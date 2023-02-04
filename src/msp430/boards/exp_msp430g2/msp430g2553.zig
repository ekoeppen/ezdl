const std = @import("std");

pub fn path() []const u8 {
    return @src().file;
}

pub const config = .{
    .name = "exp_msp430g2",
    .cpu_arch = .msp430,
    .cpu_model = .{ .explicit = &std.Target.msp430.cpu.msp430 },
    .programmer = "rf2500",
    .memory = &.{
        .{ .name = "rom", .attrs = "rx", .start = 0xc000, .size = 0x3f80 },
        .{ .name = "ram", .attrs = "rwx", .start = 0x0200, .size = 512 },
        .{ .name = "vectors", .attrs = "rx", .start = 0xff80, .size = 128 },
    },
    .board_path = std.fs.path.dirname(path()).? ++ "/board.zig",
};
