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
    alternate: struct {
        mode: OutputMode = .push_pull,
        speed: OutputSpeed = .medium,
    },
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
            const cr_field = @as(u16, if (pin < 8) pin else pin - 8);
            switch (c) {
                .input => |input| {
                    const cr: u4 = if (input.pull != .none) 0b1000 else 0b0000;
                    if (pin < 8)
                        periph.CRL.modify_raw(cr_field * 4, 4, cr)
                    else
                        periph.CRH.modify_raw(cr_field * 4, 4, cr);
                },
                .output => |output| {
                    const cr: u4 = @as(u4, if (output.mode == .open_drain) 0b0100 else 0) | @as(u4, switch (output.speed) {
                        .low => 0b10,
                        .medium => 0b01,
                        .high => 0b11,
                    });
                    if (pin < 8)
                        periph.CRL.modify_raw(cr_field * 4, 4, cr)
                    else
                        periph.CRH.modify_raw(cr_field * 4, 4, cr);
                },
                .alternate => |alternate| {
                    const cr: u4 = @as(u4, if (alternate.mode == .open_drain) 0b1100 else 0b1000) | @as(u4, switch (alternate.speed) {
                        .low => 0b10,
                        .medium => 0b01,
                        .high => 0b11,
                    });
                    if (pin < 8) {
                        periph.CRL.modify_raw(cr_field * 4, 4, cr);
                    } else {
                        periph.CRH.modify_raw(cr_field * 4, 4, cr);
                    }
                },
                .analog => {
                    if (pin < 8)
                        periph.CRL.modify_raw(cr_field * 4, 4, 0)
                    else
                        periph.CRH.modify_raw(cr_field * 4, 4, 0);
                },
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
