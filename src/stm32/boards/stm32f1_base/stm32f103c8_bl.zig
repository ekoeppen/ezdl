const std = @import("std");

pub fn path() []const u8 {
    return @src().file;
}

pub const config = .{
    .name = "stm32f103c8_base_bl",
    .cpu_name = "stm32f103c8",
    .cpu_arch = .thumb,
    .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m3 },
    .programmer = "dfu-util",
    .port = "1eaf:0003,2",
    .memory = &.{
        .{ .name = "rom", .attrs = "rx", .start = 0x08002000, .size = 56 * 1024 },
        .{ .name = "ram", .attrs = "rwx", .start = 0x20000000, .size = 20 * 1024 },
    },
    .board_path = std.fs.path.dirname(path()).? ++ "/board.zig",
};
