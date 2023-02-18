pub const ezdl = @import("ezdl");
pub const mcu = ezdl.stm32.mcus.stm32f0x0;
pub const svd = ezdl.stm32.svd.stm32f0x0;

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

pub const tx = mcu.Gpio(periph.GPIOA, 2, .{ .alternate = .{ .pull = .up, .function = 1 } });
pub const rx = mcu.Gpio(periph.GPIOA, 3, .{ .alternate = .{ .pull = .up, .function = 1 } });

pub const scl = mcu.Gpio(periph.GPIOA, 9, .{ .alternate = .{ .pull = .up } });
pub const sda = mcu.Gpio(periph.GPIOA, 10, .{ .alternate = .{ .pull = .up } });

pub const spi = mcu.Spi(periph.SPI1);
pub const usart = mcu.Usart(periph.USART1, .{ .speed = 115200 });
pub const i2c = mcu.I2c(periph.I2C1);

pub const p1 = mcu.Gpio(periph.GPIOA, 8, .{ .input = .{} });
pub const p2 = mcu.Gpio(periph.GPIOB, 1, .{ .input = .{} });
pub const p3 = mcu.Gpio(periph.GPIOB, 0, .{ .input = .{} });
pub const p4 = mcu.Gpio(periph.GPIOA, 3, .{ .input = .{} });
pub const p5 = mcu.Gpio(periph.GPIOA, 2, .{ .input = .{} });
pub const p6 = mcu.Gpio(periph.GPIOA, 1, .{ .input = .{} });
pub const p7 = mcu.Gpio(periph.GPIOA, 0, .{ .input = .{} });
pub const p8 = mcu.Gpio(periph.GPIOB, 4, .{ .input = .{} });
pub const p9 = mcu.Gpio(periph.GPIOB, 5, .{ .input = .{} });
pub const p10 = mcu.Gpio(periph.GPIOB, 6, .{ .input = .{} });

pub const nrf24 = struct {
    pub const ce = mcu.Gpio(periph.GPIOB, 1, .{ .output = .{} });
    pub const irq = mcu.Gpio(periph.GPIOA, 0, .{ .output = .{} });
};

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

pub const console = usart;

const irqs: []const svd.VectorIndex = &.{ .SPI1, .USART1, .I2C1, .RTC, .EXTI0_1 };

pub fn init() void {
    periph.RCC.AHBENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1 });
    periph.RCC.APB2ENR.modify(.{ .SPI1EN = 1, .SYSCFGEN = 1, .USART1EN = 1 });
    periph.RCC.APB1ENR.modify(.{ .I2C1EN = 1 });
    nvic.enableInterrupts(ezdl.irqIndicesToInts(irqs));
}
