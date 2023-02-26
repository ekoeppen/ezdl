pub const svd = @import("ezdl").avr.svd.avr64dd32;
pub const mcu = @import("ezdl").avr.mcus.avr_dd;

pub const periph = svd.peripherals;

pub const button = mcu.Gpio(periph.PORTF, 6, .input);
pub const led = mcu.Gpio(periph.PORTF, 5, .output);
pub const rx = mcu.Gpio(periph.PORTD, 5, .input);
pub const tx = mcu.Gpio(periph.PORTD, 4, .output);
pub const sdo = mcu.Gpio(periph.PORTA, 4, .output);
pub const sdi = mcu.Gpio(periph.PORTA, 5, .input);
pub const sck = mcu.Gpio(periph.PORTA, 6, .output);
pub const cs = mcu.Gpio(periph.PORTA, 7, .output);

pub const usart = mcu.Usart(periph.USART0);
pub const spi = mcu.Spi(periph.SPI0, .{ .speed = 2_000_000 });

pub const nrf24 = struct {
    pub const ce = mcu.Gpio(periph.PORTD, 1, .output);
    pub const irq = mcu.Gpio(periph.PORTD, 2, .output);
};

pub const console = usart;

export fn vectorSection() linksection(".vectors") callconv(.Naked) void {
    asm volatile (
        \\jmp resetHandler
    );
}

pub fn init() void {
    periph.PORTMUX.USARTROUTEA.modify(.{ .USART0 = .{ .value = .ALT3 } });
}
