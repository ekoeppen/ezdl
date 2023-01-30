pub const ezdl = @import("ezdl");
pub const mcu = ezdl.stm32.mcus.stm32f0x2;
pub const svd = ezdl.stm32.svd.stm32f0x2;

pub const periph = svd.peripherals;

pub const nvic = mcu.Nvic(periph.NVIC);
pub const exti = mcu.Exti(periph.EXTI, periph.SYSCFG_COMP);
pub const rtc = mcu.Rtc(periph.RTC, exti);

pub const led = mcu.Gpio(periph.GPIOA, 5, .{ .output = .{} });
pub const led2 = mcu.Gpio(periph.GPIOC, 8, .{ .output = .{} });
pub const led3 = mcu.Gpio(periph.GPIOC, 6, .{ .output = .{} });
pub const button = mcu.Gpio(periph.GPIOC, 13, .{ .input = .{ .exti = exti, .trigger = .falling } });

pub const cs = mcu.Gpio(periph.GPIOB, 6, .{ .output = .{} });
pub const sck = mcu.Gpio(periph.GPIOA, 5, .{ .alternate = .{} });
pub const sdi = mcu.Gpio(periph.GPIOA, 6, .{ .alternate = .{} });
pub const sdo = mcu.Gpio(periph.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(periph.GPIOA, 2, .{ .alternate = .{ .pull = .up, .function = 1 } });
pub const rx = mcu.Gpio(periph.GPIOA, 3, .{ .alternate = .{ .pull = .up, .function = 1 } });

pub const scl = mcu.Gpio(periph.GPIOB, 8, .{ .alternate = .{ .pull = .up } });
pub const sda = mcu.Gpio(periph.GPIOB, 9, .{ .alternate = .{ .pull = .up } });

pub const spi = mcu.Spi(periph.SPI1);
pub const usart = mcu.Usart(periph.USART2, .{ .speed = 115200 });
pub const i2c = mcu.I2c(periph.I2C1);

const irqs: []const svd.VectorIndex = &.{ .SPI1, .USART2, .I2C1, .RTC, .EXTI4_15 };

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

pub fn init() void {
    periph.RCC.AHBENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1 });
    periph.RCC.APB2ENR.modify(.{ .SPI1EN = 1, .SYSCFGEN = 1 });
    periph.RCC.APB1ENR.modify(.{ .I2C2EN = 1, .USART2EN = 1, .PWREN = 1 });
    periph.PWR.CR.modify(.{ .DBP = 1 });
    periph.RCC.BDCR.modify(.{ .BDRST = 0, .RTCSEL = 0b10, .RTCEN = 1 });
    nvic.enableInterrupts(ezdl.irqIndicesToInts(irqs));
}
