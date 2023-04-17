const micro = @import("microzig");
const mmio = micro.mmio;

pub const devices = struct {
    pub const ATSAMD21G18A = struct {
        pub const properties = struct {
            pub const family = "SAMD";
            pub const arch = "CORTEX-M0PLUS";
            pub const series = "SAMD21";
        };

        pub const VectorTable = extern struct {
            const Handler = micro.interrupt.Handler;
            const unhandled = micro.interrupt.unhandled;

            initial_stack_pointer: u32,
            Reset: Handler = unhandled,
            ///  Non maskable Interrupt, cannot be stopped or preempted
            NonMaskableInt: Handler = unhandled,
            ///  Hard Fault, all classes of Fault
            HardFault: Handler = unhandled,
            reserved2: [7]u32 = undefined,
            ///  System Service Call via SVC instruction
            SVCall: Handler = unhandled,
            reserved10: [2]u32 = undefined,
            ///  Pendable request for system service
            PendSV: Handler = unhandled,
            ///  System Tick Timer
            SysTick: Handler = unhandled,
            ///  Power Manager
            PM_PM: Handler = unhandled,
            ///  System Controller
            SYSCTRL_SYSCTRL: Handler = unhandled,
            ///  Watchdog Timer
            WDT_WDT: Handler = unhandled,
            ///  Real Time Counter
            RTC_RTC: Handler = unhandled,
            ///  External Interrupt Controller
            EIC_EIC: Handler = unhandled,
            ///  Non-Volatile Memory Controller
            NVMCTRL_NVMCTRL: Handler = unhandled,
            ///  Direct Memory Controller
            DMAC_DMAC: Handler = unhandled,
            ///  Universal Serial Bus
            USB_USB: Handler = unhandled,
            ///  Event Systems
            EVSYS_EVSYS: Handler = unhandled,
            ///  Serial Communication Interface 0
            SERCOM0_SERCOM0: Handler = unhandled,
            ///  Serial Communication Interface 1
            SERCOM1_SERCOM1: Handler = unhandled,
            ///  Serial Communication Interface 2
            SERCOM2_SERCOM2: Handler = unhandled,
            ///  Serial Communication Interface 3
            SERCOM3_SERCOM3: Handler = unhandled,
            ///  Serial Communication Interface 4
            SERCOM4_SERCOM4: Handler = unhandled,
            ///  Serial Communication Interface 5
            SERCOM5_SERCOM5: Handler = unhandled,
            ///  Timer/Counter for Control Applications 0
            TCC0_TCC0: Handler = unhandled,
            ///  Timer/Counter for Control Applications 1
            TCC1_TCC1: Handler = unhandled,
            ///  Timer/Counter for Control Applications 2
            TCC2_TCC2: Handler = unhandled,
            ///  Timer/Counter 3
            TC3_TC3: Handler = unhandled,
            ///  Timer/Counter 4
            TC4_TC4: Handler = unhandled,
            ///  Timer/Counter 5
            TC5_TC5: Handler = unhandled,
            reserved35: [2]u32 = undefined,
            ///  Analog-to-Digital Converter
            ADC_ADC: Handler = unhandled,
            ///  Analog Comparators
            AC_AC: Handler = unhandled,
            ///  Digital-to-Analog Converter
            DAC_DAC: Handler = unhandled,
            ///  Peripheral Touch Controller
            PTC_PTC: Handler = unhandled,
            ///  Inter-IC Sound Controller
            I2S_I2S: Handler = unhandled,
        };

        pub const VectorIndex = enum(i32) {
            ///  Reset Vector, invoked on Power up and warm reset
            Reset = -15,
            ///  Non maskable Interrupt, cannot be stopped or preempted
            NonMaskableInt = -14,
            ///  Hard Fault, all classes of Fault
            HardFault = -13,
            ///  System Service Call via SVC instruction
            SVCall = -5,
            ///  Pendable request for system service
            PendSV = -2,
            ///  System Tick Timer
            SysTick = -1,
            ///  Power Manager
            PM_PM = 0,
            ///  System Controller
            SYSCTRL_SYSCTRL = 1,
            ///  Watchdog Timer
            WDT_WDT = 2,
            ///  Real Time Counter
            RTC_RTC = 3,
            ///  External Interrupt Controller
            EIC_EIC = 4,
            ///  Non-Volatile Memory Controller
            NVMCTRL_NVMCTRL = 5,
            ///  Direct Memory Controller
            DMAC_DMAC = 6,
            ///  Universal Serial Bus
            USB_USB = 7,
            ///  Event Systems
            EVSYS_EVSYS = 8,
            ///  Serial Communication Interface 0
            SERCOM0_SERCOM0 = 9,
            ///  Serial Communication Interface 1
            SERCOM1_SERCOM1 = 10,
            ///  Serial Communication Interface 2
            SERCOM2_SERCOM2 = 11,
            ///  Serial Communication Interface 3
            SERCOM3_SERCOM3 = 12,
            ///  Serial Communication Interface 4
            SERCOM4_SERCOM4 = 13,
            ///  Serial Communication Interface 5
            SERCOM5_SERCOM5 = 14,
            ///  Timer/Counter for Control Applications 0
            TCC0_TCC0 = 15,
            ///  Timer/Counter for Control Applications 1
            TCC1_TCC1 = 16,
            ///  Timer/Counter for Control Applications 2
            TCC2_TCC2 = 17,
            ///  Timer/Counter 3
            TC3_TC3 = 18,
            ///  Timer/Counter 4
            TC4_TC4 = 19,
            ///  Timer/Counter 5
            TC5_TC5 = 20,
            ///  Analog-to-Digital Converter
            ADC_ADC = 23,
            ///  Analog Comparators
            AC_AC = 24,
            ///  Digital-to-Analog Converter
            DAC_DAC = 25,
            ///  Peripheral Touch Controller
            PTC_PTC = 26,
            ///  Inter-IC Sound Controller
            I2S_I2S = 27,
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
            ///  Direct Memory Access Controller
            pub const DMAC = @intToPtr(*volatile types.peripherals.DMAC.DMAC, 0x41004800);
            ///  Universal Serial Bus
            pub const USB = @intToPtr(*volatile types.peripherals.USB.USB, 0x41005000);
            ///  Cortex-M0+ Micro-Trace Buffer
            pub const MTB = @intToPtr(*volatile types.peripherals.MTB, 0x41006000);
            ///  HSB Matrix
            pub const SBMATRIX = @intToPtr(*volatile types.peripherals.HMATRIXB.HMATRIXB, 0x41007110);
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
            ///  Serial Communication Interface
            pub const SERCOM4 = @intToPtr(*volatile types.peripherals.SERCOM, 0x42001800);
            ///  Serial Communication Interface
            pub const SERCOM5 = @intToPtr(*volatile types.peripherals.SERCOM, 0x42001c00);
            ///  Timer Counter Control
            pub const TCC0 = @intToPtr(*volatile types.peripherals.TCC, 0x42002000);
            ///  Timer Counter Control
            pub const TCC1 = @intToPtr(*volatile types.peripherals.TCC, 0x42002400);
            ///  Timer Counter Control
            pub const TCC2 = @intToPtr(*volatile types.peripherals.TCC, 0x42002800);
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
            ///  Inter-IC Sound Interface
            pub const I2S = @intToPtr(*volatile types.peripherals.I2S, 0x42005000);
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
                ///  Internal Ground
                GND = 0x18,
                ///  I/O Ground
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
                ///  Left-Adjusted Result
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
            ///  Input Control
            INPUTCTRL: mmio.Mmio(packed struct(u32) {
                ///  Positive Mux Input Selection
                MUXPOS: packed union {
                    raw: u5,
                    value: ADC_INPUTCTRL__MUXPOS,
                },
                reserved8: u3,
                ///  Negative Mux Input Selection
                MUXNEG: packed union {
                    raw: u5,
                    value: ADC_INPUTCTRL__MUXNEG,
                },
                reserved16: u3,
                ///  Number of Input Channels Included in Scan
                INPUTSCAN: u4,
                ///  Positive Mux Setting Offset
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
                ///  Bypass DATABUF Write Protection
                BDWP: u1,
                reserved6: u1,
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
                ///  Data value to be converted
                DATA: u16,
            }),
            reserved12: [2]u8,
            ///  Data Buffer
            DATABUF: mmio.Mmio(packed struct(u16) {
                ///  Data Buffer
                DATABUF: u16,
            }),
        };

        ///  Direct Memory Access Controller
        pub const DMAC = struct {
            pub const DMAC_BTCTRL__BEATSIZE = enum(u2) {
                ///  8-bit bus transfer
                BYTE = 0x0,
                ///  16-bit bus transfer
                HWORD = 0x1,
                ///  32-bit bus transfer
                WORD = 0x2,
                _,
            };

            pub const DMAC_BTCTRL__BLOCKACT = enum(u2) {
                ///  Channel will be disabled if it is the last block transfer in the transaction
                NOACT = 0x0,
                ///  Channel will be disabled if it is the last block transfer in the transaction and block interrupt
                INT = 0x1,
                ///  Channel suspend operation is completed
                SUSPEND = 0x2,
                ///  Both channel suspend operation and block interrupt
                BOTH = 0x3,
            };

            pub const DMAC_BTCTRL__EVOSEL = enum(u2) {
                ///  Event generation disabled
                DISABLE = 0x0,
                ///  Event strobe when block transfer complete
                BLOCK = 0x1,
                ///  Event strobe when beat transfer complete
                BEAT = 0x3,
                _,
            };

            pub const DMAC_BTCTRL__STEPSEL = enum(u1) {
                ///  Step size settings apply to the destination address
                DST = 0x0,
                ///  Step size settings apply to the source address
                SRC = 0x1,
            };

            pub const DMAC_BTCTRL__STEPSIZE = enum(u3) {
                ///  Next ADDR = ADDR + (1<<BEATSIZE) * 1
                X1 = 0x0,
                ///  Next ADDR = ADDR + (1<<BEATSIZE) * 2
                X2 = 0x1,
                ///  Next ADDR = ADDR + (1<<BEATSIZE) * 4
                X4 = 0x2,
                ///  Next ADDR = ADDR + (1<<BEATSIZE) * 8
                X8 = 0x3,
                ///  Next ADDR = ADDR + (1<<BEATSIZE) * 16
                X16 = 0x4,
                ///  Next ADDR = ADDR + (1<<BEATSIZE) * 32
                X32 = 0x5,
                ///  Next ADDR = ADDR + (1<<BEATSIZE) * 64
                X64 = 0x6,
                ///  Next ADDR = ADDR + (1<<BEATSIZE) * 128
                X128 = 0x7,
            };

            pub const DMAC_CRCCTRL__CRCBEATSIZE = enum(u2) {
                ///  8-bit bus transfer
                BYTE = 0x0,
                ///  16-bit bus transfer
                HWORD = 0x1,
                ///  32-bit bus transfer
                WORD = 0x2,
                _,
            };

            pub const DMAC_CRCCTRL__CRCPOLY = enum(u2) {
                ///  CRC-16 (CRC-CCITT)
                CRC16 = 0x0,
                ///  CRC32 (IEEE 802.3)
                CRC32 = 0x1,
                _,
            };

            pub const DMAC_CRCCTRL__CRCSRC = enum(u6) {
                ///  No action
                NOACT = 0x0,
                ///  I/O interface
                IO = 0x1,
                _,
            };

            pub const DMAC_QOSCTRL__DQOS = enum(u2) {
                ///  Background (no sensitive operation)
                DISABLE = 0x0,
                ///  Sensitive Bandwidth
                LOW = 0x1,
                ///  Sensitive Latency
                MEDIUM = 0x2,
                ///  Critical Latency
                HIGH = 0x3,
            };

            pub const DMAC_QOSCTRL__FQOS = enum(u2) {
                ///  Background (no sensitive operation)
                DISABLE = 0x0,
                ///  Sensitive Bandwidth
                LOW = 0x1,
                ///  Sensitive Latency
                MEDIUM = 0x2,
                ///  Critical Latency
                HIGH = 0x3,
            };

            pub const DMAC_QOSCTRL__WRBQOS = enum(u2) {
                ///  Background (no sensitive operation)
                DISABLE = 0x0,
                ///  Sensitive Bandwidth
                LOW = 0x1,
                ///  Sensitive Latency
                MEDIUM = 0x2,
                ///  Critical Latency
                HIGH = 0x3,
            };

            pub const DMAC_CHCTRLB__CMD = enum(u2) {
                ///  No action
                NOACT = 0x0,
                ///  Channel suspend operation
                SUSPEND = 0x1,
                ///  Channel resume operation
                RESUME = 0x2,
                _,
            };

            pub const DMAC_CHCTRLB__EVACT = enum(u3) {
                ///  No action
                NOACT = 0x0,
                ///  Transfer and periodic transfer trigger
                TRIG = 0x1,
                ///  Conditional transfer trigger
                CTRIG = 0x2,
                ///  Conditional block transfer
                CBLOCK = 0x3,
                ///  Channel suspend operation
                SUSPEND = 0x4,
                ///  Channel resume operation
                RESUME = 0x5,
                ///  Skip next block suspend action
                SSKIP = 0x6,
                _,
            };

            pub const DMAC_CHCTRLB__LVL = enum(u2) {
                ///  Channel Priority Level 0
                LVL0 = 0x0,
                ///  Channel Priority Level 1
                LVL1 = 0x1,
                ///  Channel Priority Level 2
                LVL2 = 0x2,
                ///  Channel Priority Level 3
                LVL3 = 0x3,
            };

            pub const DMAC_CHCTRLB__TRIGACT = enum(u2) {
                ///  One trigger required for each block transfer
                BLOCK = 0x0,
                ///  One trigger required for each beat transfer
                BEAT = 0x2,
                ///  One trigger required for each transaction
                TRANSACTION = 0x3,
                _,
            };

            pub const DMAC_CHCTRLB__TRIGSRC = enum(u6) {
                ///  Only software/event triggers
                DISABLE = 0x0,
                _,
            };

            ///  Direct Memory Access Controller
            pub const DMAC = extern struct {
                ///  Control
                CTRL: mmio.Mmio(packed struct(u16) {
                    ///  Software Reset
                    SWRST: u1,
                    ///  DMA Enable
                    DMAENABLE: u1,
                    ///  CRC Enable
                    CRCENABLE: u1,
                    reserved8: u5,
                    ///  Priority Level 0 Enable
                    LVLEN0: u1,
                    ///  Priority Level 1 Enable
                    LVLEN1: u1,
                    ///  Priority Level 2 Enable
                    LVLEN2: u1,
                    ///  Priority Level 3 Enable
                    LVLEN3: u1,
                    padding: u4,
                }),
                ///  CRC Control
                CRCCTRL: mmio.Mmio(packed struct(u16) {
                    ///  CRC Beat Size
                    CRCBEATSIZE: packed union {
                        raw: u2,
                        value: DMAC_CRCCTRL__CRCBEATSIZE,
                    },
                    ///  CRC Polynomial Type
                    CRCPOLY: packed union {
                        raw: u2,
                        value: DMAC_CRCCTRL__CRCPOLY,
                    },
                    reserved8: u4,
                    ///  CRC Input Source
                    CRCSRC: packed union {
                        raw: u6,
                        value: DMAC_CRCCTRL__CRCSRC,
                    },
                    padding: u2,
                }),
                ///  CRC Data Input
                CRCDATAIN: mmio.Mmio(packed struct(u32) {
                    ///  CRC Data Input
                    CRCDATAIN: u32,
                }),
                ///  CRC Checksum
                CRCCHKSUM: mmio.Mmio(packed struct(u32) {
                    ///  CRC Checksum
                    CRCCHKSUM: u32,
                }),
                ///  CRC Status
                CRCSTATUS: mmio.Mmio(packed struct(u8) {
                    ///  CRC Module Busy
                    CRCBUSY: u1,
                    ///  CRC Zero
                    CRCZERO: u1,
                    padding: u6,
                }),
                ///  Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Run
                    DBGRUN: u1,
                    padding: u7,
                }),
                ///  QOS Control
                QOSCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Write-Back Quality of Service
                    WRBQOS: packed union {
                        raw: u2,
                        value: DMAC_QOSCTRL__WRBQOS,
                    },
                    ///  Fetch Quality of Service
                    FQOS: packed union {
                        raw: u2,
                        value: DMAC_QOSCTRL__FQOS,
                    },
                    ///  Data Transfer Quality of Service
                    DQOS: packed union {
                        raw: u2,
                        value: DMAC_QOSCTRL__DQOS,
                    },
                    padding: u2,
                }),
                reserved16: [1]u8,
                ///  Software Trigger Control
                SWTRIGCTRL: mmio.Mmio(packed struct(u32) {
                    ///  Channel 0 Software Trigger
                    SWTRIG0: u1,
                    ///  Channel 1 Software Trigger
                    SWTRIG1: u1,
                    ///  Channel 2 Software Trigger
                    SWTRIG2: u1,
                    ///  Channel 3 Software Trigger
                    SWTRIG3: u1,
                    ///  Channel 4 Software Trigger
                    SWTRIG4: u1,
                    ///  Channel 5 Software Trigger
                    SWTRIG5: u1,
                    ///  Channel 6 Software Trigger
                    SWTRIG6: u1,
                    ///  Channel 7 Software Trigger
                    SWTRIG7: u1,
                    ///  Channel 8 Software Trigger
                    SWTRIG8: u1,
                    ///  Channel 9 Software Trigger
                    SWTRIG9: u1,
                    ///  Channel 10 Software Trigger
                    SWTRIG10: u1,
                    ///  Channel 11 Software Trigger
                    SWTRIG11: u1,
                    padding: u20,
                }),
                ///  Priority Control 0
                PRICTRL0: mmio.Mmio(packed struct(u32) {
                    ///  Level 0 Channel Priority Number
                    LVLPRI0: u4,
                    reserved7: u3,
                    ///  Level 0 Round-Robin Scheduling Enable
                    RRLVLEN0: u1,
                    ///  Level 1 Channel Priority Number
                    LVLPRI1: u4,
                    reserved15: u3,
                    ///  Level 1 Round-Robin Scheduling Enable
                    RRLVLEN1: u1,
                    ///  Level 2 Channel Priority Number
                    LVLPRI2: u4,
                    reserved23: u3,
                    ///  Level 2 Round-Robin Scheduling Enable
                    RRLVLEN2: u1,
                    ///  Level 3 Channel Priority Number
                    LVLPRI3: u4,
                    reserved31: u3,
                    ///  Level 3 Round-Robin Scheduling Enable
                    RRLVLEN3: u1,
                }),
                reserved32: [8]u8,
                ///  Interrupt Pending
                INTPEND: mmio.Mmio(packed struct(u16) {
                    ///  Channel ID
                    ID: u4,
                    reserved8: u4,
                    ///  Transfer Error
                    TERR: u1,
                    ///  Transfer Complete
                    TCMPL: u1,
                    ///  Channel Suspend
                    SUSP: u1,
                    reserved13: u2,
                    ///  Fetch Error
                    FERR: u1,
                    ///  Busy
                    BUSY: u1,
                    ///  Pending
                    PEND: u1,
                }),
                reserved36: [2]u8,
                ///  Interrupt Status
                INTSTATUS: mmio.Mmio(packed struct(u32) {
                    ///  Channel 0 Pending Interrupt
                    CHINT0: u1,
                    ///  Channel 1 Pending Interrupt
                    CHINT1: u1,
                    ///  Channel 2 Pending Interrupt
                    CHINT2: u1,
                    ///  Channel 3 Pending Interrupt
                    CHINT3: u1,
                    ///  Channel 4 Pending Interrupt
                    CHINT4: u1,
                    ///  Channel 5 Pending Interrupt
                    CHINT5: u1,
                    ///  Channel 6 Pending Interrupt
                    CHINT6: u1,
                    ///  Channel 7 Pending Interrupt
                    CHINT7: u1,
                    ///  Channel 8 Pending Interrupt
                    CHINT8: u1,
                    ///  Channel 9 Pending Interrupt
                    CHINT9: u1,
                    ///  Channel 10 Pending Interrupt
                    CHINT10: u1,
                    ///  Channel 11 Pending Interrupt
                    CHINT11: u1,
                    padding: u20,
                }),
                ///  Busy Channels
                BUSYCH: mmio.Mmio(packed struct(u32) {
                    ///  Busy Channel 0
                    BUSYCH0: u1,
                    ///  Busy Channel 1
                    BUSYCH1: u1,
                    ///  Busy Channel 2
                    BUSYCH2: u1,
                    ///  Busy Channel 3
                    BUSYCH3: u1,
                    ///  Busy Channel 4
                    BUSYCH4: u1,
                    ///  Busy Channel 5
                    BUSYCH5: u1,
                    ///  Busy Channel 6
                    BUSYCH6: u1,
                    ///  Busy Channel 7
                    BUSYCH7: u1,
                    ///  Busy Channel 8
                    BUSYCH8: u1,
                    ///  Busy Channel 9
                    BUSYCH9: u1,
                    ///  Busy Channel 10
                    BUSYCH10: u1,
                    ///  Busy Channel 11
                    BUSYCH11: u1,
                    padding: u20,
                }),
                ///  Pending Channels
                PENDCH: mmio.Mmio(packed struct(u32) {
                    ///  Pending Channel 0
                    PENDCH0: u1,
                    ///  Pending Channel 1
                    PENDCH1: u1,
                    ///  Pending Channel 2
                    PENDCH2: u1,
                    ///  Pending Channel 3
                    PENDCH3: u1,
                    ///  Pending Channel 4
                    PENDCH4: u1,
                    ///  Pending Channel 5
                    PENDCH5: u1,
                    ///  Pending Channel 6
                    PENDCH6: u1,
                    ///  Pending Channel 7
                    PENDCH7: u1,
                    ///  Pending Channel 8
                    PENDCH8: u1,
                    ///  Pending Channel 9
                    PENDCH9: u1,
                    ///  Pending Channel 10
                    PENDCH10: u1,
                    ///  Pending Channel 11
                    PENDCH11: u1,
                    padding: u20,
                }),
                ///  Active Channel and Levels
                ACTIVE: mmio.Mmio(packed struct(u32) {
                    ///  Level 0 Channel Trigger Request Executing
                    LVLEX0: u1,
                    ///  Level 1 Channel Trigger Request Executing
                    LVLEX1: u1,
                    ///  Level 2 Channel Trigger Request Executing
                    LVLEX2: u1,
                    ///  Level 3 Channel Trigger Request Executing
                    LVLEX3: u1,
                    reserved8: u4,
                    ///  Active Channel ID
                    ID: u5,
                    reserved15: u2,
                    ///  Active Channel Busy
                    ABUSY: u1,
                    ///  Active Channel Block Transfer Count
                    BTCNT: u16,
                }),
                ///  Descriptor Memory Section Base Address
                BASEADDR: mmio.Mmio(packed struct(u32) {
                    ///  Descriptor Memory Base Address
                    BASEADDR: u32,
                }),
                ///  Write-Back Memory Section Base Address
                WRBADDR: mmio.Mmio(packed struct(u32) {
                    ///  Write-Back Memory Base Address
                    WRBADDR: u32,
                }),
                reserved63: [3]u8,
                ///  Channel ID
                CHID: mmio.Mmio(packed struct(u8) {
                    ///  Channel ID
                    ID: u4,
                    padding: u4,
                }),
                ///  Channel Control A
                CHCTRLA: mmio.Mmio(packed struct(u8) {
                    ///  Channel Software Reset
                    SWRST: u1,
                    ///  Channel Enable
                    ENABLE: u1,
                    padding: u6,
                }),
                reserved68: [3]u8,
                ///  Channel Control B
                CHCTRLB: mmio.Mmio(packed struct(u32) {
                    ///  Event Input Action
                    EVACT: packed union {
                        raw: u3,
                        value: DMAC_CHCTRLB__EVACT,
                    },
                    ///  Channel Event Input Enable
                    EVIE: u1,
                    ///  Channel Event Output Enable
                    EVOE: u1,
                    ///  Channel Arbitration Level
                    LVL: packed union {
                        raw: u2,
                        value: DMAC_CHCTRLB__LVL,
                    },
                    reserved8: u1,
                    ///  Trigger Source
                    TRIGSRC: packed union {
                        raw: u6,
                        value: DMAC_CHCTRLB__TRIGSRC,
                    },
                    reserved22: u8,
                    ///  Trigger Action
                    TRIGACT: packed union {
                        raw: u2,
                        value: DMAC_CHCTRLB__TRIGACT,
                    },
                    ///  Software Command
                    CMD: packed union {
                        raw: u2,
                        value: DMAC_CHCTRLB__CMD,
                    },
                    padding: u6,
                }),
                reserved76: [4]u8,
                ///  Channel Interrupt Enable Clear
                CHINTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Channel Transfer Error Interrupt Enable
                    TERR: u1,
                    ///  Channel Transfer Complete Interrupt Enable
                    TCMPL: u1,
                    ///  Channel Suspend Interrupt Enable
                    SUSP: u1,
                    padding: u5,
                }),
                ///  Channel Interrupt Enable Set
                CHINTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Channel Transfer Error Interrupt Enable
                    TERR: u1,
                    ///  Channel Transfer Complete Interrupt Enable
                    TCMPL: u1,
                    ///  Channel Suspend Interrupt Enable
                    SUSP: u1,
                    padding: u5,
                }),
                ///  Channel Interrupt Flag Status and Clear
                CHINTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Channel Transfer Error
                    TERR: u1,
                    ///  Channel Transfer Complete
                    TCMPL: u1,
                    ///  Channel Suspend
                    SUSP: u1,
                    padding: u5,
                }),
                ///  Channel Status
                CHSTATUS: mmio.Mmio(packed struct(u8) {
                    ///  Channel Pending
                    PEND: u1,
                    ///  Channel Busy
                    BUSY: u1,
                    ///  Channel Fetch Error
                    FERR: u1,
                    padding: u5,
                }),
            };

            ///  Direct Memory Access Controller
            pub const DMAC_DESCRIPTOR = extern struct {
                ///  Block Transfer Control
                BTCTRL: mmio.Mmio(packed struct(u16) {
                    ///  Descriptor Valid
                    VALID: u1,
                    ///  Event Output Selection
                    EVOSEL: packed union {
                        raw: u2,
                        value: DMAC_BTCTRL__EVOSEL,
                    },
                    ///  Block Action
                    BLOCKACT: packed union {
                        raw: u2,
                        value: DMAC_BTCTRL__BLOCKACT,
                    },
                    reserved8: u3,
                    ///  Beat Size
                    BEATSIZE: packed union {
                        raw: u2,
                        value: DMAC_BTCTRL__BEATSIZE,
                    },
                    ///  Source Address Increment Enable
                    SRCINC: u1,
                    ///  Destination Address Increment Enable
                    DSTINC: u1,
                    ///  Step Selection
                    STEPSEL: packed union {
                        raw: u1,
                        value: DMAC_BTCTRL__STEPSEL,
                    },
                    ///  Address Increment Step Size
                    STEPSIZE: packed union {
                        raw: u3,
                        value: DMAC_BTCTRL__STEPSIZE,
                    },
                }),
                ///  Block Transfer Count
                BTCNT: mmio.Mmio(packed struct(u16) {
                    ///  Block Transfer Count
                    BTCNT: u16,
                }),
                ///  Block Transfer Source Address
                SRCADDR: mmio.Mmio(packed struct(u32) {
                    ///  Transfer Source Address
                    SRCADDR: u32,
                }),
                ///  Block Transfer Destination Address
                DSTADDR: mmio.Mmio(packed struct(u32) {
                    ///  Transfer Destination Address
                    DSTADDR: u32,
                }),
                ///  Next Descriptor Address
                DESCADDR: mmio.Mmio(packed struct(u32) {
                    ///  Next Descriptor Address
                    DESCADDR: u32,
                }),
            };
        };

        ///  Device Service Unit
        pub const DSU = extern struct {
            ///  Control
            CTRL: mmio.Mmio(packed struct(u8) {
                ///  Software Reset
                SWRST: u1,
                reserved2: u1,
                ///  32-bit Cyclic Redundancy Check
                CRC: u1,
                ///  Memory Built-In Self-Test
                MBIST: u1,
                ///  Chip Erase
                CE: u1,
                padding: u3,
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
                reserved2: u2,
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
                ///  Revision
                REVISION: u4,
                ///  Die Identification
                DIE: u4,
                ///  Product Series
                SERIES: u6,
                reserved23: u1,
                ///  Product Family
                FAMILY: u5,
                ///  Processor
                PROCESSOR: u4,
            }),
            reserved4096: [4068]u8,
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
                ///  4KB Count
                FKBC: u4,
                padding: u24,
            }),
            reserved8160: [12]u8,
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

            pub const EVSYS_USER__CHANNEL = enum(u5) {
                ///  No Channel Output Selected
                @"0" = 0x0,
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
                CHANNEL: u4,
                reserved8: u4,
                ///  Software Event
                SWEVT: u1,
                reserved16: u7,
                ///  Event Generator Selection
                EVGEN: u7,
                reserved24: u1,
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
                USER: u5,
                reserved8: u3,
                ///  Channel Event Selection
                CHANNEL: packed union {
                    raw: u5,
                    value: EVSYS_USER__CHANNEL,
                },
                padding: u3,
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
                ///  Channel 8 User Ready
                USRRDY8: u1,
                ///  Channel 9 User Ready
                USRRDY9: u1,
                ///  Channel 10 User Ready
                USRRDY10: u1,
                ///  Channel 11 User Ready
                USRRDY11: u1,
                reserved24: u4,
                ///  Channel 8 Busy
                CHBUSY8: u1,
                ///  Channel 9 Busy
                CHBUSY9: u1,
                ///  Channel 10 Busy
                CHBUSY10: u1,
                ///  Channel 11 Busy
                CHBUSY11: u1,
                padding: u4,
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
                ///  Channel 8 Overrun Interrupt Enable
                OVR8: u1,
                ///  Channel 9 Overrun Interrupt Enable
                OVR9: u1,
                ///  Channel 10 Overrun Interrupt Enable
                OVR10: u1,
                ///  Channel 11 Overrun Interrupt Enable
                OVR11: u1,
                reserved24: u4,
                ///  Channel 8 Event Detection Interrupt Enable
                EVD8: u1,
                ///  Channel 9 Event Detection Interrupt Enable
                EVD9: u1,
                ///  Channel 10 Event Detection Interrupt Enable
                EVD10: u1,
                ///  Channel 11 Event Detection Interrupt Enable
                EVD11: u1,
                padding: u4,
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
                ///  Channel 8 Overrun Interrupt Enable
                OVR8: u1,
                ///  Channel 9 Overrun Interrupt Enable
                OVR9: u1,
                ///  Channel 10 Overrun Interrupt Enable
                OVR10: u1,
                ///  Channel 11 Overrun Interrupt Enable
                OVR11: u1,
                reserved24: u4,
                ///  Channel 8 Event Detection Interrupt Enable
                EVD8: u1,
                ///  Channel 9 Event Detection Interrupt Enable
                EVD9: u1,
                ///  Channel 10 Event Detection Interrupt Enable
                EVD10: u1,
                ///  Channel 11 Event Detection Interrupt Enable
                EVD11: u1,
                padding: u4,
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
                ///  Channel 8 Overrun
                OVR8: u1,
                ///  Channel 9 Overrun
                OVR9: u1,
                ///  Channel 10 Overrun
                OVR10: u1,
                ///  Channel 11 Overrun
                OVR11: u1,
                reserved24: u4,
                ///  Channel 8 Event Detection
                EVD8: u1,
                ///  Channel 9 Event Detection
                EVD9: u1,
                ///  Channel 10 Event Detection
                EVD10: u1,
                ///  Channel 11 Event Detection
                EVD11: u1,
                padding: u4,
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
                ///  Generic clock generator 8
                GCLK8 = 0x8,
                _,
            };

            pub const GCLK_CLKCTRL__ID = enum(u6) {
                ///  DFLL48
                DFLL48 = 0x0,
                ///  FDPLL
                FDPLL = 0x1,
                ///  FDPLL32K
                FDPLL32K = 0x2,
                ///  WDT
                WDT = 0x3,
                ///  RTC
                RTC = 0x4,
                ///  EIC
                EIC = 0x5,
                ///  USB
                USB = 0x6,
                ///  EVSYS_0
                EVSYS_0 = 0x7,
                ///  EVSYS_1
                EVSYS_1 = 0x8,
                ///  EVSYS_2
                EVSYS_2 = 0x9,
                ///  EVSYS_3
                EVSYS_3 = 0xa,
                ///  EVSYS_4
                EVSYS_4 = 0xb,
                ///  EVSYS_5
                EVSYS_5 = 0xc,
                ///  EVSYS_6
                EVSYS_6 = 0xd,
                ///  EVSYS_7
                EVSYS_7 = 0xe,
                ///  EVSYS_8
                EVSYS_8 = 0xf,
                ///  EVSYS_9
                EVSYS_9 = 0x10,
                ///  EVSYS_10
                EVSYS_10 = 0x11,
                ///  EVSYS_11
                EVSYS_11 = 0x12,
                ///  SERCOMX_SLOW
                SERCOMX_SLOW = 0x13,
                ///  SERCOM0_CORE
                SERCOM0_CORE = 0x14,
                ///  SERCOM1_CORE
                SERCOM1_CORE = 0x15,
                ///  SERCOM2_CORE
                SERCOM2_CORE = 0x16,
                ///  SERCOM3_CORE
                SERCOM3_CORE = 0x17,
                ///  SERCOM4_CORE
                SERCOM4_CORE = 0x18,
                ///  SERCOM5_CORE
                SERCOM5_CORE = 0x19,
                ///  TCC0_TCC1
                TCC0_TCC1 = 0x1a,
                ///  TCC2_TC3
                TCC2_TC3 = 0x1b,
                ///  TC4_TC5
                TC4_TC5 = 0x1c,
                ///  TC6_TC7
                TC6_TC7 = 0x1d,
                ///  ADC
                ADC = 0x1e,
                ///  AC_DIG
                AC_DIG = 0x1f,
                ///  AC_ANA
                AC_ANA = 0x20,
                ///  DAC
                DAC = 0x21,
                ///  I2S_0
                I2S_0 = 0x23,
                ///  I2S_1
                I2S_1 = 0x24,
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
                ///  DPLL96M output
                DPLL96M = 0x8,
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
                ID: u4,
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
                ID: u4,
                reserved8: u4,
                ///  Division Factor
                DIV: u16,
                padding: u8,
            }),
        };

        ///  HSB Matrix
        pub const HMATRIXB = struct {
            pub const PRS = extern struct {
                ///  Priority A for Slave
                PRAS: u32,
                ///  Priority B for Slave
                PRBS: u32,
            };

            ///  HSB Matrix
            pub const HMATRIXB = extern struct {
                ///  Special Function
                SFR: mmio.Mmio(packed struct(u32) {
                    ///  Special Function Register
                    SFR: u32,
                }),
            };
        };

        ///  Inter-IC Sound Interface
        pub const I2S = extern struct {
            pub const I2S_CLKCTRL__BITDELAY = enum(u1) {
                ///  Left Justified (0 Bit Delay)
                LJ = 0x0,
                ///  I2S (1 Bit Delay)
                I2S = 0x1,
            };

            pub const I2S_CLKCTRL__FSSEL = enum(u1) {
                ///  Divided Serial Clock n is used as Frame Sync n source
                SCKDIV = 0x0,
                ///  FSn input pin is used as Frame Sync n source
                FSPIN = 0x1,
            };

            pub const I2S_CLKCTRL__FSWIDTH = enum(u2) {
                ///  Frame Sync Pulse is 1 Slot wide (default for I2S protocol)
                SLOT = 0x0,
                ///  Frame Sync Pulse is half a Frame wide
                HALF = 0x1,
                ///  Frame Sync Pulse is 1 Bit wide
                BIT = 0x2,
                ///  Clock Unit n operates in Burst mode, with a 1-bit wide Frame Sync pulse per Data sample, only when Data transfer is requested
                BURST = 0x3,
            };

            pub const I2S_CLKCTRL__MCKSEL = enum(u1) {
                ///  GCLK_I2S_n is used as Master Clock n source
                GCLK = 0x0,
                ///  MCKn input pin is used as Master Clock n source
                MCKPIN = 0x1,
            };

            pub const I2S_CLKCTRL__SCKSEL = enum(u1) {
                ///  Divided Master Clock n is used as Serial Clock n source
                MCKDIV = 0x0,
                ///  SCKn input pin is used as Serial Clock n source
                SCKPIN = 0x1,
            };

            pub const I2S_CLKCTRL__SLOTSIZE = enum(u2) {
                ///  8-bit Slot for Clock Unit n
                @"8" = 0x0,
                ///  16-bit Slot for Clock Unit n
                @"16" = 0x1,
                ///  24-bit Slot for Clock Unit n
                @"24" = 0x2,
                ///  32-bit Slot for Clock Unit n
                @"32" = 0x3,
            };

            pub const I2S_SERCTRL__BITREV = enum(u1) {
                ///  Transfer Data Most Significant Bit (MSB) first (default for I2S protocol)
                MSBIT = 0x0,
                ///  Transfer Data Least Significant Bit (LSB) first
                LSBIT = 0x1,
            };

            pub const I2S_SERCTRL__CLKSEL = enum(u1) {
                ///  Use Clock Unit 0
                CLK0 = 0x0,
                ///  Use Clock Unit 1
                CLK1 = 0x1,
            };

            pub const I2S_SERCTRL__DATASIZE = enum(u3) {
                ///  32 bits
                @"32" = 0x0,
                ///  24 bits
                @"24" = 0x1,
                ///  20 bits
                @"20" = 0x2,
                ///  18 bits
                @"18" = 0x3,
                ///  16 bits
                @"16" = 0x4,
                ///  16 bits compact stereo
                @"16C" = 0x5,
                ///  8 bits
                @"8" = 0x6,
                ///  8 bits compact stereo
                @"8C" = 0x7,
            };

            pub const I2S_SERCTRL__DMA = enum(u1) {
                ///  Single DMA channel
                SINGLE = 0x0,
                ///  One DMA channel per data channel
                MULTIPLE = 0x1,
            };

            pub const I2S_SERCTRL__EXTEND = enum(u2) {
                ///  Extend with zeroes
                ZERO = 0x0,
                ///  Extend with ones
                ONE = 0x1,
                ///  Extend with Most Significant Bit
                MSBIT = 0x2,
                ///  Extend with Least Significant Bit
                LSBIT = 0x3,
            };

            pub const I2S_SERCTRL__MONO = enum(u1) {
                ///  Normal mode
                STEREO = 0x0,
                ///  Left channel data is duplicated to right channel
                MONO = 0x1,
            };

            pub const I2S_SERCTRL__SERMODE = enum(u2) {
                ///  Receive
                RX = 0x0,
                ///  Transmit
                TX = 0x1,
                ///  Receive one PDM data on each serial clock edge
                PDM2 = 0x2,
                _,
            };

            pub const I2S_SERCTRL__SLOTADJ = enum(u1) {
                ///  Data is right adjusted in slot
                RIGHT = 0x0,
                ///  Data is left adjusted in slot
                LEFT = 0x1,
            };

            pub const I2S_SERCTRL__TXDEFAULT = enum(u2) {
                ///  Output Default Value is 0
                ZERO = 0x0,
                ///  Output Default Value is 1
                ONE = 0x1,
                ///  Output Default Value is high impedance
                HIZ = 0x3,
                _,
            };

            pub const I2S_SERCTRL__TXSAME = enum(u1) {
                ///  Zero data transmitted in case of underrun
                ZERO = 0x0,
                ///  Last data transmitted in case of underrun
                SAME = 0x1,
            };

            pub const I2S_SERCTRL__WORDADJ = enum(u1) {
                ///  Data is right adjusted in word
                RIGHT = 0x0,
                ///  Data is left adjusted in word
                LEFT = 0x1,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Software Reset
                SWRST: u1,
                ///  Enable
                ENABLE: u1,
                ///  Clock Unit 0 Enable
                CKEN0: u1,
                ///  Clock Unit 1 Enable
                CKEN1: u1,
                ///  Serializer 0 Enable
                SEREN0: u1,
                ///  Serializer 1 Enable
                SEREN1: u1,
                padding: u2,
            }),
            reserved4: [3]u8,
            ///  Clock Unit n Control
            CLKCTRL: mmio.Mmio(packed struct(u32) {
                ///  Slot Size
                SLOTSIZE: packed union {
                    raw: u2,
                    value: I2S_CLKCTRL__SLOTSIZE,
                },
                ///  Number of Slots in Frame
                NBSLOTS: u3,
                ///  Frame Sync Width
                FSWIDTH: packed union {
                    raw: u2,
                    value: I2S_CLKCTRL__FSWIDTH,
                },
                ///  Data Delay from Frame Sync
                BITDELAY: packed union {
                    raw: u1,
                    value: I2S_CLKCTRL__BITDELAY,
                },
                ///  Frame Sync Select
                FSSEL: packed union {
                    raw: u1,
                    value: I2S_CLKCTRL__FSSEL,
                },
                reserved11: u2,
                ///  Frame Sync Invert
                FSINV: u1,
                ///  Serial Clock Select
                SCKSEL: packed union {
                    raw: u1,
                    value: I2S_CLKCTRL__SCKSEL,
                },
                reserved16: u3,
                ///  Master Clock Select
                MCKSEL: packed union {
                    raw: u1,
                    value: I2S_CLKCTRL__MCKSEL,
                },
                reserved18: u1,
                ///  Master Clock Enable
                MCKEN: u1,
                ///  Master Clock Division Factor
                MCKDIV: u5,
                ///  Master Clock Output Division Factor
                MCKOUTDIV: u5,
                ///  Frame Sync Output Invert
                FSOUTINV: u1,
                ///  Serial Clock Output Invert
                SCKOUTINV: u1,
                ///  Master Clock Output Invert
                MCKOUTINV: u1,
            }),
            reserved12: [4]u8,
            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u16) {
                ///  Receive Ready 0 Interrupt Enable
                RXRDY0: u1,
                ///  Receive Ready 1 Interrupt Enable
                RXRDY1: u1,
                reserved4: u2,
                ///  Receive Overrun 0 Interrupt Enable
                RXOR0: u1,
                ///  Receive Overrun 1 Interrupt Enable
                RXOR1: u1,
                reserved8: u2,
                ///  Transmit Ready 0 Interrupt Enable
                TXRDY0: u1,
                ///  Transmit Ready 1 Interrupt Enable
                TXRDY1: u1,
                reserved12: u2,
                ///  Transmit Underrun 0 Interrupt Enable
                TXUR0: u1,
                ///  Transmit Underrun 1 Interrupt Enable
                TXUR1: u1,
                padding: u2,
            }),
            reserved16: [2]u8,
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u16) {
                ///  Receive Ready 0 Interrupt Enable
                RXRDY0: u1,
                ///  Receive Ready 1 Interrupt Enable
                RXRDY1: u1,
                reserved4: u2,
                ///  Receive Overrun 0 Interrupt Enable
                RXOR0: u1,
                ///  Receive Overrun 1 Interrupt Enable
                RXOR1: u1,
                reserved8: u2,
                ///  Transmit Ready 0 Interrupt Enable
                TXRDY0: u1,
                ///  Transmit Ready 1 Interrupt Enable
                TXRDY1: u1,
                reserved12: u2,
                ///  Transmit Underrun 0 Interrupt Enable
                TXUR0: u1,
                ///  Transmit Underrun 1 Interrupt Enable
                TXUR1: u1,
                padding: u2,
            }),
            reserved20: [2]u8,
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u16) {
                ///  Receive Ready 0
                RXRDY0: u1,
                ///  Receive Ready 1
                RXRDY1: u1,
                reserved4: u2,
                ///  Receive Overrun 0
                RXOR0: u1,
                ///  Receive Overrun 1
                RXOR1: u1,
                reserved8: u2,
                ///  Transmit Ready 0
                TXRDY0: u1,
                ///  Transmit Ready 1
                TXRDY1: u1,
                reserved12: u2,
                ///  Transmit Underrun 0
                TXUR0: u1,
                ///  Transmit Underrun 1
                TXUR1: u1,
                padding: u2,
            }),
            reserved24: [2]u8,
            ///  Synchronization Status
            SYNCBUSY: mmio.Mmio(packed struct(u16) {
                ///  Software Reset Synchronization Status
                SWRST: u1,
                ///  Enable Synchronization Status
                ENABLE: u1,
                ///  Clock Unit 0 Enable Synchronization Status
                CKEN0: u1,
                ///  Clock Unit 1 Enable Synchronization Status
                CKEN1: u1,
                ///  Serializer 0 Enable Synchronization Status
                SEREN0: u1,
                ///  Serializer 1 Enable Synchronization Status
                SEREN1: u1,
                reserved8: u2,
                ///  Data 0 Synchronization Status
                DATA0: u1,
                ///  Data 1 Synchronization Status
                DATA1: u1,
                padding: u6,
            }),
            reserved32: [6]u8,
            ///  Serializer n Control
            SERCTRL: mmio.Mmio(packed struct(u32) {
                ///  Serializer Mode
                SERMODE: packed union {
                    raw: u2,
                    value: I2S_SERCTRL__SERMODE,
                },
                ///  Line Default Line when Slot Disabled
                TXDEFAULT: packed union {
                    raw: u2,
                    value: I2S_SERCTRL__TXDEFAULT,
                },
                ///  Transmit Data when Underrun
                TXSAME: packed union {
                    raw: u1,
                    value: I2S_SERCTRL__TXSAME,
                },
                ///  Clock Unit Selection
                CLKSEL: packed union {
                    raw: u1,
                    value: I2S_SERCTRL__CLKSEL,
                },
                reserved7: u1,
                ///  Data Slot Formatting Adjust
                SLOTADJ: packed union {
                    raw: u1,
                    value: I2S_SERCTRL__SLOTADJ,
                },
                ///  Data Word Size
                DATASIZE: packed union {
                    raw: u3,
                    value: I2S_SERCTRL__DATASIZE,
                },
                reserved12: u1,
                ///  Data Word Formatting Adjust
                WORDADJ: packed union {
                    raw: u1,
                    value: I2S_SERCTRL__WORDADJ,
                },
                ///  Data Formatting Bit Extension
                EXTEND: packed union {
                    raw: u2,
                    value: I2S_SERCTRL__EXTEND,
                },
                ///  Data Formatting Bit Reverse
                BITREV: packed union {
                    raw: u1,
                    value: I2S_SERCTRL__BITREV,
                },
                ///  Slot 0 Disabled for this Serializer
                SLOTDIS0: u1,
                ///  Slot 1 Disabled for this Serializer
                SLOTDIS1: u1,
                ///  Slot 2 Disabled for this Serializer
                SLOTDIS2: u1,
                ///  Slot 3 Disabled for this Serializer
                SLOTDIS3: u1,
                ///  Slot 4 Disabled for this Serializer
                SLOTDIS4: u1,
                ///  Slot 5 Disabled for this Serializer
                SLOTDIS5: u1,
                ///  Slot 6 Disabled for this Serializer
                SLOTDIS6: u1,
                ///  Slot 7 Disabled for this Serializer
                SLOTDIS7: u1,
                ///  Mono Mode
                MONO: packed union {
                    raw: u1,
                    value: I2S_SERCTRL__MONO,
                },
                ///  Single or Multiple DMA Channels
                DMA: packed union {
                    raw: u1,
                    value: I2S_SERCTRL__DMA,
                },
                ///  Loop-back Test Mode
                RXLOOP: u1,
                padding: u5,
            }),
            reserved48: [12]u8,
            ///  Data n
            DATA: mmio.Mmio(packed struct(u32) {
                ///  Sample Data
                DATA: u32,
            }),
        };

        ///  Cortex-M0+ Micro-Trace Buffer
        pub const MTB = extern struct {
            ///  MTB Position
            POSITION: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  Pointer Value Wraps
                WRAP: u1,
                ///  Trace Packet Location Pointer
                POINTER: u29,
            }),
            ///  MTB Master
            MASTER: mmio.Mmio(packed struct(u32) {
                ///  Maximum Value of the Trace Buffer in SRAM
                MASK: u5,
                ///  Trace Start Input Enable
                TSTARTEN: u1,
                ///  Trace Stop Input Enable
                TSTOPEN: u1,
                ///  Special Function Register Write Privilege
                SFRWPRIV: u1,
                ///  SRAM Privilege
                RAMPRIV: u1,
                ///  Halt Request
                HALTREQ: u1,
                reserved31: u21,
                ///  Main Trace Enable
                EN: u1,
            }),
            ///  MTB Flow
            FLOW: mmio.Mmio(packed struct(u32) {
                ///  Auto Stop Tracing
                AUTOSTOP: u1,
                ///  Auto Halt Request
                AUTOHALT: u1,
                reserved3: u1,
                ///  Watermark value
                WATERMARK: u29,
            }),
            ///  MTB Base
            BASE: u32,
            reserved3840: [3824]u8,
            ///  MTB Integration Mode Control
            ITCTRL: u32,
            reserved4000: [156]u8,
            ///  MTB Claim Set
            CLAIMSET: u32,
            ///  MTB Claim Clear
            CLAIMCLR: u32,
            reserved4016: [8]u8,
            ///  MTB Lock Access
            LOCKACCESS: u32,
            ///  MTB Lock Status
            LOCKSTATUS: u32,
            ///  MTB Authentication Status
            AUTHSTATUS: u32,
            ///  MTB Device Architecture
            DEVARCH: u32,
            reserved4040: [8]u8,
            ///  MTB Device Configuration
            DEVID: u32,
            ///  MTB Device Type
            DEVTYPE: u32,
            ///  CoreSight
            PID4: u32,
            ///  CoreSight
            PID5: u32,
            ///  CoreSight
            PID6: u32,
            ///  CoreSight
            PID7: u32,
            ///  CoreSight
            PID0: u32,
            ///  CoreSight
            PID1: u32,
            ///  CoreSight
            PID2: u32,
            ///  CoreSight
            PID3: u32,
            ///  CoreSight
            CID0: u32,
            ///  CoreSight
            CID1: u32,
            ///  CoreSight
            CID2: u32,
            ///  CoreSight
            CID3: u32,
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
                ///  Invalidates all cache lines.
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

            pub const SYSCTRL_BOD33__ENABLE = enum(u1) {
                ///  BOD33 is disabled
                DISABLED = 0x0,
                ///  BOD33 is enabled
                ENABLED = 0x1,
            };

            pub const SYSCTRL_BOD33__ACTION = enum(u2) {
                ///  No action
                NONE = 0x0,
                ///  The BOD33 generates a reset
                RESET = 0x1,
                ///  The BOD33 generates an interrupt
                INTERRUPT = 0x2,
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

            pub const SYSCTRL_BOD33__HYST = enum(u1) {
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
                    OSC32K_CAL: u7,
                    ///  USB pad Transn calibration
                    USB_TRANSN: u5,
                    ///  USB pad Transp calibration
                    USB_TRANSP: u5,
                    ///  USB pad Trim calibration
                    USB_TRIM: u3,
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
                    ROOM_TEMP_VAL_INT: u8,
                    ///  Decimal part of room temperature
                    ROOM_TEMP_VAL_DEC: u4,
                    ///  Integer part of hot temperature in oC
                    HOT_TEMP_VAL_INT: u8,
                    ///  Decimal part of hot temperature
                    HOT_TEMP_VAL_DEC: u4,
                    ///  2's complement of the internal 1V reference drift at room temperature (versus a 1.0 centered value)
                    ROOM_INT1V_VAL: u8,
                }),
                ///  TEMP_LOG Page Word 1
                TEMP_LOG_WORD_1: mmio.Mmio(packed struct(u32) {
                    ///  2's complement of the internal 1V reference drift at hot temperature (versus a 1.0 centered value)
                    HOT_INT1V_VAL: u8,
                    ///  12-bit ADC conversion at room temperature
                    ROOM_ADC_VAL: u12,
                    ///  12-bit ADC conversion at hot temperature
                    HOT_ADC_VAL: u12,
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
                        value: SYSCTRL_BOD33__ENABLE,
                    },
                    ///  BOD33 Action
                    BOD33_ACTION: packed union {
                        raw: u2,
                        value: SYSCTRL_BOD33__ACTION,
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
                        value: SYSCTRL_BOD33__HYST,
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
                ///  DMAC AHB Clock Mask
                DMAC_: u1,
                ///  USB AHB Clock Mask
                USB_: u1,
                padding: u25,
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
                ///  DMAC APB Clock Enable
                DMAC_: u1,
                ///  USB APB Clock Enable
                USB_: u1,
                ///  HMATRIX APB Clock Enable
                HMATRIX_: u1,
                padding: u25,
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
                ///  SERCOM4 APB Clock Enable
                SERCOM4_: u1,
                ///  SERCOM5 APB Clock Enable
                SERCOM5_: u1,
                ///  TCC0 APB Clock Enable
                TCC0_: u1,
                ///  TCC1 APB Clock Enable
                TCC1_: u1,
                ///  TCC2 APB Clock Enable
                TCC2_: u1,
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
                ///  I2S APB Clock Enable
                I2S_: u1,
                padding: u11,
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

            pub const SERCOM_I2CM_CTRLA__SPEED = enum(u2) {
                ///  Standard Mode(Sm) Upto 100kHz and Fast Mode(Fm) Upto 400kHz
                STANDARD_AND_FAST_MODE = 0x0,
                ///  Fast-mode Plus Upto 1MHz
                FASTPLUS_MODE = 0x1,
                ///  High-speed mode Upto 3.4MHz
                HIGH_SPEED_MODE = 0x2,
                _,
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
                ///  SPI Address mask
                MASK = 0x0,
                ///  Two unique Addressess
                @"2_ADDRESSES" = 0x1,
                ///  Address Range
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
                ///  Auto-baud - break detection and auto-baud
                USART_FRAME_AUTO_BAUD_NO_PARITY = 0x4,
                ///  Auto-baud - break detection and auto-baud with parity
                USART_FRAME_AUTO_BAUD_WITH_PARITY = 0x5,
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

            pub const SERCOM_USART_CTRLA__TXPO = enum(u2) {
                ///  SERCOM PAD[0] is used for data transmission
                PAD0 = 0x0,
                ///  SERCOM PAD[2] is used for data transmission
                PAD2 = 0x1,
                _,
            };

            pub const SERCOM_USART_CTRLA__SAMPR = enum(u3) {
                ///  16x over-sampling using arithmetic baudrate generation
                @"16X_ARITHMETIC" = 0x0,
                ///  16x over-sampling using fractional baudrate generation
                @"16X_FRACTIONAL" = 0x1,
                ///  8x over-sampling using arithmetic baudrate generation
                @"8X_ARITHMETIC" = 0x2,
                ///  8x over-sampling using fractional baudrate generation
                @"8X_FRACTIONAL" = 0x3,
                ///  3x over-sampling using arithmetic baudrate generation
                @"3X_ARITHMETIC" = 0x4,
                _,
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
                    ///  Master SCL Low Extend Timeout
                    MEXTTOEN: u1,
                    ///  Slave SCL Low Extend Timeout
                    SEXTTOEN: u1,
                    ///  Transfer Speed
                    SPEED: packed union {
                        raw: u2,
                        value: SERCOM_I2CM_CTRLA__SPEED,
                    },
                    reserved27: u1,
                    ///  SCL Clock Stretch Mode
                    SCLSM: u1,
                    ///  Inactive Time-Out
                    INACTOUT: packed union {
                        raw: u2,
                        value: SERCOM_I2CM_CTRLA__INACTOUT,
                    },
                    ///  SCL Low Timeout Enable
                    LOWTOUTEN: u1,
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
                reserved12: [4]u8,
                ///  I2CM Baud Rate
                BAUD: mmio.Mmio(packed struct(u32) {
                    ///  Baud Rate Value
                    BAUD: u8,
                    ///  Baud Rate Value Low
                    BAUDLOW: u8,
                    ///  High Speed Baud Rate Value
                    HSBAUD: u8,
                    ///  High Speed Baud Rate Value Low
                    HSBAUDLOW: u8,
                }),
                reserved20: [4]u8,
                ///  I2CM Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Master On Bus Interrupt Disable
                    MB: u1,
                    ///  Slave On Bus Interrupt Disable
                    SB: u1,
                    reserved7: u5,
                    ///  Combined Error Interrupt Disable
                    ERROR: u1,
                }),
                reserved22: [1]u8,
                ///  I2CM Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Master On Bus Interrupt Enable
                    MB: u1,
                    ///  Slave On Bus Interrupt Enable
                    SB: u1,
                    reserved7: u5,
                    ///  Combined Error Interrupt Enable
                    ERROR: u1,
                }),
                reserved24: [1]u8,
                ///  I2CM Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Master On Bus Interrupt
                    MB: u1,
                    ///  Slave On Bus Interrupt
                    SB: u1,
                    reserved7: u5,
                    ///  Combined Error Interrupt
                    ERROR: u1,
                }),
                reserved26: [1]u8,
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
                    ///  SCL Low Timeout
                    LOWTOUT: u1,
                    ///  Clock Hold
                    CLKHOLD: u1,
                    ///  Master SCL Low Extend Timeout
                    MEXTTOUT: u1,
                    ///  Slave SCL Low Extend Timeout
                    SEXTTOUT: u1,
                    ///  Length Error
                    LENERR: u1,
                    padding: u5,
                }),
                ///  I2CM Synchronization Busy
                SYNCBUSY: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset Synchronization Busy
                    SWRST: u1,
                    ///  SERCOM Enable Synchronization Busy
                    ENABLE: u1,
                    ///  System Operation Synchronization Busy
                    SYSOP: u1,
                    padding: u29,
                }),
                reserved36: [4]u8,
                ///  I2CM Address
                ADDR: mmio.Mmio(packed struct(u32) {
                    ///  Address Value
                    ADDR: u11,
                    reserved13: u2,
                    ///  Length Enable
                    LENEN: u1,
                    ///  High Speed Mode
                    HS: u1,
                    ///  Ten Bit Addressing Enable
                    TENBITEN: u1,
                    ///  Length
                    LEN: u8,
                    padding: u8,
                }),
                ///  I2CM Data
                DATA: mmio.Mmio(packed struct(u8) {
                    ///  Data Value
                    DATA: u8,
                }),
                reserved48: [7]u8,
                ///  I2CM Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Mode
                    DBGSTOP: u1,
                    padding: u7,
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
                    ///  Run during Standby
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
                    reserved23: u1,
                    ///  Slave SCL Low Extend Timeout
                    SEXTTOEN: u1,
                    ///  Transfer Speed
                    SPEED: packed union {
                        raw: u2,
                        value: SERCOM_I2CM_CTRLA__SPEED,
                    },
                    reserved27: u1,
                    ///  SCL Clock Stretch Mode
                    SCLSM: u1,
                    reserved30: u2,
                    ///  SCL Low Timeout Enable
                    LOWTOUTEN: u1,
                    padding: u1,
                }),
                ///  I2CS Control B
                CTRLB: mmio.Mmio(packed struct(u32) {
                    reserved8: u8,
                    ///  Smart Mode Enable
                    SMEN: u1,
                    ///  PMBus Group Command
                    GCMD: u1,
                    ///  Automatic Address Acknowledge
                    AACKEN: u1,
                    reserved14: u3,
                    ///  Address Mode
                    AMODE: u2,
                    ///  Command
                    CMD: u2,
                    ///  Acknowledge Action
                    ACKACT: u1,
                    padding: u13,
                }),
                reserved20: [12]u8,
                ///  I2CS Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Stop Received Interrupt Disable
                    PREC: u1,
                    ///  Address Match Interrupt Disable
                    AMATCH: u1,
                    ///  Data Interrupt Disable
                    DRDY: u1,
                    reserved7: u4,
                    ///  Combined Error Interrupt Disable
                    ERROR: u1,
                }),
                reserved22: [1]u8,
                ///  I2CS Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Stop Received Interrupt Enable
                    PREC: u1,
                    ///  Address Match Interrupt Enable
                    AMATCH: u1,
                    ///  Data Interrupt Enable
                    DRDY: u1,
                    reserved7: u4,
                    ///  Combined Error Interrupt Enable
                    ERROR: u1,
                }),
                reserved24: [1]u8,
                ///  I2CS Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Stop Received Interrupt
                    PREC: u1,
                    ///  Address Match Interrupt
                    AMATCH: u1,
                    ///  Data Interrupt
                    DRDY: u1,
                    reserved7: u4,
                    ///  Combined Error Interrupt
                    ERROR: u1,
                }),
                reserved26: [1]u8,
                ///  I2CS Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    ///  Bus Error
                    BUSERR: u1,
                    ///  Transmit Collision
                    COLL: u1,
                    ///  Received Not Acknowledge
                    RXNACK: u1,
                    ///  Read/Write Direction
                    DIR: u1,
                    ///  Repeated Start
                    SR: u1,
                    reserved6: u1,
                    ///  SCL Low Timeout
                    LOWTOUT: u1,
                    ///  Clock Hold
                    CLKHOLD: u1,
                    reserved9: u1,
                    ///  Slave SCL Low Extend Timeout
                    SEXTTOUT: u1,
                    ///  High Speed
                    HS: u1,
                    padding: u5,
                }),
                ///  I2CS Synchronization Busy
                SYNCBUSY: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset Synchronization Busy
                    SWRST: u1,
                    ///  SERCOM Enable Synchronization Busy
                    ENABLE: u1,
                    padding: u30,
                }),
                reserved36: [4]u8,
                ///  I2CS Address
                ADDR: mmio.Mmio(packed struct(u32) {
                    ///  General Call Address Enable
                    GENCEN: u1,
                    ///  Address Value
                    ADDR: u10,
                    reserved15: u4,
                    ///  Ten Bit Addressing Enable
                    TENBITEN: u1,
                    reserved17: u1,
                    ///  Address Mask
                    ADDRMASK: u10,
                    padding: u5,
                }),
                ///  I2CS Data
                DATA: mmio.Mmio(packed struct(u8) {
                    ///  Data Value
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
                    ///  Run during Standby
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
                    ///  Data Preload Enable
                    PLOADEN: u1,
                    reserved9: u2,
                    ///  Slave Select Low Detect Enable
                    SSDE: u1,
                    reserved13: u3,
                    ///  Master Slave Select Enable
                    MSSEN: u1,
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
                reserved12: [4]u8,
                ///  SPIS Baud Rate
                BAUD: mmio.Mmio(packed struct(u8) {
                    ///  Baud Rate Value
                    BAUD: u8,
                }),
                reserved20: [7]u8,
                ///  SPIS Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Disable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Disable
                    TXC: u1,
                    ///  Receive Complete Interrupt Disable
                    RXC: u1,
                    ///  Slave Select Low Interrupt Disable
                    SSL: u1,
                    reserved7: u3,
                    ///  Combined Error Interrupt Disable
                    ERROR: u1,
                }),
                reserved22: [1]u8,
                ///  SPIS Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Enable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Enable
                    TXC: u1,
                    ///  Receive Complete Interrupt Enable
                    RXC: u1,
                    ///  Slave Select Low Interrupt Enable
                    SSL: u1,
                    reserved7: u3,
                    ///  Combined Error Interrupt Enable
                    ERROR: u1,
                }),
                reserved24: [1]u8,
                ///  SPIS Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt
                    DRE: u1,
                    ///  Transmit Complete Interrupt
                    TXC: u1,
                    ///  Receive Complete Interrupt
                    RXC: u1,
                    ///  Slave Select Low Interrupt Flag
                    SSL: u1,
                    reserved7: u3,
                    ///  Combined Error Interrupt
                    ERROR: u1,
                }),
                reserved26: [1]u8,
                ///  SPIS Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    reserved2: u2,
                    ///  Buffer Overflow
                    BUFOVF: u1,
                    padding: u13,
                }),
                ///  SPIS Synchronization Busy
                SYNCBUSY: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset Synchronization Busy
                    SWRST: u1,
                    ///  SERCOM Enable Synchronization Busy
                    ENABLE: u1,
                    ///  CTRLB Synchronization Busy
                    CTRLB: u1,
                    padding: u29,
                }),
                reserved36: [4]u8,
                ///  SPIS Address
                ADDR: mmio.Mmio(packed struct(u32) {
                    ///  Address Value
                    ADDR: u8,
                    reserved16: u8,
                    ///  Address Mask
                    ADDRMASK: u8,
                    padding: u8,
                }),
                ///  SPIS Data
                DATA: mmio.Mmio(packed struct(u32) {
                    ///  Data Value
                    DATA: u9,
                    padding: u23,
                }),
                reserved48: [4]u8,
                ///  SPIS Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Mode
                    DBGSTOP: u1,
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
                    ///  Run during Standby
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
                    ///  Data Preload Enable
                    PLOADEN: u1,
                    reserved9: u2,
                    ///  Slave Select Low Detect Enable
                    SSDE: u1,
                    reserved13: u3,
                    ///  Master Slave Select Enable
                    MSSEN: u1,
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
                reserved12: [4]u8,
                ///  SPIM Baud Rate
                BAUD: mmio.Mmio(packed struct(u8) {
                    ///  Baud Rate Value
                    BAUD: u8,
                }),
                reserved20: [7]u8,
                ///  SPIM Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Disable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Disable
                    TXC: u1,
                    ///  Receive Complete Interrupt Disable
                    RXC: u1,
                    ///  Slave Select Low Interrupt Disable
                    SSL: u1,
                    reserved7: u3,
                    ///  Combined Error Interrupt Disable
                    ERROR: u1,
                }),
                reserved22: [1]u8,
                ///  SPIM Interrupt Enable Set
                INTENSET: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Enable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Enable
                    TXC: u1,
                    ///  Receive Complete Interrupt Enable
                    RXC: u1,
                    ///  Slave Select Low Interrupt Enable
                    SSL: u1,
                    reserved7: u3,
                    ///  Combined Error Interrupt Enable
                    ERROR: u1,
                }),
                reserved24: [1]u8,
                ///  SPIM Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt
                    DRE: u1,
                    ///  Transmit Complete Interrupt
                    TXC: u1,
                    ///  Receive Complete Interrupt
                    RXC: u1,
                    ///  Slave Select Low Interrupt Flag
                    SSL: u1,
                    reserved7: u3,
                    ///  Combined Error Interrupt
                    ERROR: u1,
                }),
                reserved26: [1]u8,
                ///  SPIM Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    reserved2: u2,
                    ///  Buffer Overflow
                    BUFOVF: u1,
                    padding: u13,
                }),
                ///  SPIM Synchronization Busy
                SYNCBUSY: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset Synchronization Busy
                    SWRST: u1,
                    ///  SERCOM Enable Synchronization Busy
                    ENABLE: u1,
                    ///  CTRLB Synchronization Busy
                    CTRLB: u1,
                    padding: u29,
                }),
                reserved36: [4]u8,
                ///  SPIM Address
                ADDR: mmio.Mmio(packed struct(u32) {
                    ///  Address Value
                    ADDR: u8,
                    reserved16: u8,
                    ///  Address Mask
                    ADDRMASK: u8,
                    padding: u8,
                }),
                ///  SPIM Data
                DATA: mmio.Mmio(packed struct(u32) {
                    ///  Data Value
                    DATA: u9,
                    padding: u23,
                }),
                reserved48: [4]u8,
                ///  SPIM Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Mode
                    DBGSTOP: u1,
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
                    ///  Run during Standby
                    RUNSTDBY: u1,
                    ///  Immediate Buffer Overflow Notification
                    IBON: u1,
                    reserved13: u4,
                    ///  Sample
                    SAMPR: packed union {
                        raw: u3,
                        value: SERCOM_USART_CTRLA__SAMPR,
                    },
                    ///  Transmit Data Pinout
                    TXPO: packed union {
                        raw: u2,
                        value: SERCOM_USART_CTRLA__TXPO,
                    },
                    reserved20: u2,
                    ///  Receive Data Pinout
                    RXPO: packed union {
                        raw: u2,
                        value: SERCOM_USART_CTRLA__RXPO,
                    },
                    ///  Sample Adjustment
                    SAMPA: u2,
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
                    reserved8: u1,
                    ///  Collision Detection Enable
                    COLDEN: u1,
                    ///  Start of Frame Detection Enable
                    SFDE: u1,
                    ///  Encoding Format
                    ENC: u1,
                    reserved13: u2,
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
                reserved12: [4]u8,
                ///  USART_EXT Baud Rate
                BAUD: mmio.Mmio(packed struct(u16) {
                    ///  Baud Rate Value
                    BAUD: u13,
                    ///  Fractional Part
                    FP: u3,
                }),
                ///  USART_EXT Receive Pulse Length
                RXPL: mmio.Mmio(packed struct(u8) {
                    ///  Receive Pulse Length
                    RXPL: u8,
                }),
                reserved20: [5]u8,
                ///  USART_EXT Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Disable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Disable
                    TXC: u1,
                    ///  Receive Complete Interrupt Disable
                    RXC: u1,
                    ///  Receive Start Interrupt Disable
                    RXS: u1,
                    ///  Clear To Send Input Change Interrupt Disable
                    CTSIC: u1,
                    ///  Break Received Interrupt Disable
                    RXBRK: u1,
                    reserved7: u1,
                    ///  Combined Error Interrupt Disable
                    ERROR: u1,
                }),
                reserved22: [1]u8,
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
                    ///  Clear To Send Input Change Interrupt Enable
                    CTSIC: u1,
                    ///  Break Received Interrupt Enable
                    RXBRK: u1,
                    reserved7: u1,
                    ///  Combined Error Interrupt Enable
                    ERROR: u1,
                }),
                reserved24: [1]u8,
                ///  USART_EXT Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt
                    DRE: u1,
                    ///  Transmit Complete Interrupt
                    TXC: u1,
                    ///  Receive Complete Interrupt
                    RXC: u1,
                    ///  Receive Start Interrupt
                    RXS: u1,
                    ///  Clear To Send Input Change Interrupt
                    CTSIC: u1,
                    ///  Break Received Interrupt
                    RXBRK: u1,
                    reserved7: u1,
                    ///  Combined Error Interrupt
                    ERROR: u1,
                }),
                reserved26: [1]u8,
                ///  USART_EXT Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    ///  Parity Error
                    PERR: u1,
                    ///  Frame Error
                    FERR: u1,
                    ///  Buffer Overflow
                    BUFOVF: u1,
                    ///  Clear To Send
                    CTS: u1,
                    ///  Inconsistent Sync Field
                    ISF: u1,
                    ///  Collision Detected
                    COLL: u1,
                    padding: u10,
                }),
                ///  USART_EXT Synchronization Busy
                SYNCBUSY: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset Synchronization Busy
                    SWRST: u1,
                    ///  SERCOM Enable Synchronization Busy
                    ENABLE: u1,
                    ///  CTRLB Synchronization Busy
                    CTRLB: u1,
                    padding: u29,
                }),
                reserved40: [8]u8,
                ///  USART_EXT Data
                DATA: mmio.Mmio(packed struct(u16) {
                    ///  Data Value
                    DATA: u9,
                    padding: u7,
                }),
                reserved48: [6]u8,
                ///  USART_EXT Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Mode
                    DBGSTOP: u1,
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
                    ///  Run during Standby
                    RUNSTDBY: u1,
                    ///  Immediate Buffer Overflow Notification
                    IBON: u1,
                    reserved13: u4,
                    ///  Sample
                    SAMPR: packed union {
                        raw: u3,
                        value: SERCOM_USART_CTRLA__SAMPR,
                    },
                    ///  Transmit Data Pinout
                    TXPO: packed union {
                        raw: u2,
                        value: SERCOM_USART_CTRLA__TXPO,
                    },
                    reserved20: u2,
                    ///  Receive Data Pinout
                    RXPO: packed union {
                        raw: u2,
                        value: SERCOM_USART_CTRLA__RXPO,
                    },
                    ///  Sample Adjustment
                    SAMPA: u2,
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
                    reserved8: u1,
                    ///  Collision Detection Enable
                    COLDEN: u1,
                    ///  Start of Frame Detection Enable
                    SFDE: u1,
                    ///  Encoding Format
                    ENC: u1,
                    reserved13: u2,
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
                reserved12: [4]u8,
                ///  USART_INT Baud Rate
                BAUD: mmio.Mmio(packed struct(u16) {
                    ///  Baud Rate Value
                    BAUD: u16,
                }),
                ///  USART_INT Receive Pulse Length
                RXPL: mmio.Mmio(packed struct(u8) {
                    ///  Receive Pulse Length
                    RXPL: u8,
                }),
                reserved20: [5]u8,
                ///  USART_INT Interrupt Enable Clear
                INTENCLR: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt Disable
                    DRE: u1,
                    ///  Transmit Complete Interrupt Disable
                    TXC: u1,
                    ///  Receive Complete Interrupt Disable
                    RXC: u1,
                    ///  Receive Start Interrupt Disable
                    RXS: u1,
                    ///  Clear To Send Input Change Interrupt Disable
                    CTSIC: u1,
                    ///  Break Received Interrupt Disable
                    RXBRK: u1,
                    reserved7: u1,
                    ///  Combined Error Interrupt Disable
                    ERROR: u1,
                }),
                reserved22: [1]u8,
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
                    ///  Clear To Send Input Change Interrupt Enable
                    CTSIC: u1,
                    ///  Break Received Interrupt Enable
                    RXBRK: u1,
                    reserved7: u1,
                    ///  Combined Error Interrupt Enable
                    ERROR: u1,
                }),
                reserved24: [1]u8,
                ///  USART_INT Interrupt Flag Status and Clear
                INTFLAG: mmio.Mmio(packed struct(u8) {
                    ///  Data Register Empty Interrupt
                    DRE: u1,
                    ///  Transmit Complete Interrupt
                    TXC: u1,
                    ///  Receive Complete Interrupt
                    RXC: u1,
                    ///  Receive Start Interrupt
                    RXS: u1,
                    ///  Clear To Send Input Change Interrupt
                    CTSIC: u1,
                    ///  Break Received Interrupt
                    RXBRK: u1,
                    reserved7: u1,
                    ///  Combined Error Interrupt
                    ERROR: u1,
                }),
                reserved26: [1]u8,
                ///  USART_INT Status
                STATUS: mmio.Mmio(packed struct(u16) {
                    ///  Parity Error
                    PERR: u1,
                    ///  Frame Error
                    FERR: u1,
                    ///  Buffer Overflow
                    BUFOVF: u1,
                    ///  Clear To Send
                    CTS: u1,
                    ///  Inconsistent Sync Field
                    ISF: u1,
                    ///  Collision Detected
                    COLL: u1,
                    padding: u10,
                }),
                ///  USART_INT Synchronization Busy
                SYNCBUSY: mmio.Mmio(packed struct(u32) {
                    ///  Software Reset Synchronization Busy
                    SWRST: u1,
                    ///  SERCOM Enable Synchronization Busy
                    ENABLE: u1,
                    ///  CTRLB Synchronization Busy
                    CTRLB: u1,
                    padding: u29,
                }),
                reserved40: [8]u8,
                ///  USART_INT Data
                DATA: mmio.Mmio(packed struct(u16) {
                    ///  Data Value
                    DATA: u9,
                    padding: u7,
                }),
                reserved48: [6]u8,
                ///  USART_INT Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Mode
                    DBGSTOP: u1,
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

            pub const SYSCTRL_BOD33__ACTION = enum(u2) {
                ///  No action
                NONE = 0x0,
                ///  The BOD33 generates a reset
                RESET = 0x1,
                ///  The BOD33 generates an interrupt
                INTERRUPT = 0x2,
                _,
            };

            pub const SYSCTRL_BOD33__PSEL = enum(u4) {
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
                DIV1K = 0x9,
                ///  Divide clock by 2048
                DIV2K = 0xa,
                ///  Divide clock by 4096
                DIV4K = 0xb,
                ///  Divide clock by 8192
                DIV8K = 0xc,
                ///  Divide clock by 16384
                DIV16K = 0xd,
                ///  Divide clock by 32768
                DIV32K = 0xe,
                ///  Divide clock by 65536
                DIV64K = 0xf,
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
                ///  0.112 ms
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

            pub const SYSCTRL_DPLLCTRLB__FILTER = enum(u2) {
                ///  Default filter mode
                DEFAULT = 0x0,
                ///  Low bandwidth filter
                LBFILT = 0x1,
                ///  High bandwidth filter
                HBFILT = 0x2,
                ///  High damping filter
                HDFILT = 0x3,
            };

            pub const SYSCTRL_DPLLCTRLB__LTIME = enum(u3) {
                ///  No time-out
                DEFAULT = 0x0,
                ///  Time-out if no lock within 8 ms
                @"8MS" = 0x4,
                ///  Time-out if no lock within 9 ms
                @"9MS" = 0x5,
                ///  Time-out if no lock within 10 ms
                @"10MS" = 0x6,
                ///  Time-out if no lock within 11 ms
                @"11MS" = 0x7,
                _,
            };

            pub const SYSCTRL_DPLLCTRLB__REFCLK = enum(u2) {
                ///  CLK_DPLL_REF0 clock reference
                REF0 = 0x0,
                ///  CLK_DPLL_REF1 clock reference
                REF1 = 0x1,
                ///  GCLK_DPLL clock reference
                GCLK = 0x2,
                _,
            };

            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u32) {
                ///  XOSC Ready Interrupt Enable
                XOSCRDY: u1,
                ///  XOSC32K Ready Interrupt Enable
                XOSC32KRDY: u1,
                ///  OSC32K Ready Interrupt Enable
                OSC32KRDY: u1,
                ///  OSC8M Ready Interrupt Enable
                OSC8MRDY: u1,
                ///  DFLL Ready Interrupt Enable
                DFLLRDY: u1,
                ///  DFLL Out Of Bounds Interrupt Enable
                DFLLOOB: u1,
                ///  DFLL Lock Fine Interrupt Enable
                DFLLLCKF: u1,
                ///  DFLL Lock Coarse Interrupt Enable
                DFLLLCKC: u1,
                ///  DFLL Reference Clock Stopped Interrupt Enable
                DFLLRCS: u1,
                ///  BOD33 Ready Interrupt Enable
                BOD33RDY: u1,
                ///  BOD33 Detection Interrupt Enable
                BOD33DET: u1,
                ///  BOD33 Synchronization Ready Interrupt Enable
                B33SRDY: u1,
                reserved15: u3,
                ///  DPLL Lock Rise Interrupt Enable
                DPLLLCKR: u1,
                ///  DPLL Lock Fall Interrupt Enable
                DPLLLCKF: u1,
                ///  DPLL Lock Timeout Interrupt Enable
                DPLLLTO: u1,
                padding: u14,
            }),
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u32) {
                ///  XOSC Ready Interrupt Enable
                XOSCRDY: u1,
                ///  XOSC32K Ready Interrupt Enable
                XOSC32KRDY: u1,
                ///  OSC32K Ready Interrupt Enable
                OSC32KRDY: u1,
                ///  OSC8M Ready Interrupt Enable
                OSC8MRDY: u1,
                ///  DFLL Ready Interrupt Enable
                DFLLRDY: u1,
                ///  DFLL Out Of Bounds Interrupt Enable
                DFLLOOB: u1,
                ///  DFLL Lock Fine Interrupt Enable
                DFLLLCKF: u1,
                ///  DFLL Lock Coarse Interrupt Enable
                DFLLLCKC: u1,
                ///  DFLL Reference Clock Stopped Interrupt Enable
                DFLLRCS: u1,
                ///  BOD33 Ready Interrupt Enable
                BOD33RDY: u1,
                ///  BOD33 Detection Interrupt Enable
                BOD33DET: u1,
                ///  BOD33 Synchronization Ready Interrupt Enable
                B33SRDY: u1,
                reserved15: u3,
                ///  DPLL Lock Rise Interrupt Enable
                DPLLLCKR: u1,
                ///  DPLL Lock Fall Interrupt Enable
                DPLLLCKF: u1,
                ///  DPLL Lock Timeout Interrupt Enable
                DPLLLTO: u1,
                padding: u14,
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
                reserved15: u3,
                ///  DPLL Lock Rise
                DPLLLCKR: u1,
                ///  DPLL Lock Fall
                DPLLLCKF: u1,
                ///  DPLL Lock Timeout
                DPLLLTO: u1,
                padding: u14,
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
                reserved15: u3,
                ///  DPLL Lock Rise
                DPLLLCKR: u1,
                ///  DPLL Lock Fall
                DPLLLCKF: u1,
                ///  DPLL Lock Timeout
                DPLLLTO: u1,
                padding: u14,
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
            ///  32kHz Ultra Low Power Internal Oscillator (OSCULP32K) Control
            OSCULP32K: mmio.Mmio(packed struct(u8) {
                ///  Oscillator Calibration
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
            ///  DFLL48M Control
            DFLLCTRL: mmio.Mmio(packed struct(u16) {
                reserved1: u1,
                ///  DFLL Enable
                ENABLE: u1,
                ///  Operating Mode Selection
                MODE: u1,
                ///  Stable DFLL Frequency
                STABLE: u1,
                ///  Lose Lock After Wake
                LLAW: u1,
                ///  USB Clock Recovery Mode
                USBCRM: u1,
                ///  Run in Standby
                RUNSTDBY: u1,
                ///  On Demand Control
                ONDEMAND: u1,
                ///  Chill Cycle Disable
                CCDIS: u1,
                ///  Quick Lock Disable
                QLDIS: u1,
                ///  Bypass Coarse Lock
                BPLCKC: u1,
                ///  Wait Lock
                WAITLOCK: u1,
                padding: u4,
            }),
            reserved40: [2]u8,
            ///  DFLL48M Value
            DFLLVAL: mmio.Mmio(packed struct(u32) {
                ///  Fine Value
                FINE: u10,
                ///  Coarse Value
                COARSE: u6,
                ///  Multiplication Ratio Difference
                DIFF: u16,
            }),
            ///  DFLL48M Multiplier
            DFLLMUL: mmio.Mmio(packed struct(u32) {
                ///  DFLL Multiply Factor
                MUL: u16,
                ///  Fine Maximum Step
                FSTEP: u10,
                ///  Coarse Maximum Step
                CSTEP: u6,
            }),
            ///  DFLL48M Synchronization
            DFLLSYNC: mmio.Mmio(packed struct(u8) {
                reserved7: u7,
                ///  Read Request
                READREQ: u1,
            }),
            reserved52: [3]u8,
            ///  3.3V Brown-Out Detector (BOD33) Control
            BOD33: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Enable
                ENABLE: u1,
                ///  Hysteresis
                HYST: u1,
                ///  BOD33 Action
                ACTION: packed union {
                    raw: u2,
                    value: SYSCTRL_BOD33__ACTION,
                },
                reserved6: u1,
                ///  Run in Standby
                RUNSTDBY: u1,
                reserved8: u1,
                ///  Operation Mode
                MODE: u1,
                ///  Clock Enable
                CEN: u1,
                reserved12: u2,
                ///  Prescaler Select
                PSEL: packed union {
                    raw: u4,
                    value: SYSCTRL_BOD33__PSEL,
                },
                ///  BOD33 Threshold Level
                LEVEL: u6,
                padding: u10,
            }),
            reserved60: [4]u8,
            ///  Voltage Regulator System (VREG) Control
            VREG: mmio.Mmio(packed struct(u16) {
                reserved6: u6,
                ///  Run in Standby
                RUNSTDBY: u1,
                reserved13: u6,
                ///  Force LDO Voltage Regulator
                FORCELDO: u1,
                padding: u2,
            }),
            reserved64: [2]u8,
            ///  Voltage References System (VREF) Control
            VREF: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Temperature Sensor Enable
                TSEN: u1,
                ///  Bandgap Output Enable
                BGOUTEN: u1,
                reserved16: u13,
                ///  Bandgap Voltage Generator Calibration
                CALIB: u11,
                padding: u5,
            }),
            ///  DPLL Control A
            DPLLCTRLA: mmio.Mmio(packed struct(u8) {
                reserved1: u1,
                ///  DPLL Enable
                ENABLE: u1,
                reserved6: u4,
                ///  Run in Standby
                RUNSTDBY: u1,
                ///  On Demand Clock Activation
                ONDEMAND: u1,
            }),
            reserved72: [3]u8,
            ///  DPLL Ratio Control
            DPLLRATIO: mmio.Mmio(packed struct(u32) {
                ///  Loop Divider Ratio
                LDR: u12,
                reserved16: u4,
                ///  Loop Divider Ratio Fractional Part
                LDRFRAC: u4,
                padding: u12,
            }),
            ///  DPLL Control B
            DPLLCTRLB: mmio.Mmio(packed struct(u32) {
                ///  Proportional Integral Filter Selection
                FILTER: packed union {
                    raw: u2,
                    value: SYSCTRL_DPLLCTRLB__FILTER,
                },
                ///  Low-Power Enable
                LPEN: u1,
                ///  Wake Up Fast
                WUF: u1,
                ///  Reference Clock Selection
                REFCLK: packed union {
                    raw: u2,
                    value: SYSCTRL_DPLLCTRLB__REFCLK,
                },
                reserved8: u2,
                ///  Lock Time
                LTIME: packed union {
                    raw: u3,
                    value: SYSCTRL_DPLLCTRLB__LTIME,
                },
                reserved12: u1,
                ///  Lock Bypass
                LBYPASS: u1,
                reserved16: u3,
                ///  Clock Divider
                DIV: u11,
                padding: u5,
            }),
            ///  DPLL Status
            DPLLSTATUS: mmio.Mmio(packed struct(u8) {
                ///  DPLL Lock Status
                LOCK: u1,
                ///  Output Clock Ready
                CLKRDY: u1,
                ///  DPLL Enable
                ENABLE: u1,
                ///  Divider Enable
                DIV: u1,
                padding: u4,
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
                ///  Prescaler: GCLK_TC
                DIV1 = 0x0,
                ///  Prescaler: GCLK_TC/2
                DIV2 = 0x1,
                ///  Prescaler: GCLK_TC/4
                DIV4 = 0x2,
                ///  Prescaler: GCLK_TC/8
                DIV8 = 0x3,
                ///  Prescaler: GCLK_TC/16
                DIV16 = 0x4,
                ///  Prescaler: GCLK_TC/64
                DIV64 = 0x5,
                ///  Prescaler: GCLK_TC/256
                DIV256 = 0x6,
                ///  Prescaler: GCLK_TC/1024
                DIV1024 = 0x7,
            };

            pub const TC_CTRLA__PRESCSYNC = enum(u2) {
                ///  Reload or reset the counter on next generic clock
                GCLK = 0x0,
                ///  Reload or reset the counter on next prescaler clock
                PRESC = 0x1,
                ///  Reload or reset the counter on next generic clock. Reset the prescaler counter
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
                ///  Force a start, restart or retrigger
                RETRIGGER = 0x1,
                ///  Force a stop
                STOP = 0x2,
                _,
            };

            pub const TC_CTRLBSET__CMD = enum(u2) {
                ///  No action
                NONE = 0x0,
                ///  Force a start, restart or retrigger
                RETRIGGER = 0x1,
                ///  Force a stop
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
                ///  Period captured in CC0, pulse width in CC1
                PPW = 0x5,
                ///  Period captured in CC1, pulse width in CC0
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
                    ///  One-Shot
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
                    ///  One-Shot
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
                    ///  Count Value
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
                    ///  One-Shot
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
                    ///  Count Value
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

        ///  Timer Counter Control
        pub const TCC = extern struct {
            pub const TCC_CTRLA__PRESCALER = enum(u3) {
                ///  No division
                DIV1 = 0x0,
                ///  Divide by 2
                DIV2 = 0x1,
                ///  Divide by 4
                DIV4 = 0x2,
                ///  Divide by 8
                DIV8 = 0x3,
                ///  Divide by 16
                DIV16 = 0x4,
                ///  Divide by 64
                DIV64 = 0x5,
                ///  Divide by 256
                DIV256 = 0x6,
                ///  Divide by 1024
                DIV1024 = 0x7,
            };

            pub const TCC_CTRLA__PRESCSYNC = enum(u2) {
                ///  Reload or reset counter on next GCLK
                GCLK = 0x0,
                ///  Reload or reset counter on next prescaler clock
                PRESC = 0x1,
                ///  Reload or reset counter on next GCLK and reset prescaler counter
                RESYNC = 0x2,
                _,
            };

            pub const TCC_CTRLA__RESOLUTION = enum(u2) {
                ///  Dithering is disabled
                NONE = 0x0,
                ///  Dithering is done every 16 PWM frames
                DITH4 = 0x1,
                ///  Dithering is done every 32 PWM frames
                DITH5 = 0x2,
                ///  Dithering is done every 64 PWM frames
                DITH6 = 0x3,
            };

            pub const TCC_CTRLBCLR__CMD = enum(u3) {
                ///  No action
                NONE = 0x0,
                ///  Clear start, restart or retrigger
                RETRIGGER = 0x1,
                ///  Force stop
                STOP = 0x2,
                ///  Force update of double buffered registers
                UPDATE = 0x3,
                ///  Force COUNT read synchronization
                READSYNC = 0x4,
                _,
            };

            pub const TCC_CTRLBCLR__IDXCMD = enum(u2) {
                ///  Command disabled: Index toggles between cycles A and B
                DISABLE = 0x0,
                ///  Set index: cycle B will be forced in the next cycle
                SET = 0x1,
                ///  Clear index: cycle A will be forced in the next cycle
                CLEAR = 0x2,
                ///  Hold index: the next cycle will be the same as the current cycle
                HOLD = 0x3,
            };

            pub const TCC_CTRLBSET__CMD = enum(u3) {
                ///  No action
                NONE = 0x0,
                ///  Clear start, restart or retrigger
                RETRIGGER = 0x1,
                ///  Force stop
                STOP = 0x2,
                ///  Force update of double buffered registers
                UPDATE = 0x3,
                ///  Force COUNT read synchronization
                READSYNC = 0x4,
                _,
            };

            pub const TCC_CTRLBSET__IDXCMD = enum(u2) {
                ///  Command disabled: Index toggles between cycles A and B
                DISABLE = 0x0,
                ///  Set index: cycle B will be forced in the next cycle
                SET = 0x1,
                ///  Clear index: cycle A will be forced in the next cycle
                CLEAR = 0x2,
                ///  Hold index: the next cycle will be the same as the current cycle
                HOLD = 0x3,
            };

            pub const TCC_FCTRLA__BLANK = enum(u2) {
                ///  No blanking applied
                NONE = 0x0,
                ///  Blanking applied from rising edge of the output waveform
                RISE = 0x1,
                ///  Blanking applied from falling edge of the output waveform
                FALL = 0x2,
                ///  Blanking applied from each toggle of the output waveform
                BOTH = 0x3,
            };

            pub const TCC_FCTRLA__CAPTURE = enum(u3) {
                ///  No capture
                DISABLE = 0x0,
                ///  Capture on fault
                CAPT = 0x1,
                ///  Minimum capture
                CAPTMIN = 0x2,
                ///  Maximum capture
                CAPTMAX = 0x3,
                ///  Minimum local detection
                LOCMIN = 0x4,
                ///  Maximum local detection
                LOCMAX = 0x5,
                ///  Minimum and maximum local detection
                DERIV0 = 0x6,
                _,
            };

            pub const TCC_FCTRLA__CHSEL = enum(u2) {
                ///  Capture value stored in channel 0
                CC0 = 0x0,
                ///  Capture value stored in channel 1
                CC1 = 0x1,
                ///  Capture value stored in channel 2
                CC2 = 0x2,
                ///  Capture value stored in channel 3
                CC3 = 0x3,
            };

            pub const TCC_FCTRLA__HALT = enum(u2) {
                ///  Halt action disabled
                DISABLE = 0x0,
                ///  Hardware halt action
                HW = 0x1,
                ///  Software halt action
                SW = 0x2,
                ///  Non-recoverable fault
                NR = 0x3,
            };

            pub const TCC_FCTRLA__SRC = enum(u2) {
                ///  Fault input disabled
                DISABLE = 0x0,
                ///  MCEx (x=0,1) event input
                ENABLE = 0x1,
                ///  Inverted MCEx (x=0,1) event input
                INVERT = 0x2,
                ///  Alternate fault (A or B) state at the end of the previous period
                ALTFAULT = 0x3,
            };

            pub const TCC_FCTRLB__BLANK = enum(u2) {
                ///  No blanking applied
                NONE = 0x0,
                ///  Blanking applied from rising edge of the output waveform
                RISE = 0x1,
                ///  Blanking applied from falling edge of the output waveform
                FALL = 0x2,
                ///  Blanking applied from each toggle of the output waveform
                BOTH = 0x3,
            };

            pub const TCC_FCTRLB__CAPTURE = enum(u3) {
                ///  No capture
                DISABLE = 0x0,
                ///  Capture on fault
                CAPT = 0x1,
                ///  Minimum capture
                CAPTMIN = 0x2,
                ///  Maximum capture
                CAPTMAX = 0x3,
                ///  Minimum local detection
                LOCMIN = 0x4,
                ///  Maximum local detection
                LOCMAX = 0x5,
                ///  Minimum and maximum local detection
                DERIV0 = 0x6,
                _,
            };

            pub const TCC_FCTRLB__CHSEL = enum(u2) {
                ///  Capture value stored in channel 0
                CC0 = 0x0,
                ///  Capture value stored in channel 1
                CC1 = 0x1,
                ///  Capture value stored in channel 2
                CC2 = 0x2,
                ///  Capture value stored in channel 3
                CC3 = 0x3,
            };

            pub const TCC_FCTRLB__HALT = enum(u2) {
                ///  Halt action disabled
                DISABLE = 0x0,
                ///  Hardware halt action
                HW = 0x1,
                ///  Software halt action
                SW = 0x2,
                ///  Non-recoverable fault
                NR = 0x3,
            };

            pub const TCC_FCTRLB__SRC = enum(u2) {
                ///  Fault input disabled
                DISABLE = 0x0,
                ///  MCEx (x=0,1) event input
                ENABLE = 0x1,
                ///  Inverted MCEx (x=0,1) event input
                INVERT = 0x2,
                ///  Alternate fault (A or B) state at the end of the previous period
                ALTFAULT = 0x3,
            };

            pub const TCC_EVCTRL__CNTSEL = enum(u2) {
                ///  An interrupt/event is generated when a new counter cycle starts
                START = 0x0,
                ///  An interrupt/event is generated when a counter cycle ends
                END = 0x1,
                ///  An interrupt/event is generated when a counter cycle ends, except for the first and last cycles
                BETWEEN = 0x2,
                ///  An interrupt/event is generated when a new counter cycle starts or a counter cycle ends
                BOUNDARY = 0x3,
            };

            pub const TCC_EVCTRL__EVACT0 = enum(u3) {
                ///  Event action disabled
                OFF = 0x0,
                ///  Start, restart or re-trigger counter on event
                RETRIGGER = 0x1,
                ///  Count on event
                COUNTEV = 0x2,
                ///  Start counter on event
                START = 0x3,
                ///  Increment counter on event
                INC = 0x4,
                ///  Count on active state of asynchronous event
                COUNT = 0x5,
                ///  Non-recoverable fault
                FAULT = 0x7,
                _,
            };

            pub const TCC_EVCTRL__EVACT1 = enum(u3) {
                ///  Event action disabled
                OFF = 0x0,
                ///  Re-trigger counter on event
                RETRIGGER = 0x1,
                ///  Direction control
                DIR = 0x2,
                ///  Stop counter on event
                STOP = 0x3,
                ///  Decrement counter on event
                DEC = 0x4,
                ///  Period capture value in CC0 register, pulse width capture value in CC1 register
                PPW = 0x5,
                ///  Period capture value in CC1 register, pulse width capture value in CC0 register
                PWP = 0x6,
                ///  Non-recoverable fault
                FAULT = 0x7,
            };

            pub const TCC_WAVE__RAMP = enum(u2) {
                ///  RAMP1 operation
                RAMP1 = 0x0,
                ///  Alternative RAMP2 operation
                RAMP2A = 0x1,
                ///  RAMP2 operation
                RAMP2 = 0x2,
                _,
            };

            pub const TCC_WAVE__WAVEGEN = enum(u3) {
                ///  Normal frequency
                NFRQ = 0x0,
                ///  Match frequency
                MFRQ = 0x1,
                ///  Normal PWM
                NPWM = 0x2,
                ///  Dual-slope critical
                DSCRITICAL = 0x4,
                ///  Dual-slope with interrupt/event condition when COUNT reaches ZERO
                DSBOTTOM = 0x5,
                ///  Dual-slope with interrupt/event condition when COUNT reaches ZERO or TOP
                DSBOTH = 0x6,
                ///  Dual-slope with interrupt/event condition when COUNT reaches TOP
                DSTOP = 0x7,
                _,
            };

            pub const TCC_WAVEB__RAMPB = enum(u2) {
                ///  RAMP1 operation
                RAMP1 = 0x0,
                ///  Alternative RAMP2 operation
                RAMP2A = 0x1,
                ///  RAMP2 operation
                RAMP2 = 0x2,
                _,
            };

            pub const TCC_WAVEB__WAVEGENB = enum(u3) {
                ///  Normal frequency
                NFRQ = 0x0,
                ///  Match frequency
                MFRQ = 0x1,
                ///  Normal PWM
                NPWM = 0x2,
                ///  Dual-slope critical
                DSCRITICAL = 0x4,
                ///  Dual-slope with interrupt/event condition when COUNT reaches ZERO
                DSBOTTOM = 0x5,
                ///  Dual-slope with interrupt/event condition when COUNT reaches ZERO or TOP
                DSBOTH = 0x6,
                ///  Dual-slope with interrupt/event condition when COUNT reaches TOP
                DSTOP = 0x7,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u32) {
                ///  Software Reset
                SWRST: u1,
                ///  Enable
                ENABLE: u1,
                reserved5: u3,
                ///  Enhanced Resolution
                RESOLUTION: packed union {
                    raw: u2,
                    value: TCC_CTRLA__RESOLUTION,
                },
                reserved8: u1,
                ///  Prescaler
                PRESCALER: packed union {
                    raw: u3,
                    value: TCC_CTRLA__PRESCALER,
                },
                ///  Run in Standby
                RUNSTDBY: u1,
                ///  Prescaler and Counter Synchronization Selection
                PRESCSYNC: packed union {
                    raw: u2,
                    value: TCC_CTRLA__PRESCSYNC,
                },
                ///  Auto Lock
                ALOCK: u1,
                reserved24: u9,
                ///  Capture Channel 0 Enable
                CPTEN0: u1,
                ///  Capture Channel 1 Enable
                CPTEN1: u1,
                ///  Capture Channel 2 Enable
                CPTEN2: u1,
                ///  Capture Channel 3 Enable
                CPTEN3: u1,
                padding: u4,
            }),
            ///  Control B Clear
            CTRLBCLR: mmio.Mmio(packed struct(u8) {
                ///  Counter Direction
                DIR: u1,
                ///  Lock Update
                LUPD: u1,
                ///  One-Shot
                ONESHOT: u1,
                ///  Ramp Index Command
                IDXCMD: packed union {
                    raw: u2,
                    value: TCC_CTRLBCLR__IDXCMD,
                },
                ///  TCC Command
                CMD: packed union {
                    raw: u3,
                    value: TCC_CTRLBCLR__CMD,
                },
            }),
            ///  Control B Set
            CTRLBSET: mmio.Mmio(packed struct(u8) {
                ///  Counter Direction
                DIR: u1,
                ///  Lock Update
                LUPD: u1,
                ///  One-Shot
                ONESHOT: u1,
                ///  Ramp Index Command
                IDXCMD: packed union {
                    raw: u2,
                    value: TCC_CTRLBSET__IDXCMD,
                },
                ///  TCC Command
                CMD: packed union {
                    raw: u3,
                    value: TCC_CTRLBSET__CMD,
                },
            }),
            reserved8: [2]u8,
            ///  Synchronization Busy
            SYNCBUSY: mmio.Mmio(packed struct(u32) {
                ///  Swrst Busy
                SWRST: u1,
                ///  Enable Busy
                ENABLE: u1,
                ///  Ctrlb Busy
                CTRLB: u1,
                ///  Status Busy
                STATUS: u1,
                ///  Count Busy
                COUNT: u1,
                ///  Pattern Busy
                PATT: u1,
                ///  Wave Busy
                WAVE: u1,
                ///  Period busy
                PER: u1,
                ///  Compare Channel 0 Busy
                CC0: u1,
                ///  Compare Channel 1 Busy
                CC1: u1,
                ///  Compare Channel 2 Busy
                CC2: u1,
                ///  Compare Channel 3 Busy
                CC3: u1,
                reserved16: u4,
                ///  Pattern Buffer Busy
                PATTB: u1,
                ///  Wave Buffer Busy
                WAVEB: u1,
                ///  Period Buffer Busy
                PERB: u1,
                ///  Compare Channel Buffer 0 Busy
                CCB0: u1,
                ///  Compare Channel Buffer 1 Busy
                CCB1: u1,
                ///  Compare Channel Buffer 2 Busy
                CCB2: u1,
                ///  Compare Channel Buffer 3 Busy
                CCB3: u1,
                padding: u9,
            }),
            ///  Recoverable Fault A Configuration
            FCTRLA: mmio.Mmio(packed struct(u32) {
                ///  Fault A Source
                SRC: packed union {
                    raw: u2,
                    value: TCC_FCTRLA__SRC,
                },
                reserved3: u1,
                ///  Fault A Keeper
                KEEP: u1,
                ///  Fault A Qualification
                QUAL: u1,
                ///  Fault A Blanking Mode
                BLANK: packed union {
                    raw: u2,
                    value: TCC_FCTRLA__BLANK,
                },
                ///  Fault A Restart
                RESTART: u1,
                ///  Fault A Halt Mode
                HALT: packed union {
                    raw: u2,
                    value: TCC_FCTRLA__HALT,
                },
                ///  Fault A Capture Channel
                CHSEL: packed union {
                    raw: u2,
                    value: TCC_FCTRLA__CHSEL,
                },
                ///  Fault A Capture Action
                CAPTURE: packed union {
                    raw: u3,
                    value: TCC_FCTRLA__CAPTURE,
                },
                reserved16: u1,
                ///  Fault A Blanking Time
                BLANKVAL: u8,
                ///  Fault A Filter Value
                FILTERVAL: u4,
                padding: u4,
            }),
            ///  Recoverable Fault B Configuration
            FCTRLB: mmio.Mmio(packed struct(u32) {
                ///  Fault B Source
                SRC: packed union {
                    raw: u2,
                    value: TCC_FCTRLB__SRC,
                },
                reserved3: u1,
                ///  Fault B Keeper
                KEEP: u1,
                ///  Fault B Qualification
                QUAL: u1,
                ///  Fault B Blanking Mode
                BLANK: packed union {
                    raw: u2,
                    value: TCC_FCTRLB__BLANK,
                },
                ///  Fault B Restart
                RESTART: u1,
                ///  Fault B Halt Mode
                HALT: packed union {
                    raw: u2,
                    value: TCC_FCTRLB__HALT,
                },
                ///  Fault B Capture Channel
                CHSEL: packed union {
                    raw: u2,
                    value: TCC_FCTRLB__CHSEL,
                },
                ///  Fault B Capture Action
                CAPTURE: packed union {
                    raw: u3,
                    value: TCC_FCTRLB__CAPTURE,
                },
                reserved16: u1,
                ///  Fault B Blanking Time
                BLANKVAL: u8,
                ///  Fault B Filter Value
                FILTERVAL: u4,
                padding: u4,
            }),
            ///  Waveform Extension Configuration
            WEXCTRL: mmio.Mmio(packed struct(u32) {
                ///  Output Matrix
                OTMX: u2,
                reserved8: u6,
                ///  Dead-time Insertion Generator 0 Enable
                DTIEN0: u1,
                ///  Dead-time Insertion Generator 1 Enable
                DTIEN1: u1,
                ///  Dead-time Insertion Generator 2 Enable
                DTIEN2: u1,
                ///  Dead-time Insertion Generator 3 Enable
                DTIEN3: u1,
                reserved16: u4,
                ///  Dead-time Low Side Outputs Value
                DTLS: u8,
                ///  Dead-time High Side Outputs Value
                DTHS: u8,
            }),
            ///  Driver Control
            DRVCTRL: mmio.Mmio(packed struct(u32) {
                ///  Non-Recoverable State 0 Output Enable
                NRE0: u1,
                ///  Non-Recoverable State 1 Output Enable
                NRE1: u1,
                ///  Non-Recoverable State 2 Output Enable
                NRE2: u1,
                ///  Non-Recoverable State 3 Output Enable
                NRE3: u1,
                ///  Non-Recoverable State 4 Output Enable
                NRE4: u1,
                ///  Non-Recoverable State 5 Output Enable
                NRE5: u1,
                ///  Non-Recoverable State 6 Output Enable
                NRE6: u1,
                ///  Non-Recoverable State 7 Output Enable
                NRE7: u1,
                ///  Non-Recoverable State 0 Output Value
                NRV0: u1,
                ///  Non-Recoverable State 1 Output Value
                NRV1: u1,
                ///  Non-Recoverable State 2 Output Value
                NRV2: u1,
                ///  Non-Recoverable State 3 Output Value
                NRV3: u1,
                ///  Non-Recoverable State 4 Output Value
                NRV4: u1,
                ///  Non-Recoverable State 5 Output Value
                NRV5: u1,
                ///  Non-Recoverable State 6 Output Value
                NRV6: u1,
                ///  Non-Recoverable State 7 Output Value
                NRV7: u1,
                ///  Output Waveform 0 Inversion
                INVEN0: u1,
                ///  Output Waveform 1 Inversion
                INVEN1: u1,
                ///  Output Waveform 2 Inversion
                INVEN2: u1,
                ///  Output Waveform 3 Inversion
                INVEN3: u1,
                ///  Output Waveform 4 Inversion
                INVEN4: u1,
                ///  Output Waveform 5 Inversion
                INVEN5: u1,
                ///  Output Waveform 6 Inversion
                INVEN6: u1,
                ///  Output Waveform 7 Inversion
                INVEN7: u1,
                ///  Non-Recoverable Fault Input 0 Filter Value
                FILTERVAL0: u4,
                ///  Non-Recoverable Fault Input 1 Filter Value
                FILTERVAL1: u4,
            }),
            reserved30: [2]u8,
            ///  Debug Control
            DBGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Debug Running Mode
                DBGRUN: u1,
                reserved2: u1,
                ///  Fault Detection on Debug Break Detection
                FDDBD: u1,
                padding: u5,
            }),
            reserved32: [1]u8,
            ///  Event Control
            EVCTRL: mmio.Mmio(packed struct(u32) {
                ///  Timer/counter Input Event0 Action
                EVACT0: packed union {
                    raw: u3,
                    value: TCC_EVCTRL__EVACT0,
                },
                ///  Timer/counter Input Event1 Action
                EVACT1: packed union {
                    raw: u3,
                    value: TCC_EVCTRL__EVACT1,
                },
                ///  Timer/counter Output Event Mode
                CNTSEL: packed union {
                    raw: u2,
                    value: TCC_EVCTRL__CNTSEL,
                },
                ///  Overflow/Underflow Output Event Enable
                OVFEO: u1,
                ///  Retrigger Output Event Enable
                TRGEO: u1,
                ///  Timer/counter Output Event Enable
                CNTEO: u1,
                reserved12: u1,
                ///  Inverted Event 0 Input Enable
                TCINV0: u1,
                ///  Inverted Event 1 Input Enable
                TCINV1: u1,
                ///  Timer/counter Event 0 Input Enable
                TCEI0: u1,
                ///  Timer/counter Event 1 Input Enable
                TCEI1: u1,
                ///  Match or Capture Channel 0 Event Input Enable
                MCEI0: u1,
                ///  Match or Capture Channel 1 Event Input Enable
                MCEI1: u1,
                ///  Match or Capture Channel 2 Event Input Enable
                MCEI2: u1,
                ///  Match or Capture Channel 3 Event Input Enable
                MCEI3: u1,
                reserved24: u4,
                ///  Match or Capture Channel 0 Event Output Enable
                MCEO0: u1,
                ///  Match or Capture Channel 1 Event Output Enable
                MCEO1: u1,
                ///  Match or Capture Channel 2 Event Output Enable
                MCEO2: u1,
                ///  Match or Capture Channel 3 Event Output Enable
                MCEO3: u1,
                padding: u4,
            }),
            ///  Interrupt Enable Clear
            INTENCLR: mmio.Mmio(packed struct(u32) {
                ///  Overflow Interrupt Enable
                OVF: u1,
                ///  Retrigger Interrupt Enable
                TRG: u1,
                ///  Counter Interrupt Enable
                CNT: u1,
                ///  Error Interrupt Enable
                ERR: u1,
                reserved11: u7,
                ///  Non-Recoverable Debug Fault Interrupt Enable
                DFS: u1,
                ///  Recoverable Fault A Interrupt Enable
                FAULTA: u1,
                ///  Recoverable Fault B Interrupt Enable
                FAULTB: u1,
                ///  Non-Recoverable Fault 0 Interrupt Enable
                FAULT0: u1,
                ///  Non-Recoverable Fault 1 Interrupt Enable
                FAULT1: u1,
                ///  Match or Capture Channel 0 Interrupt Enable
                MC0: u1,
                ///  Match or Capture Channel 1 Interrupt Enable
                MC1: u1,
                ///  Match or Capture Channel 2 Interrupt Enable
                MC2: u1,
                ///  Match or Capture Channel 3 Interrupt Enable
                MC3: u1,
                padding: u12,
            }),
            ///  Interrupt Enable Set
            INTENSET: mmio.Mmio(packed struct(u32) {
                ///  Overflow Interrupt Enable
                OVF: u1,
                ///  Retrigger Interrupt Enable
                TRG: u1,
                ///  Counter Interrupt Enable
                CNT: u1,
                ///  Error Interrupt Enable
                ERR: u1,
                reserved11: u7,
                ///  Non-Recoverable Debug Fault Interrupt Enable
                DFS: u1,
                ///  Recoverable Fault A Interrupt Enable
                FAULTA: u1,
                ///  Recoverable Fault B Interrupt Enable
                FAULTB: u1,
                ///  Non-Recoverable Fault 0 Interrupt Enable
                FAULT0: u1,
                ///  Non-Recoverable Fault 1 Interrupt Enable
                FAULT1: u1,
                ///  Match or Capture Channel 0 Interrupt Enable
                MC0: u1,
                ///  Match or Capture Channel 1 Interrupt Enable
                MC1: u1,
                ///  Match or Capture Channel 2 Interrupt Enable
                MC2: u1,
                ///  Match or Capture Channel 3 Interrupt Enable
                MC3: u1,
                padding: u12,
            }),
            ///  Interrupt Flag Status and Clear
            INTFLAG: mmio.Mmio(packed struct(u32) {
                ///  Overflow
                OVF: u1,
                ///  Retrigger
                TRG: u1,
                ///  Counter
                CNT: u1,
                ///  Error
                ERR: u1,
                reserved11: u7,
                ///  Non-Recoverable Debug Fault
                DFS: u1,
                ///  Recoverable Fault A
                FAULTA: u1,
                ///  Recoverable Fault B
                FAULTB: u1,
                ///  Non-Recoverable Fault 0
                FAULT0: u1,
                ///  Non-Recoverable Fault 1
                FAULT1: u1,
                ///  Match or Capture 0
                MC0: u1,
                ///  Match or Capture 1
                MC1: u1,
                ///  Match or Capture 2
                MC2: u1,
                ///  Match or Capture 3
                MC3: u1,
                padding: u12,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u32) {
                ///  Stop
                STOP: u1,
                ///  Ramp
                IDX: u1,
                reserved3: u1,
                ///  Non-Recoverable Debug Fault State
                DFS: u1,
                ///  Slave
                SLAVE: u1,
                ///  Pattern Buffer Valid
                PATTBV: u1,
                ///  Wave Buffer Valid
                WAVEBV: u1,
                ///  Period Buffer Valid
                PERBV: u1,
                ///  Recoverable Fault A Input
                FAULTAIN: u1,
                ///  Recoverable Fault B Input
                FAULTBIN: u1,
                ///  Non-Recoverable Fault0 Input
                FAULT0IN: u1,
                ///  Non-Recoverable Fault1 Input
                FAULT1IN: u1,
                ///  Recoverable Fault A State
                FAULTA: u1,
                ///  Recoverable Fault B State
                FAULTB: u1,
                ///  Non-Recoverable Fault 0 State
                FAULT0: u1,
                ///  Non-Recoverable Fault 1 State
                FAULT1: u1,
                ///  Compare Channel 0 Buffer Valid
                CCBV0: u1,
                ///  Compare Channel 1 Buffer Valid
                CCBV1: u1,
                ///  Compare Channel 2 Buffer Valid
                CCBV2: u1,
                ///  Compare Channel 3 Buffer Valid
                CCBV3: u1,
                reserved24: u4,
                ///  Compare Channel 0 Value
                CMP0: u1,
                ///  Compare Channel 1 Value
                CMP1: u1,
                ///  Compare Channel 2 Value
                CMP2: u1,
                ///  Compare Channel 3 Value
                CMP3: u1,
                padding: u4,
            }),
            ///  Count
            COUNT: mmio.Mmio(packed struct(u32) {
                ///  Counter Value
                COUNT: u24,
                padding: u8,
            }),
            ///  Pattern
            PATT: mmio.Mmio(packed struct(u16) {
                ///  Pattern Generator 0 Output Enable
                PGE0: u1,
                ///  Pattern Generator 1 Output Enable
                PGE1: u1,
                ///  Pattern Generator 2 Output Enable
                PGE2: u1,
                ///  Pattern Generator 3 Output Enable
                PGE3: u1,
                ///  Pattern Generator 4 Output Enable
                PGE4: u1,
                ///  Pattern Generator 5 Output Enable
                PGE5: u1,
                ///  Pattern Generator 6 Output Enable
                PGE6: u1,
                ///  Pattern Generator 7 Output Enable
                PGE7: u1,
                ///  Pattern Generator 0 Output Value
                PGV0: u1,
                ///  Pattern Generator 1 Output Value
                PGV1: u1,
                ///  Pattern Generator 2 Output Value
                PGV2: u1,
                ///  Pattern Generator 3 Output Value
                PGV3: u1,
                ///  Pattern Generator 4 Output Value
                PGV4: u1,
                ///  Pattern Generator 5 Output Value
                PGV5: u1,
                ///  Pattern Generator 6 Output Value
                PGV6: u1,
                ///  Pattern Generator 7 Output Value
                PGV7: u1,
            }),
            reserved60: [2]u8,
            ///  Waveform Control
            WAVE: mmio.Mmio(packed struct(u32) {
                ///  Waveform Generation
                WAVEGEN: packed union {
                    raw: u3,
                    value: TCC_WAVE__WAVEGEN,
                },
                reserved4: u1,
                ///  Ramp Mode
                RAMP: packed union {
                    raw: u2,
                    value: TCC_WAVE__RAMP,
                },
                reserved7: u1,
                ///  Circular period Enable
                CIPEREN: u1,
                ///  Circular Channel 0 Enable
                CICCEN0: u1,
                ///  Circular Channel 1 Enable
                CICCEN1: u1,
                ///  Circular Channel 2 Enable
                CICCEN2: u1,
                ///  Circular Channel 3 Enable
                CICCEN3: u1,
                reserved16: u4,
                ///  Channel 0 Polarity
                POL0: u1,
                ///  Channel 1 Polarity
                POL1: u1,
                ///  Channel 2 Polarity
                POL2: u1,
                ///  Channel 3 Polarity
                POL3: u1,
                reserved24: u4,
                ///  Swap DTI Output Pair 0
                SWAP0: u1,
                ///  Swap DTI Output Pair 1
                SWAP1: u1,
                ///  Swap DTI Output Pair 2
                SWAP2: u1,
                ///  Swap DTI Output Pair 3
                SWAP3: u1,
                padding: u4,
            }),
            ///  Period
            PER: mmio.Mmio(packed struct(u32) {
                ///  Dithering Cycle Number
                DITHERCY: u4,
                ///  Period Value
                PER: u20,
                padding: u8,
            }),
            ///  Compare and Capture
            CC: mmio.Mmio(packed struct(u32) {
                ///  Dithering Cycle Number
                DITHERCY: u4,
                ///  Channel Compare/Capture Value
                CC: u20,
                padding: u8,
            }),
            reserved100: [28]u8,
            ///  Pattern Buffer
            PATTB: mmio.Mmio(packed struct(u16) {
                ///  Pattern Generator 0 Output Enable Buffer
                PGEB0: u1,
                ///  Pattern Generator 1 Output Enable Buffer
                PGEB1: u1,
                ///  Pattern Generator 2 Output Enable Buffer
                PGEB2: u1,
                ///  Pattern Generator 3 Output Enable Buffer
                PGEB3: u1,
                ///  Pattern Generator 4 Output Enable Buffer
                PGEB4: u1,
                ///  Pattern Generator 5 Output Enable Buffer
                PGEB5: u1,
                ///  Pattern Generator 6 Output Enable Buffer
                PGEB6: u1,
                ///  Pattern Generator 7 Output Enable Buffer
                PGEB7: u1,
                ///  Pattern Generator 0 Output Enable
                PGVB0: u1,
                ///  Pattern Generator 1 Output Enable
                PGVB1: u1,
                ///  Pattern Generator 2 Output Enable
                PGVB2: u1,
                ///  Pattern Generator 3 Output Enable
                PGVB3: u1,
                ///  Pattern Generator 4 Output Enable
                PGVB4: u1,
                ///  Pattern Generator 5 Output Enable
                PGVB5: u1,
                ///  Pattern Generator 6 Output Enable
                PGVB6: u1,
                ///  Pattern Generator 7 Output Enable
                PGVB7: u1,
            }),
            reserved104: [2]u8,
            ///  Waveform Control Buffer
            WAVEB: mmio.Mmio(packed struct(u32) {
                ///  Waveform Generation Buffer
                WAVEGENB: packed union {
                    raw: u3,
                    value: TCC_WAVEB__WAVEGENB,
                },
                reserved4: u1,
                ///  Ramp Mode Buffer
                RAMPB: packed union {
                    raw: u2,
                    value: TCC_WAVEB__RAMPB,
                },
                reserved7: u1,
                ///  Circular Period Enable Buffer
                CIPERENB: u1,
                ///  Circular Channel 0 Enable Buffer
                CICCENB0: u1,
                ///  Circular Channel 1 Enable Buffer
                CICCENB1: u1,
                ///  Circular Channel 2 Enable Buffer
                CICCENB2: u1,
                ///  Circular Channel 3 Enable Buffer
                CICCENB3: u1,
                reserved16: u4,
                ///  Channel 0 Polarity Buffer
                POLB0: u1,
                ///  Channel 1 Polarity Buffer
                POLB1: u1,
                ///  Channel 2 Polarity Buffer
                POLB2: u1,
                ///  Channel 3 Polarity Buffer
                POLB3: u1,
                reserved24: u4,
                ///  Swap DTI Output Pair 0 Buffer
                SWAPB0: u1,
                ///  Swap DTI Output Pair 1 Buffer
                SWAPB1: u1,
                ///  Swap DTI Output Pair 2 Buffer
                SWAPB2: u1,
                ///  Swap DTI Output Pair 3 Buffer
                SWAPB3: u1,
                padding: u4,
            }),
            ///  Period Buffer
            PERB: mmio.Mmio(packed struct(u32) {
                ///  Dithering Buffer Cycle Number
                DITHERCYB: u4,
                ///  Period Buffer Value
                PERB: u20,
                padding: u8,
            }),
            ///  Compare and Capture Buffer
            CCB: mmio.Mmio(packed struct(u32) {
                ///  Dithering Buffer Cycle Number
                DITHERCYB: u4,
                ///  Channel Compare/Capture Buffer Value
                CCB: u20,
                padding: u8,
            }),
        };

        ///  Universal Serial Bus
        pub const USB = struct {
            pub const USB_CTRLA__MODE = enum(u1) {
                ///  Device Mode
                DEVICE = 0x0,
                ///  Host Mode
                HOST = 0x1,
            };

            pub const USB_QOSCTRL__CQOS = enum(u2) {
                ///  Background (no sensitive operation)
                DISABLE = 0x0,
                ///  Sensitive Bandwidth
                LOW = 0x1,
                ///  Sensitive Latency
                MEDIUM = 0x2,
                ///  Critical Latency
                HIGH = 0x3,
            };

            pub const USB_QOSCTRL__DQOS = enum(u2) {
                ///  Background (no sensitive operation)
                DISABLE = 0x0,
                ///  Sensitive Bandwidth
                LOW = 0x1,
                ///  Sensitive Latency
                MEDIUM = 0x2,
                ///  Critical Latency
                HIGH = 0x3,
            };

            pub const USB_DEVICE_CTRLB__LPMHDSK = enum(u2) {
                ///  No handshake. LPM is not supported
                NO = 0x0,
                ///  ACK
                ACK = 0x1,
                ///  NYET
                NYET = 0x2,
                ///  STALL
                STALL = 0x3,
            };

            pub const USB_DEVICE_CTRLB__SPDCONF = enum(u2) {
                ///  FS : Full Speed
                FS = 0x0,
                ///  LS : Low Speed
                LS = 0x1,
                ///  HS : High Speed capable
                HS = 0x2,
                ///  HSTM: High Speed Test Mode (force high-speed mode for test mode)
                HSTM = 0x3,
            };

            pub const USB_HOST_CTRLB__SPDCONF = enum(u2) {
                ///  Normal mode:the host starts in full-speed mode and performs a high-speed reset to switch to the high speed mode if the downstream peripheral is high-speed capable.
                NORMAL = 0x0,
                ///  Full-speed:the host remains in full-speed mode whatever is the peripheral speed capability. Relevant in UTMI mode only.
                FS = 0x3,
                _,
            };

            pub const USB_DEVICE_STATUS__LINESTATE = enum(u2) {
                ///  SE0/RESET
                @"0" = 0x0,
                ///  FS-J or LS-K State
                @"1" = 0x1,
                ///  FS-K or LS-J State
                @"2" = 0x2,
                _,
            };

            pub const USB_DEVICE_STATUS__SPEED = enum(u2) {
                ///  Full-speed mode
                FS = 0x0,
                ///  High-speed mode
                HS = 0x1,
                ///  Low-speed mode
                LS = 0x2,
                _,
            };

            pub const USB_FSMSTATUS__FSMSTATE = enum(u7) {
                ///  OFF (L3). It corresponds to the powered-off, disconnected, and disabled state
                OFF = 0x1,
                ///  ON (L0). It corresponds to the Idle and Active states
                ON = 0x2,
                ///  SUSPEND (L2)
                SUSPEND = 0x4,
                ///  SLEEP (L1)
                SLEEP = 0x8,
                ///  DNRESUME. Down Stream Resume.
                DNRESUME = 0x10,
                ///  UPRESUME. Up Stream Resume.
                UPRESUME = 0x20,
                ///  RESET. USB lines Reset.
                RESET = 0x40,
                _,
            };

            pub const DEVICE_DESC_BANK = extern union {
                pub const Mode = enum {
                    DEVICE,
                };

                pub fn get_mode(self: *volatile @This()) Mode {
                    {
                        const value = self.CTRLA.read().MODE;
                        switch (value) {
                            0 => return .DEVICE,
                            else => {},
                        }
                    }

                    unreachable;
                }

                DEVICE: extern struct {
                    ///  DEVICE_DESC_BANK Endpoint Bank, Adress of Data Buffer
                    ADDR: mmio.Mmio(packed struct(u32) {
                        ///  Adress of data buffer
                        ADDR: u32,
                    }),
                    ///  DEVICE_DESC_BANK Endpoint Bank, Packet Size
                    PCKSIZE: mmio.Mmio(packed struct(u32) {
                        ///  Byte Count
                        BYTE_COUNT: u14,
                        ///  Multi Packet In or Out size
                        MULTI_PACKET_SIZE: u14,
                        ///  Enpoint size
                        SIZE: u3,
                        ///  Automatic Zero Length Packet
                        AUTO_ZLP: u1,
                    }),
                    ///  DEVICE_DESC_BANK Endpoint Bank, Extended
                    EXTREG: mmio.Mmio(packed struct(u16) {
                        ///  SUBPID field send with extended token
                        SUBPID: u4,
                        ///  Variable field send with extended token
                        VARIABLE: u11,
                        padding: u1,
                    }),
                    ///  DEVICE_DESC_BANK Enpoint Bank, Status of Bank
                    STATUS_BK: mmio.Mmio(packed struct(u8) {
                        ///  CRC Error Status
                        CRCERR: u1,
                        ///  Error Flow Status
                        ERRORFLOW: u1,
                        padding: u6,
                    }),
                    padding: [5]u8,
                },
            };

            pub const HOST_DESC_BANK = extern union {
                pub const Mode = enum {
                    HOST,
                };

                pub fn get_mode(self: *volatile @This()) Mode {
                    {
                        const value = self.CTRLA.read().MODE;
                        switch (value) {
                            1 => return .HOST,
                            else => {},
                        }
                    }

                    unreachable;
                }

                HOST: extern struct {
                    ///  HOST_DESC_BANK Host Bank, Adress of Data Buffer
                    ADDR: mmio.Mmio(packed struct(u32) {
                        ///  Adress of data buffer
                        ADDR: u32,
                    }),
                    ///  HOST_DESC_BANK Host Bank, Packet Size
                    PCKSIZE: mmio.Mmio(packed struct(u32) {
                        ///  Byte Count
                        BYTE_COUNT: u14,
                        ///  Multi Packet In or Out size
                        MULTI_PACKET_SIZE: u14,
                        ///  Pipe size
                        SIZE: u3,
                        ///  Automatic Zero Length Packet
                        AUTO_ZLP: u1,
                    }),
                    ///  HOST_DESC_BANK Host Bank, Extended
                    EXTREG: mmio.Mmio(packed struct(u16) {
                        ///  SUBPID field send with extended token
                        SUBPID: u4,
                        ///  Variable field send with extended token
                        VARIABLE: u11,
                        padding: u1,
                    }),
                    ///  HOST_DESC_BANK Host Bank, Status of Bank
                    STATUS_BK: mmio.Mmio(packed struct(u8) {
                        ///  CRC Error Status
                        CRCERR: u1,
                        ///  Error Flow Status
                        ERRORFLOW: u1,
                        padding: u6,
                    }),
                    reserved12: [1]u8,
                    ///  HOST_DESC_BANK Host Bank, Host Control Pipe
                    CTRL_PIPE: mmio.Mmio(packed struct(u16) {
                        ///  Pipe Device Adress
                        PDADDR: u7,
                        reserved8: u1,
                        ///  Pipe Endpoint Number
                        PEPNUM: u4,
                        ///  Pipe Error Max Number
                        PERMAX: u4,
                    }),
                    ///  HOST_DESC_BANK Host Bank, Host Status Pipe
                    STATUS_PIPE: mmio.Mmio(packed struct(u16) {
                        ///  Data Toggle Error
                        DTGLER: u1,
                        ///  Data PID Error
                        DAPIDER: u1,
                        ///  PID Error
                        PIDER: u1,
                        ///  Time Out Error
                        TOUTER: u1,
                        ///  CRC16 Error
                        CRC16ER: u1,
                        ///  Pipe Error Count
                        ERCNT: u3,
                        padding: u8,
                    }),
                },
            };

            pub const DEVICE_ENDPOINT = extern union {
                pub const Mode = enum {
                    DEVICE,
                };

                pub fn get_mode(self: *volatile @This()) Mode {
                    {
                        const value = self.CTRLA.read().MODE;
                        switch (value) {
                            0 => return .DEVICE,
                            else => {},
                        }
                    }

                    unreachable;
                }

                DEVICE: extern struct {
                    ///  DEVICE_ENDPOINT End Point Configuration
                    EPCFG: mmio.Mmio(packed struct(u8) {
                        ///  End Point Type0
                        EPTYPE0: u3,
                        reserved4: u1,
                        ///  End Point Type1
                        EPTYPE1: u3,
                        ///  NYET Token Disable
                        NYETDIS: u1,
                    }),
                    reserved4: [3]u8,
                    ///  DEVICE_ENDPOINT End Point Pipe Status Clear
                    EPSTATUSCLR: mmio.Mmio(packed struct(u8) {
                        ///  Data Toggle OUT Clear
                        DTGLOUT: u1,
                        ///  Data Toggle IN Clear
                        DTGLIN: u1,
                        ///  Curren Bank Clear
                        CURBK: u1,
                        reserved4: u1,
                        ///  Stall 0 Request Clear
                        STALLRQ0: u1,
                        ///  Stall 1 Request Clear
                        STALLRQ1: u1,
                        ///  Bank 0 Ready Clear
                        BK0RDY: u1,
                        ///  Bank 1 Ready Clear
                        BK1RDY: u1,
                    }),
                    ///  DEVICE_ENDPOINT End Point Pipe Status Set
                    EPSTATUSSET: mmio.Mmio(packed struct(u8) {
                        ///  Data Toggle OUT Set
                        DTGLOUT: u1,
                        ///  Data Toggle IN Set
                        DTGLIN: u1,
                        ///  Current Bank Set
                        CURBK: u1,
                        reserved4: u1,
                        ///  Stall 0 Request Set
                        STALLRQ0: u1,
                        ///  Stall 1 Request Set
                        STALLRQ1: u1,
                        ///  Bank 0 Ready Set
                        BK0RDY: u1,
                        ///  Bank 1 Ready Set
                        BK1RDY: u1,
                    }),
                    ///  DEVICE_ENDPOINT End Point Pipe Status
                    EPSTATUS: mmio.Mmio(packed struct(u8) {
                        ///  Data Toggle Out
                        DTGLOUT: u1,
                        ///  Data Toggle In
                        DTGLIN: u1,
                        ///  Current Bank
                        CURBK: u1,
                        reserved4: u1,
                        ///  Stall 0 Request
                        STALLRQ0: u1,
                        ///  Stall 1 Request
                        STALLRQ1: u1,
                        ///  Bank 0 ready
                        BK0RDY: u1,
                        ///  Bank 1 ready
                        BK1RDY: u1,
                    }),
                    ///  DEVICE_ENDPOINT End Point Interrupt Flag
                    EPINTFLAG: mmio.Mmio(packed struct(u8) {
                        ///  Transfer Complete 0
                        TRCPT0: u1,
                        ///  Transfer Complete 1
                        TRCPT1: u1,
                        ///  Error Flow 0
                        TRFAIL0: u1,
                        ///  Error Flow 1
                        TRFAIL1: u1,
                        ///  Received Setup
                        RXSTP: u1,
                        ///  Stall 0 In/out
                        STALL0: u1,
                        ///  Stall 1 In/out
                        STALL1: u1,
                        padding: u1,
                    }),
                    ///  DEVICE_ENDPOINT End Point Interrupt Clear Flag
                    EPINTENCLR: mmio.Mmio(packed struct(u8) {
                        ///  Transfer Complete 0 Interrupt Disable
                        TRCPT0: u1,
                        ///  Transfer Complete 1 Interrupt Disable
                        TRCPT1: u1,
                        ///  Error Flow 0 Interrupt Disable
                        TRFAIL0: u1,
                        ///  Error Flow 1 Interrupt Disable
                        TRFAIL1: u1,
                        ///  Received Setup Interrupt Disable
                        RXSTP: u1,
                        ///  Stall 0 In/Out Interrupt Disable
                        STALL0: u1,
                        ///  Stall 1 In/Out Interrupt Disable
                        STALL1: u1,
                        padding: u1,
                    }),
                    ///  DEVICE_ENDPOINT End Point Interrupt Set Flag
                    EPINTENSET: mmio.Mmio(packed struct(u8) {
                        ///  Transfer Complete 0 Interrupt Enable
                        TRCPT0: u1,
                        ///  Transfer Complete 1 Interrupt Enable
                        TRCPT1: u1,
                        ///  Error Flow 0 Interrupt Enable
                        TRFAIL0: u1,
                        ///  Error Flow 1 Interrupt Enable
                        TRFAIL1: u1,
                        ///  Received Setup Interrupt Enable
                        RXSTP: u1,
                        ///  Stall 0 In/out Interrupt enable
                        STALL0: u1,
                        ///  Stall 1 In/out Interrupt enable
                        STALL1: u1,
                        padding: u1,
                    }),
                    padding: [22]u8,
                },
            };

            pub const HOST_PIPE = extern union {
                pub const Mode = enum {
                    HOST,
                };

                pub fn get_mode(self: *volatile @This()) Mode {
                    {
                        const value = self.CTRLA.read().MODE;
                        switch (value) {
                            1 => return .HOST,
                            else => {},
                        }
                    }

                    unreachable;
                }

                HOST: extern struct {
                    ///  HOST_PIPE End Point Configuration
                    PCFG: mmio.Mmio(packed struct(u8) {
                        ///  Pipe Token
                        PTOKEN: u2,
                        ///  Pipe Bank
                        BK: u1,
                        ///  Pipe Type
                        PTYPE: u3,
                        padding: u2,
                    }),
                    reserved3: [2]u8,
                    ///  HOST_PIPE Bus Access Period of Pipe
                    BINTERVAL: mmio.Mmio(packed struct(u8) {
                        ///  Bit Interval
                        BITINTERVAL: u8,
                    }),
                    ///  HOST_PIPE End Point Pipe Status Clear
                    PSTATUSCLR: mmio.Mmio(packed struct(u8) {
                        ///  Data Toggle clear
                        DTGL: u1,
                        reserved2: u1,
                        ///  Curren Bank clear
                        CURBK: u1,
                        reserved4: u1,
                        ///  Pipe Freeze Clear
                        PFREEZE: u1,
                        reserved6: u1,
                        ///  Bank 0 Ready Clear
                        BK0RDY: u1,
                        ///  Bank 1 Ready Clear
                        BK1RDY: u1,
                    }),
                    ///  HOST_PIPE End Point Pipe Status Set
                    PSTATUSSET: mmio.Mmio(packed struct(u8) {
                        ///  Data Toggle Set
                        DTGL: u1,
                        reserved2: u1,
                        ///  Current Bank Set
                        CURBK: u1,
                        reserved4: u1,
                        ///  Pipe Freeze Set
                        PFREEZE: u1,
                        reserved6: u1,
                        ///  Bank 0 Ready Set
                        BK0RDY: u1,
                        ///  Bank 1 Ready Set
                        BK1RDY: u1,
                    }),
                    ///  HOST_PIPE End Point Pipe Status
                    PSTATUS: mmio.Mmio(packed struct(u8) {
                        ///  Data Toggle
                        DTGL: u1,
                        reserved2: u1,
                        ///  Current Bank
                        CURBK: u1,
                        reserved4: u1,
                        ///  Pipe Freeze
                        PFREEZE: u1,
                        reserved6: u1,
                        ///  Bank 0 ready
                        BK0RDY: u1,
                        ///  Bank 1 ready
                        BK1RDY: u1,
                    }),
                    ///  HOST_PIPE Pipe Interrupt Flag
                    PINTFLAG: mmio.Mmio(packed struct(u8) {
                        ///  Transfer Complete 0 Interrupt Flag
                        TRCPT0: u1,
                        ///  Transfer Complete 1 Interrupt Flag
                        TRCPT1: u1,
                        ///  Error Flow Interrupt Flag
                        TRFAIL: u1,
                        ///  Pipe Error Interrupt Flag
                        PERR: u1,
                        ///  Transmit Setup Interrupt Flag
                        TXSTP: u1,
                        ///  Stall Interrupt Flag
                        STALL: u1,
                        padding: u2,
                    }),
                    ///  HOST_PIPE Pipe Interrupt Flag Clear
                    PINTENCLR: mmio.Mmio(packed struct(u8) {
                        ///  Transfer Complete 0 Disable
                        TRCPT0: u1,
                        ///  Transfer Complete 1 Disable
                        TRCPT1: u1,
                        ///  Error Flow Interrupt Disable
                        TRFAIL: u1,
                        ///  Pipe Error Interrupt Disable
                        PERR: u1,
                        ///  Transmit Setup Interrupt Disable
                        TXSTP: u1,
                        ///  Stall Inetrrupt Disable
                        STALL: u1,
                        padding: u2,
                    }),
                    ///  HOST_PIPE Pipe Interrupt Flag Set
                    PINTENSET: mmio.Mmio(packed struct(u8) {
                        ///  Transfer Complete 0 Interrupt Enable
                        TRCPT0: u1,
                        ///  Transfer Complete 1 Interrupt Enable
                        TRCPT1: u1,
                        ///  Error Flow Interrupt Enable
                        TRFAIL: u1,
                        ///  Pipe Error Interrupt Enable
                        PERR: u1,
                        ///  Transmit Setup Interrupt Enable
                        TXSTP: u1,
                        ///  Stall Interrupt Enable
                        STALL: u1,
                        padding: u2,
                    }),
                    padding: [22]u8,
                },
            };

            ///  Universal Serial Bus
            pub const USB = extern union {
                pub const Mode = enum {
                    DEVICE,
                    HOST,
                };

                pub fn get_mode(self: *volatile @This()) Mode {
                    {
                        const value = self.CTRLA.read().MODE;
                        switch (value) {
                            0 => return .DEVICE,
                            else => {},
                        }
                    }
                    {
                        const value = self.CTRLA.read().MODE;
                        switch (value) {
                            1 => return .HOST,
                            else => {},
                        }
                    }

                    unreachable;
                }

                DEVICE: extern struct {
                    ///  Control A
                    CTRLA: mmio.Mmio(packed struct(u8) {
                        ///  Software Reset
                        SWRST: u1,
                        ///  Enable
                        ENABLE: u1,
                        ///  Run in Standby Mode
                        RUNSTDBY: u1,
                        reserved7: u4,
                        ///  Operating Mode
                        MODE: packed union {
                            raw: u1,
                            value: USB_CTRLA__MODE,
                        },
                    }),
                    reserved2: [1]u8,
                    ///  Synchronization Busy
                    SYNCBUSY: mmio.Mmio(packed struct(u8) {
                        ///  Software Reset Synchronization Busy
                        SWRST: u1,
                        ///  Enable Synchronization Busy
                        ENABLE: u1,
                        padding: u6,
                    }),
                    ///  USB Quality Of Service
                    QOSCTRL: mmio.Mmio(packed struct(u8) {
                        ///  Configuration Quality of Service
                        CQOS: packed union {
                            raw: u2,
                            value: USB_QOSCTRL__CQOS,
                        },
                        ///  Data Quality of Service
                        DQOS: packed union {
                            raw: u2,
                            value: USB_QOSCTRL__DQOS,
                        },
                        padding: u4,
                    }),
                    reserved8: [4]u8,
                    ///  DEVICE Control B
                    CTRLB: mmio.Mmio(packed struct(u16) {
                        ///  Detach
                        DETACH: u1,
                        ///  Upstream Resume
                        UPRSM: u1,
                        ///  Speed Configuration
                        SPDCONF: packed union {
                            raw: u2,
                            value: USB_DEVICE_CTRLB__SPDCONF,
                        },
                        ///  No Reply
                        NREPLY: u1,
                        ///  Test mode J
                        TSTJ: u1,
                        ///  Test mode K
                        TSTK: u1,
                        ///  Test packet mode
                        TSTPCKT: u1,
                        ///  Specific Operational Mode
                        OPMODE2: u1,
                        ///  Global NAK
                        GNAK: u1,
                        ///  Link Power Management Handshake
                        LPMHDSK: packed union {
                            raw: u2,
                            value: USB_DEVICE_CTRLB__LPMHDSK,
                        },
                        padding: u4,
                    }),
                    ///  DEVICE Device Address
                    DADD: mmio.Mmio(packed struct(u8) {
                        ///  Device Address
                        DADD: u7,
                        ///  Device Address Enable
                        ADDEN: u1,
                    }),
                    reserved12: [1]u8,
                    ///  DEVICE Status
                    STATUS: mmio.Mmio(packed struct(u8) {
                        reserved2: u2,
                        ///  Speed Status
                        SPEED: packed union {
                            raw: u2,
                            value: USB_DEVICE_STATUS__SPEED,
                        },
                        reserved6: u2,
                        ///  USB Line State Status
                        LINESTATE: packed union {
                            raw: u2,
                            value: USB_DEVICE_STATUS__LINESTATE,
                        },
                    }),
                    ///  Finite State Machine Status
                    FSMSTATUS: mmio.Mmio(packed struct(u8) {
                        ///  Fine State Machine Status
                        FSMSTATE: packed union {
                            raw: u7,
                            value: USB_FSMSTATUS__FSMSTATE,
                        },
                        padding: u1,
                    }),
                    reserved16: [2]u8,
                    ///  DEVICE Device Frame Number
                    FNUM: mmio.Mmio(packed struct(u16) {
                        ///  Micro Frame Number
                        MFNUM: u3,
                        ///  Frame Number
                        FNUM: u11,
                        reserved15: u1,
                        ///  Frame Number CRC Error
                        FNCERR: u1,
                    }),
                    reserved20: [2]u8,
                    ///  DEVICE Device Interrupt Enable Clear
                    INTENCLR: mmio.Mmio(packed struct(u16) {
                        ///  Suspend Interrupt Enable
                        SUSPEND: u1,
                        ///  Micro Start of Frame Interrupt Enable in High Speed Mode
                        MSOF: u1,
                        ///  Start Of Frame Interrupt Enable
                        SOF: u1,
                        ///  End of Reset Interrupt Enable
                        EORST: u1,
                        ///  Wake Up Interrupt Enable
                        WAKEUP: u1,
                        ///  End Of Resume Interrupt Enable
                        EORSM: u1,
                        ///  Upstream Resume Interrupt Enable
                        UPRSM: u1,
                        ///  Ram Access Interrupt Enable
                        RAMACER: u1,
                        ///  Link Power Management Not Yet Interrupt Enable
                        LPMNYET: u1,
                        ///  Link Power Management Suspend Interrupt Enable
                        LPMSUSP: u1,
                        padding: u6,
                    }),
                    reserved24: [2]u8,
                    ///  DEVICE Device Interrupt Enable Set
                    INTENSET: mmio.Mmio(packed struct(u16) {
                        ///  Suspend Interrupt Enable
                        SUSPEND: u1,
                        ///  Micro Start of Frame Interrupt Enable in High Speed Mode
                        MSOF: u1,
                        ///  Start Of Frame Interrupt Enable
                        SOF: u1,
                        ///  End of Reset Interrupt Enable
                        EORST: u1,
                        ///  Wake Up Interrupt Enable
                        WAKEUP: u1,
                        ///  End Of Resume Interrupt Enable
                        EORSM: u1,
                        ///  Upstream Resume Interrupt Enable
                        UPRSM: u1,
                        ///  Ram Access Interrupt Enable
                        RAMACER: u1,
                        ///  Link Power Management Not Yet Interrupt Enable
                        LPMNYET: u1,
                        ///  Link Power Management Suspend Interrupt Enable
                        LPMSUSP: u1,
                        padding: u6,
                    }),
                    reserved28: [2]u8,
                    ///  DEVICE Device Interrupt Flag
                    INTFLAG: mmio.Mmio(packed struct(u16) {
                        ///  Suspend
                        SUSPEND: u1,
                        ///  Micro Start of Frame in High Speed Mode
                        MSOF: u1,
                        ///  Start Of Frame
                        SOF: u1,
                        ///  End of Reset
                        EORST: u1,
                        ///  Wake Up
                        WAKEUP: u1,
                        ///  End Of Resume
                        EORSM: u1,
                        ///  Upstream Resume
                        UPRSM: u1,
                        ///  Ram Access
                        RAMACER: u1,
                        ///  Link Power Management Not Yet
                        LPMNYET: u1,
                        ///  Link Power Management Suspend
                        LPMSUSP: u1,
                        padding: u6,
                    }),
                    reserved32: [2]u8,
                    ///  DEVICE End Point Interrupt Summary
                    EPINTSMRY: mmio.Mmio(packed struct(u16) {
                        ///  End Point 0 Interrupt
                        EPINT0: u1,
                        ///  End Point 1 Interrupt
                        EPINT1: u1,
                        ///  End Point 2 Interrupt
                        EPINT2: u1,
                        ///  End Point 3 Interrupt
                        EPINT3: u1,
                        ///  End Point 4 Interrupt
                        EPINT4: u1,
                        ///  End Point 5 Interrupt
                        EPINT5: u1,
                        ///  End Point 6 Interrupt
                        EPINT6: u1,
                        ///  End Point 7 Interrupt
                        EPINT7: u1,
                        padding: u8,
                    }),
                    reserved36: [2]u8,
                    ///  Descriptor Address
                    DESCADD: mmio.Mmio(packed struct(u32) {
                        ///  Descriptor Address Value
                        DESCADD: u32,
                    }),
                    ///  USB PAD Calibration
                    PADCAL: mmio.Mmio(packed struct(u16) {
                        ///  USB Pad Transp calibration
                        TRANSP: u5,
                        reserved6: u1,
                        ///  USB Pad Transn calibration
                        TRANSN: u5,
                        reserved12: u1,
                        ///  USB Pad Trim calibration
                        TRIM: u3,
                        padding: u1,
                    }),
                },
                HOST: extern struct {
                    ///  Control A
                    CTRLA: mmio.Mmio(packed struct(u8) {
                        ///  Software Reset
                        SWRST: u1,
                        ///  Enable
                        ENABLE: u1,
                        ///  Run in Standby Mode
                        RUNSTDBY: u1,
                        reserved7: u4,
                        ///  Operating Mode
                        MODE: packed union {
                            raw: u1,
                            value: USB_CTRLA__MODE,
                        },
                    }),
                    reserved2: [1]u8,
                    ///  Synchronization Busy
                    SYNCBUSY: mmio.Mmio(packed struct(u8) {
                        ///  Software Reset Synchronization Busy
                        SWRST: u1,
                        ///  Enable Synchronization Busy
                        ENABLE: u1,
                        padding: u6,
                    }),
                    ///  USB Quality Of Service
                    QOSCTRL: mmio.Mmio(packed struct(u8) {
                        ///  Configuration Quality of Service
                        CQOS: packed union {
                            raw: u2,
                            value: USB_QOSCTRL__CQOS,
                        },
                        ///  Data Quality of Service
                        DQOS: packed union {
                            raw: u2,
                            value: USB_QOSCTRL__DQOS,
                        },
                        padding: u4,
                    }),
                    reserved8: [4]u8,
                    ///  HOST Control B
                    CTRLB: mmio.Mmio(packed struct(u16) {
                        reserved1: u1,
                        ///  Send USB Resume
                        RESUME: u1,
                        ///  Speed Configuration for Host
                        SPDCONF: packed union {
                            raw: u2,
                            value: USB_HOST_CTRLB__SPDCONF,
                        },
                        reserved5: u1,
                        ///  Test mode J
                        TSTJ: u1,
                        ///  Test mode K
                        TSTK: u1,
                        reserved8: u1,
                        ///  Start of Frame Generation Enable
                        SOFE: u1,
                        ///  Send USB Reset
                        BUSRESET: u1,
                        ///  VBUS is OK
                        VBUSOK: u1,
                        ///  Send L1 Resume
                        L1RESUME: u1,
                        padding: u4,
                    }),
                    ///  HOST Host Start Of Frame Control
                    HSOFC: mmio.Mmio(packed struct(u8) {
                        ///  Frame Length Control
                        FLENC: u4,
                        reserved7: u3,
                        ///  Frame Length Control Enable
                        FLENCE: u1,
                    }),
                    reserved12: [1]u8,
                    ///  HOST Status
                    STATUS: mmio.Mmio(packed struct(u8) {
                        reserved2: u2,
                        ///  Speed Status
                        SPEED: u2,
                        reserved6: u2,
                        ///  USB Line State Status
                        LINESTATE: u2,
                    }),
                    ///  Finite State Machine Status
                    FSMSTATUS: mmio.Mmio(packed struct(u8) {
                        ///  Fine State Machine Status
                        FSMSTATE: packed union {
                            raw: u7,
                            value: USB_FSMSTATUS__FSMSTATE,
                        },
                        padding: u1,
                    }),
                    reserved16: [2]u8,
                    ///  HOST Host Frame Number
                    FNUM: mmio.Mmio(packed struct(u16) {
                        ///  Micro Frame Number
                        MFNUM: u3,
                        ///  Frame Number
                        FNUM: u11,
                        padding: u2,
                    }),
                    ///  HOST Host Frame Length
                    FLENHIGH: mmio.Mmio(packed struct(u8) {
                        ///  Frame Length
                        FLENHIGH: u8,
                    }),
                    reserved20: [1]u8,
                    ///  HOST Host Interrupt Enable Clear
                    INTENCLR: mmio.Mmio(packed struct(u16) {
                        reserved2: u2,
                        ///  Host Start Of Frame Interrupt Disable
                        HSOF: u1,
                        ///  BUS Reset Interrupt Disable
                        RST: u1,
                        ///  Wake Up Interrupt Disable
                        WAKEUP: u1,
                        ///  DownStream to Device Interrupt Disable
                        DNRSM: u1,
                        ///  Upstream Resume from Device Interrupt Disable
                        UPRSM: u1,
                        ///  Ram Access Interrupt Disable
                        RAMACER: u1,
                        ///  Device Connection Interrupt Disable
                        DCONN: u1,
                        ///  Device Disconnection Interrupt Disable
                        DDISC: u1,
                        padding: u6,
                    }),
                    reserved24: [2]u8,
                    ///  HOST Host Interrupt Enable Set
                    INTENSET: mmio.Mmio(packed struct(u16) {
                        reserved2: u2,
                        ///  Host Start Of Frame Interrupt Enable
                        HSOF: u1,
                        ///  Bus Reset Interrupt Enable
                        RST: u1,
                        ///  Wake Up Interrupt Enable
                        WAKEUP: u1,
                        ///  DownStream to the Device Interrupt Enable
                        DNRSM: u1,
                        ///  Upstream Resume fromthe device Interrupt Enable
                        UPRSM: u1,
                        ///  Ram Access Interrupt Enable
                        RAMACER: u1,
                        ///  Link Power Management Interrupt Enable
                        DCONN: u1,
                        ///  Device Disconnection Interrupt Enable
                        DDISC: u1,
                        padding: u6,
                    }),
                    reserved28: [2]u8,
                    ///  HOST Host Interrupt Flag
                    INTFLAG: mmio.Mmio(packed struct(u16) {
                        reserved2: u2,
                        ///  Host Start Of Frame
                        HSOF: u1,
                        ///  Bus Reset
                        RST: u1,
                        ///  Wake Up
                        WAKEUP: u1,
                        ///  Downstream
                        DNRSM: u1,
                        ///  Upstream Resume from the Device
                        UPRSM: u1,
                        ///  Ram Access
                        RAMACER: u1,
                        ///  Device Connection
                        DCONN: u1,
                        ///  Device Disconnection
                        DDISC: u1,
                        padding: u6,
                    }),
                    reserved32: [2]u8,
                    ///  HOST Pipe Interrupt Summary
                    PINTSMRY: mmio.Mmio(packed struct(u16) {
                        ///  Pipe 0 Interrupt
                        EPINT0: u1,
                        ///  Pipe 1 Interrupt
                        EPINT1: u1,
                        ///  Pipe 2 Interrupt
                        EPINT2: u1,
                        ///  Pipe 3 Interrupt
                        EPINT3: u1,
                        ///  Pipe 4 Interrupt
                        EPINT4: u1,
                        ///  Pipe 5 Interrupt
                        EPINT5: u1,
                        ///  Pipe 6 Interrupt
                        EPINT6: u1,
                        ///  Pipe 7 Interrupt
                        EPINT7: u1,
                        padding: u8,
                    }),
                    reserved36: [2]u8,
                    ///  Descriptor Address
                    DESCADD: mmio.Mmio(packed struct(u32) {
                        ///  Descriptor Address Value
                        DESCADD: u32,
                    }),
                    ///  USB PAD Calibration
                    PADCAL: mmio.Mmio(packed struct(u16) {
                        ///  USB Pad Transp calibration
                        TRANSP: u5,
                        reserved6: u1,
                        ///  USB Pad Transn calibration
                        TRANSN: u5,
                        reserved12: u1,
                        ///  USB Pad Trim calibration
                        TRIM: u3,
                        padding: u1,
                    }),
                },
            };

            ///  Universal Serial Bus
            pub const USB_DESCRIPTOR = union {
                pub const Mode = enum {
                    DEVICE,
                    HOST,
                };

                pub fn get_mode(self: *volatile @This()) Mode {
                    {
                        const value = self.CTRLA.read().MODE;
                        switch (value) {
                            0 => return .DEVICE,
                            else => {},
                        }
                    }
                    {
                        const value = self.CTRLA.read().MODE;
                        switch (value) {
                            1 => return .HOST,
                            else => {},
                        }
                    }

                    unreachable;
                }

                DEVICE: extern struct {},
                HOST: extern struct {},
            };
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
                SETENA: u28,
                padding: u4,
            }),
            reserved128: [124]u8,
            ///  Interrupt Clear Enable Register
            ICER: mmio.Mmio(packed struct(u32) {
                ///  Interrupt clear-enable bits
                CLRENA: u28,
                padding: u4,
            }),
            reserved256: [124]u8,
            ///  Interrupt Set Pending Register
            ISPR: mmio.Mmio(packed struct(u32) {
                ///  Interrupt set-pending bits
                SETPEND: u28,
                padding: u4,
            }),
            reserved384: [124]u8,
            ///  Interrupt Clear Pending Register
            ICPR: mmio.Mmio(packed struct(u32) {
                ///  Interrupt clear-pending bits
                CLRPEND: u28,
                padding: u4,
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
