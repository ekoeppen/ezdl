pub const Gpio = @import("../peripherals/peripherals.zig").gpio_v2.Gpio;
pub const Spi = @import("../peripherals/peripherals.zig").spi_v2.Spi;
pub const Usart = @import("../peripherals/peripherals.zig").usart_v2.Usart;
pub const I2c = @import("../peripherals/peripherals.zig").i2c_v2.I2c;
pub const Exti = @import("../peripherals/peripherals.zig").exti_v2.Exti;
pub const Rtc = @import("../peripherals/peripherals.zig").rtc_v2.Rtc;
pub const Nvic = @import("../peripherals/peripherals.zig").nvic_v1.Nvic;

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
