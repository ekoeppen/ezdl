pub const Gpio = @import("../peripherals/peripherals.zig").gpio.Gpio;
pub const Usart = @import("../peripherals/peripherals.zig").usart.Usart;
pub const Spi = @import("../peripherals/peripherals.zig").soft_spi.Spi;

pub const reset = @intToPtr(*allowzero const fn () void, 0);

pub inline fn sleep() void {}

pub inline fn waitForInterrupt() void {}

pub inline fn waitForEvent() void {
    waitForInterrupt();
}
