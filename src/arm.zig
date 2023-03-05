const std = @import("std");
const build = @import("../build.zig");
const build_tools = @import("build_tools.zig");

pub fn addFamilySteps(
    b: *std.Build,
    exe: *std.build.CompileStep,
    board: *const build.Board,
) !void {
    const startup = b.addObject(.{
        .name = "startup",
        .root_source_file = .{ .path = build.mkPath(@src(), "arm/startup.zig") },
        .target = exe.target,
        .optimize = exe.optimize,
    });
    exe.addObject(startup);
    exe.addLibraryPath(build.mkPath(@src(), "arm"));

    const hex_cmd = try build_tools.addObjCopyStep(b, exe, .hex);
    const bin_cmd = try build_tools.addObjCopyStep(b, exe, .bin);
    _ = build_tools.addFlashStep(b, hex_cmd, .jlink, board);
    _ = build_tools.addFlashStep(b, hex_cmd, .stlink, board);
    _ = build_tools.addFlashStep(b, hex_cmd, .stm32flash, board);
    _ = build_tools.addFlashStep(b, bin_cmd, .dfu_util, board);
}
