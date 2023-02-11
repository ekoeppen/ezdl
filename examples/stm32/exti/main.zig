const board = @import("board");

const writer = board.console.writer();

fn run() anyerror!void {
    _ = try writer.print("---- Starting -----------------------------------\n", .{});
    while (true) {
        board.button.awaitClear();
        _ = try writer.print("     Button pressed\n", .{});
    }
}

pub export fn main() void {
    board.init();

    if (run()) {} else |_| {
        @panic("Runtime exception");
    }
}
