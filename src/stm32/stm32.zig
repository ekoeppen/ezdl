const std = @import("std");
const ezdl = @import("../ezdl.zig");

pub const mcus = @import("mcus/mcus.zig");
pub const svd = @import("svd/svd.zig");

pub const nucleo_f072rb = @import("nucleo_f072rb.zig");
pub const nucleo_f103rb = @import("nucleo_f103rb.zig");
pub const nucleo_l010rb = @import("nucleo_l010rb.zig");
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
) anyerror!*std.build.LibExeObjStep {
    const exe = try ezdl.addExecutable(b, elf_name, ezdl.mkPath(@src(), "startup.zig"), board);
    exe.addLibraryPath(ezdl.mkPath(@src(), ""));
    exe.addAssemblyFile(ezdl.mkPath(@src(), "clzsi2.S"));

    const ezdl_pkg = std.build.Pkg{
        .name = "ezdl",
        .source = .{ .path = ezdl.mkPath(@src(), "../ezdl.zig") },
    };
    const board_pkg = std.build.Pkg{
        .name = "board",
        .source = .{ .path = board.pkgFile() },
        .dependencies = &.{ezdl_pkg},
    };
    const app_pkg = std.build.Pkg{
        .name = "app",
        .source = .{ .path = main_file },
        .dependencies = &.{ ezdl_pkg, board_pkg },
    };
    exe.addPackage(ezdl_pkg);
    exe.addPackage(board_pkg);
    exe.addPackage(app_pkg);

    const size_cmd = b.addSystemCommand(&[_][]const u8{"arm-none-eabi-size"});
    size_cmd.addArtifactArg(exe);
    b.getInstallStep().dependOn(&size_cmd.step);

    const extension_len = std.fs.path.extension(exe.name).len;
    const base_name = if (extension_len > 0) exe.name[0 .. exe.name.len - extension_len] else exe.name;
    var name_buf: [std.os.PATH_MAX]u8 = undefined;
    const bin_name = try std.fmt.bufPrint(&name_buf, "{s}.bin", .{base_name});
    var path_buf: [std.os.PATH_MAX]u8 = undefined;
    const bin_path = try std.fmt.bufPrint(&path_buf, "{s}/{s}", .{ b.cache_root, bin_name });
    const bin_cmd = b.addSystemCommand(&[_][]const u8{
        "arm-none-eabi-objcopy",
        "-O",
        "binary",
    });
    bin_cmd.addArtifactArg(exe);
    bin_cmd.addArg(bin_path);
    b.getInstallStep().dependOn(&bin_cmd.step);
    b.installBinFile(bin_path, bin_name);
    return exe;
}
