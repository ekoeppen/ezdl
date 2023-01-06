const std = @import("std");
const ezdl = @import("3rdparty/ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_path = b.option([]const u8, "board", "Board directory") orelse //
        "3rdparty/ezdl/src/stm32/boards/nucleo_f072rb";
    const exe = try ezdl.addExecutable(b, "accept.elf", "main.zig", board_path);
    exe.install();
}
