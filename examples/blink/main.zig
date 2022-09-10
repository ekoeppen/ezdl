const board = @import("board");

pub export fn main() void {
    board.init();
    board.led.set();
    while (true) {
        asm volatile ("wfi");
    }
}
