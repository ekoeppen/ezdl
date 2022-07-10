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
    exe.addPackagePath("ezdl", "ezdl/src/ezdl.zig");
    exe.install();
}
