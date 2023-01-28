pub const mcu = @import("ezdl").stm32.mcus.stm32f103;
pub const svd = @import("ezdl").stm32.svd.stm32f103;

pub const periph = svd.peripherals;

pub const exti = mcu.Exti(periph.EXTI, periph.SYSCFG);
pub const rtc = mcu.Rtc(periph.RTC, exti);

pub const led = mcu.Gpio(periph.GPIOA, 5, .{ .output = .{} });
pub const led2 = mcu.Gpio(periph.GPIOA, 1, .{ .output = .{} });
pub const button = mcu.Gpio(periph.GPIOC, 9, .{ .input = .{
    .exti = exti,
    .trigger = .falling,
} });

pub const cs = mcu.Gpio(periph.GPIOB, 5, .{ .output = .{} });
pub const sck = mcu.Gpio(periph.GPIOA, 5, .{ .alternate = .{} });
pub const sdi = mcu.Gpio(periph.GPIOA, 6, .{ .input = .{} });
pub const sdo = mcu.Gpio(periph.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(periph.GPIOA, 9, .{ .alternate = .{} });
pub const rx = mcu.Gpio(periph.GPIOA, 10, .{ .alternate = .{} });

pub const scl = mcu.Gpio(periph.GPIOB, 10, .{ .alternate = .{} });
pub const sda = mcu.Gpio(periph.GPIOB, 11, .{ .alternate = .{} });

pub const spi = mcu.Spi(periph.SPI1);
pub const usart = mcu.Usart(periph.USART1, .{ .speed = 115200 });
pub const i2c = mcu.I2c(periph.I2C2);

pub fn init() void {
    periph.RCC.APB2ENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .SPI1EN = 1, .USART1EN = 1 });
}
