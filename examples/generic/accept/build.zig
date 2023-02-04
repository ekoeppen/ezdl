const std = @import("std");
const ezdl = @import("3rdparty/ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_name = b.option([]const u8, "board", "Board") orelse "nucleo_f072rb";
    const board = try ezdl.boardFromName(board_name);
    const exe = try ezdl.addExecutable(b, "accept.elf", "main.zig", &board);
    exe.addPackagePath("accept", "3rdparty/accept/src/main.zig");
    b.installArtifact(exe);
}
