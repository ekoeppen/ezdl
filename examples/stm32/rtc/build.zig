const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board = ezdl.stm32.rfm69_modem;
    const exe = try ezdl.stm32.addExecutable(b, "rtc.elf", "main.zig", board);
    exe.install();
}
