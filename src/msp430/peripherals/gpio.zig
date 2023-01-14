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
                .input => periph.DIR.clearRaw(pin, 1),
                .output => periph.DIR.setRaw(pin, 1),
            }
            switch (c.function) {
                .none => {
                    periph.SEL.clearRaw(pin, 1);
                    periph.SEL2.clearRaw(pin, 1);
                },
                .primary => {
                    periph.SEL.setRaw(pin, 1);
                    periph.SEL2.clearRaw(pin, 1);
                },
                .secondary => {
                    periph.SEL.setRaw(pin, 1);
                    periph.SEL2.setRaw(pin, 1);
                },
            }
            switch (c.pull) {
                .none => periph.REN.clearRaw(pin, 1),
                .up => {
                    periph.REN.setRaw(pin, 1);
                    periph.OUT.setRaw(pin, 1);
                },
                .down => {
                    periph.REN.setRaw(pin, 1);
                    periph.OUT.clearRaw(pin, 1);
                },
            }
        }

        pub fn isSet() bool {
            return periph.IN.readRaw() & pin_bit == 1;
        }

        pub fn set() void {
            periph.OUT.setRaw(pin, 1);
        }

        pub fn clear() void {
            periph.OUT.clearRaw(pin, 1);
        }

        pub fn toggle() void {
            periph.OUT.toggleRaw(pin, 1);
        }
    };
}
