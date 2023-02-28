const std = @import("std");

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
    @import("stm32/boards/stm32f0_nrf24/stm32f030f4.zig"),
    @import("stm32/boards/stm32l0_nrf24/stm32l011f4.zig"),
    @import("stm32/boards/stm32l0_rfm69/stm32l011f4.zig"),
    @import("stm32/boards/nucleo_f072rb/stm32f072rb.zig"),
    @import("stm32/boards/nucleo_f103rb/stm32f103rb.zig"),
    @import("stm32/boards/nucleo_l031k6/stm32l031k6.zig"),
    @import("stm32/boards/olimexino_stm32/stm32f103rb.zig"),
    @import("stm32/boards/olimexino_stm32/stm32f103rb_bl.zig"),
    @import("stm32/boards/stm32f0_stackable/stm32f072c8.zig"),
    @import("stm32/boards/stm32f1_base/stm32f103c8.zig"),
    @import("stm32/boards/stm32f1_base/stm32f103c8_bl.zig"),
    @import("msp430/boards/exp_msp430g2/msp430g2553.zig"),
    @import("avr/boards/arduino_uno/atmega328p.zig"),
    @import("avr/boards/arduino_leonardo/atmega32u4.zig"),
    @import("avr/boards/avr64dd32_curiosity_nano/avr64dd32.zig"),
};

pub fn boardFromName(name: []const u8) !Board {
    inline for (boards) |board| {
        if (std.ascii.eqlIgnoreCase(board.config.name, name)) {
            return board.config;
        }
    }
    return error.BoardDoesNotExist;
}

pub fn build(b: *std.Build) !void {
    const board_path = b.option("board");
    const info_tool = b.addExecutable(.{
        .name = "info_tool",
        .root_source_file = .{ .path = "src/lib/build_info.zig" },
    });
    const build_info = info_tool.run();
    _ = build_info;

    b.addModule(.{
        .name = "build_info",
        .source_file = .{ .path = "zig-cache/build_info.zig" },
    });
    b.addModule(.{
        .name = "microzig",
        .source_file = .{ .path = "src/microzig.zig" },
    });
    b.addModule(.{
        .name = "ezdl",
        .source_file = .{ .path = "src/ezdl.zig" },
    });

    b.addModule(.{
        .name = "board",
        .source_file = .{ .path = board_path },
    });
}
