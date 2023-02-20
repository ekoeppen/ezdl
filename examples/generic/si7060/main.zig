const std = @import("std");
const ezdl = @import("ezdl");
const board = @import("board");
const accept = @import("accept");
const build_info = @import("build_info");

const writer = board.console.writer();
const reader = board.console.reader();

const si7060 = ezdl.drivers.si7060.Si7060(board.i2c, 0x32);

fn busReset() !void {
    board.sda_pp.init();
    var n: u32 = 9;
    while (n > 0) : (n -= 1) {
        board.sda_pp.clear();
        delay(7000);
        board.sda_pp.set();
        delay(7000);
    }

    board.sda.init();
}

pub fn run() !void {
    try busReset();
    board.scl.init();
    board.sda.init();
    board.i2c.init();

    while (!board.console.dtr()) {
        board.mcu.sleep();
    }
    _ = try writer.writeAll("\n---- Si7060 Test -----------------------------------\n");
    _ = try writer.print("---- Built: {s} from {s}\n", .{
        build_info.build_time,
        build_info.commit,
    });
    while (true) {
        _ = try writer.writeAll("\nboard (r)eset\n(b)us reset\n(w)akeup\n(s)leep\n(m)easure\n");
        const c = board.console.receive();
        switch (c) {
            'r' => board.mcu.reset(),
            'b' => try busReset(),
            'w' => si7060.wakeup() catch |err| {
                _ = try writer.print("Wakeup error: {}\n", .{err});
                continue;
            },
            's' => si7060.sleep() catch |err| {
                _ = try writer.print("Sleep error: {}\n", .{err});
                continue;
            },
            'm' => {
                const t = si7060.measureTemperature() catch |err| {
                    _ = try writer.print("Measurement error: {}\n", .{err});
                    continue;
                };
                _ = try writer.print("t: {d}\n", .{t});
            },
            else => {},
        }
    }
}

fn delay(count: u32) void {
    var n: u32 = count;
    while (n > 0) : (n -= 1) asm volatile ("");
}

pub export fn main() void {
    board.init();
    board.led.init();
    board.tx.init();
    board.rx.init();

    board.console.init();
    board.led.set();

    if (run()) {} else |_| {
        board.mcu.reset();
    }
}
