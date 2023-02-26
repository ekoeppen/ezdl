const std = @import("std");

pub fn Usart(comptime usart: anytype) type {
    const Context = struct {};
    const WriteError = error{};
    const ReadError = error{};

    return struct {
        pub fn init() void {
            usart.BAUD = 4 * 4_000_000 / 115200;
            usart.CTRLC.write(.{
                .CMODE = .{ .value = .ASYNCHRONOUS },
                .PMODE = .{ .value = .DISABLED },
                .SBMODE = .{ .value = .@"1BIT" },
                .CHSIZE = .{ .value = .@"8BIT" },
            });
            usart.CTRLB.modify(.{ .RXEN = 1, .TXEN = 1 });
        }

        pub fn dtr() bool {
            return true;
        }

        pub fn rxAvailable() bool {
            return usart.STATUS.read().RXCIF == 1;
        }

        pub fn send(c: u8) void {
            while (usart.STATUS.read().DREIF == 0) {}
            usart.TXDATAL.write(.{ .DATA = c });
        }

        pub fn receive() u8 {
            while (usart.STATUS.read().RXCIF == 0) {}
            return usart.RXDATAL.read().DATA;
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
                bytes[amountRead] = receive();
                amountRead += 1;
            }
            return amountRead;
        }
    };
}
