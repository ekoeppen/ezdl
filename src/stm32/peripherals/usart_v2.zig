const std = @import("std");

pub const Config = struct {
    speed: u32 = 115200,
    clock_speed: u32 = 8_000_000,
    rx_dma: bool = false,
    tx_dma: bool = false,
    rx_irq: bool = false,
    tx_irq: bool = false,
};

pub fn Usart(comptime periph: anytype, comptime config: Config) type {
    const Context = struct {};
    const WriteError = error{FramingError};
    const ReadError = error{ OverrunError, NoiseDetected, FramingError, ParityError };

    return struct {
        pub fn init() void {
            const int_scale = 4;
            const int_divider = 25 * config.clock_speed / (int_scale * config.speed);
            const frac_divider = int_divider % 100;
            periph.BRR.modify(.{
                .DIV_Fraction = ((frac_divider * 16) + 50) / 100 % 16,
                .DIV_Mantissa = int_divider / 100,
            });
            periph.CR3.modify(.{
                .DMAT = if (config.tx_dma) 1 else 0,
                .DMAR = if (config.rx_dma) 1 else 0,
            });
            periph.CR1.modify(.{
                .UE = 1,
                .TE = 1,
                .RE = 1,
                .RXNEIE = if (config.rx_irq) 1 else 0,
                .TCIE = if (config.tx_irq) 1 else 0,
            });
            periph.ICR.modify(.{ .FECF = 1, .ORECF = 1 });
        }

        pub fn receive() u8 {
            while (periph.ISR.read().RXNE == 0) {}
            return @truncate(u8, periph.RDR.read().RDR);
        }

        pub fn send(data: u8) void {
            while (periph.ISR.read().TXE == 0) {}
            periph.TDR.write(.{ .TDR = data });
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
                const isr = periph.ISR.read();
                if (isr.ORE == 1) return error.OverrunError;
                if (isr.NF == 1) return error.NoiseDetected;
                if (isr.FE == 1) return error.FramingError;
                if (isr.PE == 1) return error.ParityError;
                bytes[amountRead] = receive();
                amountRead += 1;
            }
            return amountRead;
        }
    };
}
