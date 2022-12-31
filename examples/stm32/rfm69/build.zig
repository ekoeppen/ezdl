const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_settings = try ezdl.readBoardSettings(
        b,
        "ezdl/src/stm32/boards/rfm69_modem/board.json",
    );
    const exe = try ezdl.stm32.addExecutable(
        b,
        "rfm69.elf",
        "main.zig",
        "ezdl/src/stm32/boards/rfm69_modem/board.zig",
        &board_settings,
    );
    exe.install();
}
