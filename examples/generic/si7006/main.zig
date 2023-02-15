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
    _ = try writer.write("\n---- Si7006 Test -----------------------------------\n");
    _ = try writer.print("---- Built: {s} from {s}\n", .{
        build_info.build_time,
        build_info.commit,
    });
    while (true) {
        _ = try writer.write("Press a key to reading temperature and humidity...\n");
        _ = board.console.receive();
        const rh = try si7006.measureHumidity();
        const t = try si7006.readTemperature();
        _ = try writer.print("t: {d} rh: {d}\n", .{ t, rh });
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
