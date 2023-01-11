pub fn Spi(
    comptime sck: anytype,
    comptime sdo: anytype,
    comptime sdi: anytype,
    comptime mode: u2,
) type {
    return struct {
        const polarity: u1 = (mode & 0b10) >> 1;
        const phase: u1 = mode & 0b1;

        fn activeClock() void {
            switch (polarity) {
                0 => sck.set(),
                1 => sck.clear(),
            }
        }

        fn idleClock() void {
            switch (polarity) {
                0 => sck.clear(),
                1 => sck.set(),
            }
        }
        pub fn init() void {
            idleClock();
        }

        pub fn transfer(comptime T: type, out: T) T {
            var in: T = 0;
            var out_bit: T = 1 << (@bitSizeOf(T) - 1);
            var in_bit: T = 1;
            idleClock();
            while (out_bit != 0) {
                switch (phase) {
                    0 => {
                        if (out & out_bit != 0) sdo.set() else sdo.clear();
                        if (sdi.isSet()) in |= in_bit;
                        activeClock();
                        idleClock();
                    },
                    1 => {
                        activeClock();
                        if (out & out_bit != 0) sdo.set() else sdo.clear();
                        if (sdi.isSet()) in |= in_bit;
                        idleClock();
                    },
                }
                out_bit >>= 1;
                in_bit <<= 1;
            }
            idleClock();
            return in;
        }

        pub fn send(comptime T: type, out: T) void {
            _ = transfer(T, out);
        }

        pub fn receive(comptime T: type) T {
            return transfer(T, 0);
        }
    };
}
