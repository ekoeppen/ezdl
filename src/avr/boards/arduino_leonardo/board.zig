const std = @import("std");
const svd = @import("ezdl").avr.svd.atmega32u4;
const mcu = @import("ezdl").avr.mcus.atmega32u4;

export fn vectorSection() linksection(".vectors") callconv(.Naked) void {
    asm volatile (
        \\jmp resetHandler
    );
}

pub const sclk = mcu.Gpio(svd.PORTB, 1, .output);
pub const mosi = mcu.Gpio(svd.PORTB, 2, .output);
pub const miso = mcu.Gpio(svd.PORTB, 3, .input);
pub const uext_pwr = mcu.Gpio(svd.PORTB, 4, .output);
pub const csn = mcu.Gpio(svd.PORTC, 7, .output);
pub const tx = mcu.Gpio(svd.PORTD, 3, .output);
pub const button = mcu.Gpio(svd.PORTE, 2, .input);
pub const led = mcu.Gpio(svd.PORTE, 6, .output);

pub const usart = mcu.Usart(svd.USART1);
pub const spi = mcu.Spi(svd.SPI, 0, 1);

pub fn init() void {}
