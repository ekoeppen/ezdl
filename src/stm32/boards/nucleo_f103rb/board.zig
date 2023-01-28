pub const mcu = @import("ezdl").stm32.mcus.stm32f103;
pub const svd = @import("ezdl").stm32.svd.stm32f103;

pub const led = mcu.Gpio(svd.peripherals.GPIOA, 5, .{ .output = .{} });

pub fn init() void {
    svd.peripherals.RCC.APB2ENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .SPI1EN = 1 });

    led.init();
}
