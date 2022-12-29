const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn deviceFamily(device: []const u8) enum { stm32, msp430, unknown } {
    if (std.mem.eql(u8, device[0..5], "stm32")) return .stm32;
    if (std.mem.eql(u8, device[0..6], "msp430")) return .msp430;
    return .unknown;
}

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_path = b.option([]const u8, "board", "Board directory") orelse //
        "ezdl/src/stm32/boards/nucleo_f072rb";
    const board_settings = try ezdl.readBoardSettings(b, b.pathJoin(&.{ board_path, "board.json" }));
    const exe = switch (deviceFamily(board_settings.device)) {
        .msp430 => try ezdl.msp430.addExecutable(
            b,
            "empty.elf",
            "main.zig",
            b.pathJoin(&.{ board_path, "board.zig" }),
            &board_settings,
        ),
        .stm32 => try ezdl.stm32.addExecutable(
            b,
            "empty.elf",
            "main.zig",
            b.pathJoin(&.{ board_path, "board.zig" }),
            &board_settings,
        ),
        else => return error.NotSupported,
    };
    exe.install();
}
