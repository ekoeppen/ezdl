const std = @import("std");
const board = @import("board");
const accept = @import("accept");
const build_info = @import("build_info");

const writer = board.console.writer();
const reader = board.console.reader();

var line: [16]u8 = undefined;

fn writeByte(byte: u8) void {
    board.console.send(byte);
}

fn readByte() u8 {
    return board.console.receive();
}

fn acceptMinimal() []u8 {
    while (true) {
        switch (accept.handleMinimal(writeByte, readByte())) {
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
    board.console.init();
    board.led.init();
    if (run()) {} else |_| {}
}
