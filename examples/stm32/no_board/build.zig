const std = @import("std");

pub fn build(b: *std.build.Builder) anyerror!void {
    const exe = b.addExecutable("no_board.elf", "main.zig");
    exe.setTarget(.{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &(@import("std").Target.arm.cpu.cortex_m0) },
        .os_tag = .freestanding,
    });
    exe.setLinkerScriptPath(.{ .path = "linker.ld" });
    exe.setBuildMode(b.standardReleaseOptions());
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
