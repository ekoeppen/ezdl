const std = @import("std");
const ezdl = @import("3rdparty/ezdl/src/ezdl.zig");

const board = ezdl.stm32.nucleo_l031k6;

pub fn build(b: *std.build.Builder) anyerror!void {
    const exe = try ezdl.stm32.addExecutable(b, "accept.elf", "main.zig", board);
    exe.install();
    exe.addPackagePath("accept", "3rdparty/accept/src/main.zig");
}
