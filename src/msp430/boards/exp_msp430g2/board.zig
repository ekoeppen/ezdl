pub const mcu = @import("ezdl").msp430.mcus.msp430g2x53;
pub const svd = @import("ezdl").msp430.svd.msp430g2x53;

pub const led = mcu.Gpio(svd.PORT_1, 0, .{ .direction = .output });

pub fn init() void {
    svd.WATCHDOG_TIMER.WDTCTL.modify(.{ .WDTPW = .{ .raw = 0x5a }, .WDTHOLD = 1 });
    led.init();
}
