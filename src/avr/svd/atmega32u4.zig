const mmio = @import("mmio");

pub const Handler = *const fn () callconv(.C) void;
fn unhandled() callconv(.C) void {
    while (true) {}
}

pub const devices = struct {
    pub const ATmega32U4 = struct {
        pub const properties = struct {
            pub const family = "megaAVR";
            pub const arch = "AVR8";
        };

        pub const VectorTable = extern struct {
            RESET: Handler = unhandled,
            ///  External Interrupt Request 0
            INT0: Handler = unhandled,
            ///  External Interrupt Request 1
            INT1: Handler = unhandled,
            ///  External Interrupt Request 2
            INT2: Handler = unhandled,
            ///  External Interrupt Request 3
            INT3: Handler = unhandled,
            ///  Reserved1
            Reserved1: Handler = unhandled,
            ///  Reserved2
            Reserved2: Handler = unhandled,
            ///  External Interrupt Request 6
            INT6: Handler = unhandled,
            ///  Reserved3
            Reserved3: Handler = unhandled,
            ///  Pin Change Interrupt Request 0
            PCINT0: Handler = unhandled,
            ///  USB General Interrupt Request
            USB_GEN: Handler = unhandled,
            ///  USB Endpoint/Pipe Interrupt Communication Request
            USB_COM: Handler = unhandled,
            ///  Watchdog Time-out Interrupt
            WDT: Handler = unhandled,
            ///  Reserved4
            Reserved4: Handler = unhandled,
            ///  Reserved5
            Reserved5: Handler = unhandled,
            ///  Reserved6
            Reserved6: Handler = unhandled,
            ///  Timer/Counter1 Capture Event
            TIMER1_CAPT: Handler = unhandled,
            ///  Timer/Counter1 Compare Match A
            TIMER1_COMPA: Handler = unhandled,
            ///  Timer/Counter1 Compare Match B
            TIMER1_COMPB: Handler = unhandled,
            ///  Timer/Counter1 Compare Match C
            TIMER1_COMPC: Handler = unhandled,
            ///  Timer/Counter1 Overflow
            TIMER1_OVF: Handler = unhandled,
            ///  Timer/Counter0 Compare Match A
            TIMER0_COMPA: Handler = unhandled,
            ///  Timer/Counter0 Compare Match B
            TIMER0_COMPB: Handler = unhandled,
            ///  Timer/Counter0 Overflow
            TIMER0_OVF: Handler = unhandled,
            ///  SPI Serial Transfer Complete
            SPI_STC: Handler = unhandled,
            ///  USART1, Rx Complete
            USART1_RX: Handler = unhandled,
            ///  USART1 Data register Empty
            USART1_UDRE: Handler = unhandled,
            ///  USART1, Tx Complete
            USART1_TX: Handler = unhandled,
            ///  Analog Comparator
            ANALOG_COMP: Handler = unhandled,
            ///  ADC Conversion Complete
            ADC: Handler = unhandled,
            ///  EEPROM Ready
            EE_READY: Handler = unhandled,
            ///  Timer/Counter3 Capture Event
            TIMER3_CAPT: Handler = unhandled,
            ///  Timer/Counter3 Compare Match A
            TIMER3_COMPA: Handler = unhandled,
            ///  Timer/Counter3 Compare Match B
            TIMER3_COMPB: Handler = unhandled,
            ///  Timer/Counter3 Compare Match C
            TIMER3_COMPC: Handler = unhandled,
            ///  Timer/Counter3 Overflow
            TIMER3_OVF: Handler = unhandled,
            ///  2-wire Serial Interface
            TWI: Handler = unhandled,
            ///  Store Program Memory Read
            SPM_READY: Handler = unhandled,
            ///  Timer/Counter4 Compare Match A
            TIMER4_COMPA: Handler = unhandled,
            ///  Timer/Counter4 Compare Match B
            TIMER4_COMPB: Handler = unhandled,
            ///  Timer/Counter4 Compare Match D
            TIMER4_COMPD: Handler = unhandled,
            ///  Timer/Counter4 Overflow
            TIMER4_OVF: Handler = unhandled,
            ///  Timer/Counter4 Fault Protection Interrupt
            TIMER4_FPF: Handler = unhandled,
        };

        pub const peripherals = struct {
            ///  Fuses
            pub const FUSE = @intToPtr(*volatile types.FUSE, 0x0);
            ///  Lockbits
            pub const LOCKBIT = @intToPtr(*volatile types.LOCKBIT, 0x0);
            ///  I/O Port
            pub const PORTB = @intToPtr(*volatile types.PORT.PORTB, 0x23);
            ///  I/O Port
            pub const PORTC = @intToPtr(*volatile types.PORT.PORTC, 0x26);
            ///  I/O Port
            pub const PORTD = @intToPtr(*volatile types.PORT.PORTD, 0x29);
            ///  I/O Port
            pub const PORTE = @intToPtr(*volatile types.PORT.PORTE, 0x2c);
            ///  I/O Port
            pub const PORTF = @intToPtr(*volatile types.PORT.PORTF, 0x2f);
            ///  Timer/Counter, 8-bit
            pub const TC0 = @intToPtr(*volatile types.TC8.TC0, 0x35);
            ///  Timer/Counter, 16-bit
            pub const TC1 = @intToPtr(*volatile types.TC16.TC1, 0x36);
            ///  Timer/Counter, 16-bit
            pub const TC3 = @intToPtr(*volatile types.TC16.TC3, 0x38);
            ///  Timer/Counter, 10-bit
            pub const TC4 = @intToPtr(*volatile types.TC10.TC4, 0x39);
            ///  External Interrupts
            pub const EXINT = @intToPtr(*volatile types.EXINT, 0x3b);
            ///  CPU Registers
            pub const CPU = @intToPtr(*volatile types.CPU, 0x3e);
            ///  EEPROM
            pub const EEPROM = @intToPtr(*volatile types.EEPROM, 0x3f);
            ///  Phase Locked Loop
            pub const PLL = @intToPtr(*volatile types.PLL, 0x49);
            ///  Serial Peripheral Interface
            pub const SPI = @intToPtr(*volatile types.SPI, 0x4c);
            ///  Analog Comparator
            pub const AC = @intToPtr(*volatile types.AC, 0x50);
            ///  JTAG Interface
            pub const JTAG = @intToPtr(*volatile types.JTAG, 0x51);
            ///  Bootloader
            pub const BOOT_LOAD = @intToPtr(*volatile types.BOOT_LOAD, 0x57);
            ///  Watchdog Timer
            pub const WDT = @intToPtr(*volatile types.WDT, 0x60);
            ///  Analog-to-Digital Converter
            pub const ADC = @intToPtr(*volatile types.ADC, 0x78);
            ///  Two Wire Serial Interface
            pub const TWI = @intToPtr(*volatile types.TWI, 0xb8);
            ///  USART
            pub const USART1 = @intToPtr(*volatile types.USART.USART1, 0xc8);
            ///  USB Device Registers
            pub const USB_DEVICE = @intToPtr(*volatile types.USB_DEVICE, 0xd7);
        };
    };
};

