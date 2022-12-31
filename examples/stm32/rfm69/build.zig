const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_settings = try ezdl.readBoardSettings(b, "board.json");
    const exe = try ezdl.stm32.addExecutable(
        b,
        "rfm69.elf",
        "main.zig",
        "board.zig",
        &board_settings,
    );
    exe.install();
}
