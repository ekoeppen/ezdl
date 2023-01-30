pub const mcu = @import("ezdl").msp430.mcus.msp430g2x53;
pub const svd = @import("ezdl").msp430.svd.msp430g2x53;

pub const periph = svd.peripherals;

pub const clock = mcu.Clock(
    periph.SYSTEM_CLOCK,
    .{ .aclk = .{}, .mclk = .{}, .smclk = .{ .speed = 8_000_000 } },
    periph.CALIBRATION_DATA,
);

pub const led = mcu.Gpio(periph.PORT_1, 0, .{ .direction = .output });
pub const rx = mcu.Gpio(periph.PORT_1, 1, .{ .direction = .input, .function = .secondary });
pub const tx = mcu.Gpio(periph.PORT_1, 2, .{ .direction = .output, .function = .secondary });
pub const button = mcu.Gpio(periph.PORT_1, 3, .{ .direction = .input, .pull = .up });
pub const sck = mcu.Gpio(periph.PORT_1, 5, .{ .direction = .output, .function = .secondary });
pub const sdi = mcu.Gpio(periph.PORT_1, 6, .{ .direction = .input, .function = .secondary });
pub const sdo = mcu.Gpio(periph.PORT_1, 7, .{ .direction = .output, .function = .secondary });
pub const cs = mcu.Gpio(periph.PORT_2, 1, .{ .direction = .output });
pub const usart = mcu.Usart(periph.USCI_A0_UART_MODE, 9600, clock, .smclk);
pub const spi = mcu.Spi(periph.USCI_B0_SPI_MODE, 8_000_000, 0, clock, .smclk);

pub fn init() void {
    periph.WATCHDOG_TIMER.WDTCTL.modify(.{ .WDTPW = .{ .raw = 0x5a }, .WDTHOLD = 1 });
    clock.init();
}
