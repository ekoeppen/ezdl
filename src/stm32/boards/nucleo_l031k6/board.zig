pub const mcu = @import("ezdl").stm32.mcus.stm32l0x1;
pub const svd = @import("ezdl").stm32.svd.stm32l0x1;

pub const exti = mcu.Exti(svd.EXTI, svd.SYSCFG_COMP);
pub const rtc = mcu.Rtc(svd.RTC, exti);

pub const button = mcu.Gpio(svd.GPIOA, 0, .{ .input = .{
    .exti = exti,
    .trigger = .falling,
} });

pub const csn = mcu.Gpio(svd.GPIOA, 4, .{ .output = .{} });
pub const sclk = mcu.Gpio(svd.GPIOA, 5, .{ .alternate = .{} });
pub const miso = mcu.Gpio(svd.GPIOA, 6, .{ .alternate = .{} });
pub const mosi = mcu.Gpio(svd.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(svd.GPIOA, 2, .{ .alternate = .{ .pull = .up, .function = 4 } });
pub const rx = mcu.Gpio(svd.GPIOA, 15, .{ .alternate = .{ .pull = .up, .function = 4 } });

pub const scl = mcu.Gpio(svd.GPIOB, 8, .{ .alternate = .{ .pull = .up, .function = 1 } });
pub const sda = mcu.Gpio(svd.GPIOB, 9, .{ .alternate = .{ .pull = .up, .function = 1 } });

pub const spi = mcu.Spi(svd.SPI1);
pub const usart = mcu.Usart(svd.USART2, .{
    .speed = 115200,
    .clock_speed = 2_100_000,
    .rx_dma = false,
});
pub const i2c = mcu.I2c(svd.I2C1);

pub const handlers = &.{};

pub var rx_buffer: [64]u8 = undefined;
pub var rx_index: usize = 0;

pub fn init() void {
    svd.RCC.IOPENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1 });
    svd.RCC.APB2ENR.modify(.{ .SPI1EN = 1, .SYSCFGEN = 1 });
    svd.RCC.APB1ENR.modify(.{ .I2C2EN = 1, .USART2EN = 1, .PWREN = 1 });
    svd.RCC.AHBENR.modify(.{ .DMAEN = 1 });
    svd.PWR.CR.modify(.{ .DBP = 1 });
    svd.RCC.CSR.modify(.{ .RTCSEL = 0b10, .RTCEN = 1 });

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

    if (false) {
        svd.DMA1.CPAR5.modify(.{ .PA = @ptrToInt(svd.USART2.RDR.raw_ptr) });
        svd.DMA1.CMAR5.modify(.{ .MA = @ptrToInt(&rx_buffer) });
        svd.DMA1.CCR5.modify(.{ .CIRC = 1, .MINC = 1 });
        svd.DMA1.CNDTR5.modify(.{ .NDT = @as(u32, rx_buffer.len) });
        svd.DMA1.CSELR.modify(.{ .C5S = 4 });
        svd.DMA1.CCR5.modify(.{ .EN = 1 });
    }
}
