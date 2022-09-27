const std = @import("std");
const ezdl = @import("ezdl");
const board = @import("board");

const writer = board.usart.writer();

fn run() anyerror!void {
    _ = try writer.print("---- Starting -----------------------------------\n", .{});
    board.exti.connect(board.button);
    board.exti.enable(board.button.pin_number, .interrupt, .rising);
    asm volatile ("sev");
    asm volatile ("sev");
    while (true) {
        asm volatile ("wfe");
        _ = try writer.print("     Button pressed\n", .{});
    }
}

pub export fn main() void {
    board.init();

    if (run()) {} else |_| {
        @panic("Runtime exception");
    }
}
