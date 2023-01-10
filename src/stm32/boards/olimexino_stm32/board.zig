pub const mcu = @import("ezdl").stm32.mcus.stm32f103x;
pub const svd = @import("ezdl").stm32.svd.stm32f103xx;

pub const exti = mcu.Exti(svd.EXTI, svd.SYSCFG);
pub const rtc = mcu.Rtc(svd.RTC, exti);

pub const led = mcu.Gpio(svd.GPIOA, 5, .{ .output = .{} });
pub const led2 = mcu.Gpio(svd.GPIOA, 1, .{ .output = .{} });
pub const button = mcu.Gpio(svd.GPIOC, 9, .{ .input = .{
    .exti = exti,
    .trigger = .falling,
} });

pub const csn = mcu.Gpio(svd.GPIOB, 5, .{ .output = .{} });
pub const sclk = mcu.Gpio(svd.GPIOA, 5, .{ .alternate = .{} });
pub const miso = mcu.Gpio(svd.GPIOA, 6, .{ .input = .{} });
pub const mosi = mcu.Gpio(svd.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(svd.GPIOA, 9, .{ .alternate = .{ .pull = .up, .function = 1 } });
pub const rx = mcu.Gpio(svd.GPIOA, 10, .{ .alternate = .{ .pull = .up, .function = 1 } });

pub const scl = mcu.Gpio(svd.GPIOB, 10, .{ .alternate = .{ .pull = .up } });
pub const sda = mcu.Gpio(svd.GPIOB, 11, .{ .alternate = .{ .pull = .up } });

pub const spi = mcu.Spi(svd.SPI1);
pub const usart = mcu.Usart(svd.USART1, .{ .speed = 115200 });
pub const i2c = mcu.I2c(svd.I2C2);

pub fn init() void {
    svd.RCC.APB2ENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .SPI1EN = 1, .USART1EN = 1 });
}