pub const lib = @import("lib/lib.zig");
pub const drivers = @import("drivers/drivers.zig");
pub const stm32 = @import("stm32/stm32.zig");
pub const msp430 = @import("msp430/msp430.zig");
pub const avr = @import("avr/avr.zig");

pub fn irqIndicesToInts(comptime indices: anytype) []u8 {
    var ints: [indices.len]u8 = undefined;
    for (indices, &ints) |index, *int| {
        int.* = @enumToInt(index);
    }
    return &ints;
}
