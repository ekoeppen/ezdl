pub const ezdl = @import("ezdl");
pub const mcu = ezdl.stm32.mcus.stm32l0x1;
pub const svd = ezdl.stm32.svd.stm32l0x1;

pub const periph = svd.peripherals;

pub const nvic = mcu.Nvic(periph.NVIC);
pub const exti = mcu.Exti(periph.EXTI, periph.SYSCFG_COMP);
pub const rtc = mcu.Rtc(periph.RTC, exti);

pub const led = mcu.Gpio(periph.GPIOA, 1, .{ .output = .{} });
pub const led2 = mcu.Gpio(periph.GPIOA, 1, .{ .output = .{} });
pub const button = mcu.Gpio(periph.GPIOA, 0, .{ .input = .{
    .exti = exti,
    .trigger = .falling,
} });

pub const cs = mcu.Gpio(periph.GPIOA, 4, .{ .output = .{} });
pub const sck = mcu.Gpio(periph.GPIOA, 5, .{ .alternate = .{} });
pub const sdi = mcu.Gpio(periph.GPIOA, 6, .{ .alternate = .{} });
pub const sdo = mcu.Gpio(periph.GPIOA, 7, .{ .alternate = .{} });
pub const spi = mcu.Spi(periph.SPI1, 2_100_000, 1_000_000);

pub const tx = mcu.Gpio(periph.GPIOA, 2, .{ .alternate = .{ .pull = .up, .function = 4 } });
pub const rx = mcu.Gpio(periph.GPIOA, 3, .{ .alternate = .{ .pull = .up, .function = 4 } });

pub const scl = mcu.Gpio(periph.GPIOA, 9, .{ .alternate = .{ .pull = .up } });
pub const sda = mcu.Gpio(periph.GPIOA, 10, .{ .alternate = .{ .pull = .up } });

pub const usart = mcu.Usart(periph.USART2, .{ .speed = 115200, .clock_speed = 2_100_000 });
pub const i2c = mcu.I2c(periph.I2C1);

pub const nrf24 = struct {
    pub const ce = mcu.Gpio(periph.GPIOB, 1, .{ .output = .{} });
    pub const irq = mcu.Gpio(periph.GPIOA, 0, .{ .output = .{} });
};

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

pub const console = usart;

const irqs: []const svd.VectorIndex = &.{ .SPI1, .USART2, .I2C1, .RTC, .EXTI0_1 };

pub fn init() void {
    periph.RCC.IOPENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1 });
    periph.RCC.APB2ENR.modify(.{ .SPI1EN = 1, .SYSCFGEN = 1 });
    periph.RCC.APB1ENR.modify(.{ .I2C1EN = 1, .USART2EN = 1 });
    nvic.enableInterrupts(ezdl.irqIndicesToInts(irqs));
}
