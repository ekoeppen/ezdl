const microzig = @import("microzig");
pub const mcu = @import("ezdl").stm32.mcus.stm32f103;
pub const svd = @import("ezdl").stm32.svd.stm32f103;

pub const periph = svd.peripherals;

pub const led = mcu.Gpio(periph.GPIOA, 5, .{ .output = .{} });
pub const led2 = mcu.Gpio(periph.GPIOC, 8, .{ .output = .{} });
pub const led3 = mcu.Gpio(periph.GPIOC, 6, .{ .output = .{} });
pub const button = mcu.Gpio(periph.GPIOC, 13, .{ .input = .{} });

pub const cs = mcu.Gpio(periph.GPIOA, 4, .{ .output = .{} });
pub const sck = mcu.Gpio(periph.GPIOA, 5, .{ .alternate = .{} });
pub const sdi = mcu.Gpio(periph.GPIOA, 6, .{ .alternate = .{} });
pub const sdo = mcu.Gpio(periph.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(periph.GPIOA, 2, .{ .alternate = .{ .pull_mode = .up } });
pub const rx = mcu.Gpio(periph.GPIOA, 3, .{ .alternate = .{ .pull_mode = .up } });

pub const scl = mcu.Gpio(periph.GPIOB, 8, .{ .alternate = .{ .pull_mode = .up } });
pub const sda = mcu.Gpio(periph.GPIOB, 9, .{ .alternate = .{ .pull_mode = .up } });

pub const spi = mcu.Spi(periph.SPI1);
pub const usart = mcu.Usart(periph.USART2, .{ .speed = 115200 });
pub const i2c = mcu.I2c(periph.I2C1);

pub fn init() void {
    periph.RCC.APB2ENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .SPI1EN = 1 });

    led.init();
}
