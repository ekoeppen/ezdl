pub const mcu = @import("ezdl").msp430.mcus.msp430g2x53;
pub const svd = @import("ezdl").msp430.svd.msp430g2x53;

pub const clock = mcu.Clock(
    svd.SYSTEM_CLOCK,
    .{ .aclk = .{}, .mclk = .{}, .smclk = .{ .speed = 8_000_000 } },
    svd.CALIBRATION_DATA,
);

pub const led = mcu.Gpio(svd.PORT_1, 0, .{ .direction = .output });
pub const rx = mcu.Gpio(svd.PORT_1, 1, .{ .direction = .input, .function = .secondary });
pub const tx = mcu.Gpio(svd.PORT_1, 2, .{ .direction = .output, .function = .secondary });
pub const button = mcu.Gpio(svd.PORT_1, 3, .{ .direction = .input, .pull = .up });
pub const sck = mcu.Gpio(svd.PORT_1, 5, .{ .direction = .output, .function = .secondary });
pub const sdi = mcu.Gpio(svd.PORT_1, 6, .{ .direction = .input, .function = .secondary });
pub const sdo = mcu.Gpio(svd.PORT_1, 7, .{ .direction = .output, .function = .secondary });
pub const cs = mcu.Gpio(svd.PORT_2, 1, .{ .direction = .output });
pub const usart = mcu.Usart(svd.USCI_A0_UART_MODE, 9600, clock, .smclk);
pub const spi = mcu.Spi(svd.USCI_B0_SPI_MODE, 8_000_000, 0, clock, .smclk);

pub fn init() void {
    svd.WATCHDOG_TIMER.WDTCTL.modify(.{ .WDTPW = .{ .raw = 0x5a }, .WDTHOLD = 1 });
    clock.init();
}
