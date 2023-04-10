pub const Pin = @import("../peripherals.zig").pin.Pin;
pub const Nvic = @import("../peripherals.zig").nvic_m0.Nvic;
pub const SercomUsart = @import("../peripherals.zig").sercom_usart.SercomUsart;
pub const Nvm = @import("../peripherals.zig").nvm.Nvm;

pub fn reset(address: usize) void {
    if (address == 0) {
        const AIRCR = @intToPtr(*volatile u32, 0xe000ed0c);
        AIRCR.* = 0x05fa0004;
        while (true) {}
    } else {
        asm volatile (
            \\ldr r1, =0xe000ed08
            \\str r0, [r1]
            \\ldr r1, [r0]
            \\adds r0, #4
            \\ldr r2, [r0]
            \\mov sp, r1
            \\mov pc, r2
            :
            : [address] "{r0}" (address),
        );
    }
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

pub const flash_config = .{
    .write_granularity = [1]u32{64},
    .erase_granularity = [1]u32{4 * 64},
};
