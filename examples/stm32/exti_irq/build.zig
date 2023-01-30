const std = @import("std");
const ezdl = @import("ezdl/src/ezdl.zig");

pub fn build(b: *std.build.Builder) anyerror!void {
    const board_path = b.option([]const u8, "board", "Board directory") orelse //
        "ezdl/src/stm32/boards/nucleo_f072rb";
    const exe = try ezdl.addExecutable(b, "exti_irq.elf", "main.zig", board_path);
    exe.install();
}
