pub const Config = struct {
    mode: u2 = 0,
    clock: u32 = 4_000_000,
    speed: u32 = 1_000_000,
};

pub fn Spi(comptime spi: anytype, comptime config: Config) type {
    return struct {
        const presc =
            if (config.speed >= config.clock / 8) .DIV4 else if (config.speed >= config.clock / 32) .DIV16 else if (config.speed >= config.clock / 128) .DIV64 else if (config.speed >= config.clock / 256) .DIV128;

        pub fn init() void {
            spi.CTRLB.write(.{
                .BUFEN = 0,
                .BUFWR = 0,
                .SSD = 1,
                .MODE = .{ .raw = config.mode },
            });
            spi.CTRLA.write(.{
                .DORD = 0,
                .MASTER = 1,
                .CLK2X = 1,
                .PRESC = .{ .value = presc },
                .ENABLE = 1,
            });
        }

        pub fn receive() u8 {
            return transmit(0x00);
        }

        pub fn send(data: u8) void {
            _ = transmit(data);
        }

        pub fn transmit(data: u8) u8 {
            spi.DATA = data;
            while (spi.INTFLAGS.read().RXCIF == 0) {}
            return spi.DATA;
        }
    };
}
