const std = @import("std");
const ezdl = @import("../ezdl.zig");
const build_tools = @import("build_tools.zig");

pub const mcus = @import("mcus/mcus.zig");
pub const svd = @import("svd/svd.zig");

pub const IrqHandler = struct {
    number: u32,
    handler: fn () void,
};

pub fn mkVectors(
    comptime interrupts: anytype,
    comptime handlers: []const IrqHandler,
) [@typeInfo(interrupts).Struct.decls.len]*const fn () void {
    var v: [@typeInfo(interrupts).Struct.decls.len]*const fn () void = undefined;
    for (handlers) |handler| {
        v[handler.number] = handler.handler;
    }
    return v;
}

pub fn toCpuModel(model: []const u8) *const std.Target.Cpu.Model {
    _ = model;
    return &std.Target.arm.cpu.cortex_m0;
}

pub fn addExecutable(
    b: *std.build.Builder,
    elf_name: []const u8,
    main_file: []const u8,
    board_file: []const u8,
    board_settings: *const ezdl.Board,
) anyerror!*std.build.LibExeObjStep {
    const target = .{
        .cpu_arch = board_settings.cpu_arch,
        .cpu_model = .{ .explicit = toCpuModel(board_settings.cpu_model) },
        .os_tag = .freestanding,
    };

    const exe = try ezdl.addExecutable(b, elf_name, main_file, board_settings);
    exe.addLibraryPath(ezdl.mkPath(@src(), ""));
    exe.setTarget(target);

    const info_pkg = std.build.Pkg{
        .name = "build_info",
        .source = .{ .path = "zig-cache/build_info.zig" },
    };
    const ezdl_pkg = std.build.Pkg{
        .name = "ezdl",
        .source = .{ .path = ezdl.mkPath(@src(), "../ezdl.zig") },
    };
    const board_pkg = std.build.Pkg{
        .name = "board",
        .source = .{ .path = board_file },
        .dependencies = &.{ezdl_pkg},
    };

    exe.addPackage(ezdl_pkg);
    exe.addPackage(board_pkg);
    exe.addPackage(info_pkg);

    const startup = b.addObject("startup", ezdl.mkPath(@src(), "startup.zig"));
    startup.setTarget(target);
    startup.setBuildMode(b.standardReleaseOptions());
    exe.addObject(startup);

    const size_cmd = b.addSystemCommand(&[_][]const u8{"arm-none-eabi-size"});
    size_cmd.addArtifactArg(exe);
    b.getInstallStep().dependOn(&size_cmd.step);

    const hex_cmd = try build_tools.addObjCopyStep(b, exe, .hex);
    _ = build_tools.addFlashStep(b, hex_cmd, .jlink, board_settings);
    _ = build_tools.addFlashStep(b, hex_cmd, .stm32flash, board_settings);
    return exe;
}
