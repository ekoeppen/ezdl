pub const Gpio = @import("../peripherals.zig").gpio.Gpio;
pub const Usart = @import("../peripherals.zig").usart.Usart;
pub const Spi = @import("../peripherals.zig").soft_spi.Spi;

pub const reset = @intToPtr(*allowzero const fn () void, 0);

pub inline fn sleep() void {}

pub inline fn waitForInterrupt() void {}

pub inline fn waitForEvent() void {
    waitForInterrupt();
}
