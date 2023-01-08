pub const Gpio = @import("../peripherals/peripherals.zig").gpio_v1.Gpio;
pub const Usart = @import("../peripherals/peripherals.zig").usci_uart.Usart;
pub const Clock = @import("../peripherals/peripherals.zig").basic_clock.Clock;

export fn __mspabi_mpyi(x: i16, y: i16) i16 {
    var bit: u8 = 0;
    var neg: bool = false;
    var rv: i16 = 0;
    var xx: i16 = x;
    var yy: i16 = undefined;

    if (y < 0) {
        yy = -y;
        neg = true;
    } else {
        yy = y;
    }

    while (y != 0 and bit < 16) {
        if (yy & 1 != 0)
            rv += xx;
        xx <<= 1;
        yy >>= 1;
        bit += 1;
    }

    return if (neg) -rv else rv;
}
