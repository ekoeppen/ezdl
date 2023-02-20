const std = @import("std");
const ezdl = @import("ezdl");
const board = @import("board");
const build_info = @import("build_info");
const Rfm69 = ezdl.drivers.rfm69.Rfm69;

const writer = board.console.writer();
const reader = board.console.reader();
const radio = Rfm69(board.spi, board.cs);

fn txTest() anyerror!void {
    _ = try writer.print("---- TX test ------------------------------------\n", .{});
    radio.txMode();
    radio.tx(&.{ 0xd8, 0x40, 0x01 });
    _ = try radio.printRegisters(writer);
}

fn rxTest() anyerror!void {
    _ = try writer.print("---- RX test ------------------------------------\n", .{});
    radio.rxMode();
    var packet: [256]u8 = undefined;
    while (!radio.packetAvailable()) {
        asm volatile ("wfe");
    }
    const length = radio.rx(&packet);
    _ = try radio.printRegisters(writer);
    _ = try writer.print("     Got {d} bytes\n", .{length});
}

fn run() anyerror!void {
    board.init();
    board.led.init();
    board.tx.init();
    board.rx.init();
    board.sck.init();
    board.sdo.init();
    board.sdi.init();
    board.cs.init();
    board.spi.init();

    board.console.init();
    board.led.set();
    // board.exti.connect(board.modem_irq);
    // board.exti.enable(board.modem_irq.pin_number, .event, .rising);
    _ = try writer.print("---- Starting -----------------------------------\n", .{});
    _ = try writer.print("     Built: {s} from {s}\n", .{
        build_info.build_time,
        build_info.commit,
    });
    const dateTime = board.rtc.read();
    _ = try writer.print("     {d}-{d}-{d} {d}:{d}:{d}\n", .{
        dateTime.year,
        dateTime.month.numeric(),
        dateTime.day,
        dateTime.hour,
        dateTime.minute,
        dateTime.second,
    });

    if (!radio.init()) {
        _ = try writer.print("!!!! Modem init failed\n", .{});
        board.led.clear();
        _ = try radio.printRegisters(writer);
        return error.InitFailed;
    }

    radio.setFrequency(868_000_000);
    while (true) {
        _ = try writer.writeAll("Press r for receive test, t for transmit test, i for registers\n");
        const c = try reader.readByte();
        switch (c) {
            'r' => _ = try rxTest(),
            't' => _ = try txTest(),
            'i' => _ = try radio.printRegisters(writer),
            else => {},
        }
        board.led.clear();
    }
}

pub export fn main() void {
    if (run()) {} else |_| {
        @panic("Runtime exception");
    }
    while (true) {
        asm volatile ("wfi");
    }
}
