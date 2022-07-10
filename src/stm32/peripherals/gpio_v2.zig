const PullMode = enum(u2) { none = 0b00, up = 0b01, down = 0b10 };
const OutputMode = enum(u1) { push_pull = 0b0, open_drain = 0b1 };

const PinMode = enum(u2) { input = 0b00, output = 0b01, alternate = 0b10, analog = 0b11 };
const Config = union(PinMode) {
    input: struct { pull: PullMode = .none },
    output: struct { pull: PullMode = .none, mode: OutputMode = .push_pull },
    alternate: struct { pull: PullMode = .none, mode: OutputMode = .push_pull, function: u4 = 0 },
    analog,
};

fn modify(comptime reg: anytype, comptime offset: u5, comptime width: u5, value: u32) void {
    const mask: u32 = 0xffffffff ^ (((1 << width) - 1) << offset);
    const bits: u32 = value << offset;
    reg.write_raw((reg.read_raw() & mask) | bits);
}

pub fn Gpio(comptime Periph: type, comptime pin: u8, comptime config: Config) type {
    const pinBit: u32 = 1 << pin;
    return struct {
        pub fn init() void {
            setConfig(config);
        }

        pub fn setConfig(c: Config) void {
            modify(Periph.MODER, pin * 2, 2, @enumToInt(c));
            switch (c) {
                .input => |input| {
                    modify(Periph.PUPDR, pin, 1, @enumToInt(input.pull));
                },
                .output => |output| {
                    modify(Periph.OTYPER, pin, 1, @enumToInt(output.mode));
                    modify(Periph.PUPDR, pin, 1, @enumToInt(output.pull));
                },
                .alternate => |alternate| {
                    modify(Periph.OTYPER, pin, 1, @enumToInt(alternate.mode));
                    modify(Periph.PUPDR, pin, 1, @enumToInt(alternate.pull));
                    if (pin < 8) {
                        modify(Periph.AFRL, pin, 4, alternate.function);
                    } else {
                        modify(Periph.AFRH, pin - 8, 4, alternate.function);
                    }
                },
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
