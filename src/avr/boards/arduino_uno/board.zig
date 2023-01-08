const std = @import("std");
const svd = @import("ezdl").avr.svd.atmega328;
const mcu = @import("ezdl").avr.mcus.atmega328;

export fn vectorSection() linksection(".vectors") callconv(.Naked) void {
    asm volatile (
        \\jmp resetHandler
    );
}

pub const led = mcu.Gpio(svd.PORTB, 5, .output);
pub const sclk = mcu.Gpio(svd.PORTB, 5, .output);
pub const mosi = mcu.Gpio(svd.PORTB, 3, .output);
pub const miso = mcu.Gpio(svd.PORTB, 4, .input);
pub const csn = mcu.Gpio(svd.PORTB, 2, .output);
pub const usart = mcu.Usart(svd.USART0);
pub const spi = mcu.Spi(svd.SPI, 0, 1);

pub fn init() void {}
