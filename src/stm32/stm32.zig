const std = @import("std");
const ezdl = @import("../ezdl.zig");
const build_tools = @import("build_tools.zig");

pub const mcus = @import("mcus/mcus.zig");
pub const svd = @import("svd/svd.zig");

pub const nucleo_f072rb = @import("nucleo_f072rb.zig");
pub const nucleo_f103rb = @import("nucleo_f103rb.zig");
pub const nucleo_l031k6 = @import("nucleo_l031k6.zig");
pub const rfm69_modem = @import("rfm69_modem.zig");

pub const IrqHandler = struct {
    number: u32,
    handler: fn () void,
};

pub fn mkVectors(
    comptime interrupts: anytype,
    comptime handlers: []const IrqHandler,
) [@typeInfo(interrupts).Struct.decls.len]fn () void {
    var v: [@typeInfo(interrupts).Struct.decls.len]fn () void = undefined;
    for (handlers) |handler| {
        v[handler.number] = handler.handler;
    }
    return v;
}

pub fn addExecutable(
    b: *std.build.Builder,
    elf_name: []const u8,
    main_file: []const u8,
    comptime board: type,
    comptime packages: []const std.build.Pkg,
) anyerror!*std.build.LibExeObjStep {
    const exe = try ezdl.addExecutable(
        b,
        elf_name,
        ezdl.mkPath(@src(), "startup.zig"),
        board,
    );
    exe.addLibraryPath(ezdl.mkPath(@src(), ""));

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
        .source = .{ .path = board.pkgFile() },
        .dependencies = &.{ezdl_pkg},
    };

    const app_dependencies = init: {
        var deps: [packages.len + 3]std.build.Pkg = undefined;
        deps[0] = ezdl_pkg;
        deps[1] = board_pkg;
        deps[2] = info_pkg;
        for (packages) |p, i| deps[3 + i] = p;
        break :init deps;
    };
    const app_pkg = std.build.Pkg{
        .name = "app",
        .source = .{ .path = main_file },
        .dependencies = &app_dependencies,
    };
    exe.addPackage(ezdl_pkg);
    exe.addPackage(board_pkg);
    exe.addPackage(app_pkg);

    const size_cmd = b.addSystemCommand(&[_][]const u8{"arm-none-eabi-size"});
    size_cmd.addArtifactArg(exe);
    b.getInstallStep().dependOn(&size_cmd.step);

    const hex_cmd = try build_tools.addObjCopyStep(b, exe, .hex);
    _ = build_tools.addFlashStep(b, hex_cmd, .jlink, board);
    _ = build_tools.addFlashStep(b, hex_cmd, .stm32flash, board);
    return exe;
}
