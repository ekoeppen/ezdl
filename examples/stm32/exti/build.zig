const std = @import("std");
const ezdl = @import("ezdl");

const board = ezdl.stm32.nucleo_f072rb;

pub fn build(b: *std.build.Builder) anyerror!void {
    const exe = try ezdl.stm32.addExecutable(b, "exti.elf", "main.zig", board, &.{});
    exe.install();
}
