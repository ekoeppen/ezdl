const std = @import("std");
const ezdl = @import("ezdl");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_name = b.option([]const u8, "board", "Board") orelse "stm32f103c8_base";
    const board = try ezdl.boardFromName(board_name);
    const exe = try ezdl.addExecutable(b, "cp2102.elf", "main.zig", &board);
    b.installArtifact(exe);
}
