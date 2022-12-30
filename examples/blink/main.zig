const board = @import("board");

fn delay(n: usize) void {
    var counter = n;
    while (counter > 0) {
        counter -= 1;
        asm volatile ("");
    }
}

pub export fn main() void {
    board.init();
    board.led.init();

    while (true) {
        board.led.toggle();
        delay(65535);
    }
}
