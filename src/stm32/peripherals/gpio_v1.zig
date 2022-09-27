const PullMode = enum {
    none,
    up,
    down,
};
const OutputMode = enum {
    push_pull,
    open_drain,
};
const OutputSpeed = enum {
    low,
    medium,
    high,
};

const PinMode = enum(u2) {
    input = 0b00,
    output = 0b01,
    alternate = 0b10,
    analog = 0b11,
};
const Config = union(PinMode) {
    input: struct {
        pull: PullMode = .none,
    },
    output: struct {
        pull: PullMode = .none,
        mode: OutputMode = .push_pull,
        speed: OutputSpeed = .medium,
    },
    alternate: u4,
    analog,
};

pub fn Gpio(comptime periph: anytype, comptime pin: u4, comptime config: Config) type {
    return struct {
        pub const pin_number: u4 = pin;
        pub const port_number: u4 = @truncate(u4, (@ptrToInt(periph.CRL.raw_ptr) >> 10) - 2);
        pub const pin_bit = 1 << pin;

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
            return periph.IDR.read_raw() & pin_bit == pin_bit;
        }

        pub fn set() void {
            periph.BSRR.write_raw(pin_bit);
        }

        pub fn clear() void {
            periph.BRR.write_raw(pin_bit);
        }

        pub fn toggle() void {
            periph.ODR.write_raw(periph.ODR.read_raw() ^ pin_bit);
        }
    };
}
