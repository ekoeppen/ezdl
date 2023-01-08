const std = @import("std");

pub fn Usart(comptime periph: anytype) type {
    const Context = struct {};
    const WriteError = error{FramingError};
    const ReadError = error{ OverrunError, NoiseDetected, ParityError };

    return struct {
        pub fn init() void {
            periph.BRH = 0;
            periph.BRL = 16;
            periph.CSRA = 0b0000_0010;
            periph.CSRB = 0b0001_1000;
            periph.CSRC = 0b0000_0110;
        }

        pub fn send(c: u8) void {
            while (periph.CSRA & 0b0010_0000 == 0) {}
            periph.DR = c;
        }

        pub fn receive() u8 {
            while (periph.CSRA & 0b1000_0000 == 0) {}
            return periph.DR;
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
                const sr = periph.CSRA;
                if (sr & 0b0000_1000 != 0) return error.OverrunError;
                if (sr & 0b0001_0000 != 0) return error.FramingError;
                if (sr & 0b0001_0010 != 0) return error.ParityError;
                bytes[amountRead] = receive();
                amountRead += 1;
            }
            return amountRead;
        }
    };
}
