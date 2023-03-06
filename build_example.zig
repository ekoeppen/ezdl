const std = @import("std");
const ezdl = @import("build.zig");

pub fn build(b: *std.Build) !void {
    const binary = b.option([]const u8, "binary", "Binary name") orelse @panic("Binary name missing");
    const main = b.option([]const u8, "main", "Main file path") orelse @panic("Main file path missing");
    const board_name = b.option([]const u8, "board", "Board name") orelse @panic("Board name missing");
    const board = try ezdl.boardFromName(board_name);
    _ = try ezdl.addExecutable(b, binary, main, &board);
}
