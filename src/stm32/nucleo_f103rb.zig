const mcu = @import("mcus/stm32f103x.zig");
const svd = @import("svd/stm32f103x.zig");

pub const led = mcu.Gpio(svd.GPIOA, 5, .{ .output = .{} });
pub const spi = mcu.Spi(svd.SPI1);

pub fn init() void {
    svd.RCC.APB2ENR.write(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .SPI1EN = 1 });

    led.init();
    spi.init();
}
