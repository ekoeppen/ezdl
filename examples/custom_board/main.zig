const board = @import("blue_pill.zig");
const ezdl = @import("ezdl");

pub export fn main() void {
    board.init();
    board.led.set();
    while (true) {
        asm volatile ("wfi");
    }
}
