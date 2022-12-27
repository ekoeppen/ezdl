const std = @import("std");

pub const lib = @import("lib/lib.zig");
pub const stm32 = @import("stm32/stm32.zig");
pub const msp430 = @import("msp430/msp430.zig");
pub const drivers = @import("drivers/drivers.zig");

pub fn mkPath(
    comptime src: std.builtin.SourceLocation,
    comptime path: []const u8,
) []const u8 {
    return comptime blk: {
        const pkg_dir = @import("std").fs.path.dirname(src.file) orelse ".";
        break :blk pkg_dir ++ "/" ++ path;
    };
}

pub fn generateLinkerScript(
    path: []const u8,
    comptime board: type,
) anyerror!void {
    const file = try std.fs.cwd().createFile(path, .{ .truncate = true });
    defer file.close();
    var writer = file.writer();
    try writer.print("MEMORY{{\n", .{});
    inline for (board.memory) |region| {
        try writer.print("    {s}({s}): ORIGIN = 0x{x:0>8}, LENGTH = {d}\n", .{
            region.name,
            region.attrs,
            region.start,
            region.size,
        });
    }
    try writer.print("}}\nINCLUDE sections.ld\n", .{});
}

pub fn addExecutable(
    b: *std.build.Builder,
    elf_name: []const u8,
    main: []const u8,
    comptime board: type,
) anyerror!*std.build.LibExeObjStep {
    const linker_script_path = "zig-cache/memory.ld";
    const exe = b.addExecutable(elf_name, main);
    const info_tool = b.addExecutable("info_tool", mkPath(@src(), "lib/build_info.zig"));
    const build_info = info_tool.run();
    try generateLinkerScript(linker_script_path, board);
    exe.setTarget(board.mcu.target);
    exe.setLinkerScriptPath(.{ .path = linker_script_path });
    exe.setBuildMode(b.standardReleaseOptions());
    exe.step.dependOn(&build_info.step);
    return exe;
}
