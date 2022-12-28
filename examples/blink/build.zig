const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_path = b.option([]const u8, "board", "Board directory") orelse //
        "ezdl/src/stm32/boards/nucleo_f072rb";
    const board_settings = try ezdl.readBoardSettings(b, b.pathJoin(&.{ board_path, "board.json" }));
    const exe = try ezdl.stm32.addExecutable(
        b,
        "blink.elf",
        "main.zig",
        b.pathJoin(&.{ board_path, "board.zig" }),
        &board_settings,
    );
    exe.install();
}
