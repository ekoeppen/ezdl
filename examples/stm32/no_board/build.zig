const std = @import("std");

pub fn build(b: *std.Build) anyerror!void {
    const target = .{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &(@import("std").Target.arm.cpu.cortex_m0) },
        .os_tag = .freestanding,
    };
    const exe = b.addExecutable(.{
        .name = "no_board.elf",
        .root_source_file = .{ .path = "main.zig" },
        .target = target,
        .optimize = b.standardOptimizeOption(.{}),
    });
    exe.setLinkerScriptPath(.{ .path = "linker.ld" });
    const microzig = std.build.Pkg{
        .name = "microzig",
        .source = .{ .path = "ezdl/src/microzig.zig" },
    };
    const ezdl_pkg = std.build.Pkg{
        .name = "ezdl",
        .source = .{ .path = "ezdl/src/ezdl.zig" },
        .dependencies = &.{microzig},
    };
    exe.addPackage(ezdl_pkg);
    exe.install();
}
