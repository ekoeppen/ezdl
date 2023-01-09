const std = @import("std");
const ezdl = @import("../ezdl.zig");

pub const mcus = @import("mcus/mcus.zig");
pub const svd = @import("svd/svd.zig");

pub const IrqHandler = struct {
    number: u32,
    handler: fn () void,
};

pub fn mkVectors(
    comptime interrupts: anytype,
    comptime handlers: []const IrqHandler,
) [@typeInfo(interrupts).Struct.decls.len]*const fn () void {
    var v: [@typeInfo(interrupts).Struct.decls.len]*const fn () void = undefined;
    for (handlers) |handler| {
        v[handler.number] = handler.handler;
    }
    return v;
}

pub fn addFamilySteps(
    b: *std.build.Builder,
    exe: *std.build.LibExeObjStep,
    board: *const ezdl.Board,
) !void {
    const startup = b.addObject("startup", ezdl.mkPath(@src(), "startup.zig"));
    startup.setTarget(exe.target);
    startup.setBuildMode(b.standardReleaseOptions());
    exe.addObject(startup);
    exe.addLibraryPath(ezdl.mkPath(@src(), ""));

    const hex_cmd = try ezdl.build_tools.addObjCopyStep(b, exe, .hex);
    const bin_cmd = try ezdl.build_tools.addObjCopyStep(b, exe, .bin);
    _ = ezdl.build_tools.addFlashStep(b, hex_cmd, .jlink, board);
    _ = ezdl.build_tools.addFlashStep(b, hex_cmd, .stm32flash, board);
    _ = ezdl.build_tools.addFlashStep(b, bin_cmd, .dfu_util, board);
}
