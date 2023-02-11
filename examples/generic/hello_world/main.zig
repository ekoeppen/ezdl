const board = @import("board");

export fn main() void {
    board.init();
    board.tx.init();
    board.rx.init();
    board.console.init();
    for ("Hello, World!\n") |c| {
        board.console.send(c);
    }
    while (true) {
        board.console.send(board.console.receive());
    }
}
