pub fn Nvic(comptime nvic: anytype) type {
    return struct {
        pub fn enableInterrupts(comptime interrupts: []const u8) void {
            inline for (interrupts) |interrupt| {
                clearPending(interrupt);
                nvic.ISER.modify(.{ .SETENA = 1 << @truncate(u5, interrupt) });
            }
        }

        pub fn clearPending(irq: u5) void {
            nvic.ICPR.modify(.{ .CLRPEND = @as(u32, 1) << irq });
        }
    };
}
