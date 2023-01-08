const PullMode = enum { none, up, down };
const AlternateFunction = enum { none, primary, secondary };
const Direction = enum { input, output };

const Config = struct {
    pull: PullMode = .none,
    direction: Direction = .input,
    function: AlternateFunction = .none,
};

pub fn Gpio(
    comptime periph: anytype,
    comptime pin: u8,
    comptime config: Config,
) type {
    return struct {
        const pin_bit = @as(u8, 1) << pin;
        pub fn init() void {
            setConfig(config);
        }

        pub fn setConfig(c: Config) void {
            switch (c.direction) {
                .input => periph.DIR.clear_raw(pin, 1),
                .output => periph.DIR.set_raw(pin, 1),
            }
            switch (c.function) {
                .none => {
                    periph.SEL.clear_raw(pin, 1);
                    periph.SEL2.clear_raw(pin, 1);
                },
                .primary => {
                    periph.SEL.set_raw(pin, 1);
                    periph.SEL2.clear_raw(pin, 1);
                },
                .secondary => {
                    periph.SEL.set_raw(pin, 1);
                    periph.SEL2.set_raw(pin, 1);
                },
            }
            switch (c.pull) {
                .none => periph.REN.clear_raw(pin, 1),
                .up => {
                    periph.REN.set_raw(pin, 1);
                    periph.OUT.set_raw(pin, 1);
                },
                .down => {
                    periph.REN.set_raw(pin, 1);
                    periph.OUT.clear_raw(pin, 1);
                },
            }
        }

        pub fn isSet() bool {
            return periph.IN.read_raw() & pin_bit == 1;
        }

        pub fn set() void {
            periph.OUT.set_raw(pin, 1);
        }

        pub fn clear() void {
            periph.OUT.clear_raw(pin, 1);
        }

        pub fn toggle() void {
            periph.OUT.toggle_raw(pin, 1);
        }
    };
}
