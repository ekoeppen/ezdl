const std = @import("std");
const ezdl = @import("../ezdl.zig");
const microzig = @import("microzig");

pub const mcus = @import("mcus/mcus.zig");
pub const svd = @import("svd/svd.zig");
pub const startup = @import("startup.zig");

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

pub fn addFamilySteps(
    b: *std.build.Builder,
    exe: *std.build.LibExeObjStep,
    board: *const ezdl.Board,
) !void {
    const s = b.addObject("startup", ezdl.mkPath(@src(), "startup.zig"));
    s.setTarget(exe.target);
    s.setBuildMode(b.standardReleaseOptions());
    exe.addObject(s);
    exe.addLibraryPath(ezdl.mkPath(@src(), ""));

    const hex_cmd = try ezdl.build_tools.addObjCopyStep(b, exe, .hex);
    const bin_cmd = try ezdl.build_tools.addObjCopyStep(b, exe, .bin);
    _ = ezdl.build_tools.addFlashStep(b, hex_cmd, .jlink, board);
    _ = ezdl.build_tools.addFlashStep(b, hex_cmd, .stlink, board);
    _ = ezdl.build_tools.addFlashStep(b, hex_cmd, .stm32flash, board);
    _ = ezdl.build_tools.addFlashStep(b, bin_cmd, .dfu_util, board);
}
