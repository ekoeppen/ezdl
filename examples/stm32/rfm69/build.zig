const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_name = b.option([]const u8, "board", "Board") orelse "nucleo_f072rb";
    const board = try ezdl.boardFromName(board_name);
    const exe = try ezdl.addExecutable(b, "rfm69.elf", "main.zig", &board);
    b.installArtifact(exe);
}
