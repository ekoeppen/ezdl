pub const Gpio = @import("../peripherals/peripherals.zig").gpio_dx.Gpio;
pub const Usart = @import("../peripherals/peripherals.zig").usart_dx.Usart;

pub const reset = @intToPtr(*allowzero const fn () void, 0);

pub inline fn sleep() void {}

pub inline fn waitForInterrupt() void {}

pub inline fn waitForEvent() void {
    waitForInterrupt();
}
