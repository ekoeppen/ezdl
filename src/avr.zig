const std = @import("std");
const build = @import("../build.zig");
const build_tools = @import("build_tools.zig");

pub const mcus = @import("avr/mcus.zig");
pub const svd = @import("avr/atdf.zig");

pub fn addFamilySteps(
    b: *std.Build,
    exe: *std.build.CompileStep,
    board: *const build.Board,
) !void {
    const startup = b.addObject(.{
        .name = "startup",
        .root_source_file = .{ .path = build.mkPath(@src(), "avr/startup.zig") },
        .target = exe.target,
        .optimize = exe.optimize,
    });
    exe.addObject(startup);
    exe.addLibraryPath(build.mkPath(@src(), "avr"));

    const hex_cmd = try build_tools.addObjCopyStep(b, exe, .hex);
    _ = build_tools.addFlashStep(b, hex_cmd, .avrdude, board);
}
