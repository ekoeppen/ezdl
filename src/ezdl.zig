const std = @import("std");

pub const DeviceFamily = enum {
    stm32,
    msp430,
    avr,
    unknown,
};

pub const lib = @import("lib/lib.zig");
pub const stm32 = @import("stm32/stm32.zig");
pub const msp430 = @import("msp430/msp430.zig");
pub const avr = @import("avr/avr.zig");
pub const drivers = @import("drivers/drivers.zig");
pub const build_tools = @import("build_tools.zig");

pub fn mkPath(
    comptime src: std.builtin.SourceLocation,
    comptime path: []const u8,
) []const u8 {
    return comptime blk: {
        const pkg_dir = @import("std").fs.path.dirname(src.file) orelse ".";
        break :blk pkg_dir ++ "/" ++ path;
    };
}

pub fn deviceFamily(device: []const u8) DeviceFamily {
    if (device.len >= 5 and std.mem.eql(u8, device[0..5], "stm32")) return .stm32;
    if (device.len >= 6 and std.mem.eql(u8, device[0..6], "msp430")) return .msp430;
    if (device.len >= 6 and std.mem.eql(u8, device[0..6], "atmega")) return .avr;
    return .unknown;
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

const Model = struct { name: []const u8, cpu: *const std.Target.Cpu.Model };

const model_table: []const Model = &.{
    .{ .name = "cortex_m0", .cpu = &std.Target.arm.cpu.cortex_m0 },
    .{ .name = "cortex_m0plus", .cpu = &std.Target.arm.cpu.cortex_m0plus },
    .{ .name = "cortex_m1", .cpu = &std.Target.arm.cpu.cortex_m1 },
    .{ .name = "cortex_m3", .cpu = &std.Target.arm.cpu.cortex_m3 },
    .{ .name = "cortex_m4", .cpu = &std.Target.arm.cpu.cortex_m4 },
    .{ .name = "cortex_m7", .cpu = &std.Target.arm.cpu.cortex_m4 },
    .{ .name = "msp430", .cpu = &std.Target.msp430.cpu.msp430 },
    .{ .name = "atmega328", .cpu = &std.Target.avr.cpu.atmega328 },
    .{ .name = "atmega328p", .cpu = &std.Target.avr.cpu.atmega328p },
    .{ .name = "atmega32u4", .cpu = &std.Target.avr.cpu.atmega32u4 },
};

pub fn toCpuModel(model: []const u8) !*const std.Target.Cpu.Model {
    for (model_table) |known_model| {
        if (std.mem.eql(u8, known_model.name, model)) return known_model.cpu;
    }
    return error.UnkownCpuModel;
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
    board_path: []const u8,
) anyerror!*std.build.LibExeObjStep {
    const board = try readBoardSettings(b, b.pathJoin(&.{ board_path, "board.json" }));
    const linker_script_path = "zig-cache/memory.ld";
    const exe = b.addExecutable(elf_name, main);
    const info_tool = b.addExecutable("info_tool", mkPath(@src(), "lib/build_info.zig"));
    const build_info = info_tool.run();
    try generateLinkerScript(linker_script_path, board.memory);
    exe.setLinkerScriptPath(.{ .path = linker_script_path });
    exe.setBuildMode(b.standardReleaseOptions());
    exe.step.dependOn(&build_info.step);

    const target = .{
        .cpu_arch = board.cpu_arch,
        .cpu_model = .{ .explicit = try toCpuModel(board.cpu_model) },
        .os_tag = .freestanding,
    };
    exe.setTarget(target);

    const info_pkg = std.build.Pkg{
        .name = "build_info",
        .source = .{ .path = "zig-cache/build_info.zig" },
    };
    const mmio_pkg = std.build.Pkg{
        .name = "mmio",
        .source = .{ .path = mkPath(@src(), "mmio.zig") },
    };
    const ezdl_pkg = std.build.Pkg{
        .name = "ezdl",
        .source = .{ .path = mkPath(@src(), "ezdl.zig") },
        .dependencies = &.{mmio_pkg},
    };
    const board_pkg = std.build.Pkg{
        .name = "board",
        .source = .{ .path = b.pathJoin(&.{ board_path, "board.zig" }) },
        .dependencies = &.{ ezdl_pkg, mmio_pkg },
    };

    exe.addPackage(ezdl_pkg);
    exe.addPackage(board_pkg);
    exe.addPackage(info_pkg);

    const size_cmd = b.addSystemCommand(&[_][]const u8{"size"});
    size_cmd.addArtifactArg(exe);
    b.getInstallStep().dependOn(&size_cmd.step);

    switch (deviceFamily(board.device)) {
        .stm32 => try stm32.addFamilySteps(b, exe, &board),
        .msp430 => try msp430.addFamilySteps(b, exe, &board),
        .avr => try avr.addFamilySteps(b, exe, &board),
        else => {},
    }

    return exe;
}
