const Config = enum { input, output };

pub fn Gpio(comptime port: anytype, comptime pin: u3, comptime c: Config) type {
    return struct {
        const pin_bit: u8 = @as(u8, 1) << pin;
        pub fn init() void {
            switch (c) {
                .input => port.DDR &= ~pin_bit,
                .output => port.DDR |= pin_bit,
            }
        }

        pub fn set() void {
            port.PORT |= pin_bit;
        }

        pub fn clear() void {
            port.PORT &= ~pin_bit;
        }

        pub fn toggle() void {
            port.PIN |= pin_bit;
        }
    };
}
