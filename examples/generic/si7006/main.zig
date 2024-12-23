const std = @import("std");
const ezdl = @import("ezdl");
const board = @import("board");
const accept = @import("accept");
const build_info = @import("build_info");

const writer = board.console.writer();
const reader = board.console.reader();

const si7006 = ezdl.drivers.si7006.Si7006(board.i2c);

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
    _ = try writer.writeAll("\n---- Si7006 Test -----------------------------------\n");
    _ = try writer.print("---- Built: {s} from {s}\n", .{
        build_info.build_time,
        build_info.commit,
    });
    while (true) {
        _ = try writer.writeAll("\nboard (r)eset\n(b)us reset\nsi7006 r(e)set\n(m)easure\n");
        const c = board.console.receive();
        switch (c) {
            'r' => board.mcu.reset(),
            'b' => try busReset(),
            'e' => si7006.reset() catch |err| {
                _ = try writer.print("Reset error: {}\n", .{err});
                continue;
            },
            'm' => {
                const rh = si7006.measureHumidity() catch |err| {
                    _ = try writer.print("Humidity measurement error: {}\n", .{err});
                    continue;
                };
                const t = si7006.readTemperature() catch |err| {
                    _ = try writer.print("Temperature reading error: {}\n", .{err});
                    continue;
                };
                _ = try writer.print("t: {d} rh: {d}\n", .{ t, rh });
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
