const std = @import("std");
const ezdl = @import("ezdl");

pub fn build(b: *std.build.Builder) anyerror!void {
    const exe = try ezdl.addExecutable(b, "bootloader.elf", "main.zig", &.{
        .name = "bootloader",
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &(@import("std").Target.arm.cpu.cortex_m0) },
        .programmer = "jlink",
        .memory = &.{
            .{ .name = "rom", .attrs = "rx", .start = 0x00000000, .size = 65536 },
            .{ .name = "ram", .attrs = "rwx", .start = 0x20000000, .size = 20480 },
        },
    });
    b.installArtifact(exe);
}
