const std = @import("std");
const svd = @import("ezdl").avr.svd.atmega328;

extern const _data_loadaddr: u16;
extern var _data: u16;
extern const _edata: u16;
extern var _bss: u16;
extern const _ebss: u16;
extern const _stack: u16;

// export const vectors linksection(".vectors") = svd.VectorTable{ .RESET = resetHandler };

// export fn vectorSection() linksection(".vectors") callconv(.Naked) void {
//    inline for (std.meta.fields(@TypeOf(vectors))) |vector| {
//        @field(vectors, vector.name)();
//    }
//}

export fn vectorSection() linksection(".vectors") callconv(.Naked) void {
    asm volatile (
        \\jmp resetHandler
    );
}

const PORT = packed struct {
    PIN: u8,
    DDR: u8,
    PORT: u8,
};

const PORTB = @intToPtr(*volatile PORT, 0x23);
const PORTE = @intToPtr(*volatile PORT, 0x2c);

const USART = packed struct {
    CSRA: u8,
    CSRB: u8,
    CSRC: u8,
    reserved0: u8,
    BRL: u8,
    BRH: u8,
    DR: u8,
};

const Config = enum { input, output };

const USART0 = @intToPtr(*volatile USART, 0xc0);
const USART1 = @intToPtr(*volatile USART, 0xc8);

fn Gpio(comptime port: anytype, comptime pin: u3, comptime c: Config) type {
    return struct {
        const pin_bit: u8 = @as(u8, 1) << pin;
        pub fn init() void {
            switch (c) {
                .input => port.DDR &= ~pin_bit,
                .output => port.DDR |= pin_bit,
            }
        }

        pub fn set() void {
            port.PORT |= pin_bit;
        }

        pub fn clear() void {
            port.PORT &= ~pin_bit;
        }

        pub fn toggle() void {
            port.PIN |= pin_bit;
        }
    };
}

fn Uart(comptime periph: anytype) type {
    const Context = struct {};
    const WriteError = error{FramingError};
    return struct {
        pub fn init() void {
            periph.BRH = 0;
            periph.BRL = 16;
            periph.CSRA = 0b0000_0010;
            periph.CSRB = 0b0001_1000;
            periph.CSRC = 0b0000_0110;
        }

        pub fn send(c: u8) void {
            while (periph.CSRA & 0b0010_0000 == 0) {}
            periph.DR = c;
        }

        pub fn receive() u8 {
            while (periph.CSRA & 0b1000_0000 == 0) {}
            return periph.DR;
        }

        pub const Writer = std.io.Writer(Context, WriteError, write);

        pub fn writer() Writer {
            return .{ .context = Context{} };
        }

        pub fn write(_: Context, bytes: []const u8) WriteError!usize {
            for (bytes) |b| send(b);
            return bytes.len;
        }
    };
}

pub const led = Gpio(PORTB, 5, .output);
pub const usart = Uart(USART0);

pub fn init() void {
    led.init();
    usart.init();
}
