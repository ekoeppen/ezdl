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
        event: bool = false,
        interrupt: bool = false,
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

pub fn Gpio(comptime periph: anytype, comptime pin: u8, comptime config: Config) type {
    return struct {
        pub const pin_number: u4 = pin;
        pub const pin_bit: u32 = 1 << pin;
        pub const port_number: u4 = @truncate(u4, @ptrToInt(periph) >> 10);
        pub const pin_config: Config = config;

        pub fn init() void {
            setConfig(config);
        }

        pub fn setConfig(comptime c: Config) void {
            periph.MODER.modify_raw(pin * 2, 2, @enumToInt(c));
            switch (c) {
                .input => |input| {
                    periph.PUPDR.modify_raw(pin * 2, 2, @enumToInt(input.pull));
                    if (input.trigger == .none) {
                        return;
                    }
                    if (input.exti) |exti| {
                        exti.connect(.{ .pin_number = pin_number, .port_number = port_number });
                        const exti_type = if (input.event) .event else .interrupt;
                        switch (input.trigger) {
                            .rising => exti.enable(pin_number, exti_type, .rising),
                            .falling => exti.enable(pin_number, exti_type, .falling),
                            .rising_falling => exti.enable(pin_number, exti_type, .rising_falling),
                            .none => {},
                        }
                    }
                },
                .output => |output| {
                    periph.OTYPER.modify_raw(pin, 1, @enumToInt(output.mode));
                    periph.PUPDR.modify_raw(pin * 2, 2, @enumToInt(output.pull));
                },
                .alternate => |alternate| {
                    periph.OTYPER.modify_raw(pin, 1, @enumToInt(alternate.mode));
                    periph.PUPDR.modify_raw(pin * 2, 2, @enumToInt(alternate.pull));
                    if (pin < 8) {
                        periph.AFRL.modify_raw(pin * 4, 4, alternate.function);
                    } else {
                        periph.AFRH.modify_raw((pin - 8) * 4, 4, alternate.function);
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
