const std = @import("std");

pub fn Spi(
    comptime spi: anytype,
    comptime speed: u32,
    comptime mode: u2,
    comptime clock: anytype,
    comptime clock_source: enum { aclk, smclk },
) type {
    const Context = struct {};
    const WriteError = error{};
    const ReadError = error{ OverrunError, ReceiveError, ParityError };

    return struct {
        const instance = switch (@ptrToInt(spi)) {
            0x60 => .usci_a0,
            0x68 => .usci_b0,
            else => unreachable,
        };
        const IFG = @intToPtr(*volatile u8, 3);
        const RXIFG = if (instance == .usci_a0) 0b0000_0001 else 0b0000_0010;
        const TXIFG = if (instance == .usci_a0) 0b0000_0100 else 0b0000_1000;
        const SFR = @intToPtr(*allowzero volatile [16]u8, 0x00);

        pub fn init() void {
            const clk = switch (clock_source) {
                .aclk => clock.config.aclk.speed,
                .smclk => clock.config.smclk.speed,
            };
            const src = switch (clock_source) {
                .aclk => .UCSSEL_1,
                .smclk => .UCSSEL_2,
            };
            spi.CTL1.modify(.{ .UCSWRST = 1 });
            spi.CTL1.modify(.{ .UCSSEL = .{ .value = src } });
            spi.BR0.write(.{ .BR0 = @truncate(u8, clk / speed) });
            spi.BR1.write(.{ .BR1 = @truncate(u8, (clk / speed) >> 8) });
            spi.CTL0.modify(.{
                .UCCKPH = 1 - @truncate(u1, mode),
                .UCCKPL = @truncate(u1, mode >> 1),
                .UCMSB = 1,
                .UC7BIT = 0,
                .UCMST = 1,
                .UCMODE = .{ .value = .UCMODE_0 },
                .UCSYNC = 1,
            });
            spi.CTL1.modify(.{ .UCSWRST = 0 });
        }

        pub fn receive() u8 {
            while (IFG.* & RXIFG == 0) {}
            return spi.RXBUF.read().RXBUF;
        }

        pub fn send(data: u8) void {
            while (IFG.* & TXIFG == 0) {}
            spi.TXBUF.write(.{ .TXBUF = data });
            while (spi.STAT.read().UCBUSY != 0) {}
        }

        pub fn transmit(data: u8) u8 {
            while (IFG.* & TXIFG == 0) {}
            spi.TXBUF.write(.{ .TXBUF = data });
            while (IFG.* & TXIFG != 0) {}
            while (IFG.* & RXIFG == 0) {}
            return spi.RXBUF.read().RXBUF;
        }

        pub const Writer = std.io.Writer(Context, WriteError, write);

        pub fn writer() Writer {
            return .{ .context = Context{} };
        }

        pub fn write(_: Context, bytes: []const u8) WriteError!usize {
            for (bytes) |b| send(b);
            return bytes.len;
        }

        pub const Reader = std.io.Reader(Context, ReadError, read);

        pub fn reader() Reader {
            return .{ .context = Context{} };
        }

        pub fn read(_: Context, bytes: []u8) ReadError!usize {
            var amountRead: usize = 0;
            while (amountRead < bytes.len) {
                const sr = spi.STAT.read();
                if (sr.UCOE == 1) return error.OverrunError;
                if (sr.UCRXERR == 1) return error.ReceiveError;
                if (sr.UCPE == 1) return error.ParityError;
                bytes[amountRead] = receive();
                amountRead += 1;
            }
            return amountRead;
        }
    };
}
