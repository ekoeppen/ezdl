pub const lib = @import("lib.zig");
pub const drivers = @import("drivers.zig");
pub const stm32 = @import("stm32.zig");
pub const sam = @import("sam.zig");
pub const msp430 = @import("msp430.zig");
pub const avr = @import("avr.zig");
pub const arm = @import("arm.zig");

pub fn irqIndicesToInts(comptime indices: anytype) []u8 {
    var ints: [indices.len]u8 = undefined;
    for (indices, &ints) |index, *int| {
        int.* = @enumToInt(index);
    }
    return &ints;
}
