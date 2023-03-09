const micro = @import("microzig");
const mmio = micro.mmio;

pub const devices = struct {
    pub const ATSAMD20E15 = struct {
        pub const properties = struct {
            pub const family = "SAMD";
            pub const arch = "CORTEX-M0PLUS";
            pub const series = "SAMD20";
        };

        pub const VectorTable = extern struct {
            const Handler = micro.interrupt.Handler;
            const unhandled = micro.interrupt.unhandled;

            initial_stack_pointer: u32,
            Reset: Handler = unhandled,
            NMI: Handler = unhandled,
            HardFault: Handler = unhandled,
            reserved2: [7]u32 = undefined,
            SVCall: Handler = unhandled,
            reserved10: [2]u32 = undefined,
            PendSV: Handler = unhandled,
            reserved13: [1]u32 = undefined,
            ///  Power Manager
            PM: Handler = unhandled,
            ///  System Controller
            SYSCTRL: Handler = unhandled,
            ///  Watchdog Timer
            WDT: Handler = unhandled,
            ///  Real Time Counter
            RTC: Handler = unhandled,
            ///  External Interrupt Controller
            EIC: Handler = unhandled,
            ///  Non-Volatile Memory Controller
            NVMCTRL: Handler = unhandled,
            ///  Event Systems
            EVSYS: Handler = unhandled,
            ///  Serial Communication Interface 0
            SERCOM0: Handler = unhandled,
            ///  Serial Communication Interface 1
            SERCOM1: Handler = unhandled,
            ///  Serial Communication Interface 2
            SERCOM2: Handler = unhandled,
            ///  Serial Communication Interface 3
            SERCOM3: Handler = unhandled,
            reserved25: [2]u32 = undefined,
            ///  Timer/Counter 0
            TC0: Handler = unhandled,
            ///  Timer/Counter 1
            TC1: Handler = unhandled,
            ///  Timer/Counter 2
            TC2: Handler = unhandled,
            ///  Timer/Counter 3
            TC3: Handler = unhandled,
            ///  Timer/Counter 4
            TC4: Handler = unhandled,
            ///  Timer/Counter 5
            TC5: Handler = unhandled,
            reserved33: [2]u32 = undefined,
            ///  Analog-to-Digital Converter
            ADC: Handler = unhandled,
            ///  Analog Comparators
            AC: Handler = unhandled,
            ///  Digital-to-Analog Converter
            DAC: Handler = unhandled,
            ///  Peripheral Touch Controller
            PTC: Handler = unhandled,
        };

        pub const peripherals = struct {
            ///  Peripheral Access Controller
            pub const PAC0 = @intToPtr(*volatile types.peripherals.PAC, 0x40000000);
            ///  Power Manager
            pub const PM = @intToPtr(*volatile types.peripherals.PM, 0x40000400);
            ///  System Control
            pub const SYSCTRL = @intToPtr(*volatile types.peripherals.SYSCTRL, 0x40000800);
            ///  Generic Clock Generator
            pub const GCLK = @intToPtr(*volatile types.peripherals.GCLK, 0x40000c00);
            ///  Watchdog Timer
            pub const WDT = @intToPtr(*volatile types.peripherals.WDT, 0x40001000);
            ///  Real-Time Counter
            pub const RTC = @intToPtr(*volatile types.peripherals.RTC, 0x40001400);
            ///  External Interrupt Controller
            pub const EIC = @intToPtr(*volatile types.peripherals.EIC, 0x40001800);
            ///  Peripheral Access Controller
            pub const PAC1 = @intToPtr(*volatile types.peripherals.PAC, 0x41000000);
            ///  Device Service Unit
            pub const DSU = @intToPtr(*volatile types.peripherals.DSU, 0x41002000);
            ///  Non-Volatile Memory Controller
            pub const NVMCTRL = @intToPtr(*volatile types.peripherals.NVMCTRL, 0x41004000);
            /// PORT
            pub const PORT_GROUP = @intToPtr(*volatile [2]types.peripherals.PORT.GROUP, 0x41004400);
            ///  Peripheral Access Controller
            pub const PAC2 = @intToPtr(*volatile types.peripherals.PAC, 0x42000000);
            ///  Event System Interface
            pub const EVSYS = @intToPtr(*volatile types.peripherals.EVSYS, 0x42000400);
            ///  Serial Communication Interface
            pub const SERCOM0 = @intToPtr(*volatile types.peripherals.SERCOM, 0x42000800);
            ///  Serial Communication Interface
            pub const SERCOM1 = @intToPtr(*volatile types.peripherals.SERCOM, 0x42000c00);
            ///  Serial Communication Interface
            pub const SERCOM2 = @intToPtr(*volatile types.peripherals.SERCOM, 0x42001000);
            ///  Serial Communication Interface
            pub const SERCOM3 = @intToPtr(*volatile types.peripherals.SERCOM, 0x42001400);
            ///  Basic Timer Counter
            pub const TC0 = @intToPtr(*volatile types.peripherals.TC, 0x42002000);
            ///  Basic Timer Counter
            pub const TC1 = @intToPtr(*volatile types.peripherals.TC, 0x42002400);
            ///  Basic Timer Counter
            pub const TC2 = @intToPtr(*volatile types.peripherals.TC, 0x42002800);
            ///  Basic Timer Counter
            pub const TC3 = @intToPtr(*volatile types.peripherals.TC, 0x42002c00);
            ///  Basic Timer Counter
            pub const TC4 = @intToPtr(*volatile types.peripherals.TC, 0x42003000);
            ///  Basic Timer Counter
            pub const TC5 = @intToPtr(*volatile types.peripherals.TC, 0x42003400);
            ///  Analog Digital Converter
            pub const ADC = @intToPtr(*volatile types.peripherals.ADC, 0x42004000);
            ///  Analog Comparators
            pub const AC = @intToPtr(*volatile types.peripherals.AC, 0x42004400);
            ///  Digital Analog Converter
            pub const DAC = @intToPtr(*volatile types.peripherals.DAC, 0x42004800);
            ///  Peripheral Touch Controller
            pub const PTC = @intToPtr(*volatile types.peripherals.PTC, 0x42004c00);
            ///  System timer
            pub const SysTick = @intToPtr(*volatile types.peripherals.SysTick, 0xe000e010);
            ///  Nested Vectored Interrupt Controller
            pub const NVIC = @intToPtr(*volatile types.peripherals.NVIC, 0xe000e100);
            ///  System Control Registers
            pub const SystemControl = @intToPtr(*volatile types.peripherals.SystemControl, 0xe000ed00);
        };
    };
};

