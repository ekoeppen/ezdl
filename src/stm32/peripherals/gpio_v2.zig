const PullMode = enum(u2) {
    none = 0b00,
    up = 0b01,
    down = 0b10,
};
const OutputMode = enum(u1) {
    push_pull = 0b0,
    open_drain = 0b1,
};

const PinMode = enum(u2) {
    input = 0b00,
    output = 0b01,
    alternate = 0b10,
    analog = 0b11,
};

const TriggerMode = enum {
    none,
    rising,
    falling,
    rising_falling,
};

const Config = union(PinMode) {
    input: struct {
        pull: PullMode = .none,
        trigger: TriggerMode = .none,
        exti: ?type = null,
    },
    output: struct {
        pull: PullMode = .none,
        mode: OutputMode = .push_pull,
    },
    alternate: struct {
        pull: PullMode = .none,
        mode: OutputMode = .push_pull,
        function: u4 = 0,
    },
    analog,
};

fn modify(comptime reg: anytype, comptime offset: u5, comptime width: u5, value: u32) void {
    const mask: u32 = 0xffffffff ^ (((1 << width) - 1) << offset);
    const bits: u32 = value << offset;
    reg.write_raw((reg.read_raw() & mask) | bits);
}

pub fn Gpio(comptime periph: anytype, comptime pin: u8, comptime config: Config) type {
    return struct {
        pub const pin_number: u4 = pin;
        pub const port_number: u4 = @truncate(u4, @ptrToInt(periph.MODER.raw_ptr) >> 10);
        pub const pin_bit: u32 = 1 << pin;
        pub const pin_config: Config = config;

        pub fn init() void {
            setConfig(config);
        }

        pub fn setConfig(comptime c: Config) void {
            modify(periph.MODER, pin * 2, 2, @enumToInt(c));
            switch (c) {
                .input => |input| {
                    modify(periph.PUPDR, pin * 2, 2, @enumToInt(input.pull));
                    if (input.trigger == .none) {
                        return;
                    }
                    if (input.exti) |exti| {
                        exti.connect(.{ .pin_number = pin_number, .port_number = port_number });
                        switch (input.trigger) {
                            .rising => exti.enable(pin_number, .event, .rising),
                            .falling => exti.enable(pin_number, .event, .falling),
                            .rising_falling => exti.enable(pin_number, .event, .rising_falling),
                            .none => {},
                        }
                    }
                },
                .output => |output| {
                    modify(periph.OTYPER, pin, 1, @enumToInt(output.mode));
                    modify(periph.PUPDR, pin * 2, 2, @enumToInt(output.pull));
                },
                .alternate => |alternate| {
                    modify(periph.OTYPER, pin, 1, @enumToInt(alternate.mode));
                    modify(periph.PUPDR, pin * 2, 2, @enumToInt(alternate.pull));
                    if (pin < 8) {
                        modify(periph.AFRL, pin * 4, 4, alternate.function);
                    } else {
                        modify(periph.AFRH, (pin - 8) * 4, 4, alternate.function);
                    }
                },
                .analog => {},
            }
        }

        pub fn isSet() bool {
            return periph.IDR.read_raw() & pin_bit == pin_bit;
        }

        pub fn set() void {
            periph.BSRR.write_raw(pin_bit);
        }

        pub fn get() u1 {
            return @truncate(u1, (periph.IDR.read_raw() & pin_bit) >> pin);
        }

        pub fn clear() void {
            periph.BRR.write_raw(pin_bit);
        }

        pub fn toggle() void {
            periph.ODR.write_raw(periph.ODR.read_raw() ^ pin_bit);
        }

        pub fn awaitValue(value: u1) void {
            if (pin_config == .input) {
                while (get() != value) {
                    if (pin_config.input.exti != null) {
                        asm volatile ("wfe");
                    }
                }
            }
        }

        pub fn awaitSet() void {
            awaitValue(1);
        }

        pub fn awaitClear() void {
            awaitValue(0);
        }
    };
}
