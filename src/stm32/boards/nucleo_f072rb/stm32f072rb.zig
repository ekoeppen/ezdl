const std = @import("std");

fn path() []const u8 {
    return @src().file;
}

pub const config = .{
    .name = "nucleo_f072rb",
    .cpu_name = "stm32f072rb",
    .cpu_arch = .thumb,
    .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m0 },
    .programmer = "jlink",
    .memory = &.{
        .{ .name = "rom", .attrs = "rx", .start = 0x08000000, .size = 131072 },
        .{ .name = "ram", .attrs = "rwx", .start = 0x20000000, .size = 16384 },
    },
    .board_path = std.fs.path.dirname(path()).? ++ "/board.zig",
};
