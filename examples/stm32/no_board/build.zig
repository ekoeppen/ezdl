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
    var microzig = b.createModule(.{
        .source_file = .{ .path = "ezdl/src/microzig.zig" },
    });
    var ezdl = b.createModule(.{
        .source_file = .{ .path = "ezdl/src/ezdl.zig" },
        .dependencies = &.{.{ .name = "microzig", .module = microzig }},
    });
    exe.addModule("ezdl", ezdl);
    exe.install();
}
