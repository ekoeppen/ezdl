const std = @import("std");
const ezdl = @import("ezdl");
const board = @import("board");
const Rfm69 = ezdl.drivers.rfm69.Rfm69;

const writer = board.usart.writer();
const reader = board.usart.reader();
const radio = Rfm69(board.spi, board.csn, board.modem_irq);

fn txTest() anyerror!void {
    _ = try writer.print("---- TX test ------------------------------------\n", .{});
    // radio.setOutputPower(1);
    radio.txMode();
    radio.tx(&.{ 0xd8, 0x40, 0x01 });
    _ = try radio.printRegisters(writer);
}

fn rxTest() anyerror!void {
    var line: [1]u8 = undefined;
    _ = try writer.print("---- RX test ------------------------------------\n", .{});
    radio.rxMode();
    _ = try reader.read(&line);
    //while (!board.modem_irq.isSet()) {}
    var packet: [256]u8 = undefined;
    const length = radio.rx(&packet);
    _ = try radio.printRegisters(writer);
    _ = try writer.print("     Got {d} bytes\n", .{length});
}

fn run() anyerror!void {
    board.init();

    board.led.set();
    _ = try writer.print("---- Starting -----------------------------------\n", .{});

    if (!radio.init()) {
        _ = try writer.print("!!!! Modem init failed\n", .{});
        board.led.clear();
        board.led2.set();
        _ = try radio.printRegisters(writer);
        return error.InitFailed;
    }

    radio.setFrequency(868_000_000);
    _ = try rxTest();
    board.led.clear();
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
