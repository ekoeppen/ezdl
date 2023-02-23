const Config = enum { input, output };

pub fn Gpio(comptime port: anytype, comptime pin: u3, comptime c: Config) type {
    return struct {
        const pin_bit: u8 = @as(u8, 1) << pin;
        pub fn init() void {
            switch (c) {
                .input => port.DIRCLR = pin_bit,
                .output => port.DIRSET = pin_bit,
            }
        }

        pub fn set() void {
            port.OUTSET = pin_bit;
        }

        pub fn clear() void {
            port.OUTCLR = pin_bit;
        }

        pub fn toggle() void {
            port.OUTTGL = pin_bit;
        }

        pub fn isSet() bool {
            return port.IN & pin_bit != 0;
        }
    };
}
