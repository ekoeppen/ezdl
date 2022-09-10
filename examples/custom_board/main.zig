const board = @import("blue_pill.zig");
const ezdl = @import("ezdl");

pub export fn main() void {
    const sensor = ezdl.drivers.si7006.Si7006(board.spi, board.led);
    sensor.init();
    board.init();
    board.led.set();
    sensor.write(0);
    while (true) {
        asm volatile ("wfi");
    }
}
