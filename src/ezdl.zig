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

pub const MemoryRegion = struct {
    name: []const u8,
    attrs: []const u8,
    start: usize,
    size: usize,
};

pub const Board = struct {
    memory: []const MemoryRegion = &.{},
    cpu_arch: std.Target.Cpu.Arch,
    cpu_model: []const u8 = "",
    device: []const u8 = "",
    path: []const u8 = "",
    port: []const u8 = "",
};

pub fn generateLinkerScript(
    path: []const u8,
    memory: []const MemoryRegion,
) anyerror!void {
    const file = try std.fs.cwd().createFile(path, .{ .truncate = true });
    defer file.close();
    var writer = file.writer();
    try writer.print("MEMORY{{\n", .{});
    for (memory) |region| {
        try writer.print("    {s}({s}): ORIGIN = 0x{x:0>8}, LENGTH = {d}\n", .{
            region.name,
            region.attrs,
            region.start,
            region.size,
        });
    }
    try writer.print("}}\nINCLUDE sections.ld\n", .{});
}

pub fn readBoardSettings(b: *std.build.Builder, path: []const u8) !Board {
    const file = try std.fs.cwd().createFile(path, .{ .read = true, .truncate = false });
    defer file.close();
    const settings = try file.reader().readAllAlloc(b.allocator, 65536);
    defer b.allocator.free(settings);
    var stream = std.json.TokenStream.init(settings);
    const board = try std.json.parse(Board, &stream, .{ .allocator = b.allocator });
    return board;
}

pub fn addExecutable(
    b: *std.build.Builder,
    elf_name: []const u8,
    main: []const u8,
    board: *const Board,
) anyerror!*std.build.LibExeObjStep {
    const linker_script_path = "zig-cache/memory.ld";
    const exe = b.addExecutable(elf_name, main);
    const info_tool = b.addExecutable("info_tool", mkPath(@src(), "lib/build_info.zig"));
    const build_info = info_tool.run();
    try generateLinkerScript(linker_script_path, board.memory);
    exe.setLinkerScriptPath(.{ .path = linker_script_path });
    exe.setBuildMode(b.standardReleaseOptions());
    exe.step.dependOn(&build_info.step);
    return exe;
}
