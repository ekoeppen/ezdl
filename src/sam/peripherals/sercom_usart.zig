const std = @import("std");

pub const Config = struct {
    speed: u32 = 115200,
    clock_speed: u32 = 8_000_000,
    tx_pad: u1,
    rx_pad: u2,
};

pub fn SercomUsart(comptime periph: anytype, comptime config: Config) type {
    const Context = struct {};
    const WriteError = error{};
    const ReadError = error{ BufferOverflow, FramingError, ParityError };

    return struct {
        pub fn init() void {
            periph.CTRLA.modify(.{ .ENABLE = 0 });
            periph.CTRLA.modify(.{
                .MODE = .{ .value = .USART_INT_CLK },
                .RXPO = .{ .raw = config.rx_pad },
                .TXPO = .{ .raw = config.tx_pad },
                .DORD = .{ .value = .LSB },
            });
            periph.BAUD.write(.{
                .BAUD = @as(u64, 65536) - @as(u64, 65535) * 16 * config.speed / config.clock_speed,
            });
            periph.CTRLB.modify(.{
                .TXEN = 1,
                .RXEN = 1,
                .CHSIZE = .{ .value = .@"8_BIT" },
            });
            periph.CTRLA.modify(.{ .ENABLE = 1 });
        }

        pub fn dtr() bool {
            return true;
        }

        pub fn receive() u8 {
            while (!rxAvailable()) {}
            return @truncate(u8, periph.DATA.read().DATA);
        }

        pub fn rxAvailable() bool {
            return periph.INTFLAG.read().RXC == 1;
        }

        pub fn send(data: u8) void {
            while (periph.INTFLAG.read().DRE == 0) {}
            periph.DATA.write(.{ .DATA = data, .padding = 0 });
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
                const isr = periph.STATUS.read();
                if (isr.BUFOVF == 1) return error.BufferOverflow;
                if (isr.FERR == 1) return error.FramingError;
                if (isr.PERR == 1) return error.ParityError;
                bytes[amountRead] = receive();
                amountRead += 1;
            }
            return amountRead;
        }
    };
}
