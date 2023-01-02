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
    const mmio_pkg = std.build.Pkg{
        .name = "mmio",
        .source = .{ .path = "ezdl/src/mmio.zig" },
    };
    const ezdl_pkg = std.build.Pkg{
        .name = "ezdl",
        .source = .{ .path = "ezdl/src/ezdl.zig" },
        .dependencies = &.{mmio_pkg},
    };
    exe.addPackage(ezdl_pkg);
    exe.install();
}
