const std = @import("std");
const ezdl = @import("../ezdl.zig");

pub const mcus = @import("mcus/mcus.zig");
pub const svd = @import("svd/svd.zig");

pub fn addFamilySteps(
    b: *std.Build,
    exe: *std.build.CompileStep,
    board: *const ezdl.Board,
) !void {
    const startup = b.addObject(.{
        .name = "startup",
        .root_source_file = .{ .path = ezdl.mkPath(@src(), "startup.zig") },
        .target = exe.target,
        .optimize = exe.optimize,
    });
    exe.addObject(startup);
    exe.addLibraryPath(ezdl.mkPath(@src(), ""));

    const hex_cmd = try ezdl.build_tools.addObjCopyStep(b, exe, .hex);
    _ = ezdl.build_tools.addFlashStep(b, hex_cmd, .mspdebug, board);
}
