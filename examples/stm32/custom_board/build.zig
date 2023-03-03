const std = @import("std");
const ezdl = @import("root").dependencies.imports.ezdl;

pub fn build(b: *std.build.Builder) anyerror!void {
    const exe = try ezdl.addExecutable(b, "blink.elf", "main.zig", &.{
        .name = "blue_pill",
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &(@import("std").Target.arm.cpu.cortex_m3) },
        .port = "/dev/ttyUSB0",
        .programmer = "stm32flash",
        .memory = &.{
            .{ .name = "rom", .attrs = "rx", .start = 0x08000000, .size = 65536 },
            .{ .name = "ram", .attrs = "rwx", .start = 0x20000000, .size = 20480 },
        },
    });
    b.installArtifact(exe);
}
