const Edge = enum {
    rising,
    falling,
    rising_falling,
};

const Type = enum {
    interrupt,
    event,
};

pub fn Exti(comptime exti: anytype, comptime syscfg: anytype) type {
    return struct {
        pub fn connect(comptime pin: anytype) void {
            switch (pin.pin_number) {
                0 => syscfg.EXTICR1.modify(.{ .EXTI0 = pin.port_number }),
                1 => syscfg.EXTICR1.modify(.{ .EXTI1 = pin.port_number }),
                2 => syscfg.EXTICR1.modify(.{ .EXTI2 = pin.port_number }),
                3 => syscfg.EXTICR1.modify(.{ .EXTI3 = pin.port_number }),
                4 => syscfg.EXTICR2.modify(.{ .EXTI4 = pin.port_number }),
                5 => syscfg.EXTICR2.modify(.{ .EXTI5 = pin.port_number }),
                6 => syscfg.EXTICR2.modify(.{ .EXTI6 = pin.port_number }),
                7 => syscfg.EXTICR2.modify(.{ .EXTI7 = pin.port_number }),
                8 => syscfg.EXTICR3.modify(.{ .EXTI8 = pin.port_number }),
                9 => syscfg.EXTICR3.modify(.{ .EXTI9 = pin.port_number }),
                10 => syscfg.EXTICR3.modify(.{ .EXTI10 = pin.port_number }),
                11 => syscfg.EXTICR3.modify(.{ .EXTI11 = pin.port_number }),
                12 => syscfg.EXTICR4.modify(.{ .EXTI12 = pin.port_number }),
                13 => syscfg.EXTICR4.modify(.{ .EXTI13 = pin.port_number }),
                14 => syscfg.EXTICR4.modify(.{ .EXTI14 = pin.port_number }),
                15 => syscfg.EXTICR4.modify(.{ .EXTI15 = pin.port_number }),
            }
        }

        pub fn enable(line: u5, eventType: Type, edge: Edge) void {
            switch (eventType) {
                .interrupt => exti.IMR.writeRaw(exti.IMR.readRaw() | (@as(u32, 1) << line)),
                .event => exti.EMR.writeRaw(exti.EMR.readRaw() | (@as(u32, 1) << line)),
            }
            if (edge == .rising or edge == .rising_falling) {
                exti.RTSR.writeRaw(exti.RTSR.readRaw() | (@as(u32, 1) << line));
            }
            if (edge == .falling or edge == .rising_falling) {
                exti.FTSR.writeRaw(exti.FTSR.readRaw() | (@as(u32, 1) << line));
            }
        }

        pub fn disable(line: u5) void {
            exti.IMR.writeRaw(exti.IMR.readRaw() & ~(@as(u32, 1) << line));
            exti.EMR.writeRaw(exti.EMR.readRaw() & ~(@as(u32, 1) << line));
            exti.RTSR.writeRaw(exti.RTSR.readRaw() & ~(@as(u32, 1) << line));
            exti.FTSR.writeRaw(exti.FTSR.readRaw() & ~(@as(u32, 1) << line));
        }

        pub fn clearInterrupt(line: u5) void {
            exti.PR.writeRaw(exti.PR.readRaw() | (@as(u32, 1) << line));
        }

        pub fn interruptPending(line: u5) bool {
            return exti.PR.readRaw() & (@as(u32, 1) << line) != 0;
        }
    };
}
