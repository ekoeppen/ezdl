pub fn Nvic(comptime nvic: anytype) type {
    return struct {
        pub fn enableInterrupts(comptime handlers: anytype) void {
            inline for (handlers) |handler| {
                nvic.ISER.modify(.{ .SETENA = 1 << handler.number });
            }
        }
        pub fn clearPending(irq: u5) void {
            nvic.ICPR.modify(.{ .CLRPEND = @as(u32, 1) << irq });
        }
    };
}
