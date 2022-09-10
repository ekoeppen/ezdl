pub fn Si7006(comptime Spi: type, comptime Cs: type) type {
    return struct {
        pub fn init() void {}

        pub fn read() u8 {
            Cs.clear();
            Spi.write(0xff);
            const r = Spi.receive();
            Cs.set();
            return r;
        }

        pub fn write(d: u8) void {
            Cs.clear();
            Spi.send(d);
            Cs.set();
        }
    };
}
