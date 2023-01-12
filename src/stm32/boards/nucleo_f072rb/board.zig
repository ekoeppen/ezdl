pub const mcu = @import("ezdl").stm32.mcus.stm32f072x;
pub const svd = @import("ezdl").stm32.svd.stm32f072x;

pub const exti = mcu.Exti(svd.EXTI, svd.SYSCFG);
pub const rtc = mcu.Rtc(svd.RTC, exti);

pub const led = mcu.Gpio(svd.GPIOA, 5, .{ .output = .{} });
pub const led2 = mcu.Gpio(svd.GPIOC, 8, .{ .output = .{} });
pub const led3 = mcu.Gpio(svd.GPIOC, 6, .{ .output = .{} });
pub const button = mcu.Gpio(svd.GPIOC, 13, .{ .input = .{
    .exti = exti,
    .trigger = .falling,
} });

pub const cs = mcu.Gpio(svd.GPIOB, 6, .{ .output = .{} });
pub const sck = mcu.Gpio(svd.GPIOA, 5, .{ .alternate = .{} });
pub const sdi = mcu.Gpio(svd.GPIOA, 6, .{ .alternate = .{} });
pub const sdo = mcu.Gpio(svd.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(svd.GPIOA, 2, .{ .alternate = .{ .pull = .up, .function = 1 } });
pub const rx = mcu.Gpio(svd.GPIOA, 3, .{ .alternate = .{ .pull = .up, .function = 1 } });

pub const scl = mcu.Gpio(svd.GPIOB, 8, .{ .alternate = .{ .pull = .up } });
pub const sda = mcu.Gpio(svd.GPIOB, 9, .{ .alternate = .{ .pull = .up } });

pub const spi = mcu.Spi(svd.SPI1);
pub const usart = mcu.Usart(svd.USART2, .{ .speed = 115200 });
pub const i2c = mcu.I2c(svd.I2C1);

pub const handlers = &.{};

pub fn init() void {
    svd.RCC.AHBENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1 });
    svd.RCC.APB2ENR.modify(.{ .SPI1EN = 1, .SYSCFGEN = 1 });
    svd.RCC.APB1ENR.modify(.{ .I2C2EN = 1, .USART2EN = 1, .PWREN = 1 });
    svd.PWR.CR.modify(.{ .DBP = 1 });
    svd.RCC.BDCR.modify(.{ .BDRST = 0, .RTCSEL = 0b10, .RTCEN = 1 });
}
