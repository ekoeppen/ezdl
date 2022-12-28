const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

const board = ezdl.msp430.exp_msp430g2;

pub fn build(b: *std.build.Builder) anyerror!void {
    const exe = try ezdl.msp430.addExecutable(b, "empty.elf", "main.zig", board, &.{});
    exe.install();
}
