const board = @import("board");
const ezdl = @import("ezdl");

const button = board.mcu.Gpio(board.svd.peripherals.GPIOC, 13, .{ .input = .{
    .exti = board.exti,
    .interrupt = false,
    .trigger = .falling,
} });

const writer = board.usart.writer();

fn extiHandler() void {
    board.nvic.clearPending(board.interrupts.EXTI4_15);
    board.exti.clearInterrupt(board.interrupts.EXTI4_15);
}

const handlers: []const ezdl.stm32.IrqHandler = &.{
    .{ .number = board.interrupts.EXTI4_15, .handler = extiHandler },
};

export const vectors linksection(".vectors") = ezdl.stm32.mkVectors(board.interrupts, handlers);

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
    board.nvic.enableInterrupts(handlers);
    button.init();

    if (run()) {} else |_| {
        @panic("Runtime exception");
    }
}
