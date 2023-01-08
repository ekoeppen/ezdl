pub fn Spi(comptime periph: anytype, comptime mode: u2, comptime div: u2) type {
    return struct {
        pub fn init() void {
            periph.CR = 0b0101_0000 | (@as(u8, mode) << 2) | div;
        }

        pub fn enable() void {
            periph.CR |= 0b0100_0000;
        }

        pub fn disable() void {
            periph.CR &= 0b1011_1111;
        }

        pub fn send(d: u8) void {
            periph.DR = d;
            while (periph.SR & 0b1000_0000 == 0) {}
        }

        pub fn receive() u8 {
            send(0xff);
            return periph.DR;
        }
    };
}
