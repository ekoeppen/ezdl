pub const Gpio = @import("../peripherals/peripherals.zig").gpio_v2.Gpio;
pub const Spi = @import("../peripherals/peripherals.zig").spi_v2.Spi;
pub const Nvic = @import("../peripherals/peripherals.zig").nvic_v1.Nvic;

pub fn reset() void {
    const AIRCR = @intToPtr(*volatile u32, 0xe000ed0c);
    AIRCR.* = 0x05fa0004;
    while (true) {}
}
