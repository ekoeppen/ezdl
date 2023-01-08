const types = struct {
    const PORT = packed struct {
        PIN: u8,
        DDR: u8,
        PORT: u8,
    };

    const USART = packed struct {
        CSRA: u8,
        CSRB: u8,
        CSRC: u8,
        reserved0: u8,
        BRL: u8,
        BRH: u8,
        DR: u8,
    };

    const SPI = packed struct {
        CR: u8,
        SR: u8,
        DR: u8,
    };
};

pub const USART0 = @intToPtr(*volatile types.USART, 0xc0);
pub const USART1 = @intToPtr(*volatile types.USART, 0xc8);

pub const PORTB = @intToPtr(*volatile types.PORT, 0x23);

pub const SPI = @intToPtr(*volatile types.SPI, 0x4c);
