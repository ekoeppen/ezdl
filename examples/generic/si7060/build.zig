const std = @import("std");
const ezdl = @import("ezdl");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_name = b.option([]const u8, "board", "Board") orelse "nucleo_f072rb";
    const board = try ezdl.boardFromName(board_name);
    const exe = try ezdl.addExecutable(b, "si7060.elf", "main.zig", &board);
    b.installArtifact(exe);
}
