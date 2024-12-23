const std = @import("std");
const build_tools = @import("src/build_tools.zig");

pub const arm = @import("src/arm.zig");
pub const stm32 = @import("src/stm32.zig");
pub const msp430 = @import("src/msp430.zig");
pub const avr = @import("src/avr.zig");

pub fn mkPath(
    comptime src: std.builtin.SourceLocation,
    comptime path: []const u8,
) []const u8 {
    return comptime blk: {
        const pkg_dir = @import("std").fs.path.dirname(src.file) orelse ".";
        break :blk pkg_dir ++ "/" ++ path;
    };
}

pub const DeviceFamily = enum {
    stm32,
    msp430,
    avr,
    sam,
};

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
    device_family: ?DeviceFamily = undefined,
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
    @import("src/stm32/boards/stm32f0_nrf24/stm32f030f4.zig"),
    @import("src/stm32/boards/stm32l0_nrf24/stm32l011f4.zig"),
    @import("src/stm32/boards/stm32l0_rfm69/stm32l011f4.zig"),
    @import("src/stm32/boards/nucleo_f072rb/stm32f072rb.zig"),
    @import("src/stm32/boards/nucleo_f103rb/stm32f103rb.zig"),
    @import("src/stm32/boards/nucleo_l031k6/stm32l031k6.zig"),
    @import("src/stm32/boards/olimexino_stm32/stm32f103rb.zig"),
    @import("src/stm32/boards/olimexino_stm32/stm32f103rb_bl.zig"),
    @import("src/stm32/boards/stm32f0_stackable/stm32f072c8.zig"),
    @import("src/stm32/boards/stm32f1_base/stm32f103c8.zig"),
    @import("src/stm32/boards/stm32f1_base/stm32f103c8_bl.zig"),
    @import("src/sam/boards/atsamd20e_breakout/atsamd20e15.zig"),
    @import("src/sam/boards/atsamd20e_breakout/atsamd20e15_bl.zig"),
    @import("src/sam/boards/arduino_zero/atsamd21g18.zig"),
    @import("src/msp430/boards/exp_msp430g2/msp430g2553.zig"),
    @import("src/avr/boards/arduino_uno/atmega328p.zig"),
    @import("src/avr/boards/arduino_leonardo/atmega32u4.zig"),
    @import("src/avr/boards/avr64dd32_curiosity_nano/avr64dd32.zig"),
    @import("src/avr/boards/avr128db28_minimal/avr128db28.zig"),
};

pub fn boardFromName(name: []const u8) !Board {
    inline for (boards) |board| {
        if (std.ascii.eqlIgnoreCase(board.config.name, name)) {
            return board.config;
        }
    }
    return error.BoardDoesNotExist;
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
        .root_source_file = .{ .path = mkPath(@src(), "src/lib/build_info.zig") },
    });
    const build_info = b.addRunArtifact(info_tool);
    exe.step.dependOn(&build_info.step);
    const stats = build_tools.addStatsStep(b, exe);
    b.getInstallStep().dependOn(&stats.step);

    const info_mod = b.createModule(.{
        .source_file = .{ .path = "zig-cache/build_info.zig" },
    });
    const microzig_mod = b.createModule(.{
        .source_file = .{ .path = mkPath(@src(), "src/microzig.zig") },
    });
    const ezdl_mod = b.createModule(.{
        .source_file = .{ .path = mkPath(@src(), "src/ezdl.zig") },
        .dependencies = &.{
            .{ .name = "microzig", .module = microzig_mod },
        },
    });

    exe.addModule("ezdl", ezdl_mod);
    exe.addModule("build_info", info_mod);

    if (board.board_path) |board_path| {
        const board_mod = b.createModule(.{
            .source_file = .{ .path = board_path },
            .dependencies = &.{
                .{ .name = "ezdl", .module = ezdl_mod },
                .{ .name = "microzig", .module = microzig_mod },
            },
        });
        exe.addModule("board", board_mod);
    }

    if (board.board_path) |path| exe.addLibraryPath(std.fs.path.dirname(path).?);
    try generateLinkerScript(linker_script_path, board.memory);
    exe.setLinkerScriptPath(.{ .path = linker_script_path });
    exe.strip = false;

    switch (board.cpu_arch) {
        .arm, .thumb => try arm.addFamilySteps(b, exe, board),
        .msp430 => try msp430.addFamilySteps(b, exe, board),
        .avr => try avr.addFamilySteps(b, exe, board),
        else => {},
    }

    return exe;
}

pub fn build(b: *std.Build) !void {
    const microzig = b.addModule("microzig", .{ .source_file = .{ .path = "src/microzig.zig" } });
    _ = b.addModule("ezdl", .{
        .source_file = .{ .path = "src/ezdl.zig" },
        .dependencies = &.{.{ .name = "microzig", .module = microzig }},
    });
}
