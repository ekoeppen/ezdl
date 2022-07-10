const PullMode = enum { none, up, down };
const OutputMode = enum { push_pull, open_drain };
const OutputSpeed = enum { low, medium, high };

const PinMode = enum(u2) { input = 0b00, output = 0b01, alternate = 0b10, analog = 0b11 };
const Config = union(PinMode) {
    input: struct { pull: PullMode = .none },
    output: struct { pull: PullMode = .none, mode: OutputMode = .push_pull, speed: OutputSpeed = .medium },
    alternate: u4,
    analog,
};

pub fn Gpio(comptime Periph: type, comptime pin: u8, comptime config: Config) type {
    const pinBit = 1 << pin;
    return struct {
        pub fn init() void {
            setConfig(config);
        }

        pub fn setConfig(c: Config) void {
            switch (c) {
                .input => |_| {},
                .output => |_| {},
                .alternate => |_| {},
                .analog => {},
            }
        }

        pub fn isSet() bool {
            return if (Periph.IDR.read_raw() & pinBit) true else false;
        }

        pub fn set() void {
            Periph.BSRR.write_raw(pinBit);
        }

        pub fn clear() void {
            Periph.BRR.write_raw(pinBit);
        }

        pub fn toggle() void {
            Periph.ODR.write_raw(Periph.ODR.read_raw() ^ pinBit);
        }
    };
}
