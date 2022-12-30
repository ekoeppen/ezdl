const PullMode = enum { none, up, down };
const OutputMode = enum { push_pull, open_drain };

const PinMode = enum { input, output, alternate, analog };
const Config = union(PinMode) {
    input: struct { pull: PullMode = .none },
    output: struct { pull: PullMode = .none, mode: OutputMode = .push_pull },
    alternate: struct { pull: PullMode = .none, mode: OutputMode = .push_pull, function: u4 = 0 },
    analog,
};

pub fn Gpio(comptime Periph: type, comptime pin: u8, comptime config: Config) type {
    const pinBit: u3 = 1 << pin;
    return struct {
        pub fn init() void {
            setConfig(config);
        }

        pub fn setConfig(c: Config) void {
            _ = c;
        }

        pub fn isSet() bool {
            return if (Periph.IN.read_raw() & pinBit) true else false;
        }

        pub fn set() void {
            Periph.OUT.write_raw(pinBit);
        }

        pub fn clear() void {
            Periph.OUT.write_raw(Periph.OUT.read_raw() & ~pinBit);
        }

        pub fn toggle() void {
            Periph.OUT.write_raw(Periph.OUT.read_raw() ^ pinBit);
        }
    };
}
