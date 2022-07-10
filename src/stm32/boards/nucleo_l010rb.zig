const mcu = @import("../mcus/stm32l01x.zig");
const svd = @import("../svd/stm32l01x.zig");

pub const led = mcu.Gpio(svd.GPIOA, 5, .{ .output = .{} });
pub const spi = mcu.Spi(svd.SPI1);

pub fn init() void {
    svd.RCC.IOPENR.write(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1 });
    svd.RCC.APB2ENR.write(.{ .SPI1EN = 1 });

    led.init();
    spi.init();
}
