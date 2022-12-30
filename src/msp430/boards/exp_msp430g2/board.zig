pub const mcu = @import("ezdl").msp430.mcus.msp430g2x53;
pub const svd = @import("ezdl").msp430.svd.msp430g2x53;

pub const led = mcu.Gpio(svd.P1, 0, .{ .output = .{} });

pub fn init() void {
    svd.WDT.WDTCTL.write(.{ .WDTPW = 0x5a, .WDTHOLD = 1 });
    svd.P1.DIR.write(.{ .PIN0 = 1, .PIN6 = 1 });
    svd.P1.OUT.modify(.{
        .PIN1 = 1,
    });
    svd.P1.OUT.modify(.{
        .PIN6 = 1,
    });
}
