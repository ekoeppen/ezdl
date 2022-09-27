const std = @import("std");
const ezdl = @import("ezdl");
const board = @import("board");

const writer = board.usart.writer();
const reader = board.usart.reader();

fn run() anyerror!void {
    board.init();
    board.led.set();
    _ = try writer.print("---- Starting -----------------------------------\n", .{});
    while (true) {
        var dateTime = board.rtc.read();
        _ = try writer.print("     {t}\n", .{dateTime});
        dateTime.timeAddSeconds(10);
        board.rtc.set_alarm_time(&dateTime);
        asm volatile ("wfe");
    }
}

pub export fn main() void {
    if (run()) {} else |_| {
        board.led3.set();
        @panic("Runtime exception");
    }
    while (true) {
        asm volatile ("wfi");
    }
}
