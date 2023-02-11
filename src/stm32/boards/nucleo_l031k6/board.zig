pub const ezdl = @import("ezdl");
pub const mcu = ezdl.stm32.mcus.stm32l0x1;
pub const svd = ezdl.stm32.svd.stm32l0x1;

pub const periph = svd.peripherals;

pub const exti = mcu.Exti(periph.EXTI, periph.SYSCFG_COMP);
pub const rtc = mcu.Rtc(periph.RTC, exti);

pub const button = mcu.Gpio(periph.GPIOA, 0, .{ .input = .{
    .exti = exti,
    .trigger = .falling,
} });

pub const cs = mcu.Gpio(periph.GPIOA, 4, .{ .output = .{} });
pub const sck = mcu.Gpio(periph.GPIOA, 5, .{ .alternate = .{} });
pub const sdi = mcu.Gpio(periph.GPIOA, 6, .{ .alternate = .{} });
pub const sdo = mcu.Gpio(periph.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(periph.GPIOA, 2, .{ .alternate = .{ .pull = .up, .function = 4 } });
pub const rx = mcu.Gpio(periph.GPIOA, 15, .{ .alternate = .{ .pull = .up, .function = 4 } });

pub const scl = mcu.Gpio(periph.GPIOB, 8, .{ .alternate = .{ .pull = .up, .function = 1 } });
pub const sda = mcu.Gpio(periph.GPIOB, 9, .{ .alternate = .{ .pull = .up, .function = 1 } });

pub const spi = mcu.Spi(periph.SPI1);
pub const usart = mcu.Usart(periph.USART2, .{
    .speed = 115200,
    .clock_speed = 2_100_000,
    .rx_dma = false,
});
pub const i2c = mcu.I2c(periph.I2C1);

pub const console = usart;

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

pub var rx_buffer: [64]u8 = undefined;
pub var rx_index: usize = 0;

pub fn init() void {
    periph.RCC.IOPENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1 });
    periph.RCC.APB2ENR.modify(.{ .SPI1EN = 1, .SYSCFGEN = 1 });
    periph.RCC.APB1ENR.modify(.{ .I2C2EN = 1, .USART2EN = 1, .PWREN = 1 });
    periph.RCC.AHBENR.modify(.{ .DMAEN = 1 });
    periph.PWR.CR.modify(.{ .DBP = 1 });
    periph.RCC.CSR.modify(.{ .RTCSEL = 0b10, .RTCEN = 1 });
}
