const std = @import("std");
const build = @import("../build.zig");
const build_tools = @import("build_tools.zig");
const microzig = @import("microzig");

pub const mcus = @import("sam/mcus.zig");
pub const svd = @import("sam/svd.zig");

pub fn VectorTable(comptime T: type) type {
    return @Type(.{ .Struct = .{
        .is_tuple = false,
        .layout = .Extern,
        .fields = @typeInfo(T).Struct.fields[2..],
        .decls = &.{},
    } });
}

pub fn getInterrupts(comptime vectors: anytype) []u8 {
    var irq_numbers = init: {
        var init_value: [256]u8 = undefined;
        var last: usize = 0;
        inline for (std.meta.fields(@TypeOf(vectors))) |vector| {
            const f = @field(vectors, vector.name);
            if (@TypeOf(f) == microzig.interrupt.Handler and f != microzig.interrupt.unhandled) {
                const i = @offsetOf(@TypeOf(vectors), vector.name) / 4;
                if (i >= 16) {
                    init_value[last] = i - 16;
                    last += 1;
                }
            }
        }
        break :init init_value[0..last];
    };
    return irq_numbers;
}
