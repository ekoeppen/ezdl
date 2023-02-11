const board = @import("board");
const accept = @import("accept");
const build_info = @import("build_info");
const writer = board.console.writer();

var line: [16]u8 = undefined;

fn acceptFull() []u8 {
    while (true) {
        var head = board.rx_buffer.len - board.svd.DMA1.CNDTR5.read().NDT;
        while (board.rx_index != head) {
            const c = board.rx_buffer[board.rx_index];
            board.rx_index += 1;
            if (board.rx_index == board.rx_buffer.len) board.rx_index = 0;
            switch (accept.handle(board.console.send, c)) {
                .accepted => |accepted| return accepted,
                else => {},
            }
        }
    }
}

fn acceptMinimal() []u8 {
    while (true) {
        var head = board.rx_buffer.len - board.svd.DMA1.CNDTR5.read().NDT;
        while (board.rx_index != head) {
            const c = board.rx_buffer[board.rx_index];
            board.rx_index += 1;
            if (board.rx_index == board.rx_buffer.len) board.rx_index = 0;
            switch (accept.handleMinimal(board.console.send, c)) {
                .accepted => |accepted| return accepted,
                else => {},
            }
        }
    }
}

fn acceptMinimalNoDma() []u8 {
    while (true) {
        switch (accept.handleMinimal(board.console.send, board.console.receive())) {
            .accepted => |accepted| return accepted,
            else => {},
        }
    }
}

fn echo() !void {
    while (true) {
        const c = board.console.receive();
        _ = try writer.print("{d} ", .{c});
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
        const accepted = acceptMinimalNoDma();
        _ = try writer.print("\n> {s}\n", .{accepted});
    }
}

pub export fn main() void {
    board.init();
    if (run()) {} else |_| {
        @panic("Runtime exception");
    }
}
