const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

const board = @import("blue_pill.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const exe = try ezdl.stm32.addExecutable(b, "blue_pill.elf", "main.zig", board);
    exe.install();
}
