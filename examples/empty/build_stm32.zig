const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board = ezdl.stm32.nucleo_f072rb;
    const exe = try ezdl.stm32.addExecutable(b, "empty.elf", "main.zig", board, &.{});
    exe.install();
}
