const std = @import("std");
const ezdl = @import("../ezdl.zig");

pub const mcus = @import("mcus/mcus.zig");
pub const svd = @import("svd/svd.zig");

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
    _ = ezdl.build_tools.addFlashStep(b, hex_cmd, .avrdude, board);
}
