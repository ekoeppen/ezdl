const std = @import("std");
const ezdl = @import("ezdl");
const board = @import("board");
const Nrf24 = ezdl.drivers.nrf24.Nrf24;

const ce = board.mcu.Gpio(board.svd.GPIOB, 4, .{ .output = .{} });
const irq = board.mcu.Gpio(board.svd.GPIOB, 5, .{ .input = .{} });
const radio = Nrf24(board.spi, board.cs, ce, irq);
const writer = board.console.writer();

fn run() anyerror!void {
    _ = try writer.print("---- Starting -----------------------------------\n", .{});
    radio.init();
    radio.setChannel(70);
    radio.setRxAddress(.{ 0xff, 0xff, 0xff, 0xff, 0xf1 });
    radio.setTxAddress(.{ 0xff, 0xff, 0xff, 0xff, 0xf0 });
    radio.txMode();
    radio.tx(&.{ 1, 2, 3, 4 });
    _ = try radio.printRegisters(writer);
    while (true) {
        asm volatile ("wfi");
    }
}

pub export fn main() void {
    board.init();
    board.cs.init();
    board.cs.set();
    board.spi.init();
    board.console.init();
    board.sck.init();
    board.sdi.init();
    board.sdo.init();
    board.tx.init();
    board.rx.init();
    ce.init();
    irq.init();

    if (run()) {} else |_| {
        @panic("Runtime exception");
    }
}
