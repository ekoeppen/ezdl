const board = @import("board");
const ezdl = @import("ezdl");

const button = board.mcu.Gpio(board.svd.peripherals.GPIOC, 13, .{ .input = .{
    .exti = board.exti,
    .interrupt = false,
    .trigger = .falling,
} });

const writer = board.usart.writer();

fn extiHandler() void {
    board.nvic.clearPending(@enumToInt(@as(board.svd.VectorIndex, .EXTI4_15)));
    board.exti.clearInterrupt(@enumToInt(@as(board.svd.VectorIndex, .EXTI4_15)));
}

export const vectors: board.VectorTable linksection(".vectors") = .{
    .EXTI4_15 = extiHandler,
};

fn run() anyerror!void {
    _ = try writer.print("---- Starting -----------------------------------\n", .{});
    while (true) {
        asm volatile ("wfi");
        _ = try writer.print("     Button pressed\n", .{});
    }
}

pub export fn main() void {
    board.init();
    board.tx.init();
    board.rx.init();
    board.usart.init();
    button.init();

    if (run()) {} else |_| {
        @panic("Runtime exception");
    }
}
