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

pub const MemoryRegion = struct {
    name: []const u8,
    attrs: []const u8,
    start: usize,
    size: usize,
};

pub const Board = struct {
    name: []const u8,
    memory: []const MemoryRegion,
    cpu_name: []const u8 = undefined,
    cpu_arch: std.Target.Cpu.Arch,
    cpu_model: std.zig.CrossTarget.CpuModel,
    port: []const u8 = undefined,
    programmer: []const u8 = undefined,
    board_path: ?[]const u8 = null,
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

pub const boards = .{
    @import("stm32/boards/nucleo_f072rb/stm32f072rb.zig"),
    @import("stm32/boards/nucleo_f103rb/stm32f103rb.zig"),
    @import("stm32/boards/nucleo_l031k6/stm32l031k6.zig"),
    @import("stm32/boards/olimexino_stm32/stm32f103rb.zig"),
    @import("stm32/boards/olimexino_stm32/stm32f103rb_bl.zig"),
    @import("stm32/boards/stm32f0_stackable/stm32f072c8.zig"),
    @import("stm32/boards/stm32f1_base/stm32f103c8.zig"),
    @import("msp430/boards/exp_msp430g2/msp430g2553.zig"),
    @import("avr/boards/arduino_uno/atmega328p.zig"),
    @import("avr/boards/arduino_leonardo/atmega32u4.zig"),
};

pub fn boardFromName(name: []const u8) !Board {
    inline for (boards) |board| {
        if (std.ascii.eqlIgnoreCase(board.config.name, name)) {
            return board.config;
        }
    }
    return error.BoardDoesNotExist;
}

pub fn irqIndicesToInts(comptime indices: anytype) []u8 {
    var ints: [indices.len]u8 = undefined;
    for (indices) |index, i| {
        ints[i] = @enumToInt(index);
    }
    return &ints;
}

pub fn addExecutable(
    b: *std.Build,
    elf_name: []const u8,
    main: []const u8,
    board: *const Board,
) anyerror!*std.build.CompileStep {
    const linker_script_path = "zig-cache/memory.ld";
    const output_name = try std.fmt.allocPrint(b.allocator, "{s}_{s}{s}", .{
        std.fs.path.stem(elf_name),
        board.name,
        std.fs.path.extension(elf_name),
    });
    const target = .{
        .cpu_arch = board.cpu_arch,
        .cpu_model = board.cpu_model,
        .os_tag = .freestanding,
    };
    const exe = b.addExecutable(.{
        .name = output_name,
        .optimize = b.standardOptimizeOption(.{}),
        .target = target,
        .root_source_file = .{ .path = main },
    });
    const info_tool = b.addExecutable(.{
        .name = "info_tool",
        .root_source_file = .{ .path = mkPath(@src(), "lib/build_info.zig") },
    });
    const build_info = info_tool.run();
    try generateLinkerScript(linker_script_path, board.memory);
    exe.setLinkerScriptPath(.{ .path = linker_script_path });
    exe.step.dependOn(&build_info.step);
    exe.strip = false;

    var info_mod = b.createModule(.{
        .source_file = .{ .path = "zig-cache/build_info.zig" },
    });
    var microzig_mod = b.createModule(.{
        .source_file = .{ .path = mkPath(@src(), "microzig.zig") },
    });
    var ezdl_mod = b.createModule(.{
        .source_file = .{ .path = mkPath(@src(), "ezdl.zig") },
        .dependencies = &.{
            .{ .name = "microzig", .module = microzig_mod },
        },
    });

    exe.addModule("ezdl", ezdl_mod);
    exe.addModule("build_info", info_mod);

    if (board.board_path) |board_path| {
        var board_mod = b.createModule(.{
            .source_file = .{ .path = board_path },
            .dependencies = &.{
                .{ .name = "ezdl", .module = ezdl_mod },
                .{ .name = "microzig", .module = microzig_mod },
            },
        });
        exe.addModule("board", board_mod);
    }

    const size_cmd = b.addSystemCommand(&[_][]const u8{"size"});
    size_cmd.addArtifactArg(exe);
    b.getInstallStep().dependOn(&size_cmd.step);

    switch (board.cpu_arch) {
        .arm, .thumb => try stm32.addFamilySteps(b, exe, board),
        .msp430 => try msp430.addFamilySteps(b, exe, board),
        .avr => try avr.addFamilySteps(b, exe, board),
        else => {},
    }

    return exe;
}
