const svd = @import("ezdl").avr.svd.avr64dd32;
const mcu = @import("ezdl").avr.mcus.avr_dd;

pub const periph = svd.peripherals;

pub const rx = mcu.Gpio(periph.PORTD, 5, .input);
pub const tx = mcu.Gpio(periph.PORTD, 4, .output);
pub const button = mcu.Gpio(periph.PORTF, 6, .input);
pub const led = mcu.Gpio(periph.PORTF, 5, .output);

pub const usart = mcu.Usart(periph.USART0);

pub const console = usart;

export fn vectorSection() linksection(".vectors") callconv(.Naked) void {
    asm volatile (
        \\jmp resetHandler
    );
}

pub fn init() void {
    periph.PORTMUX.USARTROUTEA.modify(.{ .USART0 = .{ .value = .ALT3 } });
}
