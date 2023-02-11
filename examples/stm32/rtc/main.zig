const std = @import("std");
const ezdl = @import("ezdl");
const board = @import("board");

const writer = board.console.writer();
const reader = board.console.reader();

fn run() anyerror!void {
    board.init();
    board.led.set();
    _ = try writer.print("---- Starting -----------------------------------\n", .{});
    while (true) {
        var dateTime = board.rtc.read();
        _ = try writer.print("     {t}\n", .{dateTime});
        dateTime.timeAddSeconds(10);
        board.rtc.setAlarmTime(&dateTime);
        board.rtc.awaitAlarm();
    }
}

pub export fn main() void {
    if (run()) {} else |_| {
        board.led3.set();
        @panic("Runtime exception");
    }
}
