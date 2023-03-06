pub const Pin = @import("../peripherals.zig").pin.Pin;

pub fn reset() void {
    const AIRCR = @intToPtr(*volatile u32, 0xe000ed0c);
    AIRCR.* = 0x05fa0004;
    while (true) {}
}

pub inline fn sleep() void {
    asm volatile ("wfi");
}

pub inline fn waitForInterrupt() void {
    asm volatile ("wfi");
}

pub inline fn waitForEvent() void {
    asm volatile ("wfi");
}
