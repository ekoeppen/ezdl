pub const mcu = @import("ezdl").stm32.mcus.stm32f103x;
pub const svd = @import("ezdl").stm32.svd.stm32f103xx;

pub const led = mcu.Gpio(svd.GPIOA, 5, .{ .output = .{} });

pub fn init() void {
    svd.RCC.APB2ENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .SPI1EN = 1 });

    led.init();
}
