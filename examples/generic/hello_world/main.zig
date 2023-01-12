const board = @import("board");

export fn main() void {
    board.init();
    board.tx.init();
    board.rx.init();
    board.usart.init();
    for ("Hello, World!\n") |c| {
        board.usart.send(c);
    }
    while (true) {}
}
