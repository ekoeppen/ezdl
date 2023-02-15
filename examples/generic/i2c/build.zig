const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_name = b.option([]const u8, "board", "Board") orelse "nucleo_f072rb";
    const board = try ezdl.boardFromName(board_name);
    const exe = try ezdl.addExecutable(b, "i2c.elf", "main.zig", &board);
    const accept = b.dependency("accept", .{ .target = exe.target, .optimize = exe.optimize });
    exe.addModule("accept", accept.module("accept"));
    b.installArtifact(exe);
}