pub const types = struct {
    pub const peripherals = struct {
        ///  Analog Comparators
        pub const AC = extern struct {
            pub const AC_STATUSA__WSTATE0 = enum(u2) {
                ///  Signal is above window
                ABOVE = 0x0,
                ///  Signal is inside window
                INSIDE = 0x1,
                ///  Signal is below window
                BELOW = 0x2,
                _,
            };

            pub const AC_STATUSA__WSTATE1 = enum(u2) {
                ///  Signal is above window
                ABOVE = 0x0,
                ///  Signal is inside window
                INSIDE = 0x1,
                ///  Signal is below window
                BELOW = 0x2,
                _,
            };

            pub const AC_STATUSC__WSTATE0 = enum(u2) {
                ///  Signal is above window
                ABOVE = 0x0,
                ///  Signal is inside window
                INSIDE = 0x1,
                ///  Signal is below window
                BELOW = 0x2,
                _,
            };

            pub const AC_STATUSC__WSTATE1 = enum(u2) {
                ///  Signal is above window
                ABOVE = 0x0,
                ///  Signal is inside window
                INSIDE = 0x1,
                ///  Signal is below window
                BELOW = 0x2,
                _,
            };

            pub const AC_WINCTRL__WINTSEL0 = enum(u2) {
                ///  Interrupt on signal above window
                ABOVE = 0x0,
                ///  Interrupt on signal inside window
                INSIDE = 0x1,
                ///  Interrupt on signal below window
                BELOW = 0x2,
                ///  Interrupt on signal outside window
                OUTSIDE = 0x3,
            };

            pub const AC_WINCTRL__WINTSEL1 = enum(u2) {
                ///  Interrupt on signal above window
                ABOVE = 0x0,
                ///  Interrupt on signal inside window
                INSIDE = 0x1,
                ///  Interrupt on signal below window
                BELOW = 0x2,
                ///  Interrupt on signal outside window
                OUTSIDE = 0x3,
            };

            pub const AC_COMPCTRL__FLEN = enum(u3) {
                ///  No filtering
                OFF = 0x0,
                ///  3-bit majority function (2 of 3)
                MAJ3 = 0x1,
                ///  5-bit majority function (3 of 5)
                MAJ5 = 0x2,
                _,
            };

            pub const AC_COMPCTRL__INTSEL = enum(u2) {
                ///  Interrupt on comparator output toggle
                TOGGLE = 0x0,
                ///  Interrupt on comparator output rising
                RISING = 0x1,
                ///  Interrupt on comparator output falling
                FALLING = 0x2,
                ///  Interrupt on end of comparison (single-shot mode only)
                EOC = 0x3,
            };

            pub const AC_COMPCTRL__MUXNEG = enum(u3) {
                ///  I/O pin 0
                PIN0 = 0x0,
                ///  I/O pin 1
                PIN1 = 0x1,
                ///  I/O pin 2
                PIN2 = 0x2,
                ///  I/O pin 3
                PIN3 = 0x3,
                ///  Ground
                GND = 0x4,
                ///  VDD scaler
                VSCALE = 0x5,
                ///  Internal bandgap voltage
                BANDGAP = 0x6,
                ///  DAC output
                DAC = 0x7,
            };

            pub const AC_COMPCTRL__MUXPOS = enum(u2) {
                ///  I/O pin 0
                PIN0 = 0x0,
                ///  I/O pin 1
                PIN1 = 0x1,
                ///  I/O pin 2
                PIN2 = 0x2,
                ///  I/O pin 3
                PIN3 = 0x3,
            };

            pub const AC_COMPCTRL__OUT = enum(u2) {
                ///  The output of COMPn is not routed to the COMPn I/O port
                OFF = 0x0,
                ///  The asynchronous output of COMPn is routed to the COMPn I/O port
                ASYNC = 0x1,
                ///  The synchronous output (including filtering) of COMPn is routed to the COMPn I/O port
                SYNC = 0x2,
                _,
            };

            pub const AC_COMPCTRL__SPEED = enum(u2) {
                ///  Low speed
                LOW = 0x0,
                ///  High speed
                HIGH = 0x1,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Software Reset
                SWRST: u1,
                ///  Enable
                ENABLE: u1,
                ///  Run in Standby
                RUNSTDBY: u1,
                reserved7: u4,
                ///  Low-Power Mux
                LPMUX: u1,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  Comparator 0 Start Comparison
                START0: u1,
                ///  Comparator 1 Start Comparison
                START1: u1,
                padding: u6,
            }),
            ///  Event Control
            EVCTRL: mmio.Mmio(packed struct(u16) {
                ///  Comparator 0 Event Output Enable
                COMPEO0: u1,
                ///  Comparator 1 Event Output Enable
                COMPEO1: u1,
                reserved4: u2,
                ///  Window 0 Event Output Enable
                WINEO0: u1,
                reserved8: u3,
                ///  Comparator 0 Event Input
                COMPEI0: u1,
                ///  Comparator 1 Event Input
                COMPEI1: u1,
                padding: u6,
            }),
            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u8) {
                ///  Comparator 0 Interrupt Enable
                COMP0: u1,
                ///  Comparator 1 Interrupt Enable
                COMP1: u1,
                reserved4: u2,
                ///  Window 0 Interrupt Enable
                WIN0: u1,
                padding: u3,
            }),
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u8) {
                ///  Comparator 0 Interrupt Enable
                COMP0: u1,
                ///  Comparator 1 Interrupt Enable
                COMP1: u1,
                reserved4: u2,
                ///  Window 0 Interrupt Enable
                WIN0: u1,
                padding: u3,
            }),
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u8) {
                ///  Comparator 0
                COMP0: u1,
                ///  Comparator 1
                COMP1: u1,
                reserved4: u2,
                ///  Window 0
                WIN0: u1,
                padding: u3,
            }),
            reserved8: [1]u8,
            ///  Status A
            STATUSA: mmio.Mmio(packed struct(u8) {
                ///  Comparator 0 Current State
                STATE0: u1,
                ///  Comparator 1 Current State
                STATE1: u1,
                reserved4: u2,
                ///  Window 0 Current State
                WSTATE0: packed union {
                    raw: u2,
                    value: AC_STATUSA__WSTATE0,
                },
                padding: u2,
            }),
            ///  Status B
            STATUSB: mmio.Mmio(packed struct(u8) {
                ///  Comparator 0 Ready
                READY0: u1,
                ///  Comparator 1 Ready
                READY1: u1,
                reserved7: u5,
                ///  Synchronization Busy
                SYNCBUSY: u1,
            }),
            ///  Status C
            STATUSC: mmio.Mmio(packed struct(u8) {
                ///  Comparator 0 Current State
                STATE0: u1,
                ///  Comparator 1 Current State
                STATE1: u1,
                reserved4: u2,
                ///  Window 0 Current State
                WSTATE0: packed union {
                    raw: u2,
                    value: AC_STATUSC__WSTATE0,
                },
                padding: u2,
            }),
            reserved12: [1]u8,
            ///  Window Control
            WINCTRL: mmio.Mmio(packed struct(u8) {
                ///  Window 0 Mode Enable
                WEN0: u1,
                ///  Window 0 Interrupt Selection
                WINTSEL0: packed union {
                    raw: u2,
                    value: AC_WINCTRL__WINTSEL0,
                },
                padding: u5,
            }),
            reserved16: [3]u8,
            ///  Comparator Control n
            COMPCTRL: mmio.Mmio(packed struct(u32) {
                ///  Enable
                ENABLE: u1,
                ///  Single-Shot Mode
                SINGLE: u1,
                ///  Speed Selection
                SPEED: packed union {
                    raw: u2,
                    value: AC_COMPCTRL__SPEED,
                },
                reserved5: u1,
                ///  Interrupt Selection
                INTSEL: packed union {
                    raw: u2,
                    value: AC_COMPCTRL__INTSEL,
                },
                reserved8: u1,
                ///  Negative Input Mux Selection
                MUXNEG: packed union {
                    raw: u3,
                    value: AC_COMPCTRL__MUXNEG,
                },
                reserved12: u1,
                ///  Positive Input Mux Selection
                MUXPOS: packed union {
                    raw: u2,
                    value: AC_COMPCTRL__MUXPOS,
                },
                reserved15: u1,
                ///  Swap Inputs and Invert
                SWAP: u1,
                ///  Output
                OUT: packed union {
                    raw: u2,
                    value: AC_COMPCTRL__OUT,
                },
                reserved19: u1,
                ///  Hysteresis Enable
                HYST: u1,
                reserved24: u4,
                ///  Filter Length
                FLEN: packed union {
                    raw: u3,
                    value: AC_COMPCTRL__FLEN,
                },
                padding: u5,
            }),
            reserved32: [12]u8,
            ///  Scaler n
            SCALER: mmio.Mmio(packed struct(u8) {
                ///  Scaler Value
                VALUE: u6,
                padding: u2,
            }),
        };

        ///  Analog Digital Converter
        pub const ADC = extern struct {
            pub const ADC_REFCTRL__REFSEL = enum(u4) {
                ///  1.0V voltage reference
                INT1V = 0x0,
                ///  1/1.48 VDDANA
                INTVCC0 = 0x1,
                ///  1/2 VDDANA (only for VDDANA > 2.0V)
                INTVCC1 = 0x2,
                ///  External reference A
                AREFA = 0x3,
                ///  External reference B
                AREFB = 0x4,
                _,
            };

            pub const ADC_AVGCTRL__SAMPLENUM = enum(u4) {
                ///  1 sample
                @"1" = 0x0,
                ///  2 samples
                @"2" = 0x1,
                ///  4 samples
                @"4" = 0x2,
                ///  8 samples
                @"8" = 0x3,
                ///  16 samples
                @"16" = 0x4,
                ///  32 samples
                @"32" = 0x5,
                ///  64 samples
                @"64" = 0x6,
                ///  128 samples
                @"128" = 0x7,
                ///  256 samples
                @"256" = 0x8,
                ///  512 samples
                @"512" = 0x9,
                ///  1024 samples
                @"1024" = 0xa,
                _,
            };

            pub const ADC_CTRLB__PRESCALER = enum(u3) {
                ///  Peripheral clock divided by 4
                DIV4 = 0x0,
                ///  Peripheral clock divided by 8
                DIV8 = 0x1,
                ///  Peripheral clock divided by 16
                DIV16 = 0x2,
                ///  Peripheral clock divided by 32
                DIV32 = 0x3,
                ///  Peripheral clock divided by 64
                DIV64 = 0x4,
                ///  Peripheral clock divided by 128
                DIV128 = 0x5,
                ///  Peripheral clock divided by 256
                DIV256 = 0x6,
                ///  Peripheral clock divided by 512
                DIV512 = 0x7,
            };

            pub const ADC_CTRLB__RESSEL = enum(u2) {
                ///  12-bit result
                @"12BIT" = 0x0,
                ///  16-bit averaging mode
                @"16BIT" = 0x1,
                ///  10-bit result
                @"10BIT" = 0x2,
                ///  8-bit result
                @"8BIT" = 0x3,
            };

            pub const ADC_WINCTRL__WINMODE = enum(u3) {
                ///  No window mode (default)
                DISABLE = 0x0,
                ///  Mode 1: RESULT > WINLT
                MODE1 = 0x1,
                ///  Mode 2: RESULT < WINUT
                MODE2 = 0x2,
                ///  Mode 3: WINLT < RESULT < WINUT
                MODE3 = 0x3,
                ///  Mode 4: !(WINLT < RESULT < WINUT)
                MODE4 = 0x4,
                _,
            };

            pub const ADC_INPUTCTRL__GAIN = enum(u4) {
                ///  1x
                @"1X" = 0x0,
                ///  2x
                @"2X" = 0x1,
                ///  4x
                @"4X" = 0x2,
                ///  8x
                @"8X" = 0x3,
                ///  16x
                @"16X" = 0x4,
                ///  1/2x
                DIV2 = 0xf,
                _,
            };

            pub const ADC_INPUTCTRL__MUXNEG = enum(u5) {
                ///  ADC AIN0 Pin
                PIN0 = 0x0,
                ///  ADC AIN1 Pin
                PIN1 = 0x1,
                ///  ADC AIN2 Pin
                PIN2 = 0x2,
                ///  ADC AIN3 Pin
                PIN3 = 0x3,
                ///  ADC AIN4 Pin
                PIN4 = 0x4,
                ///  ADC AIN5 Pin
                PIN5 = 0x5,
                ///  ADC AIN6 Pin
                PIN6 = 0x6,
                ///  ADC AIN7 Pin
                PIN7 = 0x7,
                ///  Internal ground
                GND = 0x18,
                ///  IO ground
                IOGND = 0x19,
                _,
            };

            pub const ADC_INPUTCTRL__MUXPOS = enum(u5) {
                ///  ADC AIN0 Pin
                PIN0 = 0x0,
                ///  ADC AIN1 Pin
                PIN1 = 0x1,
                ///  ADC AIN2 Pin
                PIN2 = 0x2,
                ///  ADC AIN3 Pin
                PIN3 = 0x3,
                ///  ADC AIN4 Pin
                PIN4 = 0x4,
                ///  ADC AIN5 Pin
                PIN5 = 0x5,
                ///  ADC AIN6 Pin
                PIN6 = 0x6,
                ///  ADC AIN7 Pin
                PIN7 = 0x7,
                ///  ADC AIN8 Pin
                PIN8 = 0x8,
                ///  ADC AIN9 Pin
                PIN9 = 0x9,
                ///  ADC AIN10 Pin
                PIN10 = 0xa,
                ///  ADC AIN11 Pin
                PIN11 = 0xb,
                ///  ADC AIN12 Pin
                PIN12 = 0xc,
                ///  ADC AIN13 Pin
                PIN13 = 0xd,
                ///  ADC AIN14 Pin
                PIN14 = 0xe,
                ///  ADC AIN15 Pin
                PIN15 = 0xf,
                ///  ADC AIN16 Pin
                PIN16 = 0x10,
                ///  ADC AIN17 Pin
                PIN17 = 0x11,
                ///  ADC AIN18 Pin
                PIN18 = 0x12,
                ///  ADC AIN19 Pin
                PIN19 = 0x13,
                ///  Temperature Reference
                TEMP = 0x18,
                ///  Bandgap Voltage
                BANDGAP = 0x19,
                ///  1/4 Scaled Core Supply
                SCALEDCOREVCC = 0x1a,
                ///  1/4 Scaled I/O Supply
                SCALEDIOVCC = 0x1b,
                ///  DAC Output
                DAC = 0x1c,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Software Reset
                SWRST: u1,
                ///  Enable
                ENABLE: u1,
                ///  Run in Standby
                RUNSTDBY: u1,
                padding: u5,
            }),
            ///  Reference Control
            REFCTRL: mmio.Mmio(packed struct(u8) {
                ///  Reference Selection
                REFSEL: packed union {
                    raw: u4,
                    value: ADC_REFCTRL__REFSEL,
                },
                reserved7: u3,
                ///  Reference Buffer Offset Compensation Enable
                REFCOMP: u1,
            }),
            ///  Average Control
            AVGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Number of Samples to be Collected
                SAMPLENUM: packed union {
                    raw: u4,
                    value: ADC_AVGCTRL__SAMPLENUM,
                },
                ///  Adjusting Result / Division Coefficient
                ADJRES: u3,
                padding: u1,
            }),
            ///  Sampling Time Control
            SAMPCTRL: mmio.Mmio(packed struct(u8) {
                ///  Sampling Time Length
                SAMPLEN: u6,
                padding: u2,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u16) {
                ///  Differential Mode
                DIFFMODE: u1,
                ///  Left Adjusted Result
                LEFTADJ: u1,
                ///  Free Running Mode
                FREERUN: u1,
                ///  Digital Correction Logic Enabled
                CORREN: u1,
                ///  Conversion Result Resolution
                RESSEL: packed union {
                    raw: u2,
                    value: ADC_CTRLB__RESSEL,
                },
                reserved8: u2,
                ///  Prescaler Configuration
                PRESCALER: packed union {
                    raw: u3,
                    value: ADC_CTRLB__PRESCALER,
                },
                padding: u5,
            }),
            reserved8: [2]u8,
            ///  Window Monitor Control
            WINCTRL: mmio.Mmio(packed struct(u8) {
                ///  Window Monitor Mode
                WINMODE: packed union {
                    raw: u3,
                    value: ADC_WINCTRL__WINMODE,
                },
                padding: u5,
            }),
            reserved12: [3]u8,
            ///  Software Trigger
            SWTRIG: mmio.Mmio(packed struct(u8) {
                ///  ADC Conversion Flush
                FLUSH: u1,
                ///  ADC Start Conversion
                START: u1,
                padding: u6,
            }),
            reserved16: [3]u8,
            ///  Inputs Control
            INPUTCTRL: mmio.Mmio(packed struct(u32) {
                ///  Positive MUX Input Selection
                MUXPOS: packed union {
                    raw: u5,
                    value: ADC_INPUTCTRL__MUXPOS,
                },
                reserved8: u3,
                ///  Negative MUX Input Selection
                MUXNEG: packed union {
                    raw: u5,
                    value: ADC_INPUTCTRL__MUXNEG,
                },
                reserved16: u3,
                ///  Number of Input Channels Included in Scan
                INPUTSCAN: u4,
                ///  Positive MUX Setting Offset
                INPUTOFFSET: u4,
                ///  Gain Factor Selection
                GAIN: packed union {
                    raw: u4,
                    value: ADC_INPUTCTRL__GAIN,
                },
                padding: u4,
            }),
            ///  Event Control
            EVCTRL: mmio.Mmio(packed struct(u8) {
                ///  Start Conversion Event In
                STARTEI: u1,
                ///  Synchronization Event In
                SYNCEI: u1,
                reserved4: u2,
                ///  Result Ready Event Out
                RESRDYEO: u1,
                ///  Window Monitor Event Out
                WINMONEO: u1,
                padding: u2,
            }),
            reserved22: [1]u8,
            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u8) {
                ///  Result Ready Interrupt Enable
                RESRDY: u1,
                ///  Overrun Interrupt Enable
                OVERRUN: u1,
                ///  Window Monitor Interrupt Enable
                WINMON: u1,
                ///  Synchronization Ready Interrupt Enable
                SYNCRDY: u1,
                padding: u4,
            }),
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u8) {
                ///  Result Ready Interrupt Enable
                RESRDY: u1,
                ///  Overrun Interrupt Enable
                OVERRUN: u1,
                ///  Window Monitor Interrupt Enable
                WINMON: u1,
                ///  Synchronization Ready Interrupt Enable
                SYNCRDY: u1,
                padding: u4,
            }),
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u8) {
                ///  Result Ready
                RESRDY: u1,
                ///  Overrun
                OVERRUN: u1,
                ///  Window Monitor
                WINMON: u1,
                ///  Synchronization Ready
                SYNCRDY: u1,
                padding: u4,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                reserved7: u7,
                ///  Synchronization Busy
                SYNCBUSY: u1,
            }),
            ///  Result
            RESULT: mmio.Mmio(packed struct(u16) {
                ///  Result Conversion Value
                RESULT: u16,
            }),
            ///  Window Monitor Lower Threshold
            WINLT: mmio.Mmio(packed struct(u16) {
                ///  Window Lower Threshold
                WINLT: u16,
            }),
            reserved32: [2]u8,
            ///  Window Monitor Upper Threshold
            WINUT: mmio.Mmio(packed struct(u16) {
                ///  Window Upper Threshold
                WINUT: u16,
            }),
            reserved36: [2]u8,
            ///  Gain Correction
            GAINCORR: mmio.Mmio(packed struct(u16) {
                ///  Gain Correction Value
                GAINCORR: u12,
                padding: u4,
            }),
            ///  Offset Correction
            OFFSETCORR: mmio.Mmio(packed struct(u16) {
                ///  Offset Correction Value
                OFFSETCORR: u12,
                padding: u4,
            }),
            ///  Calibration
            CALIB: mmio.Mmio(packed struct(u16) {
                ///  Linearity Calibration Value
                LINEARITY_CAL: u8,
                ///  Bias Calibration Value
                BIAS_CAL: u3,
                padding: u5,
            }),
            ///  Debug Control
            DBGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Debug Run
                DBGRUN: u1,
                padding: u7,
            }),
        };

        ///  Digital Analog Converter
        pub const DAC = extern struct {
            pub const DAC_CTRLB__REFSEL = enum(u2) {
                ///  Internal 1.0V reference
                INT1V = 0x0,
                ///  AVCC
                AVCC = 0x1,
                ///  External reference
                VREFP = 0x2,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Software Reset
                SWRST: u1,
                ///  Enable
                ENABLE: u1,
                ///  Run in Standby
                RUNSTDBY: u1,
                padding: u5,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  External Output Enable
                EOEN: u1,
                ///  Internal Output Enable
                IOEN: u1,
                ///  Left Adjusted Data
                LEFTADJ: u1,
                ///  Voltage Pump Disable
                VPD: u1,
                reserved6: u2,
                ///  Reference Selection
                REFSEL: packed union {
                    raw: u2,
                    value: DAC_CTRLB__REFSEL,
                },
            }),
            ///  Event Control
            EVCTRL: mmio.Mmio(packed struct(u8) {
                ///  Start Conversion Event Input
                STARTEI: u1,
                ///  Data Buffer Empty Event Output
                EMPTYEO: u1,
                padding: u6,
            }),
            reserved4: [1]u8,
            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u8) {
                ///  Underrun Interrupt Enable
                UNDERRUN: u1,
                ///  Data Buffer Empty Interrupt Enable
                EMPTY: u1,
                ///  Synchronization Ready Interrupt Enable
                SYNCRDY: u1,
                padding: u5,
            }),
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u8) {
                ///  Underrun Interrupt Enable
                UNDERRUN: u1,
                ///  Data Buffer Empty Interrupt Enable
                EMPTY: u1,
                ///  Synchronization Ready Interrupt Enable
                SYNCRDY: u1,
                padding: u5,
            }),
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u8) {
                ///  Underrun
                UNDERRUN: u1,
                ///  Data Buffer Empty
                EMPTY: u1,
                ///  Synchronization Ready
                SYNCRDY: u1,
                padding: u5,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                reserved7: u7,
                ///  Synchronization Busy Status
                SYNCBUSY: u1,
            }),
            ///  Data
            DATA: mmio.Mmio(packed struct(u16) {
                ///  Data to be converted
                DATA: u16,
            }),
            reserved12: [2]u8,
            ///  Data Buffer
            DATABUF: mmio.Mmio(packed struct(u16) {
                ///  Data Buffer
                DATABUF: u16,
            }),
        };

        ///  Device Service Unit
        pub const DSU = extern struct {
            pub const DSU_DID__FAMILY = enum(u5) {
                ///  General purpose microcontroller
                @"0" = 0x0,
                ///  PicoPower
                @"1" = 0x1,
                _,
            };

            pub const DSU_DID__PROCESSOR = enum(u4) {
                ///  Cortex-M0
                @"0" = 0x0,
                ///  Cortex-M0+
                @"1" = 0x1,
                ///  Cortex-M3
                @"2" = 0x2,
                ///  Cortex-M4
                @"3" = 0x3,
                _,
            };

            pub const DSU_DID__SERIES = enum(u6) {
                ///  Cortex-M0+ processor, basic feature set
                @"0" = 0x0,
                ///  Cortex-M0+ processor, USB
                @"1" = 0x1,
                _,
            };

            ///  Control
            CTRL: mmio.Mmio(packed struct(u8) {
                ///  Software Reset
                SWRST: u1,
                reserved2: u1,
                ///  32-bit Cyclic Redundancy Code
                CRC: u1,
                ///  Memory built-in self-test
                MBIST: u1,
                ///  Chip-Erase
                CE: u1,
                reserved6: u1,
                ///  Auxiliary Row Read
                ARR: u1,
                ///  Start Memory Stream Access
                SMSA: u1,
            }),
            ///  Status A
            STATUSA: mmio.Mmio(packed struct(u8) {
                ///  Done
                DONE: u1,
                ///  CPU Reset Phase Extension
                CRSTEXT: u1,
                ///  Bus Error
                BERR: u1,
                ///  Failure
                FAIL: u1,
                ///  Protection Error
                PERR: u1,
                padding: u3,
            }),
            ///  Status B
            STATUSB: mmio.Mmio(packed struct(u8) {
                ///  Protected
                PROT: u1,
                ///  Debugger Present
                DBGPRES: u1,
                ///  Debug Communication Channel 0 Dirty
                DCCD0: u1,
                ///  Debug Communication Channel 1 Dirty
                DCCD1: u1,
                ///  Hot-Plugging Enable
                HPE: u1,
                padding: u3,
            }),
            reserved4: [1]u8,
            ///  Address
            ADDR: mmio.Mmio(packed struct(u32) {
                ///  Access Mode
                AMOD: u2,
                ///  Address
                ADDR: u30,
            }),
            ///  Length
            LENGTH: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  Length
                LENGTH: u30,
            }),
            ///  Data
            DATA: mmio.Mmio(packed struct(u32) {
                ///  Data
                DATA: u32,
            }),
            ///  Debug Communication Channel n
            DCC: mmio.Mmio(packed struct(u32) {
                ///  Data
                DATA: u32,
            }),
            reserved24: [4]u8,
            ///  Device Identification
            DID: mmio.Mmio(packed struct(u32) {
                ///  Device Select
                DEVSEL: u8,
                ///  Revision Number
                REVISION: u4,
                ///  Die Number
                DIE: u4,
                ///  Series
                SERIES: packed union {
                    raw: u6,
                    value: DSU_DID__SERIES,
                },
                reserved23: u1,
                ///  Family
                FAMILY: packed union {
                    raw: u5,
                    value: DSU_DID__FAMILY,
                },
                ///  Processor
                PROCESSOR: packed union {
                    raw: u4,
                    value: DSU_DID__PROCESSOR,
                },
            }),
            reserved240: [212]u8,
            ///  Device Configuration
            DCFG: mmio.Mmio(packed struct(u32) {
                ///  Device Configuration
                DCFG: u32,
            }),
            reserved4096: [3852]u8,
            ///  CoreSight ROM Table Entry 0
            ENTRY0: mmio.Mmio(packed struct(u32) {
                ///  Entry Present
                EPRES: u1,
                ///  Format
                FMT: u1,
                reserved12: u10,
                ///  Address Offset
                ADDOFF: u20,
            }),
            ///  CoreSight ROM Table Entry 1
            ENTRY1: u32,
            ///  CoreSight ROM Table End
            END: mmio.Mmio(packed struct(u32) {
                ///  End Marker
                END: u32,
            }),
            reserved8140: [4032]u8,
            ///  CoreSight ROM Table Memory Type
            MEMTYPE: mmio.Mmio(packed struct(u32) {
                ///  System Memory Present
                SMEMP: u1,
                padding: u31,
            }),
            ///  Peripheral Identification 4
            PID4: mmio.Mmio(packed struct(u32) {
                ///  JEP-106 Continuation Code
                JEPCC: u4,
                ///  4KB count
                FKBC: u4,
                padding: u24,
            }),
            ///  Peripheral Identification 5
            PID5: u32,
            ///  Peripheral Identification 6
            PID6: u32,
            ///  Peripheral Identification 7
            PID7: u32,
            ///  Peripheral Identification 0
            PID0: mmio.Mmio(packed struct(u32) {
                ///  Part Number Low
                PARTNBL: u8,
                padding: u24,
            }),
            ///  Peripheral Identification 1
            PID1: mmio.Mmio(packed struct(u32) {
                ///  Part Number High
                PARTNBH: u4,
                ///  Low part of the JEP-106 Identity Code
                JEPIDCL: u4,
                padding: u24,
            }),
            ///  Peripheral Identification 2
            PID2: mmio.Mmio(packed struct(u32) {
                ///  JEP-106 Identity Code High
                JEPIDCH: u3,
                ///  JEP-106 Identity Code is used
                JEPU: u1,
                ///  Revision Number
                REVISION: u4,
                padding: u24,
            }),
            ///  Peripheral Identification 3
            PID3: mmio.Mmio(packed struct(u32) {
                ///  ARM CUSMOD
                CUSMOD: u4,
                ///  Revision Number
                REVAND: u4,
                padding: u24,
            }),
            ///  Component Identification 0
            CID0: mmio.Mmio(packed struct(u32) {
                ///  Preamble Byte 0
                PREAMBLEB0: u8,
                padding: u24,
            }),
            ///  Component Identification 1
            CID1: mmio.Mmio(packed struct(u32) {
                ///  Preamble
                PREAMBLE: u4,
                ///  Component Class
                CCLASS: u4,
                padding: u24,
            }),
            ///  Component Identification 2
            CID2: mmio.Mmio(packed struct(u32) {
                ///  Preamble Byte 2
                PREAMBLEB2: u8,
                padding: u24,
            }),
            ///  Component Identification 3
            CID3: mmio.Mmio(packed struct(u32) {
                ///  Preamble Byte 3
                PREAMBLEB3: u8,
                padding: u24,
            }),
        };

        ///  External Interrupt Controller
        pub const EIC = extern struct {
            pub const EIC_NMICTRL__NMISENSE = enum(u3) {
                ///  No detection
                NONE = 0x0,
                ///  Rising-edge detection
                RISE = 0x1,
                ///  Falling-edge detection
                FALL = 0x2,
                ///  Both-edges detection
                BOTH = 0x3,
                ///  High-level detection
                HIGH = 0x4,
                ///  Low-level detection
                LOW = 0x5,
                _,
            };

            pub const EIC_CONFIG__SENSE0 = enum(u3) {
                ///  No detection
                NONE = 0x0,
                ///  Rising-edge detection
                RISE = 0x1,
                ///  Falling-edge detection
                FALL = 0x2,
                ///  Both-edges detection
                BOTH = 0x3,
                ///  High-level detection
                HIGH = 0x4,
                ///  Low-level detection
                LOW = 0x5,
                _,
            };

            pub const EIC_CONFIG__SENSE1 = enum(u3) {
                ///  No detection
                NONE = 0x0,
                ///  Rising edge detection
                RISE = 0x1,
                ///  Falling edge detection
                FALL = 0x2,
                ///  Both edges detection
                BOTH = 0x3,
                ///  High level detection
                HIGH = 0x4,
                ///  Low level detection
                LOW = 0x5,
                _,
            };

            pub const EIC_CONFIG__SENSE2 = enum(u3) {
                ///  No detection
                NONE = 0x0,
                ///  Rising edge detection
                RISE = 0x1,
                ///  Falling edge detection
                FALL = 0x2,
                ///  Both edges detection
                BOTH = 0x3,
                ///  High level detection
                HIGH = 0x4,
                ///  Low level detection
                LOW = 0x5,
                _,
            };

            pub const EIC_CONFIG__SENSE3 = enum(u3) {
                ///  No detection
                NONE = 0x0,
                ///  Rising edge detection
                RISE = 0x1,
                ///  Falling edge detection
                FALL = 0x2,
                ///  Both edges detection
                BOTH = 0x3,
                ///  High level detection
                HIGH = 0x4,
                ///  Low level detection
                LOW = 0x5,
                _,
            };

            pub const EIC_CONFIG__SENSE4 = enum(u3) {
                ///  No detection
                NONE = 0x0,
                ///  Rising edge detection
                RISE = 0x1,
                ///  Falling edge detection
                FALL = 0x2,
                ///  Both edges detection
                BOTH = 0x3,
                ///  High level detection
                HIGH = 0x4,
                ///  Low level detection
                LOW = 0x5,
                _,
            };

            pub const EIC_CONFIG__SENSE5 = enum(u3) {
                ///  No detection
                NONE = 0x0,
                ///  Rising edge detection
                RISE = 0x1,
                ///  Falling edge detection
                FALL = 0x2,
                ///  Both edges detection
                BOTH = 0x3,
                ///  High level detection
                HIGH = 0x4,
                ///  Low level detection
                LOW = 0x5,
                _,
            };

            pub const EIC_CONFIG__SENSE6 = enum(u3) {
                ///  No detection
                NONE = 0x0,
                ///  Rising edge detection
                RISE = 0x1,
                ///  Falling edge detection
                FALL = 0x2,
                ///  Both edges detection
                BOTH = 0x3,
                ///  High level detection
                HIGH = 0x4,
                ///  Low level detection
                LOW = 0x5,
                _,
            };

            pub const EIC_CONFIG__SENSE7 = enum(u3) {
                ///  No detection
                NONE = 0x0,
                ///  Rising edge detection
                RISE = 0x1,
                ///  Falling edge detection
                FALL = 0x2,
                ///  Both edges detection
                BOTH = 0x3,
                ///  High level detection
                HIGH = 0x4,
                ///  Low level detection
                LOW = 0x5,
                _,
            };

            ///  Control
            CTRL: mmio.Mmio(packed struct(u8) {
                ///  Software Reset
                SWRST: u1,
                ///  Enable
                ENABLE: u1,
                padding: u6,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                reserved7: u7,
                ///  Synchronization Busy
                SYNCBUSY: u1,
            }),
            ///  Non-Maskable Interrupt Control
            NMICTRL: mmio.Mmio(packed struct(u8) {
                ///  Non-Maskable Interrupt Sense
                NMISENSE: packed union {
                    raw: u3,
                    value: EIC_NMICTRL__NMISENSE,
                },
                ///  Non-Maskable Interrupt Filter Enable
                NMIFILTEN: u1,
                padding: u4,
            }),
            ///  Non-Maskable Interrupt Flag Status and Clear
            NMIFLAG: mmio.Mmio(packed struct(u8) {
                ///  Non-Maskable Interrupt
                NMI: u1,
                padding: u7,
            }),
            ///  Event Control
            EVCTRL: mmio.Mmio(packed struct(u32) {
                ///  External Interrupt 0 Event Output Enable
                EXTINTEO0: u1,
                ///  External Interrupt 1 Event Output Enable
                EXTINTEO1: u1,
                ///  External Interrupt 2 Event Output Enable
                EXTINTEO2: u1,
                ///  External Interrupt 3 Event Output Enable
                EXTINTEO3: u1,
                ///  External Interrupt 4 Event Output Enable
                EXTINTEO4: u1,
                ///  External Interrupt 5 Event Output Enable
                EXTINTEO5: u1,
                ///  External Interrupt 6 Event Output Enable
                EXTINTEO6: u1,
                ///  External Interrupt 7 Event Output Enable
                EXTINTEO7: u1,
                ///  External Interrupt 8 Event Output Enable
                EXTINTEO8: u1,
                ///  External Interrupt 9 Event Output Enable
                EXTINTEO9: u1,
                ///  External Interrupt 10 Event Output Enable
                EXTINTEO10: u1,
                ///  External Interrupt 11 Event Output Enable
                EXTINTEO11: u1,
                ///  External Interrupt 12 Event Output Enable
                EXTINTEO12: u1,
                ///  External Interrupt 13 Event Output Enable
                EXTINTEO13: u1,
                ///  External Interrupt 14 Event Output Enable
                EXTINTEO14: u1,
                ///  External Interrupt 15 Event Output Enable
                EXTINTEO15: u1,
                padding: u16,
            }),
            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u32) {
                ///  External Interrupt 0 Enable
                EXTINT0: u1,
                ///  External Interrupt 1 Enable
                EXTINT1: u1,
                ///  External Interrupt 2 Enable
                EXTINT2: u1,
                ///  External Interrupt 3 Enable
                EXTINT3: u1,
                ///  External Interrupt 4 Enable
                EXTINT4: u1,
                ///  External Interrupt 5 Enable
                EXTINT5: u1,
                ///  External Interrupt 6 Enable
                EXTINT6: u1,
                ///  External Interrupt 7 Enable
                EXTINT7: u1,
                ///  External Interrupt 8 Enable
                EXTINT8: u1,
                ///  External Interrupt 9 Enable
                EXTINT9: u1,
                ///  External Interrupt 10 Enable
                EXTINT10: u1,
                ///  External Interrupt 11 Enable
                EXTINT11: u1,
                ///  External Interrupt 12 Enable
                EXTINT12: u1,
                ///  External Interrupt 13 Enable
                EXTINT13: u1,
                ///  External Interrupt 14 Enable
                EXTINT14: u1,
                ///  External Interrupt 15 Enable
                EXTINT15: u1,
                padding: u16,
            }),
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u32) {
                ///  External Interrupt 0 Enable
                EXTINT0: u1,
                ///  External Interrupt 1 Enable
                EXTINT1: u1,
                ///  External Interrupt 2 Enable
                EXTINT2: u1,
                ///  External Interrupt 3 Enable
                EXTINT3: u1,
                ///  External Interrupt 4 Enable
                EXTINT4: u1,
                ///  External Interrupt 5 Enable
                EXTINT5: u1,
                ///  External Interrupt 6 Enable
                EXTINT6: u1,
                ///  External Interrupt 7 Enable
                EXTINT7: u1,
                ///  External Interrupt 8 Enable
                EXTINT8: u1,
                ///  External Interrupt 9 Enable
                EXTINT9: u1,
                ///  External Interrupt 10 Enable
                EXTINT10: u1,
                ///  External Interrupt 11 Enable
                EXTINT11: u1,
                ///  External Interrupt 12 Enable
                EXTINT12: u1,
                ///  External Interrupt 13 Enable
                EXTINT13: u1,
                ///  External Interrupt 14 Enable
                EXTINT14: u1,
                ///  External Interrupt 15 Enable
                EXTINT15: u1,
                padding: u16,
            }),
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u32) {
                ///  External Interrupt 0
                EXTINT0: u1,
                ///  External Interrupt 1
                EXTINT1: u1,
                ///  External Interrupt 2
                EXTINT2: u1,
                ///  External Interrupt 3
                EXTINT3: u1,
                ///  External Interrupt 4
                EXTINT4: u1,
                ///  External Interrupt 5
                EXTINT5: u1,
                ///  External Interrupt 6
                EXTINT6: u1,
                ///  External Interrupt 7
                EXTINT7: u1,
                ///  External Interrupt 8
                EXTINT8: u1,
                ///  External Interrupt 9
                EXTINT9: u1,
                ///  External Interrupt 10
                EXTINT10: u1,
                ///  External Interrupt 11
                EXTINT11: u1,
                ///  External Interrupt 12
                EXTINT12: u1,
                ///  External Interrupt 13
                EXTINT13: u1,
                ///  External Interrupt 14
                EXTINT14: u1,
                ///  External Interrupt 15
                EXTINT15: u1,
                padding: u16,
            }),
            ///  Wake-Up Enable
            WAKEUP: mmio.Mmio(packed struct(u32) {
                ///  External Interrupt 0 Wake-up Enable
                WAKEUPEN0: u1,
                ///  External Interrupt 1 Wake-up Enable
                WAKEUPEN1: u1,
                ///  External Interrupt 2 Wake-up Enable
                WAKEUPEN2: u1,
                ///  External Interrupt 3 Wake-up Enable
                WAKEUPEN3: u1,
                ///  External Interrupt 4 Wake-up Enable
                WAKEUPEN4: u1,
                ///  External Interrupt 5 Wake-up Enable
                WAKEUPEN5: u1,
                ///  External Interrupt 6 Wake-up Enable
                WAKEUPEN6: u1,
                ///  External Interrupt 7 Wake-up Enable
                WAKEUPEN7: u1,
                ///  External Interrupt 8 Wake-up Enable
                WAKEUPEN8: u1,
                ///  External Interrupt 9 Wake-up Enable
                WAKEUPEN9: u1,
                ///  External Interrupt 10 Wake-up Enable
                WAKEUPEN10: u1,
                ///  External Interrupt 11 Wake-up Enable
                WAKEUPEN11: u1,
                ///  External Interrupt 12 Wake-up Enable
                WAKEUPEN12: u1,
                ///  External Interrupt 13 Wake-up Enable
                WAKEUPEN13: u1,
                ///  External Interrupt 14 Wake-up Enable
                WAKEUPEN14: u1,
                ///  External Interrupt 15 Wake-up Enable
                WAKEUPEN15: u1,
                padding: u16,
            }),
            ///  Configuration n
            CONFIG: mmio.Mmio(packed struct(u32) {
                ///  Input Sense 0 Configuration
                SENSE0: packed union {
                    raw: u3,
                    value: EIC_CONFIG__SENSE0,
                },
                ///  Filter 0 Enable
                FILTEN0: u1,
                ///  Input Sense 1 Configuration
                SENSE1: packed union {
                    raw: u3,
                    value: EIC_CONFIG__SENSE1,
                },
                ///  Filter 1 Enable
                FILTEN1: u1,
                ///  Input Sense 2 Configuration
                SENSE2: packed union {
                    raw: u3,
                    value: EIC_CONFIG__SENSE2,
                },
                ///  Filter 2 Enable
                FILTEN2: u1,
                ///  Input Sense 3 Configuration
                SENSE3: packed union {
                    raw: u3,
                    value: EIC_CONFIG__SENSE3,
                },
                ///  Filter 3 Enable
                FILTEN3: u1,
                ///  Input Sense 4 Configuration
                SENSE4: packed union {
                    raw: u3,
                    value: EIC_CONFIG__SENSE4,
                },
                ///  Filter 4 Enable
                FILTEN4: u1,
                ///  Input Sense 5 Configuration
                SENSE5: packed union {
                    raw: u3,
                    value: EIC_CONFIG__SENSE5,
                },
                ///  Filter 5 Enable
                FILTEN5: u1,
                ///  Input Sense 6 Configuration
                SENSE6: packed union {
                    raw: u3,
                    value: EIC_CONFIG__SENSE6,
                },
                ///  Filter 6 Enable
                FILTEN6: u1,
                ///  Input Sense 7 Configuration
                SENSE7: packed union {
                    raw: u3,
                    value: EIC_CONFIG__SENSE7,
                },
                ///  Filter 7 Enable
                FILTEN7: u1,
            }),
        };

        ///  Event System Interface
        pub const EVSYS = extern struct {
            pub const EVSYS_CHANNEL__EDGSEL = enum(u2) {
                ///  No event output when using the resynchronized or synchronous path
                NO_EVT_OUTPUT = 0x0,
                ///  Event detection only on the rising edge of the signal from the event generator when using the resynchronized or synchronous path
                RISING_EDGE = 0x1,
                ///  Event detection only on the falling edge of the signal from the event generator when using the resynchronized or synchronous path
                FALLING_EDGE = 0x2,
                ///  Event detection on rising and falling edges of the signal from the event generator when using the resynchronized or synchronous path
                BOTH_EDGES = 0x3,
            };

            pub const EVSYS_CHANNEL__PATH = enum(u2) {
                ///  Synchronous path
                SYNCHRONOUS = 0x0,
                ///  Resynchronized path
                RESYNCHRONIZED = 0x1,
                ///  Asynchronous path
                ASYNCHRONOUS = 0x2,
                _,
            };

            ///  Control
            CTRL: mmio.Mmio(packed struct(u8) {
                ///  Software Reset
                SWRST: u1,
                reserved4: u3,
                ///  Generic Clock Requests
                GCLKREQ: u1,
                padding: u3,
            }),
            reserved4: [3]u8,
            ///  Channel
            CHANNEL: mmio.Mmio(packed struct(u32) {
                ///  Channel Selection
                CHANNEL: u3,
                reserved8: u5,
                ///  Software Event
                SWEVT: u1,
                reserved16: u7,
                ///  Event Generator Selection
                EVGEN: u6,
                reserved24: u2,
                ///  Path Selection
                PATH: packed union {
                    raw: u2,
                    value: EVSYS_CHANNEL__PATH,
                },
                ///  Edge Detection Selection
                EDGSEL: packed union {
                    raw: u2,
                    value: EVSYS_CHANNEL__EDGSEL,
                },
                padding: u4,
            }),
            ///  User Multiplexer
            USER: mmio.Mmio(packed struct(u16) {
                ///  User Multiplexer Selection
                USER: u4,
                reserved8: u4,
                ///  Channel Event Selection
                CHANNEL: u4,
                padding: u4,
            }),
            reserved12: [2]u8,
            ///  Channel Status
            CHSTATUS: mmio.Mmio(packed struct(u32) {
                ///  Channel 0 User Ready
                USRRDY0: u1,
                ///  Channel 1 User Ready
                USRRDY1: u1,
                ///  Channel 2 User Ready
                USRRDY2: u1,
                ///  Channel 3 User Ready
                USRRDY3: u1,
                ///  Channel 4 User Ready
                USRRDY4: u1,
                ///  Channel 5 User Ready
                USRRDY5: u1,
                ///  Channel 6 User Ready
                USRRDY6: u1,
                ///  Channel 7 User Ready
                USRRDY7: u1,
                ///  Channel 0 Busy
                CHBUSY0: u1,
                ///  Channel 1 Busy
                CHBUSY1: u1,
                ///  Channel 2 Busy
                CHBUSY2: u1,
                ///  Channel 3 Busy
                CHBUSY3: u1,
                ///  Channel 4 Busy
                CHBUSY4: u1,
                ///  Channel 5 Busy
                CHBUSY5: u1,
                ///  Channel 6 Busy
                CHBUSY6: u1,
                ///  Channel 7 Busy
                CHBUSY7: u1,
                padding: u16,
            }),
            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u32) {
                ///  Channel 0 Overrun Interrupt Enable
                OVR0: u1,
                ///  Channel 1 Overrun Interrupt Enable
                OVR1: u1,
                ///  Channel 2 Overrun Interrupt Enable
                OVR2: u1,
                ///  Channel 3 Overrun Interrupt Enable
                OVR3: u1,
                ///  Channel 4 Overrun Interrupt Enable
                OVR4: u1,
                ///  Channel 5 Overrun Interrupt Enable
                OVR5: u1,
                ///  Channel 6 Overrun Interrupt Enable
                OVR6: u1,
                ///  Channel 7 Overrun Interrupt Enable
                OVR7: u1,
                ///  Channel 0 Event Detection Interrupt Enable
                EVD0: u1,
                ///  Channel 1 Event Detection Interrupt Enable
                EVD1: u1,
                ///  Channel 2 Event Detection Interrupt Enable
                EVD2: u1,
                ///  Channel 3 Event Detection Interrupt Enable
                EVD3: u1,
                ///  Channel 4 Event Detection Interrupt Enable
                EVD4: u1,
                ///  Channel 5 Event Detection Interrupt Enable
                EVD5: u1,
                ///  Channel 6 Event Detection Interrupt Enable
                EVD6: u1,
                ///  Channel 7 Event Detection Interrupt Enable
                EVD7: u1,
                padding: u16,
            }),
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u32) {
                ///  Channel 0 Overrun Interrupt Enable
                OVR0: u1,
                ///  Channel 1 Overrun Interrupt Enable
                OVR1: u1,
                ///  Channel 2 Overrun Interrupt Enable
                OVR2: u1,
                ///  Channel 3 Overrun Interrupt Enable
                OVR3: u1,
                ///  Channel 4 Overrun Interrupt Enable
                OVR4: u1,
                ///  Channel 5 Overrun Interrupt Enable
                OVR5: u1,
                ///  Channel 6 Overrun Interrupt Enable
                OVR6: u1,
                ///  Channel 7 Overrun Interrupt Enable
                OVR7: u1,
                ///  Channel 0 Event Detection Interrupt Enable
                EVD0: u1,
                ///  Channel 1 Event Detection Interrupt Enable
                EVD1: u1,
                ///  Channel 2 Event Detection Interrupt Enable
                EVD2: u1,
                ///  Channel 3 Event Detection Interrupt Enable
                EVD3: u1,
                ///  Channel 4 Event Detection Interrupt Enable
                EVD4: u1,
                ///  Channel 5 Event Detection Interrupt Enable
                EVD5: u1,
                ///  Channel 6 Event Detection Interrupt Enable
                EVD6: u1,
                ///  Channel 7 Event Detection Interrupt Enable
                EVD7: u1,
                padding: u16,
            }),
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u32) {
                ///  Channel 0 Overrun
                OVR0: u1,
                ///  Channel 1 Overrun
                OVR1: u1,
                ///  Channel 2 Overrun
                OVR2: u1,
                ///  Channel 3 Overrun
                OVR3: u1,
                ///  Channel 4 Overrun
                OVR4: u1,
                ///  Channel 5 Overrun
                OVR5: u1,
                ///  Channel 6 Overrun
                OVR6: u1,
                ///  Channel 7 Overrun
                OVR7: u1,
                ///  Channel 0 Event Detection
                EVD0: u1,
                ///  Channel 1 Event Detection
                EVD1: u1,
                ///  Channel 2 Event Detection
                EVD2: u1,
                ///  Channel 3 Event Detection
                EVD3: u1,
                ///  Channel 4 Event Detection
                EVD4: u1,
                ///  Channel 5 Event Detection
                EVD5: u1,
                ///  Channel 6 Event Detection
                EVD6: u1,
                ///  Channel 7 Event Detection
                EVD7: u1,
                padding: u16,
            }),
        };

        ///  Generic Clock Generator
        pub const GCLK = extern struct {
            pub const GCLK_CLKCTRL__GEN = enum(u4) {
                ///  Generic clock generator 0
                GCLK0 = 0x0,
                ///  Generic clock generator 1
                GCLK1 = 0x1,
                ///  Generic clock generator 2
                GCLK2 = 0x2,
                ///  Generic clock generator 3
                GCLK3 = 0x3,
                ///  Generic clock generator 4
                GCLK4 = 0x4,
                ///  Generic clock generator 5
                GCLK5 = 0x5,
                ///  Generic clock generator 6
                GCLK6 = 0x6,
                ///  Generic clock generator 7
                GCLK7 = 0x7,
                _,
            };

            pub const GCLK_CLKCTRL__ID = enum(u6) {
                ///  DFLL48M Reference
                DFLL48M = 0x0,
                ///  WDT
                WDT = 0x1,
                ///  RTC
                RTC = 0x2,
                ///  EIC
                EIC = 0x3,
                ///  EVSYS_CHANNEL_0
                EVSYS_CHANNEL_0 = 0x4,
                ///  EVSYS_CHANNEL_1
                EVSYS_CHANNEL_1 = 0x5,
                ///  EVSYS_CHANNEL_2
                EVSYS_CHANNEL_2 = 0x6,
                ///  EVSYS_CHANNEL_3
                EVSYS_CHANNEL_3 = 0x7,
                ///  EVSYS_CHANNEL_4
                EVSYS_CHANNEL_4 = 0x8,
                ///  EVSYS_CHANNEL_5
                EVSYS_CHANNEL_5 = 0x9,
                ///  EVSYS_CHANNEL_6
                EVSYS_CHANNEL_6 = 0xa,
                ///  EVSYS_CHANNEL_7
                EVSYS_CHANNEL_7 = 0xb,
                ///  SERCOMx_SLOW
                SERCOMX_SLOW = 0xc,
                ///  SERCOM0_CORE
                SERCOM0_CORE = 0xd,
                ///  SERCOM1_CORE
                SERCOM1_CORE = 0xe,
                ///  SERCOM2_CORE
                SERCOM2_CORE = 0xf,
                ///  SERCOM3_CORE
                SERCOM3_CORE = 0x10,
                ///  SERCOM4_CORE
                SERCOM4_CORE = 0x11,
                ///  SERCOM5_CORE
                SERCOM5_CORE = 0x12,
                ///  TC0,TC1
                TC0_TC1 = 0x13,
                ///  TC2,TC3
                TC2_TC3 = 0x14,
                ///  TC4,TC5
                TC4_TC5 = 0x15,
                ///  TC6,TC7
                TC6_TC7 = 0x16,
                ///  ADC
                ADC = 0x17,
                ///  AC_DIG
                AC_DIG = 0x18,
                ///  AC_ANA
                AC_ANA = 0x19,
                ///  DAC
                DAC = 0x1a,
                _,
            };

            pub const GCLK_GENCTRL__ID = enum(u4) {
                ///  Generic clock generator 0
                GCLK0 = 0x0,
                ///  Generic clock generator 1
                GCLK1 = 0x1,
                ///  Generic clock generator 2
                GCLK2 = 0x2,
                ///  Generic clock generator 3
                GCLK3 = 0x3,
                ///  Generic clock generator 4
                GCLK4 = 0x4,
                ///  Generic clock generator 5
                GCLK5 = 0x5,
                ///  Generic clock generator 6
                GCLK6 = 0x6,
                ///  Generic clock generator 7
                GCLK7 = 0x7,
                _,
            };

            pub const GCLK_GENCTRL__SRC = enum(u5) {
                ///  XOSC oscillator output
                XOSC = 0x0,
                ///  Generator input pad
                GCLKIN = 0x1,
                ///  Generic clock generator 1 output
                GCLKGEN1 = 0x2,
                ///  OSCULP32K oscillator output
                OSCULP32K = 0x3,
                ///  OSC32K oscillator output
                OSC32K = 0x4,
                ///  XOSC32K oscillator output
                XOSC32K = 0x5,
                ///  OSC8M oscillator output
                OSC8M = 0x6,
                ///  DFLL48M output
                DFLL48M = 0x7,
                _,
            };

            pub const GCLK_GENDIV__ID = enum(u4) {
                ///  Generic clock generator 0
                GCLK0 = 0x0,
                ///  Generic clock generator 1
                GCLK1 = 0x1,
                ///  Generic clock generator 2
                GCLK2 = 0x2,
                ///  Generic clock generator 3
                GCLK3 = 0x3,
                ///  Generic clock generator 4
                GCLK4 = 0x4,
                ///  Generic clock generator 5
                GCLK5 = 0x5,
                ///  Generic clock generator 6
                GCLK6 = 0x6,
                ///  Generic clock generator 7
                GCLK7 = 0x7,
                _,
            };

            pub const GCLK_GENCTRL__DIVSEL = enum(u1) {
                ///  Divide input directly by divider factor
                DIV1 = 0x0,
                ///  Divide input by 2^(divider factor+ 1)
                DIV2 = 0x1,
            };

            ///  Control
            CTRL: mmio.Mmio(packed struct(u8) {
                ///  Software Reset
                SWRST: u1,
                padding: u7,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                reserved7: u7,
                ///  Synchronization Busy Status
                SYNCBUSY: u1,
            }),
            ///  Generic Clock Control
            CLKCTRL: mmio.Mmio(packed struct(u16) {
                ///  Generic Clock Selection ID
                ID: packed union {
                    raw: u6,
                    value: GCLK_CLKCTRL__ID,
                },
                reserved8: u2,
                ///  Generic Clock Generator
                GEN: packed union {
                    raw: u4,
                    value: GCLK_CLKCTRL__GEN,
                },
                reserved14: u2,
                ///  Clock Enable
                CLKEN: u1,
                ///  Write Lock
                WRTLOCK: u1,
            }),
            ///  Generic Clock Generator Control
            GENCTRL: mmio.Mmio(packed struct(u32) {
                ///  Generic Clock Generator Selection
                ID: packed union {
                    raw: u4,
                    value: GCLK_GENCTRL__ID,
                },
                reserved8: u4,
                ///  Source Select
                SRC: packed union {
                    raw: u5,
                    value: GCLK_GENCTRL__SRC,
                },
                reserved16: u3,
                ///  Generic Clock Generator Enable
                GENEN: u1,
                ///  Improve Duty Cycle
                IDC: u1,
                ///  Output Off Value
                OOV: u1,
                ///  Output Enable
                OE: u1,
                ///  Divide Selection
                DIVSEL: packed union {
                    raw: u1,
                    value: GCLK_GENCTRL__DIVSEL,
                },
                ///  Run in Standby
                RUNSTDBY: u1,
                padding: u10,
            }),
            ///  Generic Clock Generator Division
            GENDIV: mmio.Mmio(packed struct(u32) {
                ///  Generic Clock Generator Selection
                ID: packed union {
                    raw: u4,
                    value: GCLK_GENDIV__ID,
                },
                reserved8: u4,
                ///  Division Factor
                DIV: u16,
                padding: u8,
            }),
        };

        ///  Non-Volatile Memory Controller
        pub const NVMCTRL = extern struct {
            pub const NVMCTRL_CTRLA__CMD = enum(u7) {
                ///  Erase Row - Erases the row addressed by the ADDR register.
                ER = 0x2,
                ///  Write Page - Writes the contents of the page buffer to the page addressed by the ADDR register.
                WP = 0x4,
                ///  Erase Auxiliary Row - Erases the auxiliary row addressed by the ADDR register. This command can be given only when the security bit is not set and only to the user configuration row.
                EAR = 0x5,
                ///  Write Auxiliary Page - Writes the contents of the page buffer to the page addressed by the ADDR register. This command can be given only when the security bit is not set and only to the user configuration row.
                WAP = 0x6,
                ///  Security Flow Command
                SF = 0xa,
                ///  Write lockbits
                WL = 0xf,
                ///  Lock Region - Locks the region containing the address location in the ADDR register.
                LR = 0x40,
                ///  Unlock Region - Unlocks the region containing the address location in the ADDR register.
                UR = 0x41,
                ///  Sets the power reduction mode.
                SPRM = 0x42,
                ///  Clears the power reduction mode.
                CPRM = 0x43,
                ///  Page Buffer Clear - Clears the page buffer.
                PBC = 0x44,
                ///  Set Security Bit - Sets the security bit by writing 0x00 to the first byte in the lockbit row.
                SSB = 0x45,
                ///  Invalidate all cache lines.
                INVALL = 0x46,
                _,
            };

            pub const NVMCTRL_CTRLA__CMDEX = enum(u8) {
                ///  Execution Key
                KEY = 0xa5,
                _,
            };

            pub const NVMCTRL_CTRLB__READMODE = enum(u2) {
                ///  The NVM Controller (cache system) does not insert wait states on a cache miss. Gives the best system performance.
                NO_MISS_PENALTY = 0x0,
                ///  Reduces power consumption of the cache system, but inserts a wait state each time there is a cache miss. This mode may not be relevant if CPU performance is required, as the application will be stalled and may lead to increase run time.
                LOW_POWER = 0x1,
                ///  The cache system ensures that a cache hit or miss takes the same amount of time, determined by the number of programmed flash wait states. This mode can be used for real-time applications that require deterministic execution timings.
                DETERMINISTIC = 0x2,
                _,
            };

            pub const NVMCTRL_CTRLB__RWS = enum(u4) {
                ///  Single Auto Wait State
                SINGLE = 0x0,
                ///  Half Auto Wait State
                HALF = 0x1,
                ///  Dual Auto Wait State
                DUAL = 0x2,
                _,
            };

            pub const NVMCTRL_CTRLB__SLEEPPRM = enum(u2) {
                ///  NVM block enters low-power mode when entering sleep.NVM block exits low-power mode upon first access.
                WAKEONACCESS = 0x0,
                ///  NVM block enters low-power mode when entering sleep.NVM block exits low-power mode when exiting sleep.
                WAKEUPINSTANT = 0x1,
                ///  Auto power reduction disabled.
                DISABLED = 0x3,
                _,
            };

            pub const NVMCTRL_PARAM__PSZ = enum(u3) {
                ///  8 bytes
                @"8" = 0x0,
                ///  16 bytes
                @"16" = 0x1,
                ///  32 bytes
                @"32" = 0x2,
                ///  64 bytes
                @"64" = 0x3,
                ///  128 bytes
                @"128" = 0x4,
                ///  256 bytes
                @"256" = 0x5,
                ///  512 bytes
                @"512" = 0x6,
                ///  1024 bytes
                @"1024" = 0x7,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u16) {
                ///  Command
                CMD: packed union {
                    raw: u7,
                    value: NVMCTRL_CTRLA__CMD,
                },
                reserved8: u1,
                ///  Command Execution
                CMDEX: packed union {
                    raw: u8,
                    value: NVMCTRL_CTRLA__CMDEX,
                },
            }),
            reserved4: [2]u8,
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  NVM Read Wait States
                RWS: packed union {
                    raw: u4,
                    value: NVMCTRL_CTRLB__RWS,
                },
                reserved7: u2,
                ///  Manual Write
                MANW: u1,
                ///  Power Reduction Mode during Sleep
                SLEEPPRM: packed union {
                    raw: u2,
                    value: NVMCTRL_CTRLB__SLEEPPRM,
                },
                reserved16: u6,
                ///  NVMCTRL Read Mode
                READMODE: packed union {
                    raw: u2,
                    value: NVMCTRL_CTRLB__READMODE,
                },
                ///  Cache Disable
                CACHEDIS: u1,
                padding: u13,
            }),
            ///  NVM Parameter
            PARAM: mmio.Mmio(packed struct(u32) {
                ///  NVM Pages
                NVMP: u16,
                ///  Page Size
                PSZ: packed union {
                    raw: u3,
                    value: NVMCTRL_PARAM__PSZ,
                },
                padding: u13,
            }),
            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u8) {
                ///  NVM Ready Interrupt Enable
                READY: u1,
                ///  Error Interrupt Enable
                ERROR: u1,
                padding: u6,
            }),
            reserved16: [3]u8,
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u8) {
                ///  NVM Ready Interrupt Enable
                READY: u1,
                ///  Error Interrupt Enable
                ERROR: u1,
                padding: u6,
            }),
            reserved20: [3]u8,
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u8) {
                ///  NVM Ready
                READY: u1,
                ///  Error
                ERROR: u1,
                padding: u6,
            }),
            reserved24: [3]u8,
            ///  Status
            STATUS: mmio.Mmio(packed struct(u16) {
                ///  Power Reduction Mode
                PRM: u1,
                ///  NVM Page Buffer Active Loading
                LOAD: u1,
                ///  Programming Error Status
                PROGE: u1,
                ///  Lock Error Status
                LOCKE: u1,
                ///  NVM Error
                NVME: u1,
                reserved8: u3,
                ///  Security Bit Status
                SB: u1,
                padding: u7,
            }),
            reserved28: [2]u8,
            ///  Address
            ADDR: mmio.Mmio(packed struct(u32) {
                ///  NVM Address
                ADDR: u22,
                padding: u10,
            }),
            ///  Lock Section
            LOCK: mmio.Mmio(packed struct(u16) {
                ///  Region Lock Bits
                LOCK: u16,
            }),
        };

        ///  Non-Volatile Fuses
        pub const FUSES = struct {
            pub const USER_FUSES_NVMCTRL__BOOTPROT = enum(u3) {
                ///  0 Bytes
                SIZE_0BYTES = 0x7,
                ///  512 Bytes
                SIZE_512BYTES = 0x6,
                ///  1024 Bytes
                SIZE_1024BYTES = 0x5,
                ///  2048 Bytes
                SIZE_2048BYTES = 0x4,
                ///  4096 Bytes
                SIZE_4096BYTES = 0x3,
                ///  8192 Bytes
                SIZE_8192BYTES = 0x2,
                ///  16384 Bytes
                SIZE_16384BYTES = 0x1,
                ///  32768 Bytes
                SIZE_32768BYTES = 0x0,
            };

            pub const USER_FUSES_NVMCTRL__EEPROM_SIZE = enum(u3) {
                ///  0 Bytes
                SIZE_0BYTES = 0x7,
                ///  256 Bytes
                SIZE_256BYTES = 0x6,
                ///  512 Bytes
                SIZE_512BYTES = 0x5,
                ///  1024 Bytes
                SIZE_1024BYTES = 0x4,
                ///  2048 Bytes
                SIZE_2048BYTES = 0x3,
                ///  4096 Bytes
                SIZE_4096BYTES = 0x2,
                ///  8192 Bytes
                SIZE_8192BYTES = 0x1,
                ///  16384 Bytes
                SIZE_16384BYTES = 0x0,
            };

            pub const SUPC_BOD33__ENABLE = enum(u1) {
                ///  BOD33 is disabled
                DISABLED = 0x0,
                ///  BOD33 is enabled
                ENABLED = 0x1,
            };

            pub const SUPC_BOD33__ACTION = enum(u2) {
                ///  No action
                NONE = 0x0,
                ///  The BOD33 generates a reset
                RESET = 0x1,
                ///  The BOD33 generates an interrupt
                INT = 0x2,
                _,
            };

            pub const WDT__ENABLE = enum(u1) {
                ///  WDT is disabled
                DISABLED = 0x0,
                ///  WDT is enabled
                ENABLED = 0x1,
            };

            pub const WDT__ALWAYSON = enum(u1) {
                ///  WDT is enabled and disabled through ENABLE bit
                DISABLED = 0x0,
                ///  WDT is enabled and can only be disabled by a power-on reset
                ENABLED = 0x1,
            };

            pub const WDT_CONFIG__PER = enum(u4) {
                ///  8 clock cycles
                CYC8 = 0x0,
                ///  16 clock cycles
                CYC16 = 0x1,
                ///  32 clock cycles
                CYC32 = 0x2,
                ///  64 clock cycles
                CYC64 = 0x3,
                ///  128 clock cycles
                CYC128 = 0x4,
                ///  256 clock cycles
                CYC256 = 0x5,
                ///  512 clock cycles
                CYC512 = 0x6,
                ///  1024 clock cycles
                CYC1024 = 0x7,
                ///  2048 clock cycles
                CYC2048 = 0x8,
                ///  4096 clock cycles
                CYC4096 = 0x9,
                ///  8192 clock cycles
                CYC8192 = 0xa,
                ///  16384 clock cycles
                CYC16384 = 0xb,
                _,
            };

            pub const WDT_EWCTRL__EWOFFSET = enum(u4) {
                ///  8 clock cycles
                CYC8 = 0x0,
                ///  16 clock cycles
                CYC16 = 0x1,
                ///  32 clock cycles
                CYC32 = 0x2,
                ///  64 clock cycles
                CYC64 = 0x3,
                ///  128 clock cycles
                CYC128 = 0x4,
                ///  256 clock cycles
                CYC256 = 0x5,
                ///  512 clock cycles
                CYC512 = 0x6,
                ///  1024 clock cycles
                CYC1024 = 0x7,
                ///  2048 clock cycles
                CYC2048 = 0x8,
                ///  4096 clock cycles
                CYC4096 = 0x9,
                ///  8192 clock cycles
                CYC8192 = 0xa,
                ///  16384 clock cycles
                CYC16384 = 0xb,
                _,
            };

            pub const WDT__WEN = enum(u1) {
                ///  WDT is disabled
                DISABLED = 0x0,
                ///  WDT is enabled
                ENABLED = 0x1,
            };

            pub const SUPC_BOD33__HYST = enum(u1) {
                ///  No Hysteresis
                DISABLED = 0x0,
                ///  Hysteresis Enabled
                ENABLED = 0x1,
            };

            pub const OTP4_FUSES = extern struct {
                ///  OTP4 Page Word 0
                OTP4_WORD_0: mmio.Mmio(packed struct(u32) {
                    reserved27: u27,
                    ///  ADC Linearity bits 4:0
                    ADC_LINEARITY_0: u5,
                }),
                ///  OTP4 Page Word 1
                OTP4_WORD_1: mmio.Mmio(packed struct(u32) {
                    ///  ADC Linearity bits 7:5
                    ADC_LINEARITY_1: u3,
                    ///  ADC Bias Calibration
                    ADC_BIASCAL: u3,
                    ///  OSC32K Calibration
                    OSC32KCAL: u7,
                    reserved26: u13,
                    ///  DFLL48M Coarse Calibration
                    DFLL48M_COARSE_CAL: u6,
                }),
                ///  OTP4 Page Word 2
                OTP4_WORD_2: mmio.Mmio(packed struct(u32) {
                    ///  DFLL48M Fine Calibration
                    DFLL48M_FINE_CAL: u10,
                    padding: u22,
                }),
            };

            pub const TEMP_LOG_FUSES = extern struct {
                ///  TEMP_LOG Page Word 0
                TEMP_LOG_WORD_0: mmio.Mmio(packed struct(u32) {
                    ///  Integer part of room temperature in oC
                    NVMCTRL_ROOM_TEMP_VAL_INT: u8,
                    ///  Decimal part of room temperature
                    NVMCTRL_ROOM_TEMP_VAL_DEC: u4,
                    ///  Integer part of hot temperature in oC
                    NVMCTRL_HOT_TEMP_VAL_INT: u8,
                    ///  Decimal part of hot temperature
                    NVMCTRL_HOT_TEMP_VAL_DEC: u4,
                    ///  2's complement of the internal 1V reference drift at room temperature (versus a 1.0 centered value)
                    NVMCTRL_ROOM_INT1V_VAL: u8,
                }),
                ///  TEMP_LOG Page Word 1
                TEMP_LOG_WORD_1: mmio.Mmio(packed struct(u32) {
                    ///  2's complement of the internal 1V reference drift at hot temperature (versus a 1.0 centered value)
                    NVMCTRL_HOT_INT1V_VAL: u8,
                    ///  12-bit ADC conversion at room temperature
                    NVMCTRL_ROOM_ADC_VAL: u12,
                    ///  12-bit ADC conversion at hot temperature
                    NVMCTRL_HOT_ADC_VAL: u12,
                }),
            };

            pub const USER_FUSES = extern struct {
                ///  USER Page Word 0
                USER_WORD_0: mmio.Mmio(packed struct(u32) {
                    ///  Bootloader Size
                    NVMCTRL_BOOTPROT: packed union {
                        raw: u3,
                        value: USER_FUSES_NVMCTRL__BOOTPROT,
                    },
                    reserved4: u1,
                    ///  EEPROM Size
                    NVMCTRL_EEPROM_SIZE: packed union {
                        raw: u3,
                        value: USER_FUSES_NVMCTRL__EEPROM_SIZE,
                    },
                    reserved8: u1,
                    ///  BOD33 User Level
                    BOD33USERLEVEL: u6,
                    ///  BOD33 Enable
                    BOD33_EN: packed union {
                        raw: u1,
                        value: SUPC_BOD33__ENABLE,
                    },
                    ///  BOD33 Action
                    BOD33_ACTION: packed union {
                        raw: u2,
                        value: SUPC_BOD33__ACTION,
                    },
                    reserved25: u8,
                    ///  WDT Enable
                    WDT_ENABLE: packed union {
                        raw: u1,
                        value: WDT__ENABLE,
                    },
                    ///  WDT Always On
                    WDT_ALWAYSON: packed union {
                        raw: u1,
                        value: WDT__ALWAYSON,
                    },
                    ///  WDT Period
                    WDT_PER: packed union {
                        raw: u4,
                        value: WDT_CONFIG__PER,
                    },
                    ///  WDT Window bit 0
                    WDT_WINDOW_0: u1,
                }),
                ///  USER Page Word 1
                USER_WORD_1: mmio.Mmio(packed struct(u32) {
                    ///  WDT Window bits 3:1
                    WDT_WINDOW_1: u3,
                    ///  WDT Early Warning Offset
                    WDT_EWOFFSET: packed union {
                        raw: u4,
                        value: WDT_EWCTRL__EWOFFSET,
                    },
                    ///  WDT Window Mode Enable
                    WDT_WEN: packed union {
                        raw: u1,
                        value: WDT__WEN,
                    },
                    ///  BOD33 Hysteresis
                    BOD33_HYST: packed union {
                        raw: u1,
                        value: SUPC_BOD33__HYST,
                    },
                    reserved16: u7,
                    ///  NVM Region Locks
                    NVMCTRL_REGION_LOCKS: u16,
                }),
            };
        };

        ///  Peripheral Access Controller
        pub const PAC = extern struct {
            ///  Write Protection Clear
            WPCLR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Write Protection Clear
                WP: u31,
            }),
            ///  Write Protection Set
            WPSET: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Write Protection Set
                WP: u31,
            }),
        };

        ///  Power Manager
        pub const PM = extern struct {
            pub const PM_SLEEP__IDLE = enum(u2) {
                ///  The CPU clock domain is stopped
                CPU = 0x0,
                ///  The CPU and AHB clock domains are stopped
                AHB = 0x1,
                ///  The CPU, AHB and APB clock domains are stopped
                APB = 0x2,
                _,
            };

            pub const PM_CPUSEL__CPUDIV = enum(u3) {
                ///  Divide by 1
                DIV1 = 0x0,
                ///  Divide by 2
                DIV2 = 0x1,
                ///  Divide by 4
                DIV4 = 0x2,
                ///  Divide by 8
                DIV8 = 0x3,
                ///  Divide by 16
                DIV16 = 0x4,
                ///  Divide by 32
                DIV32 = 0x5,
                ///  Divide by 64
                DIV64 = 0x6,
                ///  Divide by 128
                DIV128 = 0x7,
            };

            pub const PM_APBASEL__APBADIV = enum(u3) {
                ///  Divide by 1
                DIV1 = 0x0,
                ///  Divide by 2
                DIV2 = 0x1,
                ///  Divide by 4
                DIV4 = 0x2,
                ///  Divide by 8
                DIV8 = 0x3,
                ///  Divide by 16
                DIV16 = 0x4,
                ///  Divide by 32
                DIV32 = 0x5,
                ///  Divide by 64
                DIV64 = 0x6,
                ///  Divide by 128
                DIV128 = 0x7,
            };

            pub const PM_APBBSEL__APBBDIV = enum(u3) {
                ///  Divide by 1
                DIV1 = 0x0,
                ///  Divide by 2
                DIV2 = 0x1,
                ///  Divide by 4
                DIV4 = 0x2,
                ///  Divide by 8
                DIV8 = 0x3,
                ///  Divide by 16
                DIV16 = 0x4,
                ///  Divide by 32
                DIV32 = 0x5,
                ///  Divide by 64
                DIV64 = 0x6,
                ///  Divide by 128
                DIV128 = 0x7,
            };

            pub const PM_APBCSEL__APBCDIV = enum(u3) {
                ///  Divide by 1
                DIV1 = 0x0,
                ///  Divide by 2
                DIV2 = 0x1,
                ///  Divide by 4
                DIV4 = 0x2,
                ///  Divide by 8
                DIV8 = 0x3,
                ///  Divide by 16
                DIV16 = 0x4,
                ///  Divide by 32
                DIV32 = 0x5,
                ///  Divide by 64
                DIV64 = 0x6,
                ///  Divide by 128
                DIV128 = 0x7,
            };

            ///  Control
            CTRL: u8,
            ///  Sleep Mode
            SLEEP: mmio.Mmio(packed struct(u8) {
                ///  Idle Mode Configuration
                IDLE: packed union {
                    raw: u2,
                    value: PM_SLEEP__IDLE,
                },
                padding: u6,
            }),
            reserved8: [6]u8,
            ///  CPU Clock Select
            CPUSEL: mmio.Mmio(packed struct(u8) {
                ///  CPU Prescaler Selection
                CPUDIV: packed union {
                    raw: u3,
                    value: PM_CPUSEL__CPUDIV,
                },
                padding: u5,
            }),
            ///  APBA Clock Select
            APBASEL: mmio.Mmio(packed struct(u8) {
                ///  APBA Prescaler Selection
                APBADIV: packed union {
                    raw: u3,
                    value: PM_APBASEL__APBADIV,
                },
                padding: u5,
            }),
            ///  APBB Clock Select
            APBBSEL: mmio.Mmio(packed struct(u8) {
                ///  APBB Prescaler Selection
                APBBDIV: packed union {
                    raw: u3,
                    value: PM_APBBSEL__APBBDIV,
                },
                padding: u5,
            }),
            ///  APBC Clock Select
            APBCSEL: mmio.Mmio(packed struct(u8) {
                ///  APBC Prescaler Selection
                APBCDIV: packed union {
                    raw: u3,
                    value: PM_APBCSEL__APBCDIV,
                },
                padding: u5,
            }),
            reserved20: [8]u8,
            ///  AHB Mask
            AHBMASK: mmio.Mmio(packed struct(u32) {
                ///  HPB0 AHB Clock Mask
                HPB0_: u1,
                ///  HPB1 AHB Clock Mask
                HPB1_: u1,
                ///  HPB2 AHB Clock Mask
                HPB2_: u1,
                ///  DSU AHB Clock Mask
                DSU_: u1,
                ///  NVMCTRL AHB Clock Mask
                NVMCTRL_: u1,
                padding: u27,
            }),
            ///  APBA Mask
            APBAMASK: mmio.Mmio(packed struct(u32) {
                ///  PAC0 APB Clock Enable
                PAC0_: u1,
                ///  PM APB Clock Enable
                PM_: u1,
                ///  SYSCTRL APB Clock Enable
                SYSCTRL_: u1,
                ///  GCLK APB Clock Enable
                GCLK_: u1,
                ///  WDT APB Clock Enable
                WDT_: u1,
                ///  RTC APB Clock Enable
                RTC_: u1,
                ///  EIC APB Clock Enable
                EIC_: u1,
                padding: u25,
            }),
            ///  APBB Mask
            APBBMASK: mmio.Mmio(packed struct(u32) {
                ///  PAC1 APB Clock Enable
                PAC1_: u1,
                ///  DSU APB Clock Enable
                DSU_: u1,
                ///  NVMCTRL APB Clock Enable
                NVMCTRL_: u1,
                ///  PORT APB Clock Enable
                PORT_: u1,
                padding: u28,
            }),
            ///  APBC Mask
            APBCMASK: mmio.Mmio(packed struct(u32) {
                ///  PAC2 APB Clock Enable
                PAC2_: u1,
                ///  EVSYS APB Clock Enable
                EVSYS_: u1,
                ///  SERCOM0 APB Clock Enable
                SERCOM0_: u1,
                ///  SERCOM1 APB Clock Enable
                SERCOM1_: u1,
                ///  SERCOM2 APB Clock Enable
                SERCOM2_: u1,
                ///  SERCOM3 APB Clock Enable
                SERCOM3_: u1,
                reserved8: u2,
                ///  TC0 APB Clock Enable
                TC0_: u1,
                ///  TC1 APB Clock Enable
                TC1_: u1,
                ///  TC2 APB Clock Enable
                TC2_: u1,
                ///  TC3 APB Clock Enable
                TC3_: u1,
                ///  TC4 APB Clock Enable
                TC4_: u1,
                ///  TC5 APB Clock Enable
                TC5_: u1,
                reserved16: u2,
                ///  ADC APB Clock Enable
                ADC_: u1,
                ///  AC APB Clock Enable
                AC_: u1,
                ///  DAC APB Clock Enable
                DAC_: u1,
                ///  PTC APB Clock Enable
                PTC_: u1,
                padding: u12,
            }),
            reserved52: [16]u8,
            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u8) {
                ///  Clock Ready Interrupt Enable
                CKRDY: u1,
                padding: u7,
            }),
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u8) {
                ///  Clock Ready Interrupt Enable
                CKRDY: u1,
                padding: u7,
            }),
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u8) {
                ///  Clock Ready
                CKRDY: u1,
                padding: u7,
            }),
            reserved56: [1]u8,
            ///  Reset Cause
            RCAUSE: mmio.Mmio(packed struct(u8) {
                ///  Power On Reset
                POR: u1,
                ///  Brown Out 12 Detector Reset
                BOD12: u1,
                ///  Brown Out 33 Detector Reset
                BOD33: u1,
                reserved4: u1,
                ///  External Reset
                EXT: u1,
                ///  Watchdog Reset
                WDT: u1,
                ///  System Reset Request
                SYST: u1,
                padding: u1,
            }),
        };

        ///  Port Module
        pub const PORT = struct {
            pub const PORT_PMUX__PMUXE = enum(u4) {
                ///  Peripheral function A selected
                A = 0x0,
                ///  Peripheral function B selected
                B = 0x1,
                ///  Peripheral function C selected
                C = 0x2,
                ///  Peripheral function D selected
                D = 0x3,
                ///  Peripheral function E selected
                E = 0x4,
                ///  Peripheral function F selected
                F = 0x5,
                ///  Peripheral function G selected
                G = 0x6,
                ///  Peripheral function H selected
                H = 0x7,
                _,
            };

            pub const PORT_PMUX__PMUXO = enum(u4) {
                ///  Peripheral function A selected
                A = 0x0,
                ///  Peripheral function B selected
                B = 0x1,
                ///  Peripheral function C selected
                C = 0x2,
                ///  Peripheral function D selected
                D = 0x3,
                ///  Peripheral function E selected
                E = 0x4,
                ///  Peripheral function F selected
                F = 0x5,
                ///  Peripheral function G selected
                G = 0x6,
                ///  Peripheral function H selected
                H = 0x7,
                _,
            };

            pub const GROUP = extern struct {
                ///  Data Direction
                DIR: mmio.Mmio(packed struct(u32) {
                    ///  Port Data Direction
                    DIR: u32,
                }),
                ///  Data Direction Clear
                DIRCLR: mmio.Mmio(packed struct(u32) {
                    ///  Port Data Direction Clear
                    DIRCLR: u32,
                }),
                ///  Data Direction Set
                DIRSET: mmio.Mmio(packed struct(u32) {
                    ///  Port Data Direction Set
                    DIRSET: u32,
                }),
                ///  Data Direction Toggle
                DIRTGL: mmio.Mmio(packed struct(u32) {
                    ///  Port Data Direction Toggle
                    DIRTGL: u32,
                }),
                ///  Data Output Value
                OUT: mmio.Mmio(packed struct(u32) {
                    ///  Port Data Output Value
                    OUT: u32,
                }),
                ///  Data Output Value Clear
                OUTCLR: mmio.Mmio(packed struct(u32) {
                    ///  Port Data Output Value Clear
                    OUTCLR: u32,
                }),
                ///  Data Output Value Set
                OUTSET: mmio.Mmio(packed struct(u32) {
                    ///  Port Data Output Value Set
                    OUTSET: u32,
                }),
                ///  Data Output Value Toggle
                OUTTGL: mmio.Mmio(packed struct(u32) {
                    ///  Port Data Output Value Toggle
                    OUTTGL: u32,
                }),
                ///  Data Input Value
                IN: mmio.Mmio(packed struct(u32) {
                    ///  Port Data Input Value
                    IN: u32,
                }),
                ///  Control
                CTRL: mmio.Mmio(packed struct(u32) {
                    ///  Input Sampling Mode
                    SAMPLING: u32,
                }),
                ///  Write Configuration
                WRCONFIG: mmio.Mmio(packed struct(u32) {
                    ///  Pin Mask for Multiple Pin Configuration
                    PINMASK: u16,
                    ///  Peripheral Multiplexer Enable
                    PMUXEN: u1,
                    ///  Input Enable
                    INEN: u1,
                    ///  Pull Enable
                    PULLEN: u1,
                    reserved22: u3,
                    ///  Output Driver Strength Selection
                    DRVSTR: u1,
                    reserved24: u1,
                    ///  Peripheral Multiplexing
                    PMUX: u4,
                    ///  Write PMUX
                    WRPMUX: u1,
                    reserved30: u1,
                    ///  Write PINCFG
                    WRPINCFG: u1,
                    ///  Half-Word Select
                    HWSEL: u1,
                }),
                reserved48: [4]u8,
                ///  Peripheral Multiplexing n
                PMUX: [16]mmio.Mmio(packed struct(u8) {
                    ///  Peripheral Multiplexing Even
                    PMUXE: packed union {
                        raw: u4,
                        value: PORT_PMUX__PMUXE,
                    },
                    ///  Peripheral Multiplexing Odd
                    PMUXO: packed union {
                        raw: u4,
                        value: PORT_PMUX__PMUXO,
                    },
                }),
                ///  Pin Configuration n
                PINCFG: [32]mmio.Mmio(packed struct(u8) {
                    ///  Peripheral Multiplexer Enable
                    PMUXEN: u1,
                    ///  Input Enable
                    INEN: u1,
                    ///  Pull Enable
                    PULLEN: u1,
                    reserved6: u3,
                    ///  Output Driver Strength Selection
                    DRVSTR: u1,
                    padding: u1,
                }),
                padding: [32]u8,
            };

            ///  Port Module
            pub const PORT = struct {};
        };

        ///  Peripheral Touch Controller
        pub const PTC = struct {};

        ///  Real-Time Counter
        pub const RTC = extern union {
            pub const Mode = enum {
                MODE0,
                MODE1,
                MODE2,
            };

            pub fn get_mode(self: *volatile @This()) Mode {
                {
                    const value = self.MODE0.CTRL.read().MODE;
                    switch (value) {
                        0 => return .MODE0,
                        else => {},
                    }
                }
                {
                    const value = self.MODE1.CTRL.read().MODE;
                    switch (value) {
                        1 => return .MODE1,
                        else => {},
                    }
                }
                {
                    const value = self.MODE2.CTRL.read().MODE;
                    switch (value) {
                        2 => return .MODE2,
                        else => {},
                    }
                }

                unreachable;
            }

            pub const RTC_MODE0_CTRL__MODE = enum(u2) {
                ///  Mode 0: 32-bit Counter
                COUNT32 = 0x0,
                ///  Mode 1: 16-bit Counter
                COUNT16 = 0x1,
                ///  Mode 2: Clock/Calendar
                CLOCK = 0x2,
                _,
            };

            pub const RTC_MODE0_CTRL__PRESCALER = enum(u4) {
                ///  CLK_RTC_CNT = GCLK_RTC/1
                DIV1 = 0x0,
                ///  CLK_RTC_CNT = GCLK_RTC/2
                DIV2 = 0x1,
                ///  CLK_RTC_CNT = GCLK_RTC/4
                DIV4 = 0x2,
                ///  CLK_RTC_CNT = GCLK_RTC/8
                DIV8 = 0x3,
                ///  CLK_RTC_CNT = GCLK_RTC/16
                DIV16 = 0x4,
                ///  CLK_RTC_CNT = GCLK_RTC/32
                DIV32 = 0x5,
                ///  CLK_RTC_CNT = GCLK_RTC/64
                DIV64 = 0x6,
                ///  CLK_RTC_CNT = GCLK_RTC/128
                DIV128 = 0x7,
                ///  CLK_RTC_CNT = GCLK_RTC/256
                DIV256 = 0x8,
                ///  CLK_RTC_CNT = GCLK_RTC/512
                DIV512 = 0x9,
                ///  CLK_RTC_CNT = GCLK_RTC/1024
                DIV1024 = 0xa,
                _,
            };

            pub const RTC_MODE1_CTRL__MODE = enum(u2) {
                ///  Mode 0: 32-bit Counter
                COUNT32 = 0x0,
                ///  Mode 1: 16-bit Counter
                COUNT16 = 0x1,
                ///  Mode 2: Clock/Calendar
                CLOCK = 0x2,
                _,
            };

            pub const RTC_MODE1_CTRL__PRESCALER = enum(u4) {
                ///  CLK_RTC_CNT = GCLK_RTC/1
                DIV1 = 0x0,
                ///  CLK_RTC_CNT = GCLK_RTC/2
                DIV2 = 0x1,
                ///  CLK_RTC_CNT = GCLK_RTC/4
                DIV4 = 0x2,
                ///  CLK_RTC_CNT = GCLK_RTC/8
                DIV8 = 0x3,
                ///  CLK_RTC_CNT = GCLK_RTC/16
                DIV16 = 0x4,
                ///  CLK_RTC_CNT = GCLK_RTC/32
                DIV32 = 0x5,
                ///  CLK_RTC_CNT = GCLK_RTC/64
                DIV64 = 0x6,
                ///  CLK_RTC_CNT = GCLK_RTC/128
                DIV128 = 0x7,
                ///  CLK_RTC_CNT = GCLK_RTC/256
                DIV256 = 0x8,
                ///  CLK_RTC_CNT = GCLK_RTC/512
                DIV512 = 0x9,
                ///  CLK_RTC_CNT = GCLK_RTC/1024
                DIV1024 = 0xa,
                _,
            };

            pub const RTC_MODE2_CTRL__MODE = enum(u2) {
                ///  Mode 0: 32-bit Counter
                COUNT32 = 0x0,
                ///  Mode 1: 16-bit Counter
                COUNT16 = 0x1,
                ///  Mode 2: Clock/Calendar
                CLOCK = 0x2,
                _,
            };

            pub const RTC_MODE2_CTRL__PRESCALER = enum(u4) {
                ///  CLK_RTC_CNT = GCLK_RTC/1
                DIV1 = 0x0,
                ///  CLK_RTC_CNT = GCLK_RTC/2
                DIV2 = 0x1,
                ///  CLK_RTC_CNT = GCLK_RTC/4
                DIV4 = 0x2,
                ///  CLK_RTC_CNT = GCLK_RTC/8
                DIV8 = 0x3,
                ///  CLK_RTC_CNT = GCLK_RTC/16
                DIV16 = 0x4,
                ///  CLK_RTC_CNT = GCLK_RTC/32
                DIV32 = 0x5,
                ///  CLK_RTC_CNT = GCLK_RTC/64
                DIV64 = 0x6,
                ///  CLK_RTC_CNT = GCLK_RTC/128
                DIV128 = 0x7,
                ///  CLK_RTC_CNT = GCLK_RTC/256
                DIV256 = 0x8,
                ///  CLK_RTC_CNT = GCLK_RTC/512
                DIV512 = 0x9,
                ///  CLK_RTC_CNT = GCLK_RTC/1024
                DIV1024 = 0xa,
                _,
            };

            pub const RTC_MODE2_CLOCK__HOUR = enum(u5) {
                ///  AM when CLKREP in 12-hour
                AM = 0x0,
                ///  PM when CLKREP in 12-hour
                PM = 0x10,
                _,
            };

            pub const RTC_MODE2_ALARM_ALARM__HOUR = enum(u5) {
                ///  Morning hour
                AM = 0x0,
                ///  Afternoon hour
                PM = 0x10,
                _,
            };

            pub const RTC_MODE2_ALARM_MASK__SEL = enum(u3) {
                ///  Alarm Disabled
                OFF = 0x0,
                ///  Match seconds only
                SS = 0x1,
                ///  Match seconds and minutes only
                MMSS = 0x2,
                ///  Match seconds, minutes, and hours only
                HHMMSS = 0x3,
                ///  Match seconds, minutes, hours, and days only
                DDHHMMSS = 0x4,
                ///  Match seconds, minutes, hours, days, and months only
                MMDDHHMMSS = 0x5,
                ///  Match seconds, minutes, hours, days, months, and years
                YYMMDDHHMMSS = 0x6,
                _,
            };

            MODE0: extern struct {
                ///  MODE0 Control
                CTRL: mmio.Mmio(packed struct(u16) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  Operating Mode
                    MODE: packed union {
                        raw: u2,
                        value: RTC_MODE0_CTRL__MODE,
                    },
                    reserved7: u3,
                    ///  Clear on Match
                    MATCHCLR: u1,
                    ///  Prescaler
                    PRESCALER: packed union {
                        raw: u4,
                        value: RTC_MODE0_CTRL__PRESCALER,
                    },
                    padding: u4,
                }),
                ///  Read Request
                READREQ: mmio.Mmio(packed struct(u16) {
                    ///  Address
                    ADDR: u6,
                    reserved14: u8,
                    ///  Read Continuously
                    RCONT: u1,
                    ///  Read Request
                    RREQ: u1,
                }),
                ///  MODE0 Event Control
                EVCTRL: mmio.Mmio(packed struct(u16) {
                    ///  Periodic Interval 0 Event Output Enable
                    PEREO0: u1,
                    ///  Periodic Interval 1 Event Output Enable
                    PEREO1: u1,
                    ///  Periodic Interval 2 Event Output Enable
                    PEREO2: u1,
                    ///  Periodic Interval 3 Event Output Enable
                    PEREO3: u1,
                    ///  Periodic Interval 4 Event Output Enable
                    PEREO4: u1,
                    ///  Periodic Interval 5 Event Output Enable
                    PEREO5: u1,
                    ///  Periodic Interval 6 Event Output Enable
                    PEREO6: u1,
                    ///  Periodic Interval 7 Event Output Enable
                    PEREO7: u1,
                    ///  Compare 0 Event Output Enable
                    CMPEO0: u1,
                    reserved15: u6,
                    ///  Overflow Event Output Enable
                    OVFEO: u1,
                }),
                ///  MODE0 Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Compare 0 Interrupt Enable
                    CMP0: u1,
                    reserved6: u5,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                }),
                ///  MODE0 Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Compare 0 Interrupt Enable
                    CMP0: u1,
                    reserved6: u5,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                }),
                ///  MODE0 Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Compare 0
                    CMP0: u1,
                    reserved6: u5,
                    ///  Synchronization Ready
                    SYNCRDY: u1,
                    ///  Overflow
                    OVF: u1,
                }),
                reserved10: [1]u8,
                ///  Status
                STATUS: mmio.Mmio(packed struct(u8) {
                    reserved7: u7,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                ///  Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Run During Debug
                    DBGRUN: u1,
                    padding: u7,
                }),
                ///  Frequency Correction
                FREQCORR: mmio.Mmio(packed struct(u8) {
                    ///  Correction Value
                    VALUE: u7,
                    ///  Correction Sign
                    SIGN: u1,
                }),
                reserved16: [3]u8,
                ///  MODE0 Counter Value
                COUNT: mmio.Mmio(packed struct(u32) {
                    ///  Counter Value
                    COUNT: u32,
                }),
                reserved24: [4]u8,
                ///  MODE0 Compare n Value
                COMP: mmio.Mmio(packed struct(u32) {
                    ///  Compare Value
                    COMP: u32,
                }),
            },
            MODE1: extern struct {
                ///  MODE1 Control
                CTRL: mmio.Mmio(packed struct(u16) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  Operating Mode
                    MODE: packed union {
                        raw: u2,
                        value: RTC_MODE1_CTRL__MODE,
                    },
                    reserved8: u4,
                    ///  Prescaler
                    PRESCALER: packed union {
                        raw: u4,
                        value: RTC_MODE1_CTRL__PRESCALER,
                    },
                    padding: u4,
                }),
                ///  Read Request
                READREQ: mmio.Mmio(packed struct(u16) {
                    ///  Address
                    ADDR: u6,
                    reserved14: u8,
                    ///  Read Continuously
                    RCONT: u1,
                    ///  Read Request
                    RREQ: u1,
                }),
                ///  MODE1 Event Control
                EVCTRL: mmio.Mmio(packed struct(u16) {
                    ///  Periodic Interval 0 Event Output Enable
                    PEREO0: u1,
                    ///  Periodic Interval 1 Event Output Enable
                    PEREO1: u1,
                    ///  Periodic Interval 2 Event Output Enable
                    PEREO2: u1,
                    ///  Periodic Interval 3 Event Output Enable
                    PEREO3: u1,
                    ///  Periodic Interval 4 Event Output Enable
                    PEREO4: u1,
                    ///  Periodic Interval 5 Event Output Enable
                    PEREO5: u1,
                    ///  Periodic Interval 6 Event Output Enable
                    PEREO6: u1,
                    ///  Periodic Interval 7 Event Output Enable
                    PEREO7: u1,
                    ///  Compare 0 Event Output Enable
                    CMPEO0: u1,
                    ///  Compare 1 Event Output Enable
                    CMPEO1: u1,
                    reserved15: u5,
                    ///  Overflow Event Output Enable
                    OVFEO: u1,
                }),
                ///  MODE1 Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Compare 0 Interrupt Enable
                    CMP0: u1,
                    ///  Compare 1 Interrupt Enable
                    CMP1: u1,
                    reserved6: u4,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                }),
                ///  MODE1 Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Compare 0 Interrupt Enable
                    CMP0: u1,
                    ///  Compare 1 Interrupt Enable
                    CMP1: u1,
                    reserved6: u4,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                }),
                ///  MODE1 Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Compare 0
                    CMP0: u1,
                    ///  Compare 1
                    CMP1: u1,
                    reserved6: u4,
                    ///  Synchronization Ready
                    SYNCRDY: u1,
                    ///  Overflow
                    OVF: u1,
                }),
                reserved10: [1]u8,
                ///  Status
                STATUS: mmio.Mmio(packed struct(u8) {
                    reserved7: u7,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                ///  Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Run During Debug
                    DBGRUN: u1,
                    padding: u7,
                }),
                ///  Frequency Correction
                FREQCORR: mmio.Mmio(packed struct(u8) {
                    ///  Correction Value
                    VALUE: u7,
                    ///  Correction Sign
                    SIGN: u1,
                }),
                reserved16: [3]u8,
                ///  MODE1 Counter Value
                COUNT: mmio.Mmio(packed struct(u16) {
                    ///  Counter Value
                    COUNT: u16,
                }),
                reserved20: [2]u8,
                ///  MODE1 Counter Period
                PER: mmio.Mmio(packed struct(u16) {
                    ///  Counter Period
                    PER: u16,
                }),
                reserved24: [2]u8,
                ///  MODE1 Compare n Value
                COMP: mmio.Mmio(packed struct(u16) {
                    ///  Compare Value
                    COMP: u16,
                }),
            },
            MODE2: extern struct {
                ///  MODE2 Control
                CTRL: mmio.Mmio(packed struct(u16) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  Operating Mode
                    MODE: packed union {
                        raw: u2,
                        value: RTC_MODE2_CTRL__MODE,
                    },
                    reserved6: u2,
                    ///  Clock Representation
                    CLKREP: u1,
                    ///  Clear on Match
                    MATCHCLR: u1,
                    ///  Prescaler
                    PRESCALER: packed union {
                        raw: u4,
                        value: RTC_MODE2_CTRL__PRESCALER,
                    },
                    padding: u4,
                }),
                ///  Read Request
                READREQ: mmio.Mmio(packed struct(u16) {
                    ///  Address
                    ADDR: u6,
                    reserved14: u8,
                    ///  Read Continuously
                    RCONT: u1,
                    ///  Read Request
                    RREQ: u1,
                }),
                ///  MODE2 Event Control
                EVCTRL: mmio.Mmio(packed struct(u16) {
                    ///  Periodic Interval 0 Event Output Enable
                    PEREO0: u1,
                    ///  Periodic Interval 1 Event Output Enable
                    PEREO1: u1,
                    ///  Periodic Interval 2 Event Output Enable
                    PEREO2: u1,
                    ///  Periodic Interval 3 Event Output Enable
                    PEREO3: u1,
                    ///  Periodic Interval 4 Event Output Enable
                    PEREO4: u1,
                    ///  Periodic Interval 5 Event Output Enable
                    PEREO5: u1,
                    ///  Periodic Interval 6 Event Output Enable
                    PEREO6: u1,
                    ///  Periodic Interval 7 Event Output Enable
                    PEREO7: u1,
                    ///  Alarm 0 Event Output Enable
                    ALARMEO0: u1,
                    reserved15: u6,
                    ///  Overflow Event Output Enable
                    OVFEO: u1,
                }),
                ///  MODE2 Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Alarm 0 Interrupt Enable
                    ALARM0: u1,
                    reserved6: u5,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                }),
                ///  MODE2 Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Alarm 0 Interrupt Enable
                    ALARM0: u1,
                    reserved6: u5,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                }),
                ///  MODE2 Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Alarm 0
                    ALARM0: u1,
                    reserved6: u5,
                    ///  Synchronization Ready
                    SYNCRDY: u1,
                    ///  Overflow
                    OVF: u1,
                }),
                reserved10: [1]u8,
                ///  Status
                STATUS: mmio.Mmio(packed struct(u8) {
                    reserved7: u7,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                ///  Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Run During Debug
                    DBGRUN: u1,
                    padding: u7,
                }),
                ///  Frequency Correction
                FREQCORR: mmio.Mmio(packed struct(u8) {
                    ///  Correction Value
                    VALUE: u7,
                    ///  Correction Sign
                    SIGN: u1,
                }),
                reserved16: [3]u8,
                ///  MODE2 Clock Value
                CLOCK: mmio.Mmio(packed struct(u32) {
                    ///  Second
                    SECOND: u6,
                    ///  Minute
                    MINUTE: u6,
                    ///  Hour
                    HOUR: packed union {
                        raw: u5,
                        value: RTC_MODE2_CLOCK__HOUR,
                    },
                    ///  Day
                    DAY: u5,
                    ///  Month
                    MONTH: u4,
                    ///  Year
                    YEAR: u6,
                }),
                reserved24: [4]u8,
                ///  MODE2_ALARM Alarm n Value
                ALARM: mmio.Mmio(packed struct(u32) {
                    ///  Second
                    SECOND: u6,
                    ///  Minute
                    MINUTE: u6,
                    ///  Hour
                    HOUR: packed union {
                        raw: u5,
                        value: RTC_MODE2_ALARM_ALARM__HOUR,
                    },
                    ///  Day
                    DAY: u5,
                    ///  Month
                    MONTH: u4,
                    ///  Year
                    YEAR: u6,
                }),
                ///  MODE2_ALARM Alarm n Mask
                MASK: mmio.Mmio(packed struct(u8) {
                    ///  Alarm Mask Selection
                    SEL: packed union {
                        raw: u3,
                        value: RTC_MODE2_ALARM_MASK__SEL,
                    },
                    padding: u5,
                }),
            },
        };

        ///  Serial Communication Interface
        pub const SERCOM = extern union {
            pub const Mode = enum {
                I2CM,
                I2CS,
                SPIS,
                SPIM,
                USART_EXT,
                USART_INT,
            };

            pub fn get_mode(self: *volatile @This()) Mode {
                {
                    const value = self.I2CM_CTRLA.read().MODE;
                    switch (value) {
                        5 => return .I2CM,
                        else => {},
                    }
                }
                {
                    const value = self.I2CS_CTRLA.read().MODE;
                    switch (value) {
                        4 => return .I2CS,
                        else => {},
                    }
                }
                {
                    const value = self.SPIS_CTRLA.read().MODE;
                    switch (value) {
                        2 => return .SPIS,
                        else => {},
                    }
                }
                {
                    const value = self.SPIM_CTRLA.read().MODE;
                    switch (value) {
                        3 => return .SPIM,
                        else => {},
                    }
                }
                {
                    const value = self.USART_CTRLA.read().MODE;
                    switch (value) {
                        0 => return .USART_EXT,
                        else => {},
                    }
                }
                {
                    const value = self.USART_CTRLA.read().MODE;
                    switch (value) {
                        1 => return .USART_INT,
                        else => {},
                    }
                }

                unreachable;
            }

            pub const SERCOM_I2CM_CTRLA__MODE = enum(u3) {
                ///  USART with external clock
                USART_EXT_CLK = 0x0,
                ///  USART with internal clock
                USART_INT_CLK = 0x1,
                ///  SPI in slave operation
                SPI_SLAVE = 0x2,
                ///  SPI in master operation
                SPI_MASTER = 0x3,
                ///  I2C slave operation
                I2C_SLAVE = 0x4,
                ///  I2C master operation
                I2C_MASTER = 0x5,
                _,
            };

            pub const SERCOM_I2CM_CTRLA__SDAHOLD = enum(u2) {
                ///  Disabled
                DISABLE = 0x0,
                ///  50-100ns hold time
                @"75NS" = 0x1,
                ///  300-600ns hold time
                @"450NS" = 0x2,
                ///  400-800ns hold time
                @"600NS" = 0x3,
            };

            pub const SERCOM_I2CM_CTRLA__INACTOUT = enum(u2) {
                ///  Disabled
                DISABLE = 0x0,
                ///  5-6 SCL Time-Out(50-60us)
                @"55US" = 0x1,
                ///  10-11 SCL Time-Out(100-110us)
                @"105US" = 0x2,
                ///  20-21 SCL Time-Out(200-210us)
                @"205US" = 0x3,
            };

            pub const SERCOM_SPIM_CTRLA__MODE = enum(u3) {
                ///  USART with external clock
                USART_EXT_CLK = 0x0,
                ///  USART with internal clock
                USART_INT_CLK = 0x1,
                ///  SPI in slave operation
                SPI_SLAVE = 0x2,
                ///  SPI in master operation
                SPI_MASTER = 0x3,
                ///  I2C slave operation
                I2C_SLAVE = 0x4,
                ///  I2C master operation
                I2C_MASTER = 0x5,
                _,
            };

            pub const SERCOM_SPIM_CTRLA__CPHA = enum(u1) {
                ///  The data is sampled on a leading SCK edge and changed on a trailing SCK edge
                LEADING_EDGE = 0x0,
                ///  The data is sampled on a trailing SCK edge and changed on a leading SCK edge
                TRAILING_EDGE = 0x1,
            };

            pub const SERCOM_SPIM_CTRLA__CPOL = enum(u1) {
                ///  SCK is low when idle
                IDLE_LOW = 0x0,
                ///  SCK is high when idle
                IDLE_HIGH = 0x1,
            };

            pub const SERCOM_SPIM_CTRLA__DORD = enum(u1) {
                ///  MSB is transferred first
                MSB = 0x0,
                ///  LSB is transferred first
                LSB = 0x1,
            };

            pub const SERCOM_SPIM_CTRLA__DOPO = enum(u2) {
                ///  DO on PAD[0], SCK on PAD[1] and SS on PAD[2]
                PAD0 = 0x0,
                ///  DO on PAD[2], SCK on PAD[3] and SS on PAD[1]
                PAD1 = 0x1,
                ///  DO on PAD[3], SCK on PAD[1] and SS on PAD[2]
                PAD2 = 0x2,
                ///  DO on PAD[0], SCK on PAD[3] and SS on PAD[1]
                PAD3 = 0x3,
            };

            pub const SERCOM_SPIM_CTRLA__DIPO = enum(u2) {
                ///  SERCOM PAD[0]
                PAD0 = 0x0,
                ///  SERCOM PAD[1]
                PAD1 = 0x1,
                ///  SERCOM PAD[2]
                PAD2 = 0x2,
                ///  SERCOM PAD[3]
                PAD3 = 0x3,
            };

            pub const SERCOM_SPIM_CTRLA__FORM = enum(u4) {
                ///  SPI Frame
                SPI_FRAME = 0x0,
                ///  SPI Frame with Addr
                SPI_FRAME_WITH_ADDR = 0x2,
                _,
            };

            pub const SERCOM_SPIM_CTRLB__CHSIZE = enum(u3) {
                ///  8 bits
                @"8_BIT" = 0x0,
                ///  9 bits
                @"9_BIT" = 0x1,
                _,
            };

            pub const SERCOM_SPIM_CTRLB__AMODE = enum(u2) {
                ///  ADDRMASK is used as a mask to the ADDR register.
                MASK = 0x0,
                ///  The slave responds to the 2 unique addresses in ADDR and ADDRMASK.
                @"2_ADDRESSES" = 0x1,
                ///  The slave responds to the range of addresses between and including ADDR and ADDRMASK. ADDR is the upper limit.
                RANGE = 0x2,
                _,
            };

            pub const SERCOM_USART_CTRLA__MODE = enum(u3) {
                ///  USART with external clock
                USART_EXT_CLK = 0x0,
                ///  USART with internal clock
                USART_INT_CLK = 0x1,
                ///  SPI in slave operation
                SPI_SLAVE = 0x2,
                ///  SPI in master operation
                SPI_MASTER = 0x3,
                ///  I2C slave operation
                I2C_SLAVE = 0x4,
                ///  I2C master operation
                I2C_MASTER = 0x5,
                _,
            };

            pub const SERCOM_USART_CTRLA__CMODE = enum(u1) {
                ///  Asynchronous Communication
                ASYNC = 0x0,
                ///  Synchronous Communication
                SYNC = 0x1,
            };

            pub const SERCOM_USART_CTRLA__CPOL = enum(u1) {
                ///  TxD Change:- Rising XCK edge, RxD Sample:- Falling XCK edge
                IDLE_LOW = 0x0,
                ///  TxD Change:- Falling XCK edge, RxD Sample:- Rising XCK edge
                IDLE_HIGH = 0x1,
            };

            pub const SERCOM_USART_CTRLA__DORD = enum(u1) {
                ///  MSB is transmitted first
                MSB = 0x0,
                ///  LSB is transmitted first
                LSB = 0x1,
            };

            pub const SERCOM_USART_CTRLA__FORM = enum(u4) {
                ///  USART frame
                USART_FRAME_NO_PARITY = 0x0,
                ///  USART frame with parity
                USART_FRAME_WITH_PARITY = 0x1,
                _,
            };

            pub const SERCOM_USART_CTRLA__RXPO = enum(u2) {
                ///  SERCOM PAD[0] is used for data reception
                PAD0 = 0x0,
                ///  SERCOM PAD[1] is used for data reception
                PAD1 = 0x1,
                ///  SERCOM PAD[2] is used for data reception
                PAD2 = 0x2,
                ///  SERCOM PAD[3] is used for data reception
                PAD3 = 0x3,
            };

            pub const SERCOM_USART_CTRLA__TXPO = enum(u1) {
                ///  PAD[0] = TxD; PAD[1] = XCK
                PAD0 = 0x0,
                ///  PAD[2] = TxD; PAD[3] = XCK
                PAD1 = 0x1,
            };

            pub const SERCOM_USART_CTRLB__CHSIZE = enum(u3) {
                ///  8 Bits
                @"8_BIT" = 0x0,
                ///  9 Bits
                @"9_BIT" = 0x1,
                ///  5 Bits
                @"5_BIT" = 0x5,
                ///  6 Bits
                @"6_BIT" = 0x6,
                ///  7 Bits
                @"7_BIT" = 0x7,
                _,
            };

            pub const SERCOM_USART_CTRLB__PMODE = enum(u1) {
                ///  Even Parity
                EVEN = 0x0,
                ///  Odd Parity
                ODD = 0x1,
            };

            pub const SERCOM_USART_CTRLB__SBMODE = enum(u1) {
                ///  One Stop Bit
                @"1_BIT" = 0x0,
                ///  Two Stop Bits
                @"2_BIT" = 0x1,
            };

            I2CM: extern struct {
                ///  I2CM Control A
                CTRLA: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  Operating Mode
                    MODE: packed union {
                        raw: u3,
                        value: SERCOM_I2CM_CTRLA__MODE,
                    },
                    reserved7: u2,
                    ///  Run in Standby
                    RUNSTDBY: u1,
                    reserved16: u8,
                    ///  Pin Usage
                    PINOUT: u1,
                    reserved20: u3,
                    ///  SDA Hold Time
                    SDAHOLD: packed union {
                        raw: u2,
                        value: SERCOM_I2CM_CTRLA__SDAHOLD,
                    },
                    reserved28: u6,
                    ///  Inactive Time-out
                    INACTOUT: packed union {
                        raw: u2,
                        value: SERCOM_I2CM_CTRLA__INACTOUT,
                    },
                    ///  SCL Low Time-out
                    LOWTOUT: u1,
                    padding: u1,
                }),
                ///  I2CM Control B
                CTRLB: mmio.Mmio(packed struct(u32) {
                    reserved8: u8,
                    ///  Smart Mode Enable
                    SMEN: u1,
                    ///  Quick Command Enable
                    QCEN: u1,
                    reserved16: u6,
                    ///  Command
                    CMD: u2,
                    ///  Acknowledge Action
                    ACKACT: u1,
                    padding: u13,
                }),
                ///  I2CM Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Stop Mode
                    DBGSTOP: u1,
                    padding: u7,
                }),
                reserved10: [1]u8,
                ///  I2CM Baud Rate
                BAUD: mmio.Mmio(packed struct(u16) {
                    ///  Master Baud Rate
                    BAUD: u8,
                    ///  Master Baud Rate Low
                    BAUDLOW: u8,
                }),
                ///  I2CM Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Master on Bus Interrupt Enable
                    MB: u1,
                    ///  Slave on Bus Interrupt Enable
                    SB: u1,
                    padding: u6,
                }),
                ///  I2CM Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Master on Bus Interrupt Enable
                    MB: u1,
                    ///  Slave on Bus Interrupt Enable
                    SB: u1,
                    padding: u6,
                }),
                ///  I2CM Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Master on Bus
                    MB: u1,
                    ///  Slave on Bus
                    SB: u1,
                    padding: u6,
                }),
                reserved16: [1]u8,
                ///  I2CM Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    ///  Bus Error
                    BUSERR: u1,
                    ///  Arbitration Lost
                    ARBLOST: u1,
                    ///  Received Not Acknowledge
                    RXNACK: u1,
                    reserved4: u1,
                    ///  Bus State
                    BUSSTATE: u2,
                    ///  SCL Low Time-out
                    LOWTOUT: u1,
                    ///  Clock Hold
                    CLKHOLD: u1,
                    reserved15: u7,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                reserved20: [2]u8,
                ///  I2CM Address
                ADDR: mmio.Mmio(packed struct(u8) {
                    ///  Address
                    ADDR: u8,
                }),
                reserved24: [3]u8,
                ///  I2CM Data
                DATA: mmio.Mmio(packed struct(u8) {
                    ///  Data
                    DATA: u8,
                }),
            },
            I2CS: extern struct {
                ///  I2CS Control A
                CTRLA: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  Operating Mode
                    MODE: packed union {
                        raw: u3,
                        value: SERCOM_I2CM_CTRLA__MODE,
                    },
                    reserved7: u2,
                    ///  Run in Standby
                    RUNSTDBY: u1,
                    reserved16: u8,
                    ///  Pin Usage
                    PINOUT: u1,
                    reserved20: u3,
                    ///  SDA Hold Time
                    SDAHOLD: packed union {
                        raw: u2,
                        value: SERCOM_I2CM_CTRLA__SDAHOLD,
                    },
                    reserved30: u8,
                    ///  SCL Low Time-out
                    LOWTOUT: u1,
                    padding: u1,
                }),
                ///  I2CS Control B
                CTRLB: mmio.Mmio(packed struct(u32) {
                    reserved8: u8,
                    ///  Smart Mode Enable
                    SMEN: u1,
                    reserved14: u5,
                    ///  Address Mode
                    AMODE: u2,
                    ///  Command
                    CMD: u2,
                    ///  Acknowledge Action
                    ACKACT: u1,
                    padding: u13,
                }),
                reserved12: [4]u8,
                ///  I2CS Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Stop Received Interrupt Enable
                    PREC: u1,
                    ///  Address Match Interrupt Enable
                    AMATCH: u1,
                    ///  Data Ready Interrupt Enable
                    DRDY: u1,
                    padding: u5,
                }),
                ///  I2CS Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Stop Received Interrupt Enable
                    PREC: u1,
                    ///  Address Match Interrupt Enable
                    AMATCH: u1,
                    ///  Data Ready Interrupt Enable
                    DRDY: u1,
                    padding: u5,
                }),
                ///  I2CS Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Stop Received
                    PREC: u1,
                    ///  Address Match
                    AMATCH: u1,
                    ///  Data Ready
                    DRDY: u1,
                    padding: u5,
                }),
                reserved16: [1]u8,
                ///  I2CS Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    ///  Bus Error
                    BUSERR: u1,
                    ///  Transmit Collision
                    COLL: u1,
                    ///  Received Not Acknowledge
                    RXNACK: u1,
                    ///  Read / Write Direction
                    DIR: u1,
                    ///  Repeated Start
                    SR: u1,
                    reserved6: u1,
                    ///  SCL Low Time-out
                    LOWTOUT: u1,
                    ///  Clock Hold
                    CLKHOLD: u1,
                    reserved15: u7,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                reserved20: [2]u8,
                ///  I2CS Address
                ADDR: mmio.Mmio(packed struct(u32) {
                    ///  General Call Address Enable
                    GENCEN: u1,
                    ///  Address
                    ADDR: u7,
                    reserved17: u9,
                    ///  Address Mask
                    ADDRMASK: u7,
                    padding: u8,
                }),
                ///  I2CS Data
                DATA: mmio.Mmio(packed struct(u8) {
                    ///  Data
                    DATA: u8,
                }),
            },
            SPIS: extern struct {
                ///  SPIS Control A
                CTRLA: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  Operating Mode
                    MODE: packed union {
                        raw: u3,
                        value: SERCOM_SPIM_CTRLA__MODE,
                    },
                    reserved7: u2,
                    ///  Run In Standby
                    RUNSTDBY: u1,
                    ///  Immediate Buffer Overflow Notification
                    IBON: u1,
                    reserved16: u7,
                    ///  Data Out Pinout
                    DOPO: packed union {
                        raw: u2,
                        value: SERCOM_SPIM_CTRLA__DOPO,
                    },
                    reserved20: u2,
                    ///  Data In Pinout
                    DIPO: packed union {
                        raw: u2,
                        value: SERCOM_SPIM_CTRLA__DIPO,
                    },
                    reserved24: u2,
                    ///  Frame Format
                    FORM: packed union {
                        raw: u4,
                        value: SERCOM_SPIM_CTRLA__FORM,
                    },
                    ///  Clock Phase
                    CPHA: packed union {
                        raw: u1,
                        value: SERCOM_SPIM_CTRLA__CPHA,
                    },
                    ///  Clock Polarity
                    CPOL: packed union {
                        raw: u1,
                        value: SERCOM_SPIM_CTRLA__CPOL,
                    },
                    ///  Data Order
                    DORD: packed union {
                        raw: u1,
                        value: SERCOM_SPIM_CTRLA__DORD,
                    },
                    padding: u1,
                }),
                ///  SPIS Control B
                CTRLB: mmio.Mmio(packed struct(u32) {
                    ///  Character Size
                    CHSIZE: packed union {
                        raw: u3,
                        value: SERCOM_SPIM_CTRLB__CHSIZE,
                    },
                    reserved6: u3,
                    ///  Slave Data Preload Enable
                    PLOADEN: u1,
                    reserved14: u7,
                    ///  Address Mode
                    AMODE: packed union {
                        raw: u2,
                        value: SERCOM_SPIM_CTRLB__AMODE,
                    },
                    reserved17: u1,
                    ///  Receiver Enable
                    RXEN: u1,
                    padding: u14,
                }),
                ///  SPIS Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Stop Mode
                    DBGSTOP: u1,
                    padding: u7,
                }),
                reserved10: [1]u8,
                ///  SPIS Baud Rate
                BAUD: mmio.Mmio(packed struct(u8) {
                    ///  Baud Register
                    BAUD: u8,
                }),
                reserved12: [1]u8,
                ///  SPIS Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Enable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Enable
                    TXC: u1,
                    ///  Receive Complete Interrupt Enable
                    RXC: u1,
                    padding: u5,
                }),
                ///  SPIS Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Enable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Enable
                    TXC: u1,
                    ///  Receive Complete Interrupt Enable
                    RXC: u1,
                    padding: u5,
                }),
                ///  SPIS Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty
                    DRE: u1,
                    ///  Transmit Complete
                    TXC: u1,
                    ///  Receive Complete
                    RXC: u1,
                    padding: u5,
                }),
                reserved16: [1]u8,
                ///  SPIS Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    reserved2: u2,
                    ///  Buffer Overflow
                    BUFOVF: u1,
                    reserved15: u12,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                reserved20: [2]u8,
                ///  SPIS Address
                ADDR: mmio.Mmio(packed struct(u32) {
                    ///  Address
                    ADDR: u8,
                    reserved16: u8,
                    ///  Address Mask
                    ADDRMASK: u8,
                    padding: u8,
                }),
                ///  SPIS Data
                DATA: mmio.Mmio(packed struct(u16) {
                    ///  Data Value
                    DATA: u9,
                    padding: u7,
                }),
            },
            SPIM: extern struct {
                ///  SPIM Control A
                CTRLA: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  Operating Mode
                    MODE: packed union {
                        raw: u3,
                        value: SERCOM_SPIM_CTRLA__MODE,
                    },
                    reserved7: u2,
                    ///  Run In Standby
                    RUNSTDBY: u1,
                    ///  Immediate Buffer Overflow Notification
                    IBON: u1,
                    reserved16: u7,
                    ///  Data Out Pinout
                    DOPO: packed union {
                        raw: u2,
                        value: SERCOM_SPIM_CTRLA__DOPO,
                    },
                    reserved20: u2,
                    ///  Data In Pinout
                    DIPO: packed union {
                        raw: u2,
                        value: SERCOM_SPIM_CTRLA__DIPO,
                    },
                    reserved24: u2,
                    ///  Frame Format
                    FORM: packed union {
                        raw: u4,
                        value: SERCOM_SPIM_CTRLA__FORM,
                    },
                    ///  Clock Phase
                    CPHA: packed union {
                        raw: u1,
                        value: SERCOM_SPIM_CTRLA__CPHA,
                    },
                    ///  Clock Polarity
                    CPOL: packed union {
                        raw: u1,
                        value: SERCOM_SPIM_CTRLA__CPOL,
                    },
                    ///  Data Order
                    DORD: packed union {
                        raw: u1,
                        value: SERCOM_SPIM_CTRLA__DORD,
                    },
                    padding: u1,
                }),
                ///  SPIM Control B
                CTRLB: mmio.Mmio(packed struct(u32) {
                    ///  Character Size
                    CHSIZE: packed union {
                        raw: u3,
                        value: SERCOM_SPIM_CTRLB__CHSIZE,
                    },
                    reserved6: u3,
                    ///  Slave Data Preload Enable
                    PLOADEN: u1,
                    reserved14: u7,
                    ///  Address Mode
                    AMODE: packed union {
                        raw: u2,
                        value: SERCOM_SPIM_CTRLB__AMODE,
                    },
                    reserved17: u1,
                    ///  Receiver Enable
                    RXEN: u1,
                    padding: u14,
                }),
                ///  SPIM Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Stop Mode
                    DBGSTOP: u1,
                    padding: u7,
                }),
                reserved10: [1]u8,
                ///  SPIM Baud Rate
                BAUD: mmio.Mmio(packed struct(u8) {
                    ///  Baud Register
                    BAUD: u8,
                }),
                reserved12: [1]u8,
                ///  SPIM Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Enable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Enable
                    TXC: u1,
                    ///  Receive Complete Interrupt Enable
                    RXC: u1,
                    padding: u5,
                }),
                ///  SPIM Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Enable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Enable
                    TXC: u1,
                    ///  Receive Complete Interrupt Enable
                    RXC: u1,
                    padding: u5,
                }),
                ///  SPIM Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty
                    DRE: u1,
                    ///  Transmit Complete
                    TXC: u1,
                    ///  Receive Complete
                    RXC: u1,
                    padding: u5,
                }),
                reserved16: [1]u8,
                ///  SPIM Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    reserved2: u2,
                    ///  Buffer Overflow
                    BUFOVF: u1,
                    reserved15: u12,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                reserved20: [2]u8,
                ///  SPIM Address
                ADDR: mmio.Mmio(packed struct(u32) {
                    ///  Address
                    ADDR: u8,
                    reserved16: u8,
                    ///  Address Mask
                    ADDRMASK: u8,
                    padding: u8,
                }),
                ///  SPIM Data
                DATA: mmio.Mmio(packed struct(u16) {
                    ///  Data
                    DATA: u9,
                    padding: u7,
                }),
            },
            USART_EXT: extern struct {
                ///  USART_EXT Control A
                CTRLA: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  Operating Mode
                    MODE: packed union {
                        raw: u3,
                        value: SERCOM_USART_CTRLA__MODE,
                    },
                    reserved7: u2,
                    ///  Run In Standby
                    RUNSTDBY: u1,
                    ///  Immediate Buffer Overflow Notification
                    IBON: u1,
                    reserved16: u7,
                    ///  Transmit Data Pinout
                    TXPO: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLA__TXPO,
                    },
                    reserved20: u3,
                    ///  Receive Data Pinout
                    RXPO: packed union {
                        raw: u2,
                        value: SERCOM_USART_CTRLA__RXPO,
                    },
                    reserved24: u2,
                    ///  Frame Format
                    FORM: packed union {
                        raw: u4,
                        value: SERCOM_USART_CTRLA__FORM,
                    },
                    ///  Communication Mode
                    CMODE: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLA__CMODE,
                    },
                    ///  Clock Polarity
                    CPOL: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLA__CPOL,
                    },
                    ///  Data Order
                    DORD: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLA__DORD,
                    },
                    padding: u1,
                }),
                ///  USART_EXT Control B
                CTRLB: mmio.Mmio(packed struct(u32) {
                    ///  Character Size
                    CHSIZE: packed union {
                        raw: u3,
                        value: SERCOM_USART_CTRLB__CHSIZE,
                    },
                    reserved6: u3,
                    ///  Stop Bit Mode
                    SBMODE: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLB__SBMODE,
                    },
                    reserved9: u2,
                    ///  Start of Frame Detection Enable
                    SFDE: u1,
                    reserved13: u3,
                    ///  Parity Mode
                    PMODE: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLB__PMODE,
                    },
                    reserved16: u2,
                    ///  Transmitter Enable
                    TXEN: u1,
                    ///  Receiver Enable
                    RXEN: u1,
                    padding: u14,
                }),
                ///  USART_EXT Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Stop Mode
                    DBGSTOP: u1,
                    padding: u7,
                }),
                reserved10: [1]u8,
                ///  USART_EXT Baud
                BAUD: mmio.Mmio(packed struct(u16) {
                    ///  Baud Value
                    BAUD: u16,
                }),
                ///  USART_EXT Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Enable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Enable
                    TXC: u1,
                    ///  Receive Complete Interrupt Enable
                    RXC: u1,
                    ///  Receive Start Interrupt Disable
                    RXS: u1,
                    padding: u4,
                }),
                ///  USART_EXT Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Enable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Enable
                    TXC: u1,
                    ///  Receive Complete Interrupt Enable
                    RXC: u1,
                    ///  Receive Start Interrupt Enable
                    RXS: u1,
                    padding: u4,
                }),
                ///  USART_EXT Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty
                    DRE: u1,
                    ///  Transmit Complete
                    TXC: u1,
                    ///  Receive Complete
                    RXC: u1,
                    ///  Receive Start Interrupt
                    RXS: u1,
                    padding: u4,
                }),
                reserved16: [1]u8,
                ///  USART_EXT Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    ///  Parity Error
                    PERR: u1,
                    ///  Frame Error
                    FERR: u1,
                    ///  Buffer Overflow
                    BUFOVF: u1,
                    reserved15: u12,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                reserved24: [6]u8,
                ///  USART_EXT Data
                DATA: mmio.Mmio(packed struct(u16) {
                    ///  Data
                    DATA: u9,
                    padding: u7,
                }),
            },
            USART_INT: extern struct {
                ///  USART_INT Control A
                CTRLA: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  Operating Mode
                    MODE: packed union {
                        raw: u3,
                        value: SERCOM_USART_CTRLA__MODE,
                    },
                    reserved7: u2,
                    ///  Run In Standby
                    RUNSTDBY: u1,
                    ///  Immediate Buffer Overflow Notification
                    IBON: u1,
                    reserved16: u7,
                    ///  Transmit Data Pinout
                    TXPO: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLA__TXPO,
                    },
                    reserved20: u3,
                    ///  Receive Data Pinout
                    RXPO: packed union {
                        raw: u2,
                        value: SERCOM_USART_CTRLA__RXPO,
                    },
                    reserved24: u2,
                    ///  Frame Format
                    FORM: packed union {
                        raw: u4,
                        value: SERCOM_USART_CTRLA__FORM,
                    },
                    ///  Communication Mode
                    CMODE: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLA__CMODE,
                    },
                    ///  Clock Polarity
                    CPOL: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLA__CPOL,
                    },
                    ///  Data Order
                    DORD: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLA__DORD,
                    },
                    padding: u1,
                }),
                ///  USART_INT Control B
                CTRLB: mmio.Mmio(packed struct(u32) {
                    ///  Character Size
                    CHSIZE: packed union {
                        raw: u3,
                        value: SERCOM_USART_CTRLB__CHSIZE,
                    },
                    reserved6: u3,
                    ///  Stop Bit Mode
                    SBMODE: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLB__SBMODE,
                    },
                    reserved9: u2,
                    ///  Start of Frame Detection Enable
                    SFDE: u1,
                    reserved13: u3,
                    ///  Parity Mode
                    PMODE: packed union {
                        raw: u1,
                        value: SERCOM_USART_CTRLB__PMODE,
                    },
                    reserved16: u2,
                    ///  Transmitter Enable
                    TXEN: u1,
                    ///  Receiver Enable
                    RXEN: u1,
                    padding: u14,
                }),
                ///  USART_INT Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Stop Mode
                    DBGSTOP: u1,
                    padding: u7,
                }),
                reserved10: [1]u8,
                ///  USART_INT Baud
                BAUD: mmio.Mmio(packed struct(u16) {
                    ///  Baud Value
                    BAUD: u16,
                }),
                ///  USART_INT Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Enable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Enable
                    TXC: u1,
                    ///  Receive Complete Interrupt Enable
                    RXC: u1,
                    ///  Receive Start Interrupt Disable
                    RXS: u1,
                    padding: u4,
                }),
                ///  USART_INT Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Enable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Enable
                    TXC: u1,
                    ///  Receive Complete Interrupt Enable
                    RXC: u1,
                    ///  Receive Start Interrupt Enable
                    RXS: u1,
                    padding: u4,
                }),
                ///  USART_INT Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty
                    DRE: u1,
                    ///  Transmit Complete
                    TXC: u1,
                    ///  Receive Complete
                    RXC: u1,
                    ///  Receive Start Interrupt
                    RXS: u1,
                    padding: u4,
                }),
                reserved16: [1]u8,
                ///  USART_INT Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    ///  Parity Error
                    PERR: u1,
                    ///  Frame Error
                    FERR: u1,
                    ///  Buffer Overflow
                    BUFOVF: u1,
                    reserved15: u12,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                reserved24: [6]u8,
                ///  USART_INT Data
                DATA: mmio.Mmio(packed struct(u16) {
                    ///  Data
                    DATA: u9,
                    padding: u7,
                }),
            },
        };

        ///  System Control
        pub const SYSCTRL = extern struct {
            pub const SYSCTRL_XOSC__GAIN = enum(u3) {
                ///  2MHz
                @"0" = 0x0,
                ///  4MHz
                @"1" = 0x1,
                ///  8MHz
                @"2" = 0x2,
                ///  16MHz
                @"3" = 0x3,
                ///  30MHz
                @"4" = 0x4,
                _,
            };

            pub const SYSCTRL_OSC8M__FRANGE = enum(u2) {
                ///  4 to 6MHz
                @"0" = 0x0,
                ///  6 to 8MHz
                @"1" = 0x1,
                ///  8 to 11MHz
                @"2" = 0x2,
                ///  11 to 15MHz
                @"3" = 0x3,
            };

            pub const SYSCTRL_OSC8M__PRESC = enum(u2) {
                ///  1
                @"0" = 0x0,
                ///  2
                @"1" = 0x1,
                ///  4
                @"2" = 0x2,
                ///  8
                @"3" = 0x3,
            };

            pub const SUPC_BODVDD__ACTION = enum(u2) {
                ///  No action
                NONE = 0x0,
                ///  The BODVDD generates a reset
                RESET = 0x1,
                ///  The BODVDD generates an interrupt
                INT = 0x2,
                _,
            };

            pub const SUPC_BODVDD__PSEL = enum(u4) {
                ///  Divide clock by 2
                DIV2 = 0x0,
                ///  Divide clock by 4
                DIV4 = 0x1,
                ///  Divide clock by 8
                DIV8 = 0x2,
                ///  Divide clock by 16
                DIV16 = 0x3,
                ///  Divide clock by 32
                DIV32 = 0x4,
                ///  Divide clock by 64
                DIV64 = 0x5,
                ///  Divide clock by 128
                DIV128 = 0x6,
                ///  Divide clock by 256
                DIV256 = 0x7,
                ///  Divide clock by 512
                DIV512 = 0x8,
                ///  Divide clock by 1024
                DIV1024 = 0x9,
                ///  Divide clock by 2048
                DIV2048 = 0xa,
                ///  Divide clock by 4096
                DIV4096 = 0xb,
                ///  Divide clock by 8192
                DIV8192 = 0xc,
                ///  Divide clock by 16384
                DIV16384 = 0xd,
                ///  Divide clock by 32768
                DIV32768 = 0xe,
                ///  Divide clock by 65536
                DIV65536 = 0xf,
            };

            pub const SYSCTRL_XOSC__STARTUP = enum(u4) {
                ///  31 us
                CYCLE1 = 0x0,
                ///  61 us
                CYCLE2 = 0x1,
                ///  122 us
                CYCLE4 = 0x2,
                ///  244 us
                CYCLE8 = 0x3,
                ///  488 us
                CYCLE16 = 0x4,
                ///  977 us
                CYCLE32 = 0x5,
                ///  1953 us
                CYCLE64 = 0x6,
                ///  3906 us
                CYCLE128 = 0x7,
                ///  7813 us
                CYCLE256 = 0x8,
                ///  15625 us
                CYCLE512 = 0x9,
                ///  31250 us
                CYCLE1024 = 0xa,
                ///  62500 us
                CYCLE2048 = 0xb,
                ///  125000 us
                CYCLE4096 = 0xc,
                ///  250000 us
                CYCLE8192 = 0xd,
                ///  500000 us
                CYCLE16384 = 0xe,
                ///  1000000 us
                CYCLE32768 = 0xf,
            };

            pub const SYSCTRL_OSC32K__STARTUP = enum(u3) {
                ///  0.092 ms
                CYCLE3 = 0x0,
                ///  0.122 ms
                CYCLE4 = 0x1,
                ///  0.183 ms
                CYCLE6 = 0x2,
                ///  0.305 ms
                CYCLE10 = 0x3,
                ///  0.549 ms
                CYCLE18 = 0x4,
                ///  1.038 ms
                CYCLE34 = 0x5,
                ///  2.014 ms
                CYCLE66 = 0x6,
                ///  3.967 ms
                CYCLE130 = 0x7,
            };

            pub const SYSCTRL_XOSC32K__STARTUP = enum(u3) {
                ///  0.122 ms
                CYCLE1 = 0x0,
                ///  1.068 ms
                CYCLE32 = 0x1,
                ///  62.592 ms
                CYCLE2048 = 0x2,
                ///  125.092 ms
                CYCLE4096 = 0x3,
                ///  500.092 ms
                CYCLE16384 = 0x4,
                ///  1000.092 ms
                CYCLE32768 = 0x5,
                ///  2000.092 ms
                CYCLE65536 = 0x6,
                ///  4000.092 ms
                CYCLE131072 = 0x7,
            };

            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u32) {
                ///  XOSC Ready
                XOSCRDY: u1,
                ///  XOSC32K Ready
                XOSC32KRDY: u1,
                ///  OSC32K Ready
                OSC32KRDY: u1,
                ///  OSC8M Ready
                OSC8MRDY: u1,
                ///  DFLL Ready
                DFLLRDY: u1,
                ///  DFLL Out Of Bounds
                DFLLOOB: u1,
                ///  DFLL Lock Fine
                DFLLLCKF: u1,
                ///  DFLL Lock Coarse
                DFLLLCKC: u1,
                ///  DFLL Reference Clock Stopped
                DFLLRCS: u1,
                ///  BOD33 Ready
                BOD33RDY: u1,
                ///  BOD33 Detection
                BOD33DET: u1,
                ///  BOD33 Synchronization Ready
                B33SRDY: u1,
                padding: u20,
            }),
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u32) {
                ///  XOSC Ready
                XOSCRDY: u1,
                ///  XOSC32K Ready
                XOSC32KRDY: u1,
                ///  OSC32K Ready
                OSC32KRDY: u1,
                ///  OSC8M Ready
                OSC8MRDY: u1,
                ///  DFLL Ready
                DFLLRDY: u1,
                ///  DFLL Out Of Bounds
                DFLLOOB: u1,
                ///  DFLL Lock Fine
                DFLLLCKF: u1,
                ///  DFLL Lock Coarse
                DFLLLCKC: u1,
                ///  DFLL Reference Clock Stopped
                DFLLRCS: u1,
                ///  BOD33 Ready
                BOD33RDY: u1,
                ///  BOD33 Detection
                BOD33DET: u1,
                ///  BOD33 Synchronization Ready
                B33SRDY: u1,
                padding: u20,
            }),
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u32) {
                ///  XOSC Ready
                XOSCRDY: u1,
                ///  XOSC32K Ready
                XOSC32KRDY: u1,
                ///  OSC32K Ready
                OSC32KRDY: u1,
                ///  OSC8M Ready
                OSC8MRDY: u1,
                ///  DFLL Ready
                DFLLRDY: u1,
                ///  DFLL Out Of Bounds
                DFLLOOB: u1,
                ///  DFLL Lock Fine
                DFLLLCKF: u1,
                ///  DFLL Lock Coarse
                DFLLLCKC: u1,
                ///  DFLL Reference Clock Stopped
                DFLLRCS: u1,
                ///  BOD33 Ready
                BOD33RDY: u1,
                ///  BOD33 Detection
                BOD33DET: u1,
                ///  BOD33 Synchronization Ready
                B33SRDY: u1,
                padding: u20,
            }),
            ///  Power and Clocks Status
            PCLKSR: mmio.Mmio(packed struct(u32) {
                ///  XOSC Ready
                XOSCRDY: u1,
                ///  XOSC32K Ready
                XOSC32KRDY: u1,
                ///  OSC32K Ready
                OSC32KRDY: u1,
                ///  OSC8M Ready
                OSC8MRDY: u1,
                ///  DFLL Ready
                DFLLRDY: u1,
                ///  DFLL Out Of Bounds
                DFLLOOB: u1,
                ///  DFLL Lock Fine
                DFLLLCKF: u1,
                ///  DFLL Lock Coarse
                DFLLLCKC: u1,
                ///  DFLL Reference Clock Stopped
                DFLLRCS: u1,
                ///  BOD33 Ready
                BOD33RDY: u1,
                ///  BOD33 Detection
                BOD33DET: u1,
                ///  BOD33 Synchronization Ready
                B33SRDY: u1,
                padding: u20,
            }),
            ///  External Multipurpose Crystal Oscillator (XOSC) Control
            XOSC: mmio.Mmio(packed struct(u16) {
                reserved1: u1,
                ///  Oscillator Enable
                ENABLE: u1,
                ///  Crystal Oscillator Enable
                XTALEN: u1,
                reserved6: u3,
                ///  Run in Standby
                RUNSTDBY: u1,
                ///  On Demand Control
                ONDEMAND: u1,
                ///  Oscillator Gain
                GAIN: packed union {
                    raw: u3,
                    value: SYSCTRL_XOSC__GAIN,
                },
                ///  Automatic Amplitude Gain Control
                AMPGC: u1,
                ///  Start-Up Time
                STARTUP: packed union {
                    raw: u4,
                    value: SYSCTRL_XOSC__STARTUP,
                },
            }),
            reserved20: [2]u8,
            ///  32kHz External Crystal Oscillator (XOSC32K) Control
            XOSC32K: mmio.Mmio(packed struct(u16) {
                reserved1: u1,
                ///  Oscillator Enable
                ENABLE: u1,
                ///  Crystal Oscillator Enable
                XTALEN: u1,
                ///  32kHz Output Enable
                EN32K: u1,
                ///  1kHz Output Enable
                EN1K: u1,
                ///  Automatic Amplitude Control Enable
                AAMPEN: u1,
                ///  Run in Standby
                RUNSTDBY: u1,
                ///  On Demand Control
                ONDEMAND: u1,
                ///  Oscillator Start-Up Time
                STARTUP: packed union {
                    raw: u3,
                    value: SYSCTRL_XOSC32K__STARTUP,
                },
                reserved12: u1,
                ///  Write Lock
                WRTLOCK: u1,
                padding: u3,
            }),
            reserved24: [2]u8,
            ///  32kHz Internal Oscillator (OSC32K) Control
            OSC32K: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Oscillator Enable
                ENABLE: u1,
                ///  32kHz Output Enable
                EN32K: u1,
                ///  1kHz Output Enable
                EN1K: u1,
                reserved6: u2,
                ///  Run in Standby
                RUNSTDBY: u1,
                ///  On Demand Control
                ONDEMAND: u1,
                ///  Oscillator Start-Up Time
                STARTUP: packed union {
                    raw: u3,
                    value: SYSCTRL_OSC32K__STARTUP,
                },
                reserved12: u1,
                ///  Write Lock
                WRTLOCK: u1,
                reserved16: u3,
                ///  Oscillator Calibration
                CALIB: u7,
                padding: u9,
            }),
            ///  OSCULP32K Control
            OSCULP32K: mmio.Mmio(packed struct(u8) {
                ///  Calibration Value
                CALIB: u5,
                reserved7: u2,
                ///  Write Lock
                WRTLOCK: u1,
            }),
            reserved32: [3]u8,
            ///  8MHz Internal Oscillator (OSC8M) Control
            OSC8M: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Oscillator Enable
                ENABLE: u1,
                reserved6: u4,
                ///  Run in Standby
                RUNSTDBY: u1,
                ///  On Demand Control
                ONDEMAND: u1,
                ///  Oscillator Prescaler
                PRESC: packed union {
                    raw: u2,
                    value: SYSCTRL_OSC8M__PRESC,
                },
                reserved16: u6,
                ///  Oscillator Calibration
                CALIB: u12,
                reserved30: u2,
                ///  Oscillator Frequency Range
                FRANGE: packed union {
                    raw: u2,
                    value: SYSCTRL_OSC8M__FRANGE,
                },
            }),
            ///  DFLL Config
            DFLLCTRL: mmio.Mmio(packed struct(u16) {
                reserved1: u1,
                ///  Enable
                ENABLE: u1,
                ///  Mode Selection
                MODE: u1,
                ///  Stable Frequency
                STABLE: u1,
                ///  Lose Lock After Wake
                LLAW: u1,
                reserved6: u1,
                ///  Run during Standby
                RUNSTDBY: u1,
                ///  Enable on Demand
                ONDEMAND: u1,
                ///  Chill Cycle Disable
                CCDIS: u1,
                ///  Quick Lock Disable
                QLDIS: u1,
                padding: u6,
            }),
            reserved40: [2]u8,
            ///  DFLL Calibration Value
            DFLLVAL: mmio.Mmio(packed struct(u32) {
                ///  Fine Calibration Value
                FINE: u10,
                ///  Coarse Calibration Value
                COARSE: u6,
                ///  Multiplication Ratio Difference
                DIFF: u16,
            }),
            ///  DFLL Multiplier
            DFLLMUL: mmio.Mmio(packed struct(u32) {
                ///  Multiplication Value
                MUL: u16,
                ///  Maximum Fine Step Size
                FSTEP: u10,
                ///  Maximum Coarse Step Size
                CSTEP: u6,
            }),
            ///  DFLL Synchronization
            DFLLSYNC: mmio.Mmio(packed struct(u8) {
                reserved7: u7,
                ///  Read Request Synchronization
                READREQ: u1,
            }),
            reserved52: [3]u8,
            ///  3.3V Brown-Out Detector (BOD33) Control
            BOD33: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Enable
                ENABLE: u1,
                ///  Hysteresis Enable
                HYST: u1,
                ///  Action when Threshold Crossed
                ACTION: packed union {
                    raw: u2,
                    value: SUPC_BODVDD__ACTION,
                },
                reserved6: u1,
                ///  Run during Standby
                RUNSTDBY: u1,
                reserved8: u1,
                ///  Operation Modes
                MODE: u1,
                ///  Clock Enable
                CEN: u1,
                reserved12: u2,
                ///  Prescaler Select
                PSEL: packed union {
                    raw: u4,
                    value: SUPC_BODVDD__PSEL,
                },
                ///  Threshold Level
                LEVEL: u6,
                padding: u10,
            }),
            reserved60: [4]u8,
            ///  VREG Control
            VREG: mmio.Mmio(packed struct(u16) {
                reserved6: u6,
                ///  Run during Standby
                RUNSTDBY: u1,
                reserved13: u6,
                ///  Force LDO Voltage Regulator
                FORCELDO: u1,
                padding: u2,
            }),
            reserved64: [2]u8,
            ///  VREF Control A
            VREF: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Temperature Sensor Output Enable
                TSEN: u1,
                ///  Bandgap Output Enable
                BGOUTEN: u1,
                reserved16: u13,
                ///  Voltage Reference Calibration Value
                CALIB: u11,
                padding: u5,
            }),
        };

        ///  Basic Timer Counter
        pub const TC = extern union {
            pub const Mode = enum {
                COUNT8,
                COUNT16,
                COUNT32,
            };

            pub fn get_mode(self: *volatile @This()) Mode {
                {
                    const value = self.CTRLA.read().MODE;
                    switch (value) {
                        1 => return .COUNT8,
                        else => {},
                    }
                }
                {
                    const value = self.CTRLA.read().MODE;
                    switch (value) {
                        0 => return .COUNT16,
                        else => {},
                    }
                }
                {
                    const value = self.CTRLA.read().MODE;
                    switch (value) {
                        2 => return .COUNT32,
                        else => {},
                    }
                }

                unreachable;
            }

            pub const TC_CTRLA__MODE = enum(u2) {
                ///  Counter in 16-bit mode
                COUNT16 = 0x0,
                ///  Counter in 8-bit mode
                COUNT8 = 0x1,
                ///  Counter in 32-bit mode
                COUNT32 = 0x2,
                _,
            };

            pub const TC_CTRLA__PRESCALER = enum(u3) {
                ///  GCLK_TC
                DIV1 = 0x0,
                ///  GCLK_TC/2
                DIV2 = 0x1,
                ///  GCLK_TC/4
                DIV4 = 0x2,
                ///  GCLK_TC/8
                DIV8 = 0x3,
                ///  GCLK_TC/16
                DIV16 = 0x4,
                ///  GCLK_TC/64
                DIV64 = 0x5,
                ///  GCLK_TC/256
                DIV256 = 0x6,
                ///  GCLK_TC/1024
                DIV1024 = 0x7,
            };

            pub const TC_CTRLA__PRESCSYNC = enum(u2) {
                ///  Reload or reset Counter on next GCLK
                GCLK = 0x0,
                ///  Reload or reset Counter on next prescaler clock
                PRESC = 0x1,
                ///  Reload or reset Counter on next GCLK. Reset prescaler counter
                RESYNC = 0x2,
                _,
            };

            pub const TC_CTRLA__WAVEGEN = enum(u2) {
                NFRQ = 0x0,
                MFRQ = 0x1,
                NPWM = 0x2,
                MPWM = 0x3,
            };

            pub const TC_CTRLBCLR__CMD = enum(u2) {
                ///  No action
                NONE = 0x0,
                ///  Force start, restart or retrigger
                RETRIGGER = 0x1,
                ///  Force stop
                STOP = 0x2,
                _,
            };

            pub const TC_CTRLBSET__CMD = enum(u2) {
                ///  No action
                NONE = 0x0,
                ///  Force start, restart or retrigger
                RETRIGGER = 0x1,
                ///  Force stop
                STOP = 0x2,
                _,
            };

            pub const TC_EVCTRL__EVACT = enum(u3) {
                ///  Event action disabled
                OFF = 0x0,
                ///  Start, restart or retrigger TC on event
                RETRIGGER = 0x1,
                ///  Count on event
                COUNT = 0x2,
                ///  Start TC on event
                START = 0x3,
                ///  Period captured into CC0 Pulse Width in CC1
                PPW = 0x5,
                ///  Period captured into CC1 Pulse Width on CC0
                PWP = 0x6,
                _,
            };

            COUNT8: extern struct {
                ///  Control A
                CTRLA: mmio.Mmio(packed struct(u16) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  TC Mode
                    MODE: packed union {
                        raw: u2,
                        value: TC_CTRLA__MODE,
                    },
                    reserved5: u1,
                    ///  Waveform Generation Operation
                    WAVEGEN: packed union {
                        raw: u2,
                        value: TC_CTRLA__WAVEGEN,
                    },
                    reserved8: u1,
                    ///  Prescaler
                    PRESCALER: packed union {
                        raw: u3,
                        value: TC_CTRLA__PRESCALER,
                    },
                    ///  Run in Standby
                    RUNSTDBY: u1,
                    ///  Prescaler and Counter Synchronization
                    PRESCSYNC: packed union {
                        raw: u2,
                        value: TC_CTRLA__PRESCSYNC,
                    },
                    padding: u2,
                }),
                ///  Read Request
                READREQ: mmio.Mmio(packed struct(u16) {
                    ///  Address
                    ADDR: u5,
                    reserved14: u9,
                    ///  Read Continuously
                    RCONT: u1,
                    ///  Read Request
                    RREQ: u1,
                }),
                ///  Control B Clear
                CTRLBCLR: mmio.Mmio(packed struct(u8) {
                    ///  Counter Direction
                    DIR: u1,
                    reserved2: u1,
                    ///  One-Shot
                    ONESHOT: u1,
                    reserved6: u3,
                    ///  Command
                    CMD: packed union {
                        raw: u2,
                        value: TC_CTRLBCLR__CMD,
                    },
                }),
                ///  Control B Set
                CTRLBSET: mmio.Mmio(packed struct(u8) {
                    ///  Counter Direction
                    DIR: u1,
                    reserved2: u1,
                    ///  One-shot
                    ONESHOT: u1,
                    reserved6: u3,
                    ///  Command
                    CMD: packed union {
                        raw: u2,
                        value: TC_CTRLBSET__CMD,
                    },
                }),
                ///  Control C
                CTRLC: mmio.Mmio(packed struct(u8) {
                    ///  Output Waveform 0 Invert Enable
                    INVEN0: u1,
                    ///  Output Waveform 1 Invert Enable
                    INVEN1: u1,
                    reserved4: u2,
                    ///  Capture Channel 0 Enable
                    CPTEN0: u1,
                    ///  Capture Channel 1 Enable
                    CPTEN1: u1,
                    padding: u2,
                }),
                reserved8: [1]u8,
                ///  Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Run Mode
                    DBGRUN: u1,
                    padding: u7,
                }),
                reserved10: [1]u8,
                ///  Event Control
                EVCTRL: mmio.Mmio(packed struct(u16) {
                    ///  Event Action
                    EVACT: packed union {
                        raw: u3,
                        value: TC_EVCTRL__EVACT,
                    },
                    reserved4: u1,
                    ///  TC Inverted Event Input
                    TCINV: u1,
                    ///  TC Event Input
                    TCEI: u1,
                    reserved8: u2,
                    ///  Overflow/Underflow Event Output Enable
                    OVFEO: u1,
                    reserved12: u3,
                    ///  Match or Capture Channel 0 Event Output Enable
                    MCEO0: u1,
                    ///  Match or Capture Channel 1 Event Output Enable
                    MCEO1: u1,
                    padding: u2,
                }),
                ///  Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                    ///  Error Interrupt Enable
                    ERR: u1,
                    reserved3: u1,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Match or Capture Channel 0 Interrupt Enable
                    MC0: u1,
                    ///  Match or Capture Channel 1 Interrupt Enable
                    MC1: u1,
                    padding: u2,
                }),
                ///  Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                    ///  Error Interrupt Enable
                    ERR: u1,
                    reserved3: u1,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Match or Capture Channel 0 Interrupt Enable
                    MC0: u1,
                    ///  Match or Capture Channel 1 Interrupt Enable
                    MC1: u1,
                    padding: u2,
                }),
                ///  Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Overflow
                    OVF: u1,
                    ///  Error
                    ERR: u1,
                    reserved3: u1,
                    ///  Synchronization Ready
                    SYNCRDY: u1,
                    ///  Match or Capture Channel 0
                    MC0: u1,
                    ///  Match or Capture Channel 1
                    MC1: u1,
                    padding: u2,
                }),
                ///  Status
                STATUS: mmio.Mmio(packed struct(u8) {
                    reserved3: u3,
                    ///  Stop
                    STOP: u1,
                    ///  Slave
                    SLAVE: u1,
                    reserved7: u2,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                ///  COUNT8 Counter Value
                COUNT: mmio.Mmio(packed struct(u8) {
                    ///  Counter Value
                    COUNT: u8,
                }),
                reserved20: [3]u8,
                ///  COUNT8 Period Value
                PER: mmio.Mmio(packed struct(u8) {
                    ///  Period Value
                    PER: u8,
                }),
                reserved24: [3]u8,
                ///  COUNT8 Compare/Capture
                CC: mmio.Mmio(packed struct(u8) {
                    ///  Compare/Capture Value
                    CC: u8,
                }),
            },
            COUNT16: extern struct {
                ///  Control A
                CTRLA: mmio.Mmio(packed struct(u16) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  TC Mode
                    MODE: packed union {
                        raw: u2,
                        value: TC_CTRLA__MODE,
                    },
                    reserved5: u1,
                    ///  Waveform Generation Operation
                    WAVEGEN: packed union {
                        raw: u2,
                        value: TC_CTRLA__WAVEGEN,
                    },
                    reserved8: u1,
                    ///  Prescaler
                    PRESCALER: packed union {
                        raw: u3,
                        value: TC_CTRLA__PRESCALER,
                    },
                    ///  Run in Standby
                    RUNSTDBY: u1,
                    ///  Prescaler and Counter Synchronization
                    PRESCSYNC: packed union {
                        raw: u2,
                        value: TC_CTRLA__PRESCSYNC,
                    },
                    padding: u2,
                }),
                ///  Read Request
                READREQ: mmio.Mmio(packed struct(u16) {
                    ///  Address
                    ADDR: u5,
                    reserved14: u9,
                    ///  Read Continuously
                    RCONT: u1,
                    ///  Read Request
                    RREQ: u1,
                }),
                ///  Control B Clear
                CTRLBCLR: mmio.Mmio(packed struct(u8) {
                    ///  Counter Direction
                    DIR: u1,
                    reserved2: u1,
                    ///  One-Shot
                    ONESHOT: u1,
                    reserved6: u3,
                    ///  Command
                    CMD: packed union {
                        raw: u2,
                        value: TC_CTRLBCLR__CMD,
                    },
                }),
                ///  Control B Set
                CTRLBSET: mmio.Mmio(packed struct(u8) {
                    ///  Counter Direction
                    DIR: u1,
                    reserved2: u1,
                    ///  One-shot
                    ONESHOT: u1,
                    reserved6: u3,
                    ///  Command
                    CMD: packed union {
                        raw: u2,
                        value: TC_CTRLBSET__CMD,
                    },
                }),
                ///  Control C
                CTRLC: mmio.Mmio(packed struct(u8) {
                    ///  Output Waveform 0 Invert Enable
                    INVEN0: u1,
                    ///  Output Waveform 1 Invert Enable
                    INVEN1: u1,
                    reserved4: u2,
                    ///  Capture Channel 0 Enable
                    CPTEN0: u1,
                    ///  Capture Channel 1 Enable
                    CPTEN1: u1,
                    padding: u2,
                }),
                reserved8: [1]u8,
                ///  Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Run Mode
                    DBGRUN: u1,
                    padding: u7,
                }),
                reserved10: [1]u8,
                ///  Event Control
                EVCTRL: mmio.Mmio(packed struct(u16) {
                    ///  Event Action
                    EVACT: packed union {
                        raw: u3,
                        value: TC_EVCTRL__EVACT,
                    },
                    reserved4: u1,
                    ///  TC Inverted Event Input
                    TCINV: u1,
                    ///  TC Event Input
                    TCEI: u1,
                    reserved8: u2,
                    ///  Overflow/Underflow Event Output Enable
                    OVFEO: u1,
                    reserved12: u3,
                    ///  Match or Capture Channel 0 Event Output Enable
                    MCEO0: u1,
                    ///  Match or Capture Channel 1 Event Output Enable
                    MCEO1: u1,
                    padding: u2,
                }),
                ///  Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                    ///  Error Interrupt Enable
                    ERR: u1,
                    reserved3: u1,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Match or Capture Channel 0 Interrupt Enable
                    MC0: u1,
                    ///  Match or Capture Channel 1 Interrupt Enable
                    MC1: u1,
                    padding: u2,
                }),
                ///  Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                    ///  Error Interrupt Enable
                    ERR: u1,
                    reserved3: u1,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Match or Capture Channel 0 Interrupt Enable
                    MC0: u1,
                    ///  Match or Capture Channel 1 Interrupt Enable
                    MC1: u1,
                    padding: u2,
                }),
                ///  Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Overflow
                    OVF: u1,
                    ///  Error
                    ERR: u1,
                    reserved3: u1,
                    ///  Synchronization Ready
                    SYNCRDY: u1,
                    ///  Match or Capture Channel 0
                    MC0: u1,
                    ///  Match or Capture Channel 1
                    MC1: u1,
                    padding: u2,
                }),
                ///  Status
                STATUS: mmio.Mmio(packed struct(u8) {
                    reserved3: u3,
                    ///  Stop
                    STOP: u1,
                    ///  Slave
                    SLAVE: u1,
                    reserved7: u2,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                ///  COUNT16 Counter Value
                COUNT: mmio.Mmio(packed struct(u16) {
                    ///  Counter Value
                    COUNT: u16,
                }),
                reserved24: [6]u8,
                ///  COUNT16 Compare/Capture
                CC: mmio.Mmio(packed struct(u16) {
                    ///  Compare/Capture Value
                    CC: u16,
                }),
            },
            COUNT32: extern struct {
                ///  Control A
                CTRLA: mmio.Mmio(packed struct(u16) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  Enable
                    ENABLE: u1,
                    ///  TC Mode
                    MODE: packed union {
                        raw: u2,
                        value: TC_CTRLA__MODE,
                    },
                    reserved5: u1,
                    ///  Waveform Generation Operation
                    WAVEGEN: packed union {
                        raw: u2,
                        value: TC_CTRLA__WAVEGEN,
                    },
                    reserved8: u1,
                    ///  Prescaler
                    PRESCALER: packed union {
                        raw: u3,
                        value: TC_CTRLA__PRESCALER,
                    },
                    ///  Run in Standby
                    RUNSTDBY: u1,
                    ///  Prescaler and Counter Synchronization
                    PRESCSYNC: packed union {
                        raw: u2,
                        value: TC_CTRLA__PRESCSYNC,
                    },
                    padding: u2,
                }),
                ///  Read Request
                READREQ: mmio.Mmio(packed struct(u16) {
                    ///  Address
                    ADDR: u5,
                    reserved14: u9,
                    ///  Read Continuously
                    RCONT: u1,
                    ///  Read Request
                    RREQ: u1,
                }),
                ///  Control B Clear
                CTRLBCLR: mmio.Mmio(packed struct(u8) {
                    ///  Counter Direction
                    DIR: u1,
                    reserved2: u1,
                    ///  One-Shot
                    ONESHOT: u1,
                    reserved6: u3,
                    ///  Command
                    CMD: packed union {
                        raw: u2,
                        value: TC_CTRLBCLR__CMD,
                    },
                }),
                ///  Control B Set
                CTRLBSET: mmio.Mmio(packed struct(u8) {
                    ///  Counter Direction
                    DIR: u1,
                    reserved2: u1,
                    ///  One-shot
                    ONESHOT: u1,
                    reserved6: u3,
                    ///  Command
                    CMD: packed union {
                        raw: u2,
                        value: TC_CTRLBSET__CMD,
                    },
                }),
                ///  Control C
                CTRLC: mmio.Mmio(packed struct(u8) {
                    ///  Output Waveform 0 Invert Enable
                    INVEN0: u1,
                    ///  Output Waveform 1 Invert Enable
                    INVEN1: u1,
                    reserved4: u2,
                    ///  Capture Channel 0 Enable
                    CPTEN0: u1,
                    ///  Capture Channel 1 Enable
                    CPTEN1: u1,
                    padding: u2,
                }),
                reserved8: [1]u8,
                ///  Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Run Mode
                    DBGRUN: u1,
                    padding: u7,
                }),
                reserved10: [1]u8,
                ///  Event Control
                EVCTRL: mmio.Mmio(packed struct(u16) {
                    ///  Event Action
                    EVACT: packed union {
                        raw: u3,
                        value: TC_EVCTRL__EVACT,
                    },
                    reserved4: u1,
                    ///  TC Inverted Event Input
                    TCINV: u1,
                    ///  TC Event Input
                    TCEI: u1,
                    reserved8: u2,
                    ///  Overflow/Underflow Event Output Enable
                    OVFEO: u1,
                    reserved12: u3,
                    ///  Match or Capture Channel 0 Event Output Enable
                    MCEO0: u1,
                    ///  Match or Capture Channel 1 Event Output Enable
                    MCEO1: u1,
                    padding: u2,
                }),
                ///  Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                    ///  Error Interrupt Enable
                    ERR: u1,
                    reserved3: u1,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Match or Capture Channel 0 Interrupt Enable
                    MC0: u1,
                    ///  Match or Capture Channel 1 Interrupt Enable
                    MC1: u1,
                    padding: u2,
                }),
                ///  Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Overflow Interrupt Enable
                    OVF: u1,
                    ///  Error Interrupt Enable
                    ERR: u1,
                    reserved3: u1,
                    ///  Synchronization Ready Interrupt Enable
                    SYNCRDY: u1,
                    ///  Match or Capture Channel 0 Interrupt Enable
                    MC0: u1,
                    ///  Match or Capture Channel 1 Interrupt Enable
                    MC1: u1,
                    padding: u2,
                }),
                ///  Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Overflow
                    OVF: u1,
                    ///  Error
                    ERR: u1,
                    reserved3: u1,
                    ///  Synchronization Ready
                    SYNCRDY: u1,
                    ///  Match or Capture Channel 0
                    MC0: u1,
                    ///  Match or Capture Channel 1
                    MC1: u1,
                    padding: u2,
                }),
                ///  Status
                STATUS: mmio.Mmio(packed struct(u8) {
                    reserved3: u3,
                    ///  Stop
                    STOP: u1,
                    ///  Slave
                    SLAVE: u1,
                    reserved7: u2,
                    ///  Synchronization Busy
                    SYNCBUSY: u1,
                }),
                ///  COUNT32 Counter Value
                COUNT: mmio.Mmio(packed struct(u32) {
                    ///  Counter Value
                    COUNT: u32,
                }),
                reserved24: [4]u8,
                ///  COUNT32 Compare/Capture
                CC: mmio.Mmio(packed struct(u32) {
                    ///  Compare/Capture Value
                    CC: u32,
                }),
            },
        };

        ///  Watchdog Timer
        pub const WDT = extern struct {
            pub const WDT_CONFIG__PER = enum(u4) {
                ///  8 clock cycles
                @"8" = 0x0,
                ///  16 clock cycles
                @"16" = 0x1,
                ///  32 clock cycles
                @"32" = 0x2,
                ///  64 clock cycles
                @"64" = 0x3,
                ///  128 clock cycles
                @"128" = 0x4,
                ///  256 clock cycles
                @"256" = 0x5,
                ///  512 clock cycles
                @"512" = 0x6,
                ///  1024 clock cycles
                @"1K" = 0x7,
                ///  2048 clock cycles
                @"2K" = 0x8,
                ///  4096 clock cycles
                @"4K" = 0x9,
                ///  8192 clock cycles
                @"8K" = 0xa,
                ///  16384 clock cycles
                @"16K" = 0xb,
                _,
            };

            pub const WDT_CONFIG__WINDOW = enum(u4) {
                ///  8 clock cycles
                @"8" = 0x0,
                ///  16 clock cycles
                @"16" = 0x1,
                ///  32 clock cycles
                @"32" = 0x2,
                ///  64 clock cycles
                @"64" = 0x3,
                ///  128 clock cycles
                @"128" = 0x4,
                ///  256 clock cycles
                @"256" = 0x5,
                ///  512 clock cycles
                @"512" = 0x6,
                ///  1024 clock cycles
                @"1K" = 0x7,
                ///  2048 clock cycles
                @"2K" = 0x8,
                ///  4096 clock cycles
                @"4K" = 0x9,
                ///  8192 clock cycles
                @"8K" = 0xa,
                ///  16384 clock cycles
                @"16K" = 0xb,
                _,
            };

            pub const WDT_EWCTRL__EWOFFSET = enum(u4) {
                ///  8 clock cycles
                @"8" = 0x0,
                ///  16 clock cycles
                @"16" = 0x1,
                ///  32 clock cycles
                @"32" = 0x2,
                ///  64 clock cycles
                @"64" = 0x3,
                ///  128 clock cycles
                @"128" = 0x4,
                ///  256 clock cycles
                @"256" = 0x5,
                ///  512 clock cycles
                @"512" = 0x6,
                ///  1024 clock cycles
                @"1K" = 0x7,
                ///  2048 clock cycles
                @"2K" = 0x8,
                ///  4096 clock cycles
                @"4K" = 0x9,
                ///  8192 clock cycles
                @"8K" = 0xa,
                ///  16384 clock cycles
                @"16K" = 0xb,
                _,
            };

            pub const WDT_CLEAR__CLEAR = enum(u8) {
                ///  Clear Key
                KEY = 0xa5,
                _,
            };

            ///  Control
            CTRL: mmio.Mmio(packed struct(u8) {
                reserved1: u1,
                ///  Enable
                ENABLE: u1,
                ///  Watchdog Timer Window Mode Enable
                WEN: u1,
                reserved7: u4,
                ///  Always-On
                ALWAYSON: u1,
            }),
            ///  Configuration
            CONFIG: mmio.Mmio(packed struct(u8) {
                ///  Time-Out Period
                PER: packed union {
                    raw: u4,
                    value: WDT_CONFIG__PER,
                },
                ///  Window Mode Time-Out Period
                WINDOW: packed union {
                    raw: u4,
                    value: WDT_CONFIG__WINDOW,
                },
            }),
            ///  Early Warning Interrupt Control
            EWCTRL: mmio.Mmio(packed struct(u8) {
                ///  Early Warning Interrupt Time Offset
                EWOFFSET: packed union {
                    raw: u4,
                    value: WDT_EWCTRL__EWOFFSET,
                },
                padding: u4,
            }),
            reserved4: [1]u8,
            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u8) {
                ///  Early Warning Interrupt Enable
                EW: u1,
                padding: u7,
            }),
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u8) {
                ///  Early Warning Interrupt Enable
                EW: u1,
                padding: u7,
            }),
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u8) {
                ///  Early Warning
                EW: u1,
                padding: u7,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                reserved7: u7,
                ///  Synchronization Busy
                SYNCBUSY: u1,
            }),
            ///  Clear
            CLEAR: mmio.Mmio(packed struct(u8) {
                ///  Watchdog Clear
                CLEAR: packed union {
                    raw: u8,
                    value: WDT_CLEAR__CLEAR,
                },
            }),
        };

        ///  Nested Vectored Interrupt Controller
        pub const NVIC = extern struct {
            ///  Interrupt Set Enable Register
            ISER: mmio.Mmio(packed struct(u32) {
                ///  Interrupt set enable bits
                SETENA: u25,
                padding: u7,
            }),
            reserved128: [124]u8,
            ///  Interrupt Clear Enable Register
            ICER: mmio.Mmio(packed struct(u32) {
                ///  Interrupt clear-enable bits
                CLRENA: u25,
                padding: u7,
            }),
            reserved256: [124]u8,
            ///  Interrupt Set Pending Register
            ISPR: mmio.Mmio(packed struct(u32) {
                ///  Interrupt set-pending bits
                SETPEND: u25,
                padding: u7,
            }),
            reserved384: [124]u8,
            ///  Interrupt Clear Pending Register
            ICPR: mmio.Mmio(packed struct(u32) {
                ///  Interrupt clear-pending bits
                CLRPEND: u25,
                padding: u7,
            }),
            reserved768: [380]u8,
            ///  Interrupt Priority Register n
            IPR: mmio.Mmio(packed struct(u32) {
                ///  Priority of interrupt n
                PRI0: u2,
                reserved8: u6,
                ///  Priority of interrupt n
                PRI1: u2,
                reserved16: u6,
                ///  Priority of interrupt n
                PRI2: u2,
                reserved24: u6,
                ///  Priority of interrupt n
                PRI3: u2,
                padding: u6,
            }),
        };

        ///  System timer
        pub const SysTick = extern struct {
            pub const SysTick_CSR__CLKSOURCE = enum(u1) {
                ///  External clock
                VALUE_0 = 0x0,
                ///  Processor clock
                VALUE_1 = 0x1,
            };

            pub const SysTick_CSR__ENABLE = enum(u1) {
                ///  Counter disabled
                VALUE_0 = 0x0,
                ///  Counter enabled
                VALUE_1 = 0x1,
            };

            pub const SysTick_CSR__TICKINT = enum(u1) {
                ///  Counting down to 0 does not assert the SysTick exception request
                VALUE_0 = 0x0,
                ///  Counting down to 0 asserts the SysTick exception request
                VALUE_1 = 0x1,
            };

            pub const SysTick_CALIB__NOREF = enum(u1) {
                ///  The reference clock is provided
                VALUE_0 = 0x0,
                ///  The reference clock is not provided
                VALUE_1 = 0x1,
            };

            pub const SysTick_CALIB__SKEW = enum(u1) {
                ///  10ms calibration value is exact
                VALUE_0 = 0x0,
                ///  10ms calibration value is inexact, because of the clock frequency
                VALUE_1 = 0x1,
            };

            ///  SysTick Control and Status Register
            CSR: mmio.Mmio(packed struct(u32) {
                ///  SysTick Counter Enable
                ENABLE: packed union {
                    raw: u1,
                    value: SysTick_CSR__ENABLE,
                },
                ///  SysTick Exception Request Enable
                TICKINT: packed union {
                    raw: u1,
                    value: SysTick_CSR__TICKINT,
                },
                ///  Clock Source 0=external, 1=processor
                CLKSOURCE: packed union {
                    raw: u1,
                    value: SysTick_CSR__CLKSOURCE,
                },
                reserved16: u13,
                ///  Timer counted to 0 since last read of register
                COUNTFLAG: u1,
                padding: u15,
            }),
            ///  SysTick Reload Value Register
            RVR: mmio.Mmio(packed struct(u32) {
                ///  Value to load into the SysTick Current Value Register when the counter reaches 0
                RELOAD: u24,
                padding: u8,
            }),
            ///  SysTick Current Value Register
            CVR: mmio.Mmio(packed struct(u32) {
                ///  Current value at the time the register is accessed
                CURRENT: u24,
                padding: u8,
            }),
            ///  SysTick Calibration Value Register
            CALIB: mmio.Mmio(packed struct(u32) {
                ///  Reload value to use for 10ms timing
                TENMS: u24,
                reserved30: u6,
                ///  TENMS is rounded from non-integer ratio
                SKEW: packed union {
                    raw: u1,
                    value: SysTick_CALIB__SKEW,
                },
                ///  No Separate Reference Clock
                NOREF: packed union {
                    raw: u1,
                    value: SysTick_CALIB__NOREF,
                },
            }),
        };

        ///  System Control Registers
        pub const SystemControl = extern struct {
            pub const SystemControl_ICSR__NMIPENDSET = enum(u1) {
                ///  Write: no effect; read: NMI exception is not pending
                VALUE_0 = 0x0,
                ///  Write: changes NMI exception state to pending; read: NMI exception is pending
                VALUE_1 = 0x1,
            };

            pub const SystemControl_ICSR__PENDSTCLR = enum(u1) {
                ///  No effect
                VALUE_0 = 0x0,
                ///  Removes the pending state from the SysTick exception
                VALUE_1 = 0x1,
            };

            pub const SystemControl_ICSR__PENDSTSET = enum(u1) {
                ///  Write: no effect; read: SysTick exception is not pending
                VALUE_0 = 0x0,
                ///  Write: changes SysTick exception state to pending; read: SysTick exception is pending
                VALUE_1 = 0x1,
            };

            pub const SystemControl_ICSR__PENDSVCLR = enum(u1) {
                ///  No effect
                VALUE_0 = 0x0,
                ///  Removes the pending state from the PendSV exception
                VALUE_1 = 0x1,
            };

            pub const SystemControl_ICSR__PENDSVSET = enum(u1) {
                ///  Write: no effect; read: PendSV exception is not pending
                VALUE_0 = 0x0,
                ///  Write: changes PendSV exception state to pending; read: PendSV exception is pending
                VALUE_1 = 0x1,
            };

            pub const SystemControl_AIRCR__ENDIANNESS = enum(u1) {
                ///  Little-endian
                VALUE_0 = 0x0,
                ///  Big-endian
                VALUE_1 = 0x1,
            };

            pub const SystemControl_AIRCR__SYSRESETREQ = enum(u1) {
                ///  No system reset request
                VALUE_0 = 0x0,
                ///  Asserts a signal to the outer system that requests a reset
                VALUE_1 = 0x1,
            };

            pub const SystemControl_SCR__SEVONPEND = enum(u1) {
                ///  Only enabled interrupts or events can wakeup the processor, disabled interrupts are excluded
                VALUE_0 = 0x0,
                ///  Enabled events and all interrupts, including disabled interrupts, can wakeup the processor
                VALUE_1 = 0x1,
            };

            pub const SystemControl_SCR__SLEEPDEEP = enum(u1) {
                ///  Sleep
                VALUE_0 = 0x0,
                ///  Deep sleep
                VALUE_1 = 0x1,
            };

            pub const SystemControl_SCR__SLEEPONEXIT = enum(u1) {
                ///  O not sleep when returning to Thread mode
                VALUE_0 = 0x0,
                ///  Enter sleep, or deep sleep, on return from an ISR
                VALUE_1 = 0x1,
            };

            pub const SystemControl_CCR__STKALIGN = enum(u1) {
                ///  4-byte aligned
                VALUE_0 = 0x0,
                ///  8-byte aligned
                VALUE_1 = 0x1,
            };

            pub const SystemControl_CCR__UNALIGN_TRP = enum(u1) {
                ///  Do not trap unaligned halfword and word accesses
                VALUE_0 = 0x0,
                ///  Trap unaligned halfword and word accesses
                VALUE_1 = 0x1,
            };

            ///  CPUID Base Register
            CPUID: mmio.Mmio(packed struct(u32) {
                ///  Minor revision number
                REVISION: u4,
                ///  Processor Part Number, 0xC60=Cortex-M0+
                PARTNO: u12,
                ///  Processor Architecture, 0xC=ARMv6-M
                ARCHITECTURE: u4,
                ///  Major revision number
                VARIANT: u4,
                ///  Implementer code, ARM=0x41
                IMPLEMENTER: u8,
            }),
            ///  Interrupt Control and State Register
            ICSR: mmio.Mmio(packed struct(u32) {
                ///  Debug: Exception number of currently executing exception, or 0 if thread mode
                VECTACTIVE: u9,
                reserved12: u3,
                ///  Exception number of the highest priority pending enabled exception
                VECTPENDING: u9,
                reserved22: u1,
                ///  Debug: NVIC interrupt pending
                ISRPENDING: u1,
                ///  Debug: Pending exception serviced on exit from debug halt
                ISRPREEMPT: u1,
                reserved25: u1,
                ///  SysTick exception clear-pending bit
                PENDSTCLR: packed union {
                    raw: u1,
                    value: SystemControl_ICSR__PENDSTCLR,
                },
                ///  SysTick exception set-pending bit
                PENDSTSET: packed union {
                    raw: u1,
                    value: SystemControl_ICSR__PENDSTSET,
                },
                ///  PendSV clear-pending bit
                PENDSVCLR: packed union {
                    raw: u1,
                    value: SystemControl_ICSR__PENDSVCLR,
                },
                ///  PendSV set-pending bit
                PENDSVSET: packed union {
                    raw: u1,
                    value: SystemControl_ICSR__PENDSVSET,
                },
                reserved31: u2,
                ///  NMI set-pending bit
                NMIPENDSET: packed union {
                    raw: u1,
                    value: SystemControl_ICSR__NMIPENDSET,
                },
            }),
            ///  Vector Table Offset Register
            VTOR: mmio.Mmio(packed struct(u32) {
                reserved7: u7,
                ///  Vector table base offset
                TBLOFF: u25,
            }),
            ///  Application Interrupt and Reset Control Register
            AIRCR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Debug: Clear state information
                VECTCLRACTIVE: u1,
                ///  System Reset Request
                SYSRESETREQ: packed union {
                    raw: u1,
                    value: SystemControl_AIRCR__SYSRESETREQ,
                },
                reserved15: u12,
                ///  Data Endianness, 0=little, 1=big
                ENDIANNESS: packed union {
                    raw: u1,
                    value: SystemControl_AIRCR__ENDIANNESS,
                },
                ///  Register key (0x05FA)
                VECTKEY: u16,
            }),
            ///  System Control Register
            SCR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Sleep-On-Exit when exiting Handler mode
                SLEEPONEXIT: packed union {
                    raw: u1,
                    value: SystemControl_SCR__SLEEPONEXIT,
                },
                ///  Uses Deep Sleep as low power mode
                SLEEPDEEP: packed union {
                    raw: u1,
                    value: SystemControl_SCR__SLEEPDEEP,
                },
                reserved4: u1,
                ///  Send Event on Pending bit
                SEVONPEND: packed union {
                    raw: u1,
                    value: SystemControl_SCR__SEVONPEND,
                },
                padding: u27,
            }),
            ///  Configuration and Control Register
            CCR: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  Unaligned accesses generates a Hard Fault
                UNALIGN_TRP: packed union {
                    raw: u1,
                    value: SystemControl_CCR__UNALIGN_TRP,
                },
                reserved9: u5,
                ///  Stack 8-byte aligned on exception entry
                STKALIGN: packed union {
                    raw: u1,
                    value: SystemControl_CCR__STKALIGN,
                },
                padding: u22,
            }),
            reserved28: [4]u8,
            ///  System Handler Priority Register 2
            SHPR2: mmio.Mmio(packed struct(u32) {
                reserved24: u24,
                ///  Priority of system handler 11, SVCall
                PRI_11: u8,
            }),
            ///  System Handler Priority Register 3
            SHPR3: mmio.Mmio(packed struct(u32) {
                reserved16: u16,
                ///  Priority of system handler 14, PendSV
                PRI_14: u8,
                ///  Priority of system handler 15, SysTick exception
                PRI_15: u8,
            }),
            ///  System Handler Control and State Register
            SHCSR: mmio.Mmio(packed struct(u32) {
                reserved15: u15,
                ///  no description available
                SVCALLPENDED: u1,
                padding: u16,
            }),
            reserved48: [8]u8,
            ///  Debug Fault Status Register
            DFSR: mmio.Mmio(packed struct(u32) {
                ///  Halt request debug event active
                HALTED: u1,
                ///  Breakpoint debug event
                BKPT: u1,
                ///  DWT debug event
                DWTTRAP: u1,
                ///  Vector catch debug event
                VCATCH: u1,
                ///  EDBGRQ debug event
                EXTERNAL: u1,
                padding: u27,
            }),
        };
    };
};
