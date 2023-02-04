const std = @import("std");

pub fn path() []const u8 {
    return @src().file;
}

pub const config = .{
    .name = "olimexino_stm32",
    .cpu_name = "stm32f103rb",
    .cpu_arch = .thumb,
    .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m3 },
    .programmer = "dfu-util",
    .memory = &.{
        .{ .name = "rom", .attrs = "rx", .start = 0x08002000, .size = 124 * 1024 },
        .{ .name = "ram", .attrs = "rwx", .start = 0x20000000, .size = 20 * 1024 },
    },
    .board_path = std.fs.path.dirname(path()).? ++ "/board.zig",
};