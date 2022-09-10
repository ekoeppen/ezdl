pub const mcu = @import("mcus/msp430g2x53.zig");

pub const memory = .{
    .{ .name = "ram", .attrs = "rwx", .start = 0x0200, .size = 512 },
    .{ .name = "rom", .attrs = "rx", .start = 0xc000, .size = 16384 - 0xc0 },
    .{ .name = "vectors", .attrs = "rx", .start = 0xffc0, .size = 0xc0 },
};

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
