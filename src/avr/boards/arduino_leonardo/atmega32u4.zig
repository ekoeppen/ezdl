const std = @import("std");

pub fn path() []const u8 {
    return @src().file;
}

pub const config = .{
    .name = "arduino_leonardo",
    .cpu_name = "atmega32u4",
    .cpu_arch = .avr,
    .cpu_model = .{ .explicit = &std.Target.avr.cpu.atmega32u4 },
    .programmer = "avr109",
    .memory = &.{
        .{ .name = "rom", .attrs = "rx", .start = 0x0000, .size = 32768 },
        .{ .name = "ram", .attrs = "rw!x", .start = 0x800100, .size = 2048 },
    },
    .board_path = std.fs.path.dirname(path()).? ++ "/board.zig",
};