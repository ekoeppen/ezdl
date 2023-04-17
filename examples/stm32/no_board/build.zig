const std = @import("std");

pub fn build(b: *std.Build) anyerror!void {
    const optimize = b.standardOptimizeOption(.{});
    const target: std.zig.CrossTarget = .{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &(@import("std").Target.arm.cpu.cortex_m0) },
        .os_tag = .freestanding,
    };
    const ezdl = b.dependency("ezdl", .{ .target = target, .optimize = optimize });
    const exe = b.addExecutable(.{
        .name = "no_board.elf",
        .root_source_file = .{ .path = "main.zig" },
        .target = target,
        .optimize = optimize,
    });
    exe.setLinkerScriptPath(.{ .path = "linker.ld" });
    exe.addModule("ezdl", ezdl.module("ezdl"));
    exe.addModule("microzig", ezdl.module("microzig"));
    b.installArtifact(exe);
}
