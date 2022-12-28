pub const mcu = @import("ezdl").stm32.mcus.stm32f051;
pub const svd = @import("ezdl").stm32.svd.stm32f0xx;
pub const stm32 = @import("ezdl").stm32;

pub const led = mcu.Gpio(svd.GPIOB, 0, .{ .output = .{} });
pub const led2 = mcu.Gpio(svd.GPIOB, 1, .{ .output = .{} });
pub const led3 = mcu.Gpio(svd.GPIOB, 2, .{ .output = .{} });

pub const button = mcu.Gpio(svd.GPIOA, 0, .{ .input = .{} });

pub const modem_irq = mcu.Gpio(svd.GPIOA, 3, .{ .input = .{} });

pub const csn = mcu.Gpio(svd.GPIOA, 4, .{ .output = .{} });
pub const sclk = mcu.Gpio(svd.GPIOA, 5, .{ .alternate = .{} });
pub const miso = mcu.Gpio(svd.GPIOA, 6, .{ .alternate = .{} });
pub const mosi = mcu.Gpio(svd.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(svd.GPIOA, 9, .{ .alternate = .{ .pull = .up, .function = 1 } });
pub const rx = mcu.Gpio(svd.GPIOA, 10, .{ .alternate = .{ .pull = .up, .function = 1 } });

pub const scl = mcu.Gpio(svd.GPIOB, 6, .{ .alternate = .{ .function = 1 } });
pub const sda = mcu.Gpio(svd.GPIOB, 7, .{ .alternate = .{ .function = 1 } });

pub const spi = mcu.Spi(svd.SPI1);
pub const usart = mcu.Usart(svd.USART1, .{ .speed = 115200 });
pub const i2c = mcu.I2c(svd.I2C1);

pub const exti = mcu.Exti(svd.EXTI, svd.SYSCFG);
pub const rtc = mcu.Rtc(svd.RTC, exti);

pub fn defaultHandler() void {}

const handlers: []const stm32.IrqHandler = &.{
    .{ .number = svd.interrupts.EXTI0_1_IRQ, .handler = defaultHandler },
    .{ .number = svd.interrupts.EXTI2_3_IRQ, .handler = defaultHandler },
    .{ .number = svd.interrupts.EXTI4_15_IRQ, .handler = defaultHandler },
};

export const vectors linksection(".vectors") = stm32.mkVectors(svd.interrupts, handlers);

pub fn init() void {
    svd.RCC.AHBENR.write(.{ .IOPAEN = 1, .IOPBEN = 1 });
    svd.RCC.APB2ENR.write(.{ .SPI1EN = 1, .USART1EN = 1, .SYSCFGEN = 1 });
    svd.RCC.APB1ENR.write(.{ .I2C2EN = 1, .PWREN = 1 });
    svd.RCC.CSR.write(.{ .LSION = 1 });
    while (svd.RCC.CSR.read().LSIRDY == 0) {}
    svd.PWR.CR.write(.{ .DBP = 1 });
    svd.RCC.BDCR.write(.{ .BDRST = 0, .RTCSEL = 0b10, .RTCEN = 1 });

    led.init();
    led2.init();
    led3.init();
    button.init();

    csn.init();
    csn.set();
    sclk.init();
    miso.init();
    mosi.init();

    tx.init();
    rx.init();

    usart.init();
    spi.init();
}
