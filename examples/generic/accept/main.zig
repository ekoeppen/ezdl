const board = @import("board");
const accept = @import("3rdparty/accept/src/main.zig");
const build_info = @import("build_info");
const writer = board.usart.writer();

var line: [16]u8 = undefined;

fn acceptMinimal() []u8 {
    while (true) {
        switch (accept.handleMinimal(board.usart.send, board.usart.receive())) {
            .accepted => |accepted| return accepted,
            else => {},
        }
    }
}

pub fn run() !void {
    _ = try writer.print("\n---- Starting -----------------------------------\n", .{});
    _ = try writer.print("---- Built: {s} from {s}\n", .{
        build_info.build_time,
        build_info.commit,
    });
    while (true) {
        _ = try writer.print("\n? ", .{});
        accept.init(&line);
        const accepted = acceptMinimal();
        _ = try writer.print("\n> {s}\n", .{accepted});
    }
}

pub export fn main() void {
    board.init();
    board.tx.init();
    board.rx.init();
    board.usart.init();
    board.led.init();
    if (run()) {} else |_| {}
}
