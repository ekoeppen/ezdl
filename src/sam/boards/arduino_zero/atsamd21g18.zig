const std = @import("std");

pub fn path() []const u8 {
    return @src().file;
}

pub const config = .{
    .name = "arduino_zero",
    .cpu_name = "atsamd21g18",
    .cpu_arch = .thumb,
    .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m0plus },
    .device_family = .sam,
    .programmer = "jlink",
    .memory = &.{
        .{ .name = "rom", .attrs = "rx", .start = 0x00000000, .size = 256 * 1024 },
        .{ .name = "ram", .attrs = "rwx", .start = 0x20000000, .size = 32 * 1024 },
    },
    .board_path = std.fs.path.dirname(path()).? ++ "/board.zig",
};
