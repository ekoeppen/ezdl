const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const exe = try ezdl.addExecutable(b, "cp2102.elf", "main.zig", ".");
    exe.install();
}
