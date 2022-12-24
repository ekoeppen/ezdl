const epoch = @import("std").time.epoch;
const DateTime = @import("ezdl").lib.DateTime;

pub fn Rtc(comptime periph: anytype, comptime exti: anytype) type {
    return struct {
        pub fn unlock() void {
            periph.WPR.write(.{ .KEY = 0xca });
            periph.WPR.write(.{ .KEY = 0x53 });
        }

        pub fn lock() void {
            periph.WPR.write(.{ .KEY = 0xff });
        }

        pub fn read() DateTime {
            const dr = periph.DR.read();
            const tr = periph.TR.read();
            return .{
                .year = @as(epoch.Year, dr.YT) * 10 + @as(epoch.Year, dr.YU) + 2000,
                .month = @intToEnum(epoch.Month, @as(u4, dr.MT) * 10 + dr.MU),
                .day = @as(u5, dr.DT) * 10 + dr.DU,
                .hour = @as(u5, tr.HT) * 10 + tr.HU,
                .minute = @as(u6, tr.MNT) * 10 + tr.MNU,
                .second = @as(u6, tr.ST) * 10 + tr.SU,
            };
        }

        pub fn setAlarmTime(dateTime: *DateTime) void {
            unlock();
            clearAlarm();
            while (periph.ISR.read().ALRAWF == 0) {}
            periph.ALRMAR.write(.{
                .MSK1 = 0,
                .ST = @truncate(u3, dateTime.second / 10),
                .SU = @truncate(u4, dateTime.second % 10),
                .MSK2 = 0,
                .MNT = @truncate(u3, dateTime.minute / 10),
                .MNU = @truncate(u4, dateTime.minute % 10),
                .MSK3 = 0,
                .PM = 0,
                .HT = @truncate(u2, dateTime.hour / 10),
                .HU = @truncate(u4, dateTime.hour % 10),
                .MSK4 = 1,
                .WDSEL = 0,
                .DT = 0,
                .DU = 0,
            });
            periph.CR.modify(.{ .ALRAE = 1 });
            periph.CR.modify(.{ .ALRAIE = 1 });
            lock();
            exti.enable(17, .event, .rising);
        }

        pub fn clearAlarm() void {
            periph.CR.modify(.{ .ALRAIE = 0 });
            periph.ISR.modify(.{ .ALRAF = 0 });
            periph.CR.modify(.{ .ALRAE = 0 });
        }

        pub fn alarmRaised() bool {
            return periph.ISR.read().ALRAF == 1;
        }

        pub fn awaitAlarm() void {
            while (!alarmRaised()) {
                asm volatile ("wfe");
            }
            periph.ISR.modify(.{ .ALRAF = 0 });
        }
    };
}
