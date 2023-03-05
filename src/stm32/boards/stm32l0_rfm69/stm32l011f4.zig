const std = @import("std");

pub fn path() []const u8 {
    return @src().file;
}

pub const config = .{
    .name = "stm32l011f4_rfm69",
    .cpu_name = "stm32l011f4",
    .cpu_arch = .thumb,
    .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m0 },
    .device_family = .stm32,
    .programmer = "stm32flash",
    .memory = &.{
        .{ .name = "rom", .attrs = "rx", .start = 0x08000000, .size = 16384 },
        .{ .name = "ram", .attrs = "rwx", .start = 0x20000000, .size = 2048 },
    },
    .board_path = std.fs.path.dirname(path()).? ++ "/board.zig",
};
