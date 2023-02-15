pub const Gpio = @import("../peripherals/peripherals.zig").gpio_v1.Gpio;
pub const Spi = @import("../peripherals/peripherals.zig").spi_v1.Spi;
pub const Usart = @import("../peripherals/peripherals.zig").usart_v1.Usart;
pub const Nvic = @import("../peripherals/peripherals.zig").nvic_v1.Nvic;
pub const I2c = @import("../peripherals/peripherals.zig").i2c_v1.I2c;
pub const usb = @import("../peripherals/peripherals.zig").usb_v1;

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
