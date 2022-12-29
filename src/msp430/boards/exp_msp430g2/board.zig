pub const mcu = @import("ezdl").msp430.mcus.msp430g2x53;

pub fn init() void {
    mcu.WDT.WDTCTL.write(.{ .WDTPW = 0x5a, .WDTHOLD = 1 });
    mcu.P1.DIR.write(.{ .PIN0 = 1, .PIN6 = 1 });
    mcu.P1.OUT.modify(.{
        .PIN1 = 1,
    });
    mcu.P1.OUT.modify(.{
        .PIN6 = 1,
    });
}

pub fn pkgFile() []const u8 {
    return @src().file;
}
