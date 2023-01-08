const std = @import("std");

pub fn Usart(
    comptime usart: anytype,
    comptime speed: u32,
    comptime clock: anytype,
    comptime clock_source: enum { uclk, aclk, smclk },
) type {
    const Context = struct {};
    const WriteError = error{};
    const ReadError = error{ OverrunError, ReceiveError, ParityError };
    const IFG = @intToPtr(*volatile u8, if (@ptrToInt(usart) == 0x5c) 3 else 7);

    return struct {
        const instance = @ptrToInt(usart);
        const SFR = @intToPtr(*allowzero volatile [16]u8, 0x00);

        pub fn init() void {
            const clk = switch (clock_source) {
                .uclk => unreachable,
                .aclk => clock.config.aclk.speed,
                .smclk => clock.config.smclk.speed,
            };
            usart.CTL1.modify(.{ .UCSWRST = 1 });
            usart.CTL1.modify(.{ .UCSSEL = .{ .value = .UCSSEL_2 } });
            usart.BR0.write(.{ .BR0 = @truncate(u8, clk / speed) });
            usart.BR1.write(.{ .BR1 = @truncate(u8, (clk / speed) >> 8) });
            usart.MCTL.modify(.{ .UCBRS = .{ .raw = (clk / (speed / 100) - (clk / speed) * 100) * 8 / 100 } });
            usart.CTL1.modify(.{ .UCSWRST = 0 });
        }

        pub fn receive() u8 {
            while (IFG.* & 0b0000_0001 == 0) {}
            return usart.RXBUF.read().RXBUF;
        }

        pub fn send(data: u8) void {
            while (IFG.* & 0b0000_0010 == 0) {}
            usart.TXBUF.write(.{ .TXBUF = data });
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
                const sr = usart.STAT.read();
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
