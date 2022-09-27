pub const Gpio = @import("../peripherals/peripherals.zig").gpio_v2.Gpio;
pub const Spi = @import("../peripherals/peripherals.zig").spi_v1.Spi;
pub const Usart = @import("../peripherals/peripherals.zig").usart_v2.Usart;
pub const I2c = @import("../peripherals/peripherals.zig").i2c_v2.I2c;
pub const Exti = @import("../peripherals/peripherals.zig").exti_v2.Exti;
pub const Rtc = @import("../peripherals/peripherals.zig").rtc_v2.Rtc;

pub const target = .{
    .cpu_arch = .thumb,
    .cpu_model = .{ .explicit = &(@import("std").Target.arm.cpu.cortex_m0) },
    .os_tag = .freestanding,
};
