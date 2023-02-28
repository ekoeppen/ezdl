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
pub const sda = mcu.Gpio(periph.PORTA, 2, .output);
pub const sda_pp = mcu.Gpio(periph.PORTA, 2, .output);
pub const scl = mcu.Gpio(periph.PORTA, 3, .output);

pub const usart = mcu.Usart(periph.USART0);
pub const spi = mcu.Spi(periph.SPI0, .{ .speed = 2_000_000 });
pub const i2c = mcu.I2c(periph.TWI0, .{ .speed = 100_000 });

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
    periph.SLPCTRL.VREGCTRL.modify(.{ .PMODE = .{ .value = .AUTO } });
    periph.SLPCTRL.CTRLA.modify(.{ .SEN = 1, .SMODE = .{ .value = .PDOWN } });
    periph.PORTA.PINCONFIG.modify(.{ .PULLUPEN = 1, .ISC = .{ .value = .INPUT_DISABLE } });
    periph.PORTC.PINCONFIG.modify(.{ .PULLUPEN = 1, .ISC = .{ .value = .INPUT_DISABLE } });
    periph.PORTD.PINCONFIG.modify(.{ .PULLUPEN = 1, .ISC = .{ .value = .INPUT_DISABLE } });
    periph.PORTF.PINCONFIG.modify(.{ .PULLUPEN = 1, .ISC = .{ .value = .INPUT_DISABLE } });
    periph.RTC.PITCTRLA.modify(.{ .PERIOD = .{ .value = .CYC32768 }, .PITEN = 1 });
    // periph.CPU.CCP.write(.{ .CCP = .{ .value = .IOREG } });
}
