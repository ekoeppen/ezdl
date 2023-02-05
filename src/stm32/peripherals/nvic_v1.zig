pub fn Nvic(comptime nvic: anytype) type {
    return struct {
        pub fn enableInterrupts(comptime interrupts: []const u8) void {
            inline for (interrupts) |irq| {
                clearPending(irq);
                if (irq < 31) {
                    nvic.ISER0.modify(.{ .SETENA = 1 << irq });
                } else if (irq < 63) {
                    nvic.ISER1.modify(.{ .SETENA = 1 << (irq - 32) });
                } else if (irq < 95) {
                    nvic.ISER2.modify(.{ .SETENA = 1 << (irq - 64) });
                } else if (irq < 127) {
                    nvic.ISER3.modify(.{ .SETENA = 1 << (irq - 96) });
                }
            }
        }

        pub fn clearPending(irq: u8) void {
            if (irq < 31) {
                nvic.ICPR0.modify(.{ .CLRPEND = @as(u32, 1) << @truncate(u5, irq) });
            } else if (irq < 63) {
                nvic.ICPR0.modify(.{ .CLRPEND = @as(u32, 1) << @truncate(u5, irq - 32) });
            } else if (irq < 95) {
                nvic.ICPR0.modify(.{ .CLRPEND = @as(u32, 1) << @truncate(u5, irq - 64) });
            } else if (irq < 127) {
                nvic.ICPR0.modify(.{ .CLRPEND = @as(u32, 1) << @truncate(u5, irq - 96) });
            }
        }
    };
}
