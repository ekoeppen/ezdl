const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_settings = try ezdl.readBoardSettings(b, "blue_pill.json");
    const exe = try ezdl.stm32.addExecutable(
        b,
        "blink.elf",
        "main.zig",
        "blue_pill.zig",
        &board_settings,
    );
    exe.install();
}
