pub const Gpio = @import("../peripherals/peripherals.zig").gpio_v1.Gpio;
pub const Spi = @import("../peripherals/peripherals.zig").spi_v1.Spi;

pub const target = .{
    .cpu_arch = .thumb,
    .cpu_model = .{ .explicit = &(@import("std").Target.arm.cpu.cortex_m3) },
    .os_tag = .freestanding,
};
