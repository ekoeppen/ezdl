const std = @import("std");

pub fn path() []const u8 {
    return @src().file;
}

pub const config = .{
    .name = "avr64dd32_curiosity_nano",
    .cpu_name = "avr64dd32",
    .cpu_arch = .avr,
    .cpu_model = .{ .explicit = &std.Target.avr.cpu.atmega4809 },
    .programmer = "pkobn_updi",
    .memory = &.{
        .{ .name = "rom", .attrs = "rx", .start = 0x0, .size = 65536 },
        .{ .name = "flash", .attrs = "rx", .start = 0x8000, .size = 32768 },
        .{ .name = "ram", .attrs = "rw!x", .start = 0x6000, .size = 8192 },
        .{ .name = "eeprom", .attrs = "rw!x", .start = 0x1400, .size = 256 },
    },
    .board_path = std.fs.path.dirname(path()).? ++ "/board.zig",
};
