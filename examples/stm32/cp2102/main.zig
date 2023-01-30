const board = @import("board");
const ezdl = @import("ezdl");
const build_info = @import("build_info");

pub fn run() !void {
    const writer = board.serial.data.writer();
    const reader = board.serial.data.reader();
    while (!board.serial.control.state.dtr) {
        asm volatile ("wfi");
    }
    board.led2.set();
    _ = try writer.print("\n---- Starting -----------------------------------\n", .{});
    _ = try writer.print("---- Built: {s} from {s}\n", .{
        build_info.build_time,
        build_info.commit,
    });
    while (true) {
        asm volatile ("wfi");
        const c = reader.readByte() catch {
            continue;
        };
        board.led2.toggle();
        try writer.print("{d}\n", .{c});
    }
}

pub export fn main() void {
    board.init();
    board.led2.init();
    board.led.init();

    board.nvic.enableInterrupts(board.handlers);
    board.usb_device.init();
    board.led.set();

    if (run()) {} else |_| {
        @panic("Runtime exception");
    }
}