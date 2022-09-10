const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

const board = ezdl.stm32.rfm69_modem;

pub fn build(b: *std.build.Builder) anyerror!void {
    const exe = try ezdl.stm32.addExecutable(b, "rfm69_tx.elf", "main.zig", board);
    exe.install();
}
