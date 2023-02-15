pub const ezdl = @import("ezdl");
pub const mcu = ezdl.stm32.mcus.stm32f103;
pub const svd = ezdl.stm32.svd.stm32f103;

pub const led = mcu.Gpio(svd.peripherals.GPIOA, 5, .{ .output = .{} });
pub const led2 = mcu.Gpio(svd.peripherals.GPIOA, 5, .{ .output = .{} });

pub const periph = svd.peripherals;

pub const exti = mcu.Exti(periph.EXTI, periph.SYSCFG);
pub const nvic = mcu.Nvic(periph.NVIC);
pub const rtc = mcu.Rtc(periph.RTC, exti);

pub const button = mcu.Gpio(periph.GPIOC, 9, .{ .input = .{
    .exti = exti,
    .trigger = .falling,
} });

pub const cs = mcu.Gpio(periph.GPIOB, 5, .{ .output = .{} });
pub const sck = mcu.Gpio(periph.GPIOA, 5, .{ .alternate = .{} });
pub const sdi = mcu.Gpio(periph.GPIOA, 6, .{ .input = .{} });
pub const sdo = mcu.Gpio(periph.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(periph.GPIOA, 2, .{ .alternate = .{} });
pub const rx = mcu.Gpio(periph.GPIOA, 3, .{ .alternate = .{} });

pub const scl = mcu.Gpio(periph.GPIOB, 8, .{ .alternate = .{ .mode = .open_drain } });
pub const sda = mcu.Gpio(periph.GPIOB, 9, .{ .alternate = .{ .mode = .open_drain } });
pub const sda_pp = mcu.Gpio(periph.GPIOB, 9, .{ .output = .{} });
pub const i2c = mcu.I2c(periph.I2C1, pclk1, 400_000);

pub const spi = mcu.Spi(periph.SPI1);
pub const usart = mcu.Usart(periph.USART2, .{ .speed = 115200, .clock_speed = pclk1 });

pub const console = usart;

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

const sysclk = 72_000_000;
const pclk1 = sysclk / 2;
const pclk2 = sysclk / 2;
const hsiclk = 8_000_000;
const lsiclk = 40_000;
const lseclk = 32_768;

const irqs: []const svd.VectorIndex = &.{
    .SPI1,
    .USART1,
    .I2C1_EV,
    .RTC,
    .EXTI9_5,
    .USB_HP_CAN_TX,
    .USB_LP_CAN_RX0,
};

pub fn init() void {
    periph.RCC.APB1ENR.modify(.{ .I2C1EN = 1, .USART2EN = 1 });
    periph.RCC.APB2ENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .AFIOEN = 1 });
    periph.AFIO.MAPR.modify(.{ .I2C1_REMAP = 1 });

    periph.FLASH.ACR.modify(.{ .LATENCY = 2 });
    periph.RCC.CR.modify(.{ .HSEON = 1 });
    while (periph.RCC.CR.read().HSERDY == 0) {}
    periph.RCC.CFGR.modify(.{ .PLLSRC = 0, .PLLXTPRE = 0, .PLLMUL = 0 });
    periph.RCC.CFGR.modify(.{ .PLLSRC = 1, .PLLMUL = 7, .PPRE1 = 4 });
    periph.RCC.CR.modify(.{ .PLLON = 1 });
    while (periph.RCC.CR.read().PLLRDY == 0) {}
    periph.RCC.CFGR.modify(.{ .SW = 2 });
    while (periph.RCC.CFGR.read().SWS != 2) {}
    nvic.enableInterrupts(ezdl.irqIndicesToInts(irqs));
}
