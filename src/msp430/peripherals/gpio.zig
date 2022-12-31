const PullMode = enum { none, up, down };
const OutputMode = enum { push_pull, open_drain };

const PinMode = enum { input, output, alternate };
const Config = union(PinMode) {
    input: struct { pull: PullMode = .none },
    output: struct { pull: PullMode = .none, mode: OutputMode = .push_pull },
    alternate: struct { pull: PullMode = .none, mode: OutputMode = .push_pull, function: u4 = 0 },
};

fn modify(comptime reg: anytype, comptime offset: u3, comptime width: u1, value: u8) void {
    const mask: u8 = 0xff ^ (((1 << width) - 1) << offset);
    const bits: u8 = value << offset;
    reg.write_raw((reg.read_raw() & mask) | bits);
}

pub fn Gpio(comptime gpio: type, comptime pin: u8, comptime config: Config) type {
    const pinBit: u8 = 1 << pin;
    return struct {
        pub fn init() void {
            setConfig(config);
        }

        pub fn setConfig(c: Config) void {
            switch (c) {
                .input => modify(gpio.DIR, pin, 1, 0),
                .output => modify(gpio.DIR, pin, 1, 1),
                .alternate => {},
            }
        }

        pub fn isSet() bool {
            return if (gpio.IN.read_raw() & pinBit) true else false;
        }

        pub fn set() void {
            modify(gpio.OUT, pin, 1, 1);
        }

        pub fn clear() void {
            modify(gpio.OUT, pin, 1, 0);
        }

        pub fn toggle() void {
            gpio.OUT.write_raw(gpio.OUT.read_raw() ^ pinBit);
        }
    };
}