pub const types = struct {
    ///  Fuses
    pub const FUSE = extern struct {
        pub const ENUM_SUT_CKSEL = enum(u6) {
            ///  Ext. Clock; Start-up time: 6 CK + 0 ms
            EXTCLK_6CK_0MS = 0x0,
            ///  Ext. Clock; Start-up time: 6 CK + 4.1 ms
            EXTCLK_6CK_4MS1 = 0x10,
            ///  Ext. Clock; Start-up time: 6 CK + 65 ms
            EXTCLK_6CK_65MS = 0x20,
            ///  Int. RC Osc.; Start-up time: 6 CK + 0 ms
            INTRCOSC_6CK_0MS = 0x2,
            ///  Int. RC Osc.; Start-up time: 6 CK + 4.1 ms
            INTRCOSC_6CK_4MS1 = 0x12,
            ///  Int. RC Osc.; Start-up time: 6 CK + 65 ms
            INTRCOSC_6CK_65MS = 0x22,
            ///  Ext. Low-Freq. Crystal; Start-up time: 32K CK + 0 ms; Int. Cap.
            EXTLOFXTAL_32KCK_0MS_INTCAP = 0x7,
            ///  Ext. Low-Freq. Crystal; Start-up time: 32K CK + 4.1 ms; Int. Cap.
            EXTLOFXTAL_32KCK_4MS1_INTCAP = 0x17,
            ///  Ext. Low-Freq. Crystal; Start-up time: 32K CK + 65 ms; Int. Cap.
            EXTLOFXTAL_32KCK_65MS_INTCAP = 0x27,
            ///  Ext. Low-Freq. Crystal; Start-up time: 1K CK + 0 ms; Int. Cap.
            EXTLOFXTAL_1KCK_0MS_INTCAP = 0x6,
            ///  Ext. Low-Freq. Crystal; Start-up time: 1K CK + 4.1 ms; Int. Cap.
            EXTLOFXTAL_1KCK_4MS1_INTCAP = 0x16,
            ///  Ext. Low-Freq. Crystal; Start-up time: 1K CK + 65 ms; Int. Cap.
            EXTLOFXTAL_1KCK_65MS_INTCAP = 0x26,
            ///  Ext. Low-Freq. Crystal; Start-up time: 32K CK + 0 ms
            EXTLOFXTAL_32KCK_0MS = 0x5,
            ///  Ext. Low-Freq. Crystal; Start-up time: 32K CK + 4.1 ms
            EXTLOFXTAL_32KCK_4MS1 = 0x15,
            ///  Ext. Low-Freq. Crystal; Start-up time: 32K CK + 65 ms
            EXTLOFXTAL_32KCK_65MS = 0x25,
            ///  Ext. Low-Freq. Crystal; Start-up time: 1K CK + 0 ms
            EXTLOFXTAL_1KCK_0MS = 0x4,
            ///  Ext. Low-Freq. Crystal; Start-up time: 1K CK + 4.1 ms
            EXTLOFXTAL_1KCK_4MS1 = 0x14,
            ///  Ext. Low-Freq. Crystal; Start-up time: 1K CK + 65 ms
            EXTLOFXTAL_1KCK_65MS = 0x24,
            ///  Ext. Crystal Osc. 0.4-0.9 MHz; Start-up time: 258 CK + 4.1 ms
            EXTXOSC_0MHZ4_0MHZ9_258CK_4MS1 = 0x8,
            ///  Ext. Crystal Osc. 0.4-0.9 MHz; Start-up time: 258 CK + 65 ms
            EXTXOSC_0MHZ4_0MHZ9_258CK_65MS = 0x18,
            ///  Ext. Crystal Osc. 0.4-0.9 MHz; Start-up time: 1K CK + 0 ms
            EXTXOSC_0MHZ4_0MHZ9_1KCK_0MS = 0x28,
            ///  Ext. Crystal Osc. 0.4-0.9 MHz; Start-up time: 1K CK + 4.1 ms
            EXTXOSC_0MHZ4_0MHZ9_1KCK_4MS1 = 0x38,
            ///  Ext. Crystal Osc. 0.4-0.9 MHz; Start-up time: 1K CK + 65 ms
            EXTXOSC_0MHZ4_0MHZ9_1KCK_65MS = 0x9,
            ///  Ext. Crystal Osc. 0.4-0.9 MHz; Start-up time: 16K CK + 0 ms
            EXTXOSC_0MHZ4_0MHZ9_16KCK_0MS = 0x19,
            ///  Ext. Crystal Osc. 0.4-0.9 MHz; Start-up time: 16K CK + 4.1 ms
            EXTXOSC_0MHZ4_0MHZ9_16KCK_4MS1 = 0x29,
            ///  Ext. Crystal Osc. 0.4-0.9 MHz; Start-up time: 16K CK + 65 ms
            EXTXOSC_0MHZ4_0MHZ9_16KCK_65MS = 0x39,
            ///  Ext. Crystal Osc. 0.9-3.0 MHz; Start-up time: 258 CK + 4.1 ms
            EXTXOSC_0MHZ9_3MHZ_258CK_4MS1 = 0xa,
            ///  Ext. Crystal Osc. 0.9-3.0 MHz; Start-up time: 258 CK + 65 ms
            EXTXOSC_0MHZ9_3MHZ_258CK_65MS = 0x1a,
            ///  Ext. Crystal Osc. 0.9-3.0 MHz; Start-up time: 1K CK + 0 ms
            EXTXOSC_0MHZ9_3MHZ_1KCK_0MS = 0x2a,
            ///  Ext. Crystal Osc. 0.9-3.0 MHz; Start-up time: 1K CK + 4.1 ms
            EXTXOSC_0MHZ9_3MHZ_1KCK_4MS1 = 0x3a,
            ///  Ext. Crystal Osc. 0.9-3.0 MHz; Start-up time: 1K CK + 65 ms
            EXTXOSC_0MHZ9_3MHZ_1KCK_65MS = 0xb,
            ///  Ext. Crystal Osc. 0.9-3.0 MHz; Start-up time: 16K CK + 0 ms
            EXTXOSC_0MHZ9_3MHZ_16KCK_0MS = 0x1b,
            ///  Ext. Crystal Osc. 0.9-3.0 MHz; Start-up time: 16K CK + 4.1 ms
            EXTXOSC_0MHZ9_3MHZ_16KCK_4MS1 = 0x2b,
            ///  Ext. Crystal Osc. 0.9-3.0 MHz; Start-up time: 16K CK + 65 ms
            EXTXOSC_0MHZ9_3MHZ_16KCK_65MS = 0x3b,
            ///  Ext. Crystal Osc. 3.0-8.0 MHz; Start-up time: 258 CK + 4.1 ms
            EXTXOSC_3MHZ_8MHZ_258CK_4MS1 = 0xc,
            ///  Ext. Crystal Osc. 3.0-8.0 MHz; Start-up time: 258 CK + 65 ms
            EXTXOSC_3MHZ_8MHZ_258CK_65MS = 0x1c,
            ///  Ext. Crystal Osc. 3.0-8.0 MHz; Start-up time: 1K CK + 0 ms
            EXTXOSC_3MHZ_8MHZ_1KCK_0MS = 0x2c,
            ///  Ext. Crystal Osc. 3.0-8.0 MHz; Start-up time: 1K CK + 4.1 ms
            EXTXOSC_3MHZ_8MHZ_1KCK_4MS1 = 0x3c,
            ///  Ext. Crystal Osc. 3.0-8.0 MHz; Start-up time: 1K CK + 65 ms
            EXTXOSC_3MHZ_8MHZ_1KCK_65MS = 0xd,
            ///  Ext. Crystal Osc. 3.0-8.0 MHz; Start-up time: 16K CK + 0 ms
            EXTXOSC_3MHZ_8MHZ_16KCK_0MS = 0x1d,
            ///  Ext. Crystal Osc. 3.0-8.0 MHz; Start-up time: 16K CK + 4.1 ms
            EXTXOSC_3MHZ_8MHZ_16KCK_4MS1 = 0x2d,
            ///  Ext. Crystal Osc. 3.0-8.0 MHz; Start-up time: 16K CK + 65 ms
            EXTXOSC_3MHZ_8MHZ_16KCK_65MS = 0x3d,
            ///  Ext. Crystal Osc. 8.0- MHz; Start-up time: 258 CK + 4.1 ms
            EXTXOSC_8MHZ_XX_258CK_4MS1 = 0xe,
            ///  Ext. Crystal Osc. 8.0- MHz; Start-up time: 258 CK + 65 ms
            EXTXOSC_8MHZ_XX_258CK_65MS = 0x1e,
            ///  Ext. Crystal Osc. 8.0- MHz; Start-up time: 1K CK + 0 ms
            EXTXOSC_8MHZ_XX_1KCK_0MS = 0x2e,
            ///  Ext. Crystal Osc. 8.0- MHz; Start-up time: 1K CK + 4.1 ms
            EXTXOSC_8MHZ_XX_1KCK_4MS1 = 0x3e,
            ///  Ext. Crystal Osc. 8.0- MHz; Start-up time: 1K CK + 65 ms
            EXTXOSC_8MHZ_XX_1KCK_65MS = 0xf,
            ///  Ext. Crystal Osc. 8.0- MHz; Start-up time: 16K CK + 0 ms
            EXTXOSC_8MHZ_XX_16KCK_0MS = 0x1f,
            ///  Ext. Crystal Osc. 8.0- MHz; Start-up time: 16K CK + 4.1 ms
            EXTXOSC_8MHZ_XX_16KCK_4MS1 = 0x2f,
            ///  Ext. Crystal Osc. 8.0- MHz; Start-up time: 16K CK + 65 ms
            EXTXOSC_8MHZ_XX_16KCK_65MS = 0x3f,
            _,
        };

        pub const ENUM_BOOTSZ = enum(u2) {
            ///  Boot Flash size=256 words start address=$3F00
            @"256W_3F00" = 0x3,
            ///  Boot Flash size=512 words start address=$3E00
            @"512W_3E00" = 0x2,
            ///  Boot Flash size=1024 words start address=$3C00
            @"1024W_3C00" = 0x1,
            ///  Boot Flash size=2048 words start address=$3800
            @"2048W_3800" = 0x0,
        };

        pub const ENUM_BODLEVEL = enum(u3) {
            ///  Brown-out detection disabled; [BODLEVEL=111]
            DISABLED = 0x7,
            ///  Brown-out detection at VCC=2.0 V
            @"2V0" = 0x6,
            ///  Brown-out detection at VCC=2.2 V
            @"2V2" = 0x5,
            ///  Brown-out detection at VCC=2.4 V
            @"2V4" = 0x4,
            ///  Brown-out detection at VCC=2.6 V
            @"2V6" = 0x3,
            ///  Brown-out detection at VCC=3.4 V
            @"3V4" = 0x2,
            ///  Brown-out detection at VCC=3.5 V
            @"3V5" = 0x1,
            ///  Brown-out detection at VCC=4.3 V
            @"4V3" = 0x0,
        };

        LOW: mmio.Mmio(8, packed struct {
            ///  Select Clock Source
            SUT_CKSEL: packed union {
                raw: u6,
                value: ENUM_SUT_CKSEL,
            },
            ///  Clock output on PORTC7
            CKOUT: u1,
            ///  Divide clock by 8 internally
            CKDIV8: u1,
        }),
        HIGH: mmio.Mmio(8, packed struct {
            ///  Boot Reset vector Enabled
            BOOTRST: u1,
            ///  Select Boot Size
            BOOTSZ: packed union {
                raw: u2,
                value: ENUM_BOOTSZ,
            },
            ///  Preserve EEPROM through the Chip Erase cycle
            EESAVE: u1,
            ///  Watchdog timer always on
            WDTON: u1,
            ///  Serial program downloading (SPI) enabled
            SPIEN: u1,
            ///  JTAG Interface Enabled
            JTAGEN: u1,
            ///  On-Chip Debug Enabled
            OCDEN: u1,
        }),
        EXTENDED: mmio.Mmio(8, packed struct {
            ///  Brown-out Detector trigger level
            BODLEVEL: packed union {
                raw: u3,
                value: ENUM_BODLEVEL,
            },
            ///  Hardware Boot Enable
            HWBE: u1,
            padding: u4 = 0,
        }),
    };

    ///  Lockbits
    pub const LOCKBIT = extern struct {
        pub const ENUM_LB = enum(u2) {
            ///  Further programming and verification disabled
            PROG_VER_DISABLED = 0x0,
            ///  Further programming disabled
            PROG_DISABLED = 0x2,
            ///  No memory lock features enabled
            NO_LOCK = 0x3,
            _,
        };

        pub const ENUM_BLB = enum(u2) {
            ///  LPM and SPM prohibited in Application Section
            LPM_SPM_DISABLE = 0x0,
            ///  LPM prohibited in Application Section
            LPM_DISABLE = 0x1,
            ///  SPM prohibited in Application Section
            SPM_DISABLE = 0x2,
            ///  No lock on SPM and LPM in Application Section
            NO_LOCK = 0x3,
        };

        pub const ENUM_BLB2 = enum(u2) {
            ///  LPM and SPM prohibited in Boot Section
            LPM_SPM_DISABLE = 0x0,
            ///  LPM prohibited in Boot Section
            LPM_DISABLE = 0x1,
            ///  SPM prohibited in Boot Section
            SPM_DISABLE = 0x2,
            ///  No lock on SPM and LPM in Boot Section
            NO_LOCK = 0x3,
        };

        LOCKBIT: mmio.Mmio(8, packed struct {
            ///  Memory Lock
            LB: packed union {
                raw: u2,
                value: ENUM_LB,
            },
            ///  Boot Loader Protection Mode
            BLB0: packed union {
                raw: u2,
                value: ENUM_BLB,
            },
            ///  Boot Loader Protection Mode
            BLB1: packed union {
                raw: u2,
                value: ENUM_BLB2,
            },
            padding: u2 = 0,
        }),
    };

    ///  Watchdog Timer
    pub const WDT = extern struct {
        pub const WDOG_TIMER_PRESCALE_4BITS = enum(u4) {
            ///  Oscillator Cycles 2K
            VAL_0x00 = 0x0,
            ///  Oscillator Cycles 4K
            VAL_0x01 = 0x1,
            ///  Oscillator Cycles 8K
            VAL_0x02 = 0x2,
            ///  Oscillator Cycles 16K
            VAL_0x03 = 0x3,
            ///  Oscillator Cycles 32K
            VAL_0x04 = 0x4,
            ///  Oscillator Cycles 64K
            VAL_0x05 = 0x5,
            ///  Oscillator Cycles 128K
            VAL_0x06 = 0x6,
            ///  Oscillator Cycles 256K
            VAL_0x07 = 0x7,
            ///  Oscillator Cycles 512K
            VAL_0x08 = 0x8,
            ///  Oscillator Cycles 1024K
            VAL_0x09 = 0x9,
            _,
        };

        ///  Watchdog Timer Control Register
        WDTCSR: mmio.Mmio(8, packed struct {
            ///  Watchdog Timer Prescaler Bits
            WDP_bit0: u1,
            ///  Watchdog Timer Prescaler Bits
            WDP_bit1: u1,
            ///  Watchdog Timer Prescaler Bits
            WDP_bit2: u1,
            ///  Watch Dog Enable
            WDE: u1,
            ///  Watchdog Change Enable
            WDCE: u1,
            ///  Watchdog Timer Prescaler Bits
            WDP_bit3: u1,
            ///  Watchdog Timeout Interrupt Enable
            WDIE: u1,
            ///  Watchdog Timeout Interrupt Flag
            WDIF: u1,
        }),
    };

    ///  Serial Peripheral Interface
    pub const SPI = extern struct {
        pub const COMM_SCK_RATE_3BIT = enum(u3) {
            ///  fosc/4
            VAL_0x00 = 0x0,
            ///  fosc/16
            VAL_0x01 = 0x1,
            ///  fosc/64
            VAL_0x02 = 0x2,
            ///  fosc/128
            VAL_0x03 = 0x3,
            ///  fosc/2
            VAL_0x04 = 0x4,
            ///  fosc/8
            VAL_0x05 = 0x5,
            ///  fosc/32
            VAL_0x06 = 0x6,
            ///  fosc/64
            VAL_0x07 = 0x7,
        };

        ///  SPI Control Register
        SPCR: mmio.Mmio(8, packed struct {
            ///  SPI Clock Rate Selects
            SPR: packed union {
                raw: u3,
                value: COMM_SCK_RATE_3BIT,
            },
            ///  Clock polarity
            CPOL: u1,
            ///  Master/Slave Select
            MSTR: u1,
            ///  Data Order
            DORD: u1,
            ///  SPI Enable
            SPE: u1,
            ///  SPI Interrupt Enable
            SPIE: u1,
        }),
        ///  SPI Status Register
        SPSR: mmio.Mmio(8, packed struct {
            ///  Double SPI Speed Bit
            SPI2X: u1,
            reserved6: u5 = 0,
            ///  Write Collision Flag
            WCOL: u1,
            ///  SPI Interrupt Flag
            SPIF: u1,
        }),
        ///  SPI Data Register
        SPDR: u8,
    };

    ///  Bootloader
    pub const BOOT_LOAD = extern struct {
        ///  Store Program Memory Control Register
        SPMCSR: mmio.Mmio(8, packed struct {
            ///  Store Program Memory Enable
            SPMEN: u1,
            ///  Page Erase
            PGERS: u1,
            ///  Page Write
            PGWRT: u1,
            ///  Boot Lock Bit Set
            BLBSET: u1,
            ///  Read While Write section read enable
            RWWSRE: u1,
            ///  Signature Row Read
            SIGRD: u1,
            ///  Read While Write Section Busy
            RWWSB: u1,
            ///  SPM Interrupt Enable
            SPMIE: u1,
        }),
    };

    ///  EEPROM
    pub const EEPROM = extern struct {
        pub const EEP_MODE = enum(u2) {
            ///  Erase and Write in one operation
            VAL_0x00 = 0x0,
            ///  Erase Only
            VAL_0x01 = 0x1,
            ///  Write Only
            VAL_0x02 = 0x2,
            _,
        };

        ///  EEPROM Control Register
        EECR: mmio.Mmio(8, packed struct {
            ///  EEPROM Read Enable
            EERE: u1,
            ///  EEPROM Write Enable
            EEPE: u1,
            ///  EEPROM Master Write Enable
            EEMPE: u1,
            ///  EEPROM Ready Interrupt Enable
            EERIE: u1,
            ///  EEPROM Programming Mode Bits
            EEPM: packed union {
                raw: u2,
                value: EEP_MODE,
            },
            padding: u2 = 0,
        }),
        ///  EEPROM Data Register
        EEDR: u8,
        ///  EEPROM Address Register Low Bytes
        EEAR: u16,
    };

    ///  JTAG Interface
    pub const JTAG = extern struct {
        ///  On-Chip Debug Related Register in I/O Memory
        OCDR: u8,
        reserved3: [2]u8,
        ///  MCU Status Register
        MCUSR: mmio.Mmio(8, packed struct {
            reserved4: u4 = 0,
            ///  JTAG Reset Flag
            JTRF: u1,
            padding: u3 = 0,
        }),
        ///  MCU Control Register
        MCUCR: mmio.Mmio(8, packed struct {
            reserved7: u7 = 0,
            ///  JTAG Interface Disable
            JTD: u1,
        }),
    };

    ///  External Interrupts
    pub const EXINT = extern struct {
        ///  Interrupt Sense Control
        pub const INTERRUPT_SENSE_CONTROL = enum(u2) {
            ///  Low Level of INTX
            VAL_0x00 = 0x0,
            ///  Any Logical Change of INTX
            VAL_0x01 = 0x1,
            ///  Falling Edge of INTX
            VAL_0x02 = 0x2,
            ///  Rising Edge of INTX
            VAL_0x03 = 0x3,
        };

        ///  Pin Change Interrupt Flag Register
        PCIFR: mmio.Mmio(8, packed struct {
            ///  Pin Change Interrupt Flag 0
            PCIF0: u1,
            padding: u7 = 0,
        }),
        ///  External Interrupt Flag Register
        EIFR: mmio.Mmio(8, packed struct {
            ///  External Interrupt Flags
            INTF: u8,
        }),
        ///  External Interrupt Mask Register
        EIMSK: mmio.Mmio(8, packed struct {
            ///  External Interrupt Request 7 Enable
            INT: u8,
        }),
        reserved45: [42]u8,
        ///  Pin Change Interrupt Control Register
        PCICR: mmio.Mmio(8, packed struct {
            ///  Pin Change Interrupt Enable 0
            PCIE0: u1,
            padding: u7 = 0,
        }),
        ///  External Interrupt Control Register A
        EICRA: mmio.Mmio(8, packed struct {
            ///  External Interrupt Sense Control Bit
            ISC0: packed union {
                raw: u2,
                value: INTERRUPT_SENSE_CONTROL,
            },
            ///  External Interrupt Sense Control Bit
            ISC1: packed union {
                raw: u2,
                value: INTERRUPT_SENSE_CONTROL,
            },
            ///  External Interrupt Sense Control Bit
            ISC2: packed union {
                raw: u2,
                value: INTERRUPT_SENSE_CONTROL,
            },
            ///  External Interrupt Sense Control Bit
            ISC3: packed union {
                raw: u2,
                value: INTERRUPT_SENSE_CONTROL,
            },
        }),
        ///  External Interrupt Control Register B
        EICRB: mmio.Mmio(8, packed struct {
            ///  External Interrupt 7-4 Sense Control Bit
            ISC4: packed union {
                raw: u2,
                value: INTERRUPT_SENSE_CONTROL,
            },
            ///  External Interrupt 7-4 Sense Control Bit
            ISC5: packed union {
                raw: u2,
                value: INTERRUPT_SENSE_CONTROL,
            },
            ///  External Interrupt 7-4 Sense Control Bit
            ISC6: packed union {
                raw: u2,
                value: INTERRUPT_SENSE_CONTROL,
            },
            ///  External Interrupt 7-4 Sense Control Bit
            ISC7: packed union {
                raw: u2,
                value: INTERRUPT_SENSE_CONTROL,
            },
        }),
        ///  Pin Change Mask Register 0
        PCMSK0: u8,
    };

    ///  Two Wire Serial Interface
    pub const TWI = extern struct {
        pub const COMM_TWI_PRESACLE = enum(u2) {
            ///  1
            VAL_0x00 = 0x0,
            ///  4
            VAL_0x01 = 0x1,
            ///  16
            VAL_0x02 = 0x2,
            ///  64
            VAL_0x03 = 0x3,
        };

        ///  TWI Bit Rate register
        TWBR: u8,
        ///  TWI Status Register
        TWSR: mmio.Mmio(8, packed struct {
            ///  TWI Prescaler
            TWPS: packed union {
                raw: u2,
                value: COMM_TWI_PRESACLE,
            },
            reserved3: u1 = 0,
            ///  TWI Status
            TWS: u5,
        }),
        ///  TWI (Slave) Address register
        TWAR: mmio.Mmio(8, packed struct {
            ///  TWI General Call Recognition Enable Bit
            TWGCE: u1,
            ///  TWI (Slave) Address register Bits
            TWA: u7,
        }),
        ///  TWI Data register
        TWDR: u8,
        ///  TWI Control Register
        TWCR: mmio.Mmio(8, packed struct {
            ///  TWI Interrupt Enable
            TWIE: u1,
            reserved2: u1 = 0,
            ///  TWI Enable Bit
            TWEN: u1,
            ///  TWI Write Collition Flag
            TWWC: u1,
            ///  TWI Stop Condition Bit
            TWSTO: u1,
            ///  TWI Start Condition Bit
            TWSTA: u1,
            ///  TWI Enable Acknowledge Bit
            TWEA: u1,
            ///  TWI Interrupt Flag
            TWINT: u1,
        }),
        ///  TWI (Slave) Address Mask Register
        TWAMR: mmio.Mmio(8, packed struct {
            reserved1: u1 = 0,
            TWAM: u7,
        }),
    };

    ///  Analog-to-Digital Converter
    pub const ADC = extern struct {
        pub const ANALOG_ADC_V_REF2 = enum(u2) {
            ///  AREF, Internal Vref turned off
            VAL_0x00 = 0x0,
            ///  AVCC with external capacitor at AREF pin
            VAL_0x01 = 0x1,
            ///  Reserved
            VAL_0x02 = 0x2,
            ///  Internal 2.56V Voltage Reference with external capacitor at AREF pin
            VAL_0x03 = 0x3,
        };

        pub const ANALOG_ADC_PRESCALER = enum(u3) {
            ///  2
            VAL_0x00 = 0x0,
            ///  2
            VAL_0x01 = 0x1,
            ///  4
            VAL_0x02 = 0x2,
            ///  8
            VAL_0x03 = 0x3,
            ///  16
            VAL_0x04 = 0x4,
            ///  32
            VAL_0x05 = 0x5,
            ///  64
            VAL_0x06 = 0x6,
            ///  128
            VAL_0x07 = 0x7,
        };

        pub const ANALOG_ADC_AUTO_TRIGGER2 = enum(u3) {
            ///  Free Running mode
            VAL_0x00 = 0x0,
            ///  Analog Comparator
            VAL_0x01 = 0x1,
            ///  External Interrupt Request 0
            VAL_0x02 = 0x2,
            ///  Timer/Counter0 Compare Match A
            VAL_0x03 = 0x3,
            ///  Timer/Counter0 Overflow
            VAL_0x04 = 0x4,
            ///  Timer/Counter1 Compare Match B
            VAL_0x05 = 0x5,
            ///  Timer/Counter1 Overflow
            VAL_0x06 = 0x6,
            ///  Timer/Counter1 Capture Event
            VAL_0x07 = 0x7,
        };

        ///  ADC Data Register Bytes
        ADC: u16,
        ///  The ADC Control and Status register
        ADCSRA: mmio.Mmio(8, packed struct {
            ///  ADC Prescaler Select Bits
            ADPS: packed union {
                raw: u3,
                value: ANALOG_ADC_PRESCALER,
            },
            ///  ADC Interrupt Enable
            ADIE: u1,
            ///  ADC Interrupt Flag
            ADIF: u1,
            ///  ADC Auto Trigger Enable
            ADATE: u1,
            ///  ADC Start Conversion
            ADSC: u1,
            ///  ADC Enable
            ADEN: u1,
        }),
        ///  ADC Control and Status Register B
        ADCSRB: mmio.Mmio(8, packed struct {
            ///  ADC Auto Trigger Sources
            ADTS_bit0: u1,
            ///  ADC Auto Trigger Sources
            ADTS_bit1: u1,
            ///  ADC Auto Trigger Sources
            ADTS_bit2: u1,
            reserved4: u1 = 0,
            ///  ADC Auto Trigger Sources
            ADTS_bit3: u1,
            ///  Analog Channel and Gain Selection Bits
            MUX5: u1,
            reserved7: u1 = 0,
            ///  ADC High Speed Mode
            ADHSM: u1,
        }),
        ///  The ADC multiplexer Selection Register
        ADMUX: mmio.Mmio(8, packed struct {
            ///  Analog Channel and Gain Selection Bits
            MUX: u5,
            ///  Left Adjust Result
            ADLAR: u1,
            ///  Reference Selection Bits
            REFS: packed union {
                raw: u2,
                value: ANALOG_ADC_V_REF2,
            },
        }),
        ///  Digital Input Disable Register 2
        DIDR2: mmio.Mmio(8, packed struct {
            ///  ADC8 Digital input Disable
            ADC8D: u1,
            ///  ADC9 Digital input Disable
            ADC9D: u1,
            ///  ADC10 Digital input Disable
            ADC10D: u1,
            ///  ADC11 Digital input Disable
            ADC11D: u1,
            ///  ADC12 Digital input Disable
            ADC12D: u1,
            ///  ADC13 Digital input Disable
            ADC13D: u1,
            padding: u2 = 0,
        }),
        ///  Digital Input Disable Register 0
        DIDR0: mmio.Mmio(8, packed struct {
            ///  ADC0 Digital input Disable
            ADC0D: u1,
            ///  ADC1 Digital input Disable
            ADC1D: u1,
            ///  ADC2 Digital input Disable
            ADC2D: u1,
            ///  ADC3 Digital input Disable
            ADC3D: u1,
            ///  ADC4 Digital input Disable
            ADC4D: u1,
            ///  ADC5 Digital input Disable
            ADC5D: u1,
            ///  ADC6 Digital input Disable
            ADC6D: u1,
            ///  ADC7 Digital input Disable
            ADC7D: u1,
        }),
    };

    ///  Analog Comparator
    pub const AC = extern struct {
        pub const ANALOG_COMP_INTERRUPT = enum(u2) {
            ///  Interrupt on Toggle
            VAL_0x00 = 0x0,
            ///  Reserved
            VAL_0x01 = 0x1,
            ///  Interrupt on Falling Edge
            VAL_0x02 = 0x2,
            ///  Interrupt on Rising Edge
            VAL_0x03 = 0x3,
        };

        ///  Analog Comparator Control And Status Register
        ACSR: mmio.Mmio(8, packed struct {
            ///  Analog Comparator Interrupt Mode Select bits
            ACIS: packed union {
                raw: u2,
                value: ANALOG_COMP_INTERRUPT,
            },
            ///  Analog Comparator Input Capture Enable
            ACIC: u1,
            ///  Analog Comparator Interrupt Enable
            ACIE: u1,
            ///  Analog Comparator Interrupt Flag
            ACI: u1,
            ///  Analog Compare Output
            ACO: u1,
            ///  Analog Comparator Bandgap Select
            ACBG: u1,
            ///  Analog Comparator Disable
            ACD: u1,
        }),
        reserved43: [42]u8,
        ///  ADC Control and Status Register B
        ADCSRB: mmio.Mmio(8, packed struct {
            reserved6: u6 = 0,
            ///  Analog Comparator Multiplexer Enable
            ACME: u1,
            padding: u1 = 0,
        }),
        reserved47: [3]u8,
        DIDR1: mmio.Mmio(8, packed struct {
            ///  AIN0 Digital Input Disable
            AIN0D: u1,
            ///  AIN1 Digital Input Disable
            AIN1D: u1,
            padding: u6 = 0,
        }),
    };

    ///  CPU Registers
    pub const CPU = extern struct {
        pub const CPU_CLK_PRESCALE_4_BITS_SMALL = enum(u4) {
            ///  1
            VAL_0x00 = 0x0,
            ///  2
            VAL_0x01 = 0x1,
            ///  4
            VAL_0x02 = 0x2,
            ///  8
            VAL_0x03 = 0x3,
            ///  16
            VAL_0x04 = 0x4,
            ///  32
            VAL_0x05 = 0x5,
            ///  64
            VAL_0x06 = 0x6,
            ///  128
            VAL_0x07 = 0x7,
            ///  256
            VAL_0x08 = 0x8,
            _,
        };

        pub const CPU_SLEEP_MODE_3BITS = enum(u3) {
            ///  Idle
            IDLE = 0x0,
            ///  ADC Noise Reduction (If Available)
            ADC = 0x1,
            ///  Power Down
            PDOWN = 0x2,
            ///  Power Save
            PSAVE = 0x3,
            ///  Reserved
            VAL_0x04 = 0x4,
            ///  Reserved
            VAL_0x05 = 0x5,
            ///  Standby
            STDBY = 0x6,
            ///  Extended Standby
            ESTDBY = 0x7,
        };

        pub const RAMPZ_BITF = enum(u2) {
            ///  Default value of Z-pointer MSB's.
            VAL_0 = 0x0,
            _,
        };

        ///  Oscillator Calibration Values
        pub const OSCCAL_VALUE_ADDRESSES = enum(u1) {
            ///  8.0 MHz
            @"8_0_MHz" = 0x0,
            _,
        };

        ///  General Purpose IO Register 0
        GPIOR0: mmio.Mmio(8, packed struct {
            ///  General Purpose IO Register 0 bit 0
            GPIOR00: u1,
            ///  General Purpose IO Register 0 bit 1
            GPIOR01: u1,
            ///  General Purpose IO Register 0 bit 2
            GPIOR02: u1,
            ///  General Purpose IO Register 0 bit 3
            GPIOR03: u1,
            ///  General Purpose IO Register 0 bit 4
            GPIOR04: u1,
            ///  General Purpose IO Register 0 bit 5
            GPIOR05: u1,
            ///  General Purpose IO Register 0 bit 6
            GPIOR06: u1,
            ///  General Purpose IO Register 0 bit 7
            GPIOR07: u1,
        }),
        reserved12: [11]u8,
        ///  General Purpose IO Register 1
        GPIOR1: mmio.Mmio(8, packed struct {
            ///  General Purpose IO Register 1 bis
            GPIOR: u8,
        }),
        ///  General Purpose IO Register 2
        GPIOR2: mmio.Mmio(8, packed struct {
            ///  General Purpose IO Register 2 bis
            GPIOR: u8,
        }),
        reserved21: [7]u8,
        ///  Sleep Mode Control Register
        SMCR: mmio.Mmio(8, packed struct {
            ///  Sleep Enable
            SE: u1,
            ///  Sleep Mode Select bits
            SM: packed union {
                raw: u3,
                value: CPU_SLEEP_MODE_3BITS,
            },
            padding: u4 = 0,
        }),
        ///  MCU Status Register
        MCUSR: mmio.Mmio(8, packed struct {
            ///  Power-on reset flag
            PORF: u1,
            ///  External Reset Flag
            EXTRF: u1,
            ///  Brown-out Reset Flag
            BORF: u1,
            ///  Watchdog Reset Flag
            WDRF: u1,
            ///  JTAG Reset Flag
            JTRF: u1,
            padding: u3 = 0,
        }),
        ///  MCU Control Register
        MCUCR: mmio.Mmio(8, packed struct {
            ///  Interrupt Vector Change Enable
            IVCE: u1,
            ///  Interrupt Vector Select
            IVSEL: u1,
            reserved4: u2 = 0,
            ///  Pull-up disable
            PUD: u1,
            reserved7: u2 = 0,
            ///  JTAG Interface Disable
            JTD: u1,
        }),
        reserved29: [5]u8,
        ///  Extended Z-pointer Register for ELPM/SPM
        RAMPZ: mmio.Mmio(8, packed struct {
            ///  Extended Z-Pointer Value
            RAMPZ: packed union {
                raw: u2,
                value: RAMPZ_BITF,
            },
            ///  Reserved
            Res: u6,
        }),
        ///  Extended Indirect Register
        EIND: u8,
        ///  Stack Pointer
        SP: u16,
        ///  Status Register
        SREG: mmio.Mmio(8, packed struct {
            ///  Carry Flag
            C: u1,
            ///  Zero Flag
            Z: u1,
            ///  Negative Flag
            N: u1,
            ///  Two's Complement Overflow Flag
            V: u1,
            ///  Sign Bit
            S: u1,
            ///  Half Carry Flag
            H: u1,
            ///  Bit Copy Storage
            T: u1,
            ///  Global Interrupt Enable
            I: u1,
        }),
        reserved35: [1]u8,
        CLKPR: mmio.Mmio(8, packed struct {
            CLKPS: packed union {
                raw: u4,
                value: CPU_CLK_PRESCALE_4_BITS_SMALL,
            },
            reserved7: u3 = 0,
            CLKPCE: u1,
        }),
        reserved38: [2]u8,
        ///  Power Reduction Register0
        PRR0: mmio.Mmio(8, packed struct {
            ///  Power Reduction ADC
            PRADC: u1,
            ///  Power Reduction USART
            PRUSART0: u1,
            ///  Power Reduction Serial Peripheral Interface
            PRSPI: u1,
            ///  Power Reduction Timer/Counter1
            PRTIM1: u1,
            reserved5: u1 = 0,
            ///  Power Reduction Timer/Counter0
            PRTIM0: u1,
            ///  Power Reduction Timer/Counter2
            PRTIM2: u1,
            ///  Power Reduction TWI
            PRTWI: u1,
        }),
        ///  Power Reduction Register1
        PRR1: mmio.Mmio(8, packed struct {
            ///  Power Reduction USART1
            PRUSART1: u1,
            reserved3: u2 = 0,
            ///  Power Reduction Timer/Counter3
            PRTIM3: u1,
            ///  Power Reduction Timer/Counter4
            PRTIM4: u1,
            reserved7: u2 = 0,
            ///  Power Reduction USB
            PRUSB: u1,
        }),
        ///  Oscillator Calibration Value
        OSCCAL: mmio.Mmio(8, packed struct {
            ///  Oscillator Calibration
            OSCCAL: u8,
        }),
        ///  Oscillator Control Register
        RCCTRL: mmio.Mmio(8, packed struct {
            RCFREQ: u1,
            padding: u7 = 0,
        }),
        reserved135: [93]u8,
        CLKSEL0: mmio.Mmio(8, packed struct {
            CLKS: u1,
            reserved2: u1 = 0,
            EXTE: u1,
            RCE: u1,
            EXSUT: u2,
            RCSUT: u2,
        }),
        CLKSEL1: mmio.Mmio(8, packed struct {
            EXCKSEL: u4,
            RCCKSEL: u4,
        }),
        CLKSTA: mmio.Mmio(8, packed struct {
            EXTON: u1,
            RCON: u1,
            padding: u6 = 0,
        }),
    };

    ///  Phase Locked Loop
    pub const PLL = extern struct {
        ///  PLL Status and Control register
        PLLCSR: mmio.Mmio(8, packed struct {
            ///  PLL Lock Status Bit
            PLOCK: u1,
            ///  PLL Enable Bit
            PLLE: u1,
            reserved4: u2 = 0,
            ///  PLL prescaler Bit 2
            PINDIV: u1,
            padding: u3 = 0,
        }),
        reserved9: [8]u8,
        ///  PLL Frequency Control Register
        PLLFRQ: mmio.Mmio(8, packed struct {
            PDIV: u4,
            PLLTM: u2,
            PLLUSB: u1,
            PINMUX: u1,
        }),
    };

    ///  USB Device Registers
    pub const USB_DEVICE = extern struct {
        UHWCON: mmio.Mmio(8, packed struct {
            UVREGE: u1,
            padding: u7 = 0,
        }),
        ///  USB General Control Register
        USBCON: mmio.Mmio(8, packed struct {
            VBUSTE: u1,
            reserved4: u3 = 0,
            OTGPADE: u1,
            FRZCLK: u1,
            reserved7: u1 = 0,
            USBE: u1,
        }),
        USBSTA: mmio.Mmio(8, packed struct {
            VBUS: u1,
            reserved3: u2 = 0,
            SPEED: u1,
            padding: u4 = 0,
        }),
        USBINT: mmio.Mmio(8, packed struct {
            VBUSTI: u1,
            padding: u7 = 0,
        }),
        reserved9: [5]u8,
        UDCON: mmio.Mmio(8, packed struct {
            DETACH: u1,
            RMWKUP: u1,
            ///  USB low speed mode
            LSM: u1,
            RSTCPU: u1,
            padding: u4 = 0,
        }),
        UDINT: mmio.Mmio(8, packed struct {
            SUSPI: u1,
            reserved2: u1 = 0,
            SOFI: u1,
            EORSTI: u1,
            WAKEUPI: u1,
            EORSMI: u1,
            UPRSMI: u1,
            padding: u1 = 0,
        }),
        UDIEN: mmio.Mmio(8, packed struct {
            SUSPE: u1,
            reserved2: u1 = 0,
            SOFE: u1,
            EORSTE: u1,
            WAKEUPE: u1,
            EORSME: u1,
            UPRSME: u1,
            padding: u1 = 0,
        }),
        UDADDR: mmio.Mmio(8, packed struct {
            UADD: u7,
            ADDEN: u1,
        }),
        UDFNUM: u16,
        UDMFN: mmio.Mmio(8, packed struct {
            reserved4: u4 = 0,
            FNCERR: u1,
            padding: u3 = 0,
        }),
        reserved17: [1]u8,
        UEINTX: mmio.Mmio(8, packed struct {
            TXINI: u1,
            STALLEDI: u1,
            RXOUTI: u1,
            RXSTPI: u1,
            NAKOUTI: u1,
            RWAL: u1,
            NAKINI: u1,
            FIFOCON: u1,
        }),
        UENUM: u8,
        UERST: mmio.Mmio(8, packed struct {
            EPRST: u7,
            padding: u1 = 0,
        }),
        UECONX: mmio.Mmio(8, packed struct {
            EPEN: u1,
            reserved3: u2 = 0,
            RSTDT: u1,
            STALLRQC: u1,
            STALLRQ: u1,
            padding: u2 = 0,
        }),
        UECFG0X: mmio.Mmio(8, packed struct {
            EPDIR: u1,
            reserved6: u5 = 0,
            EPTYPE: u2,
        }),
        UECFG1X: mmio.Mmio(8, packed struct {
            reserved1: u1 = 0,
            ALLOC: u1,
            EPBK: u2,
            EPSIZE: u3,
            padding: u1 = 0,
        }),
        UESTA0X: mmio.Mmio(8, packed struct {
            NBUSYBK: u2,
            DTSEQ: u2,
            reserved5: u1 = 0,
            UNDERFI: u1,
            OVERFI: u1,
            CFGOK: u1,
        }),
        UESTA1X: mmio.Mmio(8, packed struct {
            CURRBK: u2,
            CTRLDIR: u1,
            padding: u5 = 0,
        }),
        UEIENX: mmio.Mmio(8, packed struct {
            TXINE: u1,
            STALLEDE: u1,
            RXOUTE: u1,
            RXSTPE: u1,
            NAKOUTE: u1,
            reserved6: u1 = 0,
            NAKINE: u1,
            FLERRE: u1,
        }),
        UEDATX: mmio.Mmio(8, packed struct {
            DAT: u8,
        }),
        UEBCLX: u8,
        UEBCHX: u8,
        UEINT: u8,
    };
};
