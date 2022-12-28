pub const mcu = @import("ezdl").stm32.mcus.stm32f103x;
pub const svd = @import("ezdl").stm32.svd.stm32f103x;

pub const led = mcu.Gpio(svd.GPIOA, 5, .{ .output = .{} });
pub const spi = mcu.Spi(svd.SPI1);

pub fn init() void {
    svd.RCC.APB2ENR.write(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .SPI1EN = 1 });

    led.init();
    spi.init();
}
