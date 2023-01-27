pub fn Nvic(comptime nvic: anytype) type {
    return struct {
        pub fn enableInterrupts(comptime handlers: anytype) void {
            inline for (handlers) |handler| {
                const irq = handler.number;
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
    };
}
