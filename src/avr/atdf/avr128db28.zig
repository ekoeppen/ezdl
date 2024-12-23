const micro = @import("microzig");
const mmio = micro.mmio;

pub const devices = struct {
    pub const AVR128DB28 = struct {
        pub const properties = struct {
            pub const family = "AVR";
            pub const arch = "AVR8X";
        };

        pub const VectorTable = extern struct {
            const Handler = micro.interrupt.Handler;
            const unhandled = micro.interrupt.unhandled;

            RESET: Handler = unhandled,
            CRCSCAN_NMI: Handler = unhandled,
            BOD_VLM: Handler = unhandled,
            CLKCTRL_CFD: Handler = unhandled,
            MVIO_MVIO: Handler = unhandled,
            RTC_CNT: Handler = unhandled,
            RTC_PIT: Handler = unhandled,
            CCL_CCL: Handler = unhandled,
            PORTA_PORT: Handler = unhandled,
            TCA0_LUNF: Handler = unhandled,
            TCA0_HUNF: Handler = unhandled,
            TCA0_CMP0: Handler = unhandled,
            TCA0_CMP1: Handler = unhandled,
            TCA0_CMP2: Handler = unhandled,
            TCB0_INT: Handler = unhandled,
            TCB1_INT: Handler = unhandled,
            TCD0_OVF: Handler = unhandled,
            TCD0_TRIG: Handler = unhandled,
            TWI0_TWIS: Handler = unhandled,
            TWI0_TWIM: Handler = unhandled,
            SPI0_INT: Handler = unhandled,
            USART0_RXC: Handler = unhandled,
            USART0_DRE: Handler = unhandled,
            USART0_TXC: Handler = unhandled,
            PORTD_PORT: Handler = unhandled,
            AC0_AC: Handler = unhandled,
            ADC0_RESRDY: Handler = unhandled,
            ADC0_WCMP: Handler = unhandled,
            ZCD0_ZCD: Handler = unhandled,
            AC1_AC: Handler = unhandled,
            PORTC_PORT: Handler = unhandled,
            TCB2_INT: Handler = unhandled,
            USART1_RXC: Handler = unhandled,
            USART1_DRE: Handler = unhandled,
            USART1_TXC: Handler = unhandled,
            PORTF_PORT: Handler = unhandled,
            NVMCTRL_EE: Handler = unhandled,
            SPI1_INT: Handler = unhandled,
            USART2_RXC: Handler = unhandled,
            USART2_DRE: Handler = unhandled,
            USART2_TXC: Handler = unhandled,
            AC2_AC: Handler = unhandled,
        };

        pub const VectorIndex = enum(i32) {
            CRCSCAN_NMI = 1,
            BOD_VLM = 2,
            CLKCTRL_CFD = 3,
            MVIO_MVIO = 4,
            RTC_CNT = 5,
            RTC_PIT = 6,
            CCL_CCL = 7,
            PORTA_PORT = 8,
            TCA0_LUNF = 9,
            TCA0_HUNF = 10,
            TCA0_CMP0 = 11,
            TCA0_CMP1 = 12,
            TCA0_CMP2 = 13,
            TCB0_INT = 14,
            TCB1_INT = 15,
            TCD0_OVF = 16,
            TCD0_TRIG = 17,
            TWI0_TWIS = 18,
            TWI0_TWIM = 19,
            SPI0_INT = 20,
            USART0_RXC = 21,
            USART0_DRE = 22,
            USART0_TXC = 23,
            PORTD_PORT = 24,
            AC0_AC = 25,
            ADC0_RESRDY = 26,
            ADC0_WCMP = 27,
            ZCD0_ZCD = 28,
            AC1_AC = 29,
            PORTC_PORT = 30,
            TCB2_INT = 31,
            USART1_RXC = 32,
            USART1_DRE = 33,
            USART1_TXC = 34,
            PORTF_PORT = 35,
            NVMCTRL_EE = 36,
            SPI1_INT = 37,
            USART2_RXC = 38,
            USART2_DRE = 39,
            USART2_TXC = 40,
            AC2_AC = 41,
        };

        pub const peripherals = struct {
            ///  Virtual Ports
            pub const VPORTA = @intToPtr(*volatile types.peripherals.VPORT, 0x0);
            ///  Virtual Ports
            pub const VPORTC = @intToPtr(*volatile types.peripherals.VPORT, 0x8);
            ///  Virtual Ports
            pub const VPORTD = @intToPtr(*volatile types.peripherals.VPORT, 0xc);
            ///  Virtual Ports
            pub const VPORTF = @intToPtr(*volatile types.peripherals.VPORT, 0x14);
            ///  General Purpose Registers
            pub const GPR = @intToPtr(*volatile types.peripherals.GPR, 0x1c);
            ///  CPU
            pub const CPU = @intToPtr(*volatile types.peripherals.CPU, 0x34);
            ///  Reset controller
            pub const RSTCTRL = @intToPtr(*volatile types.peripherals.RSTCTRL, 0x40);
            ///  Sleep Controller
            pub const SLPCTRL = @intToPtr(*volatile types.peripherals.SLPCTRL, 0x50);
            ///  Clock controller
            pub const CLKCTRL = @intToPtr(*volatile types.peripherals.CLKCTRL, 0x60);
            ///  Bod interface
            pub const BOD = @intToPtr(*volatile types.peripherals.BOD, 0xa0);
            ///  Voltage reference
            pub const VREF = @intToPtr(*volatile types.peripherals.VREF, 0xb0);
            ///  Multi-Voltage I/O
            pub const MVIO = @intToPtr(*volatile types.peripherals.MVIO, 0xc0);
            ///  Watch-Dog Timer
            pub const WDT = @intToPtr(*volatile types.peripherals.WDT, 0x100);
            ///  Interrupt Controller
            pub const CPUINT = @intToPtr(*volatile types.peripherals.CPUINT, 0x110);
            ///  CRCSCAN
            pub const CRCSCAN = @intToPtr(*volatile types.peripherals.CRCSCAN, 0x120);
            ///  Real-Time Counter
            pub const RTC = @intToPtr(*volatile types.peripherals.RTC, 0x140);
            ///  Configurable Custom Logic
            pub const CCL = @intToPtr(*volatile types.peripherals.CCL, 0x1c0);
            ///  Event System
            pub const EVSYS = @intToPtr(*volatile types.peripherals.EVSYS, 0x200);
            ///  I/O Ports
            pub const PORTA = @intToPtr(*volatile types.peripherals.PORT, 0x400);
            ///  I/O Ports
            pub const PORTC = @intToPtr(*volatile types.peripherals.PORT, 0x440);
            ///  I/O Ports
            pub const PORTD = @intToPtr(*volatile types.peripherals.PORT, 0x460);
            ///  I/O Ports
            pub const PORTF = @intToPtr(*volatile types.peripherals.PORT, 0x4a0);
            ///  Port Multiplexer
            pub const PORTMUX = @intToPtr(*volatile types.peripherals.PORTMUX, 0x5e0);
            ///  Analog to Digital Converter
            pub const ADC0 = @intToPtr(*volatile types.peripherals.ADC, 0x600);
            ///  Analog Comparator
            pub const AC0 = @intToPtr(*volatile types.peripherals.AC, 0x680);
            ///  Analog Comparator
            pub const AC1 = @intToPtr(*volatile types.peripherals.AC, 0x688);
            ///  Analog Comparator
            pub const AC2 = @intToPtr(*volatile types.peripherals.AC, 0x690);
            ///  Digital to Analog Converter
            pub const DAC0 = @intToPtr(*volatile types.peripherals.DAC, 0x6a0);
            ///  Zero Cross Detect
            pub const ZCD0 = @intToPtr(*volatile types.peripherals.ZCD, 0x6c0);
            ///  Operational Amplifier System
            pub const OPAMP = @intToPtr(*volatile types.peripherals.OPAMP, 0x700);
            ///  Universal Synchronous and Asynchronous Receiver and Transmitter
            pub const USART0 = @intToPtr(*volatile types.peripherals.USART, 0x800);
            ///  Universal Synchronous and Asynchronous Receiver and Transmitter
            pub const USART1 = @intToPtr(*volatile types.peripherals.USART, 0x820);
            ///  Universal Synchronous and Asynchronous Receiver and Transmitter
            pub const USART2 = @intToPtr(*volatile types.peripherals.USART, 0x840);
            ///  Two-Wire Interface
            pub const TWI0 = @intToPtr(*volatile types.peripherals.TWI, 0x900);
            ///  Serial Peripheral Interface
            pub const SPI0 = @intToPtr(*volatile types.peripherals.SPI, 0x940);
            ///  Serial Peripheral Interface
            pub const SPI1 = @intToPtr(*volatile types.peripherals.SPI, 0x960);
            ///  16-bit Timer/Counter Type A
            pub const TCA0 = @intToPtr(*volatile types.peripherals.TCA, 0xa00);
            ///  16-bit Timer Type B
            pub const TCB0 = @intToPtr(*volatile types.peripherals.TCB, 0xb00);
            ///  16-bit Timer Type B
            pub const TCB1 = @intToPtr(*volatile types.peripherals.TCB, 0xb10);
            ///  16-bit Timer Type B
            pub const TCB2 = @intToPtr(*volatile types.peripherals.TCB, 0xb20);
            ///  Timer Counter D
            pub const TCD0 = @intToPtr(*volatile types.peripherals.TCD, 0xb80);
            ///  System Configuration Registers
            pub const SYSCFG = @intToPtr(*volatile types.peripherals.SYSCFG, 0xf01);
            ///  Non-volatile Memory Controller
            pub const NVMCTRL = @intToPtr(*volatile types.peripherals.NVMCTRL, 0x1000);
            ///  Lockbits
            pub const LOCK = @intToPtr(*volatile types.peripherals.LOCK, 0x1040);
            ///  Fuses
            pub const FUSE = @intToPtr(*volatile types.peripherals.FUSE, 0x1050);
            ///  User Row
            pub const USERROW = @intToPtr(*volatile types.peripherals.USERROW, 0x1080);
            ///  Signature row
            pub const SIGROW = @intToPtr(*volatile types.peripherals.SIGROW, 0x1100);
        };
    };
};

pub const types = struct {
    pub const peripherals = struct {
        ///  Analog Comparator
        pub const AC = extern struct {
            ///  Hysteresis Mode select
            pub const AC_HYSMODE = enum(u2) {
                ///  No hysteresis
                NONE = 0x0,
                ///  Small hysteresis
                SMALL = 0x1,
                ///  Medium hysteresis
                MEDIUM = 0x2,
                ///  Large hysteresis
                LARGE = 0x3,
            };

            ///  Power profile select
            pub const AC_POWER = enum(u2) {
                ///  Power profile 0, Shortest response time, highest consumption
                PROFILE0 = 0x0,
                ///  Power profile 1
                PROFILE1 = 0x1,
                ///  Power profile 2
                PROFILE2 = 0x2,
                _,
            };

            ///  Window selection mode
            pub const AC_WINSEL = enum(u2) {
                ///  Window function disabled
                DISABLED = 0x0,
                ///  Select ACn+1 as upper limit in window compare
                UPSEL1 = 0x1,
                ///  Select ACn+2 as upper limit in window compare
                UPSEL2 = 0x2,
                _,
            };

            ///  Interrupt Mode select
            pub const AC_NORMAL_INTMODE = enum(u2) {
                ///  Positive and negative inputs crosses
                BOTHEDGE = 0x0,
                ///  Positive input goes below negative input
                NEGEDGE = 0x2,
                ///  Positive input goes above negative input
                POSEDGE = 0x3,
                _,
            };

            ///  Interrupt Mode select
            pub const AC_WINDOW_INTMODE = enum(u2) {
                ///  Window interrupt when input above both references
                ABOVE = 0x0,
                ///  Window interrupt when input betweeen references
                INSIDE = 0x1,
                ///  Window interrupt when input below both references
                BELOW = 0x2,
                ///  Window interrupt when input outside reference
                OUTSIDE = 0x3,
            };

            ///  AC Output Initial Value select
            pub const AC_INITVAL = enum(u1) {
                ///  Output initialized to 0
                LOW = 0x0,
                ///  Output initialized to 1
                HIGH = 0x1,
            };

            ///  Negative Input MUX Selection
            pub const AC_MUXNEG = enum(u3) {
                ///  Negative Pin 0
                AINN0 = 0x0,
                ///  Negative Pin 1
                AINN1 = 0x1,
                ///  Negative Pin 2
                AINN2 = 0x2,
                ///  DAC Reference
                DACREF = 0x3,
                _,
            };

            ///  Positive Input MUX Selection
            pub const AC_MUXPOS = enum(u3) {
                ///  Positive Pin 0
                AINP0 = 0x0,
                ///  Positive Pin 1
                AINP1 = 0x1,
                ///  Positive Pin 2
                AINP2 = 0x2,
                ///  Positive Pin 3
                AINP3 = 0x3,
                _,
            };

            ///  Analog Comparator Window State select
            pub const AC_WINSTATE = enum(u2) {
                ///  Above window
                ABOVE = 0x0,
                ///  Inside window
                INSIDE = 0x1,
                ///  Below window
                BELOW = 0x2,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable
                ENABLE: u1,
                ///  Hysteresis Mode
                HYSMODE: packed union {
                    raw: u2,
                    value: AC_HYSMODE,
                },
                ///  Power profile
                POWER: packed union {
                    raw: u2,
                    value: AC_POWER,
                },
                reserved6: u1,
                ///  Output Pad Enable
                OUTEN: u1,
                ///  Run in Standby Mode
                RUNSTDBY: u1,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  Window selection mode
                WINSEL: packed union {
                    raw: u2,
                    value: AC_WINSEL,
                },
                padding: u6,
            }),
            ///  Mux Control A
            MUXCTRL: mmio.Mmio(packed struct(u8) {
                ///  Negative Input MUX Selection
                MUXNEG: packed union {
                    raw: u3,
                    value: AC_MUXNEG,
                },
                ///  Positive Input MUX Selection
                MUXPOS: packed union {
                    raw: u3,
                    value: AC_MUXPOS,
                },
                ///  AC Output Initial Value
                INITVAL: packed union {
                    raw: u1,
                    value: AC_INITVAL,
                },
                ///  Invert AC Output
                INVERT: u1,
            }),
            reserved5: [2]u8,
            ///  DAC Voltage Reference
            DACREF: mmio.Mmio(packed struct(u8) {
                ///  DACREF
                DACREF: u8,
            }),
            ///  Interrupt Control
            INTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Interrupt Enable
                CMP: u1,
                reserved4: u3,
                ///  Interrupt Mode
                INTMODE: packed union {
                    raw: u2,
                    value: AC_NORMAL_INTMODE,
                },
                padding: u2,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  Analog Comparator Interrupt Flag
                CMPIF: u1,
                reserved4: u3,
                ///  Analog Comparator State
                CMPSTATE: u1,
                reserved6: u1,
                ///  Analog Comparator Window State
                WINSTATE: packed union {
                    raw: u2,
                    value: AC_WINSTATE,
                },
            }),
        };

        ///  Analog to Digital Converter
        pub const ADC = extern struct {
            ///  Conversion mode select
            pub const ADC_CONVMODE = enum(u1) {
                ///  Single-Ended mode
                SINGLEENDED = 0x0,
                ///  Differential mode
                DIFF = 0x1,
            };

            ///  Resolution selection
            pub const ADC_RESSEL = enum(u2) {
                ///  12-bit mode
                @"12BIT" = 0x0,
                ///  10-bit mode
                @"10BIT" = 0x1,
                _,
            };

            ///  Accumulation Samples select
            pub const ADC_SAMPNUM = enum(u3) {
                ///  No accumulation
                NONE = 0x0,
                ///  2 results accumulated
                ACC2 = 0x1,
                ///  4 results accumulated
                ACC4 = 0x2,
                ///  8 results accumulated
                ACC8 = 0x3,
                ///  16 results accumulated
                ACC16 = 0x4,
                ///  32 results accumulated
                ACC32 = 0x5,
                ///  64 results accumulated
                ACC64 = 0x6,
                ///  128 results accumulated
                ACC128 = 0x7,
            };

            ///  Clock Pre-scaler select
            pub const ADC_PRESC = enum(u4) {
                ///  CLK_PER divided by 2
                DIV2 = 0x0,
                ///  CLK_PER divided by 4
                DIV4 = 0x1,
                ///  CLK_PER divided by 8
                DIV8 = 0x2,
                ///  CLK_PER divided by 12
                DIV12 = 0x3,
                ///  CLK_PER divided by 16
                DIV16 = 0x4,
                ///  CLK_PER divided by 20
                DIV20 = 0x5,
                ///  CLK_PER divided by 24
                DIV24 = 0x6,
                ///  CLK_PER divided by 28
                DIV28 = 0x7,
                ///  CLK_PER divided by 32
                DIV32 = 0x8,
                ///  CLK_PER divided by 48
                DIV48 = 0x9,
                ///  CLK_PER divided by 64
                DIV64 = 0xa,
                ///  CLK_PER divided by 96
                DIV96 = 0xb,
                ///  CLK_PER divided by 128
                DIV128 = 0xc,
                ///  CLK_PER divided by 256
                DIV256 = 0xd,
                _,
            };

            ///  Initial Delay Selection
            pub const ADC_INITDLY = enum(u3) {
                ///  Delay 0 CLK_ADC cycles
                DLY0 = 0x0,
                ///  Delay 16 CLK_ADC cycles
                DLY16 = 0x1,
                ///  Delay 32 CLK_ADC cycles
                DLY32 = 0x2,
                ///  Delay 64 CLK_ADC cycles
                DLY64 = 0x3,
                ///  Delay 128 CLK_ADC cycles
                DLY128 = 0x4,
                ///  Delay 256 CLK_ADC cycles
                DLY256 = 0x5,
                _,
            };

            ///  Sampling Delay Selection
            pub const ADC_SAMPDLY = enum(u4) {
                ///  Delay 0 CLK_ADC cycles
                DLY0 = 0x0,
                ///  Delay 1 CLK_ADC cycles
                DLY1 = 0x1,
                ///  Delay 2 CLK_ADC cycles
                DLY2 = 0x2,
                ///  Delay 3 CLK_ADC cycles
                DLY3 = 0x3,
                ///  Delay 4 CLK_ADC cycles
                DLY4 = 0x4,
                ///  Delay 5 CLK_ADC cycles
                DLY5 = 0x5,
                ///  Delay 6 CLK_ADC cycles
                DLY6 = 0x6,
                ///  Delay 7 CLK_ADC cycles
                DLY7 = 0x7,
                ///  Delay 8 CLK_ADC cycles
                DLY8 = 0x8,
                ///  Delay 9 CLK_ADC cycles
                DLY9 = 0x9,
                ///  Delay 10 CLK_ADC cycles
                DLY10 = 0xa,
                ///  Delay 11 CLK_ADC cycles
                DLY11 = 0xb,
                ///  Delay 12 CLK_ADC cycles
                DLY12 = 0xc,
                ///  Delay 13 CLK_ADC cycles
                DLY13 = 0xd,
                ///  Delay 14 CLK_ADC cycles
                DLY14 = 0xe,
                ///  Delay 15 CLK_ADC cycles
                DLY15 = 0xf,
            };

            ///  Window Comparator Mode select
            pub const ADC_WINCM = enum(u3) {
                ///  No Window Comparison
                NONE = 0x0,
                ///  Below Window
                BELOW = 0x1,
                ///  Above Window
                ABOVE = 0x2,
                ///  Inside Window
                INSIDE = 0x3,
                ///  Outside Window
                OUTSIDE = 0x4,
                _,
            };

            ///  Analog Channel Selection Bits
            pub const ADC_MUXNEG = enum(u7) {
                ///  ADC input pin 0
                AIN0 = 0x0,
                ///  ADC input pin 1
                AIN1 = 0x1,
                ///  ADC input pin 2
                AIN2 = 0x2,
                ///  ADC input pin 3
                AIN3 = 0x3,
                ///  ADC input pin 4
                AIN4 = 0x4,
                ///  ADC input pin 5
                AIN5 = 0x5,
                ///  ADC input pin 6
                AIN6 = 0x6,
                ///  ADC input pin 7
                AIN7 = 0x7,
                ///  ADC input pin 8
                AIN8 = 0x8,
                ///  ADC input pin 9
                AIN9 = 0x9,
                ///  ADC input pin 10
                AIN10 = 0xa,
                ///  ADC input pin 11
                AIN11 = 0xb,
                ///  ADC input pin 12
                AIN12 = 0xc,
                ///  ADC input pin 13
                AIN13 = 0xd,
                ///  ADC input pin 14
                AIN14 = 0xe,
                ///  ADC input pin 15
                AIN15 = 0xf,
                ///  Ground
                GND = 0x40,
                ///  DAC0
                DAC0 = 0x48,
                _,
            };

            ///  Analog Channel Selection Bits
            pub const ADC_MUXPOS = enum(u7) {
                ///  ADC input pin 0
                AIN0 = 0x0,
                ///  ADC input pin 1
                AIN1 = 0x1,
                ///  ADC input pin 2
                AIN2 = 0x2,
                ///  ADC input pin 3
                AIN3 = 0x3,
                ///  ADC input pin 4
                AIN4 = 0x4,
                ///  ADC input pin 5
                AIN5 = 0x5,
                ///  ADC input pin 6
                AIN6 = 0x6,
                ///  ADC input pin 7
                AIN7 = 0x7,
                ///  ADC input pin 8
                AIN8 = 0x8,
                ///  ADC input pin 9
                AIN9 = 0x9,
                ///  ADC input pin 10
                AIN10 = 0xa,
                ///  ADC input pin 11
                AIN11 = 0xb,
                ///  ADC input pin 12
                AIN12 = 0xc,
                ///  ADC input pin 13
                AIN13 = 0xd,
                ///  ADC input pin 14
                AIN14 = 0xe,
                ///  ADC input pin 15
                AIN15 = 0xf,
                ///  ADC input pin 16
                AIN16 = 0x10,
                ///  ADC input pin 17
                AIN17 = 0x11,
                ///  ADC input pin 18
                AIN18 = 0x12,
                ///  ADC input pin 19
                AIN19 = 0x13,
                ///  ADC input pin 20
                AIN20 = 0x14,
                ///  ADC input pin 21
                AIN21 = 0x15,
                ///  Ground
                GND = 0x40,
                ///  Temperature sensor
                TEMPSENSE = 0x42,
                ///  VDD/10
                VDDDIV10 = 0x44,
                ///  VDDIO2/10
                VDDIO2DIV10 = 0x45,
                ///  DAC0
                DAC0 = 0x48,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  ADC Enable
                ENABLE: u1,
                ///  Free running mode
                FREERUN: u1,
                ///  Resolution selection
                RESSEL: packed union {
                    raw: u2,
                    value: ADC_RESSEL,
                },
                ///  Left adjust result
                LEFTADJ: u1,
                ///  Conversion mode
                CONVMODE: packed union {
                    raw: u1,
                    value: ADC_CONVMODE,
                },
                reserved7: u1,
                ///  Run standby mode
                RUNSTBY: u1,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  Accumulation Samples
                SAMPNUM: packed union {
                    raw: u3,
                    value: ADC_SAMPNUM,
                },
                padding: u5,
            }),
            ///  Control C
            CTRLC: mmio.Mmio(packed struct(u8) {
                ///  Clock Pre-scaler
                PRESC: packed union {
                    raw: u4,
                    value: ADC_PRESC,
                },
                padding: u4,
            }),
            ///  Control D
            CTRLD: mmio.Mmio(packed struct(u8) {
                ///  Sampling Delay Selection
                SAMPDLY: packed union {
                    raw: u4,
                    value: ADC_SAMPDLY,
                },
                reserved5: u1,
                ///  Initial Delay Selection
                INITDLY: packed union {
                    raw: u3,
                    value: ADC_INITDLY,
                },
            }),
            ///  Control E
            CTRLE: mmio.Mmio(packed struct(u8) {
                ///  Window Comparator Mode
                WINCM: packed union {
                    raw: u3,
                    value: ADC_WINCM,
                },
                padding: u5,
            }),
            ///  Sample Control
            SAMPCTRL: mmio.Mmio(packed struct(u8) {
                ///  Sample lenght
                SAMPLEN: u8,
            }),
            reserved8: [2]u8,
            ///  Positive mux input
            MUXPOS: mmio.Mmio(packed struct(u8) {
                ///  Analog Channel Selection Bits
                MUXPOS: packed union {
                    raw: u7,
                    value: ADC_MUXPOS,
                },
                padding: u1,
            }),
            ///  Negative mux input
            MUXNEG: mmio.Mmio(packed struct(u8) {
                ///  Analog Channel Selection Bits
                MUXNEG: packed union {
                    raw: u7,
                    value: ADC_MUXNEG,
                },
                padding: u1,
            }),
            ///  Command
            COMMAND: mmio.Mmio(packed struct(u8) {
                ///  Start Conversion
                STCONV: u1,
                ///  Stop Conversion
                SPCONV: u1,
                padding: u6,
            }),
            ///  Event Control
            EVCTRL: mmio.Mmio(packed struct(u8) {
                ///  Start Event Input Enable
                STARTEI: u1,
                padding: u7,
            }),
            ///  Interrupt Control
            INTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Result Ready Interrupt Enable
                RESRDY: u1,
                ///  Window Comparator Interrupt Enable
                WCMP: u1,
                padding: u6,
            }),
            ///  Interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Result Ready Flag
                RESRDY: u1,
                ///  Window Comparator Flag
                WCMP: u1,
                padding: u6,
            }),
            ///  Debug Control
            DBGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Debug run
                DBGRUN: u1,
                padding: u7,
            }),
            ///  Temporary Data
            TEMP: mmio.Mmio(packed struct(u8) {
                ///  Temporary
                TEMP: u8,
            }),
            ///  ADC Accumulator Result
            RES: u16,
            ///  Window comparator low threshold
            WINLT: u16,
            ///  Window comparator high threshold
            WINHT: u16,
        };

        ///  Bod interface
        pub const BOD = extern struct {
            ///  Operation in active mode select
            pub const BOD_ACTIVE = enum(u2) {
                ///  Disabled
                DIS = 0x0,
                ///  Enabled
                ENABLED = 0x1,
                ///  Sampled
                SAMPLED = 0x2,
                ///  Enabled with wake-up halted until BOD is ready
                ENWAKE = 0x3,
            };

            ///  Sample frequency select
            pub const BOD_SAMPFREQ = enum(u1) {
                ///  128Hz sampling frequency
                @"128HZ" = 0x0,
                ///  32Hz sampling frequency
                @"32HZ" = 0x1,
            };

            ///  Operation in sleep mode select
            pub const BOD_SLEEP = enum(u2) {
                ///  Disabled
                DIS = 0x0,
                ///  Enabled
                ENABLED = 0x1,
                ///  Sampled
                SAMPLED = 0x2,
                _,
            };

            ///  Bod level select
            pub const BOD_LVL = enum(u3) {
                ///  1.9 V
                BODLEVEL0 = 0x0,
                ///  2.45 V
                BODLEVEL1 = 0x1,
                ///  2.7 V
                BODLEVEL2 = 0x2,
                ///  2.85 V
                BODLEVEL3 = 0x3,
                _,
            };

            ///  Configuration select
            pub const BOD_VLMCFG = enum(u2) {
                ///  VDD falls below VLM threshold
                FALLING = 0x0,
                ///  VDD rises above VLM threshold
                RISING = 0x1,
                ///  VDD crosses VLM threshold
                BOTH = 0x2,
                _,
            };

            ///  Voltage level monitor status select
            pub const BOD_VLMS = enum(u1) {
                ///  The voltage is above the VLM threshold level
                ABOVE = 0x0,
                ///  The voltage is below the VLM threshold level
                BELOW = 0x1,
            };

            ///  voltage level monitor level select
            pub const BOD_VLMLVL = enum(u2) {
                ///  VLM Disabled
                OFF = 0x0,
                ///  VLM threshold 5% above BOD level
                @"5ABOVE" = 0x1,
                ///  VLM threshold 15% above BOD level
                @"15ABOVE" = 0x2,
                ///  VLM threshold 25% above BOD level
                @"25ABOVE" = 0x3,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Operation in sleep mode
                SLEEP: packed union {
                    raw: u2,
                    value: BOD_SLEEP,
                },
                ///  Operation in active mode
                ACTIVE: packed union {
                    raw: u2,
                    value: BOD_ACTIVE,
                },
                ///  Sample frequency
                SAMPFREQ: packed union {
                    raw: u1,
                    value: BOD_SAMPFREQ,
                },
                padding: u3,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  Bod level
                LVL: packed union {
                    raw: u3,
                    value: BOD_LVL,
                },
                padding: u5,
            }),
            reserved8: [6]u8,
            ///  Voltage level monitor Control
            VLMCTRLA: mmio.Mmio(packed struct(u8) {
                ///  voltage level monitor level
                VLMLVL: packed union {
                    raw: u2,
                    value: BOD_VLMLVL,
                },
                padding: u6,
            }),
            ///  Voltage level monitor interrupt Control
            INTCTRL: mmio.Mmio(packed struct(u8) {
                ///  voltage level monitor interrrupt enable
                VLMIE: u1,
                ///  Configuration
                VLMCFG: packed union {
                    raw: u2,
                    value: BOD_VLMCFG,
                },
                padding: u5,
            }),
            ///  Voltage level monitor interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Voltage level monitor interrupt flag
                VLMIF: u1,
                padding: u7,
            }),
            ///  Voltage level monitor status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  Voltage level monitor status
                VLMS: packed union {
                    raw: u1,
                    value: BOD_VLMS,
                },
                padding: u7,
            }),
        };

        ///  Configurable Custom Logic
        pub const CCL = extern struct {
            ///  Interrupt Mode for LUT0 select
            pub const CCL_INTMODE0 = enum(u2) {
                ///  Interrupt disabled
                INTDISABLE = 0x0,
                ///  Sense rising edge
                RISING = 0x1,
                ///  Sense falling edge
                FALLING = 0x2,
                ///  Sense both edges
                BOTH = 0x3,
            };

            ///  Interrupt Mode for LUT1 select
            pub const CCL_INTMODE1 = enum(u2) {
                ///  Interrupt disabled
                INTDISABLE = 0x0,
                ///  Sense rising edge
                RISING = 0x1,
                ///  Sense falling edge
                FALLING = 0x2,
                ///  Sense both edges
                BOTH = 0x3,
            };

            ///  Interrupt Mode for LUT2 select
            pub const CCL_INTMODE2 = enum(u2) {
                ///  Interrupt disabled
                INTDISABLE = 0x0,
                ///  Sense rising edge
                RISING = 0x1,
                ///  Sense falling edge
                FALLING = 0x2,
                ///  Sense both edges
                BOTH = 0x3,
            };

            ///  Interrupt Mode for LUT3 select
            pub const CCL_INTMODE3 = enum(u2) {
                ///  Interrupt disabled
                INTDISABLE = 0x0,
                ///  Sense rising edge
                RISING = 0x1,
                ///  Sense falling edge
                FALLING = 0x2,
                ///  Sense both edges
                BOTH = 0x3,
            };

            ///  Clock Source Selection
            pub const CCL_CLKSRC = enum(u3) {
                ///  Peripheral Clock
                CLKPER = 0x0,
                ///  Selection by INSEL2
                IN2 = 0x1,
                ///  Internal High-Frequency Oscillator
                OSCHF = 0x4,
                ///  32.768 kHz oscillator
                OSC32K = 0x5,
                ///  32.768 kHz oscillator divided by 32
                OSC1K = 0x6,
                _,
            };

            ///  Edge Detection Enable select
            pub const CCL_EDGEDET = enum(u1) {
                ///  Edge detector is disabled
                DIS = 0x0,
                ///  Edge detector is enabled
                EN = 0x1,
            };

            ///  Filter Selection
            pub const CCL_FILTSEL = enum(u2) {
                ///  Filter disabled
                DISABLE = 0x0,
                ///  Synchronizer enabled
                SYNCH = 0x1,
                ///  Filter enabled
                FILTER = 0x2,
                _,
            };

            ///  LUT Input 0 Source Selection
            pub const CCL_INSEL0 = enum(u4) {
                ///  Masked input
                MASK = 0x0,
                ///  Feedback input source
                FEEDBACK = 0x1,
                ///  Linked LUT input source
                LINK = 0x2,
                ///  Event input source A
                EVENTA = 0x3,
                ///  Event input source B
                EVENTB = 0x4,
                ///  IO pin LUTn-IN0 input source
                IN0 = 0x5,
                ///  AC0 OUT input source
                AC0 = 0x6,
                ///  ZCD0 OUT input source
                ZCD0 = 0x7,
                ///  USART0 TXD input source
                USART0 = 0x8,
                ///  SPI0 MOSI input source
                SPI0 = 0x9,
                ///  TCA0 WO0 input source
                TCA0 = 0xa,
                ///  TCB0 WO input source
                TCB0 = 0xc,
                ///  TCD0 WOA input source
                TCD0 = 0xd,
                _,
            };

            ///  LUT Input 1 Source Selection
            pub const CCL_INSEL1 = enum(u4) {
                ///  Masked input
                MASK = 0x0,
                ///  Feedback input source
                FEEDBACK = 0x1,
                ///  Linked LUT input source
                LINK = 0x2,
                ///  Event input source A
                EVENTA = 0x3,
                ///  Event input source B
                EVENTB = 0x4,
                ///  IO pin LUTn-IN1 input source
                IN1 = 0x5,
                ///  AC1 OUT input source
                AC1 = 0x6,
                ///  USART1 TXD input source
                USART1 = 0x8,
                ///  SPI0 MOSI input source
                SPI0 = 0x9,
                ///  TCA0 WO1 input source
                TCA0 = 0xa,
                ///  TCB1 WO input source
                TCB1 = 0xc,
                ///  TCD0 WOB input source
                TCD0 = 0xd,
                _,
            };

            ///  LUT Input 2 Source Selection
            pub const CCL_INSEL2 = enum(u4) {
                ///  Masked input
                MASK = 0x0,
                ///  Feedback input source
                FEEDBACK = 0x1,
                ///  Linked LUT input source
                LINK = 0x2,
                ///  Event input source A
                EVENTA = 0x3,
                ///  Event input source B
                EVENTB = 0x4,
                ///  IO pin LUTn-IN2 input source
                IN2 = 0x5,
                ///  AC2 OUT input source
                AC2 = 0x6,
                ///  USART2 TXD input source
                USART2 = 0x8,
                ///  SPI0 SCK input source
                SPI0 = 0x9,
                ///  TCA0 WO2 input source
                TCA0 = 0xa,
                ///  TCB2 WO input source
                TCB2 = 0xc,
                ///  TCD0 WOC input source
                TCD0 = 0xd,
                _,
            };

            ///  Sequential Selection
            pub const CCL_SEQSEL = enum(u3) {
                ///  Sequential logic disabled
                DISABLE = 0x0,
                ///  D FlipFlop
                DFF = 0x1,
                ///  JK FlipFlop
                JK = 0x2,
                ///  D Latch
                LATCH = 0x3,
                ///  RS Latch
                RS = 0x4,
                _,
            };

            ///  Control Register A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable
                ENABLE: u1,
                reserved6: u5,
                ///  Run in Standby
                RUNSTDBY: u1,
                padding: u1,
            }),
            ///  Sequential Control 0
            SEQCTRL0: mmio.Mmio(packed struct(u8) {
                ///  Sequential Selection
                SEQSEL: packed union {
                    raw: u3,
                    value: CCL_SEQSEL,
                },
                padding: u5,
            }),
            ///  Sequential Control 1
            SEQCTRL1: mmio.Mmio(packed struct(u8) {
                ///  Sequential Selection
                SEQSEL: packed union {
                    raw: u3,
                    value: CCL_SEQSEL,
                },
                padding: u5,
            }),
            reserved5: [2]u8,
            ///  Interrupt Control 0
            INTCTRL0: mmio.Mmio(packed struct(u8) {
                ///  Interrupt Mode for LUT0
                INTMODE0: packed union {
                    raw: u2,
                    value: CCL_INTMODE0,
                },
                ///  Interrupt Mode for LUT1
                INTMODE1: packed union {
                    raw: u2,
                    value: CCL_INTMODE1,
                },
                ///  Interrupt Mode for LUT2
                INTMODE2: packed union {
                    raw: u2,
                    value: CCL_INTMODE2,
                },
                ///  Interrupt Mode for LUT3
                INTMODE3: packed union {
                    raw: u2,
                    value: CCL_INTMODE3,
                },
            }),
            reserved7: [1]u8,
            ///  Interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Interrupt Flag
                INT: u4,
                padding: u4,
            }),
            ///  LUT 0 Control A
            LUT0CTRLA: mmio.Mmio(packed struct(u8) {
                ///  LUT Enable
                ENABLE: u1,
                ///  Clock Source Selection
                CLKSRC: packed union {
                    raw: u3,
                    value: CCL_CLKSRC,
                },
                ///  Filter Selection
                FILTSEL: packed union {
                    raw: u2,
                    value: CCL_FILTSEL,
                },
                ///  Output Enable
                OUTEN: u1,
                ///  Edge Detection Enable
                EDGEDET: packed union {
                    raw: u1,
                    value: CCL_EDGEDET,
                },
            }),
            ///  LUT 0 Control B
            LUT0CTRLB: mmio.Mmio(packed struct(u8) {
                ///  LUT Input 0 Source Selection
                INSEL0: packed union {
                    raw: u4,
                    value: CCL_INSEL0,
                },
                ///  LUT Input 1 Source Selection
                INSEL1: packed union {
                    raw: u4,
                    value: CCL_INSEL1,
                },
            }),
            ///  LUT 0 Control C
            LUT0CTRLC: mmio.Mmio(packed struct(u8) {
                ///  LUT Input 2 Source Selection
                INSEL2: packed union {
                    raw: u4,
                    value: CCL_INSEL2,
                },
                padding: u4,
            }),
            ///  Truth 0
            TRUTH0: mmio.Mmio(packed struct(u8) {
                ///  Truth Table
                TRUTH: u8,
            }),
            ///  LUT 1 Control A
            LUT1CTRLA: mmio.Mmio(packed struct(u8) {
                ///  LUT Enable
                ENABLE: u1,
                ///  Clock Source Selection
                CLKSRC: packed union {
                    raw: u3,
                    value: CCL_CLKSRC,
                },
                ///  Filter Selection
                FILTSEL: packed union {
                    raw: u2,
                    value: CCL_FILTSEL,
                },
                ///  Output Enable
                OUTEN: u1,
                ///  Edge Detection Enable
                EDGEDET: packed union {
                    raw: u1,
                    value: CCL_EDGEDET,
                },
            }),
            ///  LUT 1 Control B
            LUT1CTRLB: mmio.Mmio(packed struct(u8) {
                ///  LUT Input 0 Source Selection
                INSEL0: packed union {
                    raw: u4,
                    value: CCL_INSEL0,
                },
                ///  LUT Input 1 Source Selection
                INSEL1: packed union {
                    raw: u4,
                    value: CCL_INSEL1,
                },
            }),
            ///  LUT 1 Control C
            LUT1CTRLC: mmio.Mmio(packed struct(u8) {
                ///  LUT Input 2 Source Selection
                INSEL2: packed union {
                    raw: u4,
                    value: CCL_INSEL2,
                },
                padding: u4,
            }),
            ///  Truth 1
            TRUTH1: mmio.Mmio(packed struct(u8) {
                ///  Truth Table
                TRUTH: u8,
            }),
            ///  LUT 2 Control A
            LUT2CTRLA: mmio.Mmio(packed struct(u8) {
                ///  LUT Enable
                ENABLE: u1,
                ///  Clock Source Selection
                CLKSRC: packed union {
                    raw: u3,
                    value: CCL_CLKSRC,
                },
                ///  Filter Selection
                FILTSEL: packed union {
                    raw: u2,
                    value: CCL_FILTSEL,
                },
                ///  Output Enable
                OUTEN: u1,
                ///  Edge Detection Enable
                EDGEDET: packed union {
                    raw: u1,
                    value: CCL_EDGEDET,
                },
            }),
            ///  LUT 2 Control B
            LUT2CTRLB: mmio.Mmio(packed struct(u8) {
                ///  LUT Input 0 Source Selection
                INSEL0: packed union {
                    raw: u4,
                    value: CCL_INSEL0,
                },
                ///  LUT Input 1 Source Selection
                INSEL1: packed union {
                    raw: u4,
                    value: CCL_INSEL1,
                },
            }),
            ///  LUT 2 Control C
            LUT2CTRLC: mmio.Mmio(packed struct(u8) {
                ///  LUT Input 2 Source Selection
                INSEL2: packed union {
                    raw: u4,
                    value: CCL_INSEL2,
                },
                padding: u4,
            }),
            ///  Truth 2
            TRUTH2: mmio.Mmio(packed struct(u8) {
                ///  Truth Table
                TRUTH: u8,
            }),
            ///  LUT 3 Control A
            LUT3CTRLA: mmio.Mmio(packed struct(u8) {
                ///  LUT Enable
                ENABLE: u1,
                ///  Clock Source Selection
                CLKSRC: packed union {
                    raw: u3,
                    value: CCL_CLKSRC,
                },
                ///  Filter Selection
                FILTSEL: packed union {
                    raw: u2,
                    value: CCL_FILTSEL,
                },
                ///  Output Enable
                OUTEN: u1,
                ///  Edge Detection Enable
                EDGEDET: packed union {
                    raw: u1,
                    value: CCL_EDGEDET,
                },
            }),
            ///  LUT 3 Control B
            LUT3CTRLB: mmio.Mmio(packed struct(u8) {
                ///  LUT Input 0 Source Selection
                INSEL0: packed union {
                    raw: u4,
                    value: CCL_INSEL0,
                },
                ///  LUT Input 1 Source Selection
                INSEL1: packed union {
                    raw: u4,
                    value: CCL_INSEL1,
                },
            }),
            ///  LUT 3 Control C
            LUT3CTRLC: mmio.Mmio(packed struct(u8) {
                ///  LUT Input 2 Source Selection
                INSEL2: packed union {
                    raw: u4,
                    value: CCL_INSEL2,
                },
                padding: u4,
            }),
            ///  Truth 3
            TRUTH3: mmio.Mmio(packed struct(u8) {
                ///  Truth Table
                TRUTH: u8,
            }),
        };

        ///  Clock controller
        pub const CLKCTRL = extern struct {
            ///  Clock select
            pub const CLKCTRL_CLKSEL = enum(u3) {
                ///  Internal high-frequency oscillator
                OSCHF = 0x0,
                ///  Internal 32.768 kHz oscillator
                OSC32K = 0x1,
                ///  32.768 kHz crystal oscillator
                XOSC32K = 0x2,
                ///  External clock
                EXTCLK = 0x3,
                _,
            };

            ///  Prescaler division select
            pub const CLKCTRL_PDIV = enum(u4) {
                ///  2X
                @"2X" = 0x0,
                ///  4X
                @"4X" = 0x1,
                ///  8X
                @"8X" = 0x2,
                ///  16X
                @"16X" = 0x3,
                ///  32X
                @"32X" = 0x4,
                ///  64X
                @"64X" = 0x5,
                ///  6X
                @"6X" = 0x8,
                ///  10X
                @"10X" = 0x9,
                ///  12X
                @"12X" = 0xa,
                ///  24X
                @"24X" = 0xb,
                ///  48X
                @"48X" = 0xc,
                _,
            };

            ///  Clock Failure Detect Source select
            pub const CLKCTRL_CFDSRC = enum(u2) {
                ///  Main Clock
                CLKMAIN = 0x0,
                ///  XOSCHF
                XOSCHF = 0x1,
                ///  XOSC32K
                XOSC32K = 0x2,
                _,
            };

            ///  Interrupt type select
            pub const CLKCTRL_INTTYPE = enum(u1) {
                ///  Regular Interrupt
                INT = 0x0,
                ///  NMI
                NMI = 0x1,
            };

            ///  Frequency select
            pub const CLKCTRL_FRQSEL = enum(u4) {
                ///  1 MHz system clock
                @"1M" = 0x0,
                ///  2 MHz system clock
                @"2M" = 0x1,
                ///  3 MHz system clock
                @"3M" = 0x2,
                ///  4 MHz system clock (default)
                @"4M" = 0x3,
                ///  8 MHz system clock
                @"8M" = 0x5,
                ///  12 MHz system clock
                @"12M" = 0x6,
                ///  16 MHz system clock
                @"16M" = 0x7,
                ///  20 MHz system clock
                @"20M" = 0x8,
                ///  24 MHz system clock
                @"24M" = 0x9,
                _,
            };

            ///  Multiplication factor select
            pub const CLKCTRL_MULFAC = enum(u2) {
                ///  PLL is disabled
                DISABLE = 0x0,
                ///  2 x multiplication factor
                @"2x" = 0x1,
                ///  3 x multiplication factor
                @"3x" = 0x2,
                _,
            };

            ///  Source select
            pub const CLKCTRL_SOURCE = enum(u1) {
                ///  High frequency internal oscillator as PLL source
                OSCHF = 0x0,
                ///  High frequency external clock or external high frequency oscillator as PLL source
                XOSCHF = 0x1,
            };

            ///  Start-up Time Select
            pub const CLKCTRL_CSUTHF = enum(u2) {
                ///  256 XOSCHF cycles
                @"256" = 0x0,
                ///  1K XOSCHF cycles
                @"1K" = 0x1,
                ///  4K XOSCHF cycles
                @"4K" = 0x2,
                _,
            };

            ///  Frequency Range select
            pub const CLKCTRL_FRQRANGE = enum(u2) {
                ///  Max 8 MHz XTAL Frequency
                @"8M" = 0x0,
                ///  Max 16 MHz XTAL Frequency
                @"16M" = 0x1,
                ///  Max 24 MHz XTAL Frequency
                @"24M" = 0x2,
                ///  Max 32 MHz XTAL Frequency
                @"32M" = 0x3,
            };

            ///  External Source Select
            pub const CLKCTRL_SELHF = enum(u1) {
                ///  External Crystal
                XTAL = 0x0,
                ///  External clock on XTALHF1 pin
                EXTCLOCK = 0x1,
            };

            ///  Crystal startup time select
            pub const CLKCTRL_CSUT = enum(u2) {
                ///  1k cycles
                @"1K" = 0x0,
                ///  16k cycles
                @"16K" = 0x1,
                ///  32k cycles
                @"32K" = 0x2,
                ///  64k cycles
                @"64K" = 0x3,
            };

            ///  MCLK Control A
            MCLKCTRLA: mmio.Mmio(packed struct(u8) {
                ///  Clock select
                CLKSEL: packed union {
                    raw: u3,
                    value: CLKCTRL_CLKSEL,
                },
                reserved7: u4,
                ///  System clock out
                CLKOUT: u1,
            }),
            ///  MCLK Control B
            MCLKCTRLB: mmio.Mmio(packed struct(u8) {
                ///  Prescaler enable
                PEN: u1,
                ///  Prescaler division
                PDIV: packed union {
                    raw: u4,
                    value: CLKCTRL_PDIV,
                },
                padding: u3,
            }),
            ///  MCLK Control C
            MCLKCTRLC: mmio.Mmio(packed struct(u8) {
                ///  Clock Failure Detect Enable
                CFDEN: u1,
                ///  Clock Failure Detect Test
                CFDTST: u1,
                ///  Clock Failure Detect Source
                CFDSRC: packed union {
                    raw: u2,
                    value: CLKCTRL_CFDSRC,
                },
                padding: u4,
            }),
            ///  MCLK Interrupt Control
            MCLKINTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Clock Failure Detect Interrupt Enable
                CFD: u1,
                reserved7: u6,
                ///  Interrupt type
                INTTYPE: packed union {
                    raw: u1,
                    value: CLKCTRL_INTTYPE,
                },
            }),
            ///  MCLK Interrupt Flags
            MCLKINTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Clock Failure Detect Interrupt Flag
                CFD: u1,
                padding: u7,
            }),
            ///  MCLK Status
            MCLKSTATUS: mmio.Mmio(packed struct(u8) {
                ///  System Oscillator changing
                SOSC: u1,
                ///  High frequency oscillator status
                OSCHFS: u1,
                ///  32KHz oscillator status
                OSC32KS: u1,
                ///  32.768 kHz Crystal Oscillator status
                XOSC32KS: u1,
                ///  External Clock status
                EXTS: u1,
                ///  PLL oscillator status
                PLLS: u1,
                padding: u2,
            }),
            reserved8: [2]u8,
            ///  OSCHF Control A
            OSCHFCTRLA: mmio.Mmio(packed struct(u8) {
                ///  Autotune
                AUTOTUNE: u1,
                reserved2: u1,
                ///  Frequency select
                FRQSEL: packed union {
                    raw: u4,
                    value: CLKCTRL_FRQSEL,
                },
                reserved7: u1,
                ///  Run standby
                RUNSTDBY: u1,
            }),
            ///  OSCHF Tune
            OSCHFTUNE: mmio.Mmio(packed struct(u8) {
                ///  Tune
                TUNE: u8,
            }),
            reserved16: [6]u8,
            ///  PLL Control A
            PLLCTRLA: mmio.Mmio(packed struct(u8) {
                ///  Multiplication factor
                MULFAC: packed union {
                    raw: u2,
                    value: CLKCTRL_MULFAC,
                },
                reserved6: u4,
                ///  Source
                SOURCE: packed union {
                    raw: u1,
                    value: CLKCTRL_SOURCE,
                },
                ///  Run standby
                RUNSTDBY: u1,
            }),
            reserved24: [7]u8,
            ///  OSC32K Control A
            OSC32KCTRLA: mmio.Mmio(packed struct(u8) {
                reserved7: u7,
                ///  Run standby
                RUNSTDBY: u1,
            }),
            reserved28: [3]u8,
            ///  XOSC32K Control A
            XOSC32KCTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable
                ENABLE: u1,
                ///  Low power mode
                LPMODE: u1,
                ///  Select
                SEL: u1,
                reserved4: u1,
                ///  Crystal startup time
                CSUT: packed union {
                    raw: u2,
                    value: CLKCTRL_CSUT,
                },
                reserved7: u1,
                ///  Run standby
                RUNSTDBY: u1,
            }),
            reserved32: [3]u8,
            XOSCHFCTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable
                ENABLE: u1,
                ///  External Source Select
                SELHF: packed union {
                    raw: u1,
                    value: CLKCTRL_SELHF,
                },
                ///  Frequency Range
                FRQRANGE: packed union {
                    raw: u2,
                    value: CLKCTRL_FRQRANGE,
                },
                ///  Start-up Time Select
                CSUTHF: packed union {
                    raw: u2,
                    value: CLKCTRL_CSUTHF,
                },
                reserved7: u1,
                ///  Run Standby
                RUNSTBY: u1,
            }),
        };

        ///  CPU
        pub const CPU = extern struct {
            ///  CCP signature select
            pub const CPU_CCP = enum(u8) {
                ///  SPM Instruction Protection
                SPM = 0x9d,
                ///  IO Register Protection
                IOREG = 0xd8,
                _,
            };

            ///  Configuration Change Protection
            CCP: mmio.Mmio(packed struct(u8) {
                ///  CCP signature
                CCP: packed union {
                    raw: u8,
                    value: CPU_CCP,
                },
            }),
            reserved7: [6]u8,
            ///  Extended Z-pointer Register
            RAMPZ: mmio.Mmio(packed struct(u8) {
                ///  Extended Z-Pointer Address bits
                RAMPZ: u1,
                padding: u7,
            }),
            reserved9: [1]u8,
            ///  Stack Pointer
            SP: u16,
            ///  Status Register
            SREG: mmio.Mmio(packed struct(u8) {
                ///  Carry Flag
                C: u1,
                ///  Zero Flag
                Z: u1,
                ///  Negative Flag
                N: u1,
                ///  Two's Complement Overflow Flag
                V: u1,
                ///  N Exclusive Or V Flag
                S: u1,
                ///  Half Carry Flag
                H: u1,
                ///  Transfer Bit
                T: u1,
                ///  Global Interrupt Enable Flag
                I: u1,
            }),
        };

        ///  Interrupt Controller
        pub const CPUINT = extern struct {
            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Round-robin Scheduling Enable
                LVL0RR: u1,
                reserved5: u4,
                ///  Compact Vector Table
                CVT: u1,
                ///  Interrupt Vector Select
                IVSEL: u1,
                padding: u1,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  Level 0 Interrupt Executing
                LVL0EX: u1,
                ///  Level 1 Interrupt Executing
                LVL1EX: u1,
                reserved7: u5,
                ///  Non-maskable Interrupt Executing
                NMIEX: u1,
            }),
            ///  Interrupt Level 0 Priority
            LVL0PRI: mmio.Mmio(packed struct(u8) {
                ///  Interrupt Level Priority
                LVL0PRI: u8,
            }),
            ///  Interrupt Level 1 Priority Vector
            LVL1VEC: mmio.Mmio(packed struct(u8) {
                ///  Interrupt Vector with High Priority
                LVL1VEC: u8,
            }),
        };

        ///  CRCSCAN
        pub const CRCSCAN = extern struct {
            ///  CRC Source select
            pub const CRCSCAN_SRC = enum(u2) {
                ///  CRC on entire flash
                FLASH = 0x0,
                ///  CRC on boot and appl section of flash
                APPLICATION = 0x1,
                ///  CRC on boot section of flash
                BOOT = 0x2,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable CRC scan
                ENABLE: u1,
                ///  Enable NMI Trigger
                NMIEN: u1,
                reserved7: u5,
                ///  Reset CRC scan
                RESET: u1,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  CRC Source
                SRC: packed union {
                    raw: u2,
                    value: CRCSCAN_SRC,
                },
                padding: u6,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  CRC Busy
                BUSY: u1,
                ///  CRC Ok
                OK: u1,
                padding: u6,
            }),
        };

        ///  Digital to Analog Converter
        pub const DAC = extern struct {
            ///  Control Register A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  DAC Enable
                ENABLE: u1,
                reserved6: u5,
                ///  Output Buffer Enable
                OUTEN: u1,
                ///  Run in Standby Mode
                RUNSTDBY: u1,
            }),
            reserved2: [1]u8,
            ///  DATA Register
            DATA: mmio.Mmio(packed struct(u16) {
                reserved6: u6,
                ///  Data
                DATA: u10,
            }),
        };

        ///  Event System
        pub const EVSYS = extern struct {
            ///  Channel 0 generator select
            pub const EVSYS_CHANNEL0 = enum(u8) {
                ///  Off
                OFF = 0x0,
                ///  UPDI SYNCH character
                UPDI_SYNCH = 0x1,
                ///  MVIO VDDIO2 OK
                MVIO = 0x5,
                ///  Real Time Counter overflow
                RTC_OVF = 0x6,
                ///  Real Time Counter compare
                RTC_CMP = 0x7,
                ///  Periodic Interrupt Timer output 0
                RTC_PIT_DIV8192 = 0x8,
                ///  Periodic Interrupt Timer output 1
                RTC_PIT_DIV4096 = 0x9,
                ///  Periodic Interrupt Timer output 2
                RTC_PIT_DIV2048 = 0xa,
                ///  Periodic Interrupt Timer output 3
                RTC_PIT_DIV1024 = 0xb,
                ///  Configurable Custom Logic LUT0
                CCL_LUT0 = 0x10,
                ///  Configurable Custom Logic LUT1
                CCL_LUT1 = 0x11,
                ///  Configurable Custom Logic LUT2
                CCL_LUT2 = 0x12,
                ///  Configurable Custom Logic LUT3
                CCL_LUT3 = 0x13,
                ///  Analog Comparator 0 out
                AC0_OUT = 0x20,
                ///  Analog Comparator 1 out
                AC1_OUT = 0x21,
                ///  Analog Comparator 2 out
                AC2_OUT = 0x22,
                ///  ADC 0 Result Ready
                ADC0_RESRDY = 0x24,
                ///  Zero Cross Detect 0 out
                ZCD0 = 0x30,
                ///  OPAMP0 Ready
                OPAMP0_READY = 0x34,
                ///  OPAMP1 Ready
                OPAMP1_READY = 0x35,
                ///  Port A Pin 0
                PORTA_PIN0 = 0x40,
                ///  Port A Pin 1
                PORTA_PIN1 = 0x41,
                ///  Port A Pin 2
                PORTA_PIN2 = 0x42,
                ///  Port A Pin 3
                PORTA_PIN3 = 0x43,
                ///  Port A Pin 4
                PORTA_PIN4 = 0x44,
                ///  Port A Pin 5
                PORTA_PIN5 = 0x45,
                ///  Port A Pin 6
                PORTA_PIN6 = 0x46,
                ///  Port A Pin 7
                PORTA_PIN7 = 0x47,
                ///  USART 0 XCK
                USART0_XCK = 0x60,
                ///  USART 1 XCK
                USART1_XCK = 0x61,
                ///  USART 2 XCK
                USART2_XCK = 0x62,
                ///  SPI 0 SCK
                SPI0_SCK = 0x68,
                ///  SPI 1 SCK
                SPI1_SCK = 0x69,
                ///  Timer/Counter A0 overflow / low byte timer underflow
                TCA0_OVF_LUNF = 0x80,
                ///  Timer/Counter A0 high byte timer underflow
                TCA0_HUNF = 0x81,
                ///  Timer/Counter A0 compare 0 / low byte timer compare 0
                TCA0_CMP0_LCMP0 = 0x84,
                ///  Timer/Counter A0 compare 1 / low byte timer compare 1
                TCA0_CMP1_LCMP1 = 0x85,
                ///  Timer/Counter A0 compare 2 / low byte timer compare 2
                TCA0_CMP2_LCMP2 = 0x86,
                ///  Timer/Counter B0 capture
                TCB0_CAPT = 0xa0,
                ///  Timer/Counter B0 overflow
                TCB0_OVF = 0xa1,
                ///  Timer/Counter B1 capture
                TCB1_CAPT = 0xa2,
                ///  Timer/Counter B1 overflow
                TCB1_OVF = 0xa3,
                ///  Timer/Counter B2 capture
                TCB2_CAPT = 0xa4,
                ///  Timer/Counter B2 overflow
                TCB2_OVF = 0xa5,
                ///  Timer/Counter D0 event 0
                TCD0_CMPBCLR = 0xb0,
                ///  Timer/Counter D0 event 1
                TCD0_CMPASET = 0xb1,
                ///  Timer/Counter D0 event 2
                TCD0_CMPBSET = 0xb2,
                ///  Timer/Counter D0 event 3
                TCD0_PROGEV = 0xb3,
                _,
            };

            ///  Channel 1 generator select
            pub const EVSYS_CHANNEL1 = enum(u8) {
                ///  Off
                OFF = 0x0,
                ///  UPDI SYNCH character
                UPDI_SYNCH = 0x1,
                ///  MVIO VDDIO2 OK
                MVIO = 0x5,
                ///  Real Time Counter overflow
                RTC_OVF = 0x6,
                ///  Real Time Counter compare
                RTC_CMP = 0x7,
                ///  Periodic Interrupt Timer output 0
                RTC_PIT_DIV512 = 0x8,
                ///  Periodic Interrupt Timer output 1
                RTC_PIT_DIV256 = 0x9,
                ///  Periodic Interrupt Timer output 2
                RTC_PIT_DIV128 = 0xa,
                ///  Periodic Interrupt Timer output 3
                RTC_PIT_DIV64 = 0xb,
                ///  Configurable Custom Logic LUT0
                CCL_LUT0 = 0x10,
                ///  Configurable Custom Logic LUT1
                CCL_LUT1 = 0x11,
                ///  Configurable Custom Logic LUT2
                CCL_LUT2 = 0x12,
                ///  Configurable Custom Logic LUT3
                CCL_LUT3 = 0x13,
                ///  Analog Comparator 0 out
                AC0_OUT = 0x20,
                ///  Analog Comparator 1 out
                AC1_OUT = 0x21,
                ///  Analog Comparator 2 out
                AC2_OUT = 0x22,
                ///  ADC 0 Result Ready
                ADC0_RESRDY = 0x24,
                ///  Zero Cross Detect 0 out
                ZCD0 = 0x30,
                ///  OPAMP0 Ready
                OPAMP0_READY = 0x34,
                ///  OPAMP1 Ready
                OPAMP1_READY = 0x35,
                ///  Port A Pin 0
                PORTA_PIN0 = 0x40,
                ///  Port A Pin 1
                PORTA_PIN1 = 0x41,
                ///  Port A Pin 2
                PORTA_PIN2 = 0x42,
                ///  Port A Pin 3
                PORTA_PIN3 = 0x43,
                ///  Port A Pin 4
                PORTA_PIN4 = 0x44,
                ///  Port A Pin 5
                PORTA_PIN5 = 0x45,
                ///  Port A Pin 6
                PORTA_PIN6 = 0x46,
                ///  Port A Pin 7
                PORTA_PIN7 = 0x47,
                ///  USART 0 XCK
                USART0_XCK = 0x60,
                ///  USART 1 XCK
                USART1_XCK = 0x61,
                ///  USART 2 XCK
                USART2_XCK = 0x62,
                ///  SPI 0 SCK
                SPI0_SCK = 0x68,
                ///  SPI 1 SCK
                SPI1_SCK = 0x69,
                ///  Timer/Counter A0 overflow / low byte timer underflow
                TCA0_OVF_LUNF = 0x80,
                ///  Timer/Counter A0 high byte timer underflow
                TCA0_HUNF = 0x81,
                ///  Timer/Counter A0 compare 0 / low byte timer compare 0
                TCA0_CMP0_LCMP0 = 0x84,
                ///  Timer/Counter A0 compare 1 / low byte timer compare 1
                TCA0_CMP1_LCMP1 = 0x85,
                ///  Timer/Counter A0 compare 2 / low byte timer compare 2
                TCA0_CMP2_LCMP2 = 0x86,
                ///  Timer/Counter B0 capture
                TCB0_CAPT = 0xa0,
                ///  Timer/Counter B0 overflow
                TCB0_OVF = 0xa1,
                ///  Timer/Counter B1 capture
                TCB1_CAPT = 0xa2,
                ///  Timer/Counter B1 overflow
                TCB1_OVF = 0xa3,
                ///  Timer/Counter B2 capture
                TCB2_CAPT = 0xa4,
                ///  Timer/Counter B2 overflow
                TCB2_OVF = 0xa5,
                ///  Timer/Counter D0 event 0
                TCD0_CMPBCLR = 0xb0,
                ///  Timer/Counter D0 event 1
                TCD0_CMPASET = 0xb1,
                ///  Timer/Counter D0 event 2
                TCD0_CMPBSET = 0xb2,
                ///  Timer/Counter D0 event 3
                TCD0_PROGEV = 0xb3,
                _,
            };

            ///  Channel 2 generator select
            pub const EVSYS_CHANNEL2 = enum(u8) {
                ///  Off
                OFF = 0x0,
                ///  UPDI SYNCH character
                UPDI_SYNCH = 0x1,
                ///  MVIO VDDIO2 OK
                MVIO = 0x5,
                ///  Real Time Counter overflow
                RTC_OVF = 0x6,
                ///  Real Time Counter compare
                RTC_CMP = 0x7,
                ///  Periodic Interrupt Timer output 0
                RTC_PIT_DIV8192 = 0x8,
                ///  Periodic Interrupt Timer output 1
                RTC_PIT_DIV4096 = 0x9,
                ///  Periodic Interrupt Timer output 2
                RTC_PIT_DIV2048 = 0xa,
                ///  Periodic Interrupt Timer output 3
                RTC_PIT_DIV1024 = 0xb,
                ///  Configurable Custom Logic LUT0
                CCL_LUT0 = 0x10,
                ///  Configurable Custom Logic LUT1
                CCL_LUT1 = 0x11,
                ///  Configurable Custom Logic LUT2
                CCL_LUT2 = 0x12,
                ///  Configurable Custom Logic LUT3
                CCL_LUT3 = 0x13,
                ///  Analog Comparator 0 out
                AC0_OUT = 0x20,
                ///  Analog Comparator 1 out
                AC1_OUT = 0x21,
                ///  Analog Comparator 2 out
                AC2_OUT = 0x22,
                ///  ADC 0 Result Ready
                ADC0_RESRDY = 0x24,
                ///  Zero Cross Detect 0 out
                ZCD0 = 0x30,
                ///  OPAMP0 Ready
                OPAMP0_READY = 0x34,
                ///  OPAMP1 Ready
                OPAMP1_READY = 0x35,
                ///  Port C Pin 0
                PORTC_PIN0 = 0x40,
                ///  Port C Pin 1
                PORTC_PIN1 = 0x41,
                ///  Port C Pin 2
                PORTC_PIN2 = 0x42,
                ///  Port C Pin 3
                PORTC_PIN3 = 0x43,
                ///  Port D Pin 1
                PORTD_PIN1 = 0x49,
                ///  Port D Pin 2
                PORTD_PIN2 = 0x4a,
                ///  Port D Pin 3
                PORTD_PIN3 = 0x4b,
                ///  Port D Pin 4
                PORTD_PIN4 = 0x4c,
                ///  Port D Pin 5
                PORTD_PIN5 = 0x4d,
                ///  Port D Pin 6
                PORTD_PIN6 = 0x4e,
                ///  Port D Pin 7
                PORTD_PIN7 = 0x4f,
                ///  USART 0 XCK
                USART0_XCK = 0x60,
                ///  USART 1 XCK
                USART1_XCK = 0x61,
                ///  USART 2 XCK
                USART2_XCK = 0x62,
                ///  SPI 0 SCK
                SPI0_SCK = 0x68,
                ///  SPI 1 SCK
                SPI1_SCK = 0x69,
                ///  Timer/Counter A0 overflow / low byte timer underflow
                TCA0_OVF_LUNF = 0x80,
                ///  Timer/Counter A0 high byte timer underflow
                TCA0_HUNF = 0x81,
                ///  Timer/Counter A0 compare 0 / low byte timer compare 0
                TCA0_CMP0_LCMP0 = 0x84,
                ///  Timer/Counter A0 compare 1 / low byte timer compare 1
                TCA0_CMP1_LCMP1 = 0x85,
                ///  Timer/Counter A0 compare 2 / low byte timer compare 2
                TCA0_CMP2_LCMP2 = 0x86,
                ///  Timer/Counter B0 capture
                TCB0_CAPT = 0xa0,
                ///  Timer/Counter B0 overflow
                TCB0_OVF = 0xa1,
                ///  Timer/Counter B1 capture
                TCB1_CAPT = 0xa2,
                ///  Timer/Counter B1 overflow
                TCB1_OVF = 0xa3,
                ///  Timer/Counter B2 capture
                TCB2_CAPT = 0xa4,
                ///  Timer/Counter B2 overflow
                TCB2_OVF = 0xa5,
                ///  Timer/Counter D0 event 0
                TCD0_CMPBCLR = 0xb0,
                ///  Timer/Counter D0 event 1
                TCD0_CMPASET = 0xb1,
                ///  Timer/Counter D0 event 2
                TCD0_CMPBSET = 0xb2,
                ///  Timer/Counter D0 event 3
                TCD0_PROGEV = 0xb3,
                _,
            };

            ///  Channel 3 generator select
            pub const EVSYS_CHANNEL3 = enum(u8) {
                ///  Off
                OFF = 0x0,
                ///  UPDI SYNCH character
                UPDI_SYNCH = 0x1,
                ///  MVIO VDDIO2 OK
                MVIO = 0x5,
                ///  Real Time Counter overflow
                RTC_OVF = 0x6,
                ///  Real Time Counter compare
                RTC_CMP = 0x7,
                ///  Periodic Interrupt Timer output 0
                RTC_PIT_DIV512 = 0x8,
                ///  Periodic Interrupt Timer output 1
                RTC_PIT_DIV256 = 0x9,
                ///  Periodic Interrupt Timer output 2
                RTC_PIT_DIV128 = 0xa,
                ///  Periodic Interrupt Timer output 3
                RTC_PIT_DIV64 = 0xb,
                ///  Configurable Custom Logic LUT0
                CCL_LUT0 = 0x10,
                ///  Configurable Custom Logic LUT1
                CCL_LUT1 = 0x11,
                ///  Configurable Custom Logic LUT2
                CCL_LUT2 = 0x12,
                ///  Configurable Custom Logic LUT3
                CCL_LUT3 = 0x13,
                ///  Analog Comparator 0 out
                AC0_OUT = 0x20,
                ///  Analog Comparator 1 out
                AC1_OUT = 0x21,
                ///  Analog Comparator 2 out
                AC2_OUT = 0x22,
                ///  ADC 0 Result Ready
                ADC0_RESRDY = 0x24,
                ///  Zero Cross Detect 0 out
                ZCD0 = 0x30,
                ///  OPAMP0 Ready
                OPAMP0_READY = 0x34,
                ///  OPAMP1 Ready
                OPAMP1_READY = 0x35,
                ///  Port C Pin 0
                PORTC_PIN0 = 0x40,
                ///  Port C Pin 1
                PORTC_PIN1 = 0x41,
                ///  Port C Pin 2
                PORTC_PIN2 = 0x42,
                ///  Port C Pin 3
                PORTC_PIN3 = 0x43,
                ///  Port D Pin 1
                PORTD_PIN1 = 0x49,
                ///  Port D Pin 2
                PORTD_PIN2 = 0x4a,
                ///  Port D Pin 3
                PORTD_PIN3 = 0x4b,
                ///  Port D Pin 4
                PORTD_PIN4 = 0x4c,
                ///  Port D Pin 5
                PORTD_PIN5 = 0x4d,
                ///  Port D Pin 6
                PORTD_PIN6 = 0x4e,
                ///  Port D Pin 7
                PORTD_PIN7 = 0x4f,
                ///  USART 0 XCK
                USART0_XCK = 0x60,
                ///  USART 1 XCK
                USART1_XCK = 0x61,
                ///  USART 2 XCK
                USART2_XCK = 0x62,
                ///  SPI 0 SCK
                SPI0_SCK = 0x68,
                ///  SPI 1 SCK
                SPI1_SCK = 0x69,
                ///  Timer/Counter A0 overflow / low byte timer underflow
                TCA0_OVF_LUNF = 0x80,
                ///  Timer/Counter A0 high byte timer underflow
                TCA0_HUNF = 0x81,
                ///  Timer/Counter A0 compare 0 / low byte timer compare 0
                TCA0_CMP0_LCMP0 = 0x84,
                ///  Timer/Counter A0 compare 1 / low byte timer compare 1
                TCA0_CMP1_LCMP1 = 0x85,
                ///  Timer/Counter A0 compare 2 / low byte timer compare 2
                TCA0_CMP2_LCMP2 = 0x86,
                ///  Timer/Counter B0 capture
                TCB0_CAPT = 0xa0,
                ///  Timer/Counter B0 overflow
                TCB0_OVF = 0xa1,
                ///  Timer/Counter B1 capture
                TCB1_CAPT = 0xa2,
                ///  Timer/Counter B1 overflow
                TCB1_OVF = 0xa3,
                ///  Timer/Counter B2 capture
                TCB2_CAPT = 0xa4,
                ///  Timer/Counter B2 overflow
                TCB2_OVF = 0xa5,
                ///  Timer/Counter D0 event 0
                TCD0_CMPBCLR = 0xb0,
                ///  Timer/Counter D0 event 1
                TCD0_CMPASET = 0xb1,
                ///  Timer/Counter D0 event 2
                TCD0_CMPBSET = 0xb2,
                ///  Timer/Counter D0 event 3
                TCD0_PROGEV = 0xb3,
                _,
            };

            ///  Channel 4 generator select
            pub const EVSYS_CHANNEL4 = enum(u8) {
                ///  Off
                OFF = 0x0,
                ///  UPDI SYNCH character
                UPDI_SYNCH = 0x1,
                ///  MVIO VDDIO2 OK
                MVIO = 0x5,
                ///  Real Time Counter overflow
                RTC_OVF = 0x6,
                ///  Real Time Counter compare
                RTC_CMP = 0x7,
                ///  Periodic Interrupt Timer output 0
                RTC_PIT_DIV8192 = 0x8,
                ///  Periodic Interrupt Timer output 1
                RTC_PIT_DIV4096 = 0x9,
                ///  Periodic Interrupt Timer output 2
                RTC_PIT_DIV2048 = 0xa,
                ///  Periodic Interrupt Timer output 3
                RTC_PIT_DIV1024 = 0xb,
                ///  Configurable Custom Logic LUT0
                CCL_LUT0 = 0x10,
                ///  Configurable Custom Logic LUT1
                CCL_LUT1 = 0x11,
                ///  Configurable Custom Logic LUT2
                CCL_LUT2 = 0x12,
                ///  Configurable Custom Logic LUT3
                CCL_LUT3 = 0x13,
                ///  Analog Comparator 0 out
                AC0_OUT = 0x20,
                ///  Analog Comparator 1 out
                AC1_OUT = 0x21,
                ///  Analog Comparator 2 out
                AC2_OUT = 0x22,
                ///  ADC 0 Result Ready
                ADC0_RESRDY = 0x24,
                ///  Zero Cross Detect 0 out
                ZCD0 = 0x30,
                ///  OPAMP0 Ready
                OPAMP0_READY = 0x34,
                ///  OPAMP1 Ready
                OPAMP1_READY = 0x35,
                ///  Port F Pin 0
                PORTF_PIN0 = 0x48,
                ///  Port F Pin 1
                PORTF_PIN1 = 0x49,
                ///  Port F Pin 6
                PORTF_PIN6 = 0x4e,
                ///  USART 0 XCK
                USART0_XCK = 0x60,
                ///  USART 1 XCK
                USART1_XCK = 0x61,
                ///  USART 2 XCK
                USART2_XCK = 0x62,
                ///  SPI 0 SCK
                SPI0_SCK = 0x68,
                ///  SPI 1 SCK
                SPI1_SCK = 0x69,
                ///  Timer/Counter A0 overflow / low byte timer underflow
                TCA0_OVF_LUNF = 0x80,
                ///  Timer/Counter A0 high byte timer underflow
                TCA0_HUNF = 0x81,
                ///  Timer/Counter A0 compare 0 / low byte timer compare 0
                TCA0_CMP0_LCMP0 = 0x84,
                ///  Timer/Counter A0 compare 1 / low byte timer compare 1
                TCA0_CMP1_LCMP1 = 0x85,
                ///  Timer/Counter A0 compare 2 / low byte timer compare 2
                TCA0_CMP2_LCMP2 = 0x86,
                ///  Timer/Counter B0 capture
                TCB0_CAPT = 0xa0,
                ///  Timer/Counter B0 overflow
                TCB0_OVF = 0xa1,
                ///  Timer/Counter B1 capture
                TCB1_CAPT = 0xa2,
                ///  Timer/Counter B1 overflow
                TCB1_OVF = 0xa3,
                ///  Timer/Counter B2 capture
                TCB2_CAPT = 0xa4,
                ///  Timer/Counter B2 overflow
                TCB2_OVF = 0xa5,
                ///  Timer/Counter D0 event 0
                TCD0_CMPBCLR = 0xb0,
                ///  Timer/Counter D0 event 1
                TCD0_CMPASET = 0xb1,
                ///  Timer/Counter D0 event 2
                TCD0_CMPBSET = 0xb2,
                ///  Timer/Counter D0 event 3
                TCD0_PROGEV = 0xb3,
                _,
            };

            ///  Channel 5 generator select
            pub const EVSYS_CHANNEL5 = enum(u8) {
                ///  Off
                OFF = 0x0,
                ///  UPDI SYNCH character
                UPDI_SYNCH = 0x1,
                ///  MVIO VDDIO2 OK
                MVIO = 0x5,
                ///  Real Time Counter overflow
                RTC_OVF = 0x6,
                ///  Real Time Counter compare
                RTC_CMP = 0x7,
                ///  Periodic Interrupt Timer output 0
                RTC_PIT_DIV512 = 0x8,
                ///  Periodic Interrupt Timer output 1
                RTC_PIT_DIV256 = 0x9,
                ///  Periodic Interrupt Timer output 2
                RTC_PIT_DIV128 = 0xa,
                ///  Periodic Interrupt Timer output 3
                RTC_PIT_DIV64 = 0xb,
                ///  Configurable Custom Logic LUT0
                CCL_LUT0 = 0x10,
                ///  Configurable Custom Logic LUT1
                CCL_LUT1 = 0x11,
                ///  Configurable Custom Logic LUT2
                CCL_LUT2 = 0x12,
                ///  Configurable Custom Logic LUT3
                CCL_LUT3 = 0x13,
                ///  Analog Comparator 0 out
                AC0_OUT = 0x20,
                ///  Analog Comparator 1 out
                AC1_OUT = 0x21,
                ///  Analog Comparator 2 out
                AC2_OUT = 0x22,
                ///  ADC 0 Result Ready
                ADC0_RESRDY = 0x24,
                ///  Zero Cross Detect 0 out
                ZCD0 = 0x30,
                ///  OPAMP0 Ready
                OPAMP0_READY = 0x34,
                ///  OPAMP1 Ready
                OPAMP1_READY = 0x35,
                ///  Port F Pin 0
                PORTF_PIN0 = 0x48,
                ///  Port F Pin 1
                PORTF_PIN1 = 0x49,
                ///  Port F Pin 6
                PORTF_PIN6 = 0x4e,
                ///  USART 0 XCK
                USART0_XCK = 0x60,
                ///  USART 1 XCK
                USART1_XCK = 0x61,
                ///  USART 2 XCK
                USART2_XCK = 0x62,
                ///  SPI 0 SCK
                SPI0_SCK = 0x68,
                ///  SPI 1 SCK
                SPI1_SCK = 0x69,
                ///  Timer/Counter A0 overflow / low byte timer underflow
                TCA0_OVF_LUNF = 0x80,
                ///  Timer/Counter A0 high byte timer underflow
                TCA0_HUNF = 0x81,
                ///  Timer/Counter A0 compare 0 / low byte timer compare 0
                TCA0_CMP0_LCMP0 = 0x84,
                ///  Timer/Counter A0 compare 1 / low byte timer compare 1
                TCA0_CMP1_LCMP1 = 0x85,
                ///  Timer/Counter A0 compare 2 / low byte timer compare 2
                TCA0_CMP2_LCMP2 = 0x86,
                ///  Timer/Counter B0 capture
                TCB0_CAPT = 0xa0,
                ///  Timer/Counter B0 overflow
                TCB0_OVF = 0xa1,
                ///  Timer/Counter B1 capture
                TCB1_CAPT = 0xa2,
                ///  Timer/Counter B1 overflow
                TCB1_OVF = 0xa3,
                ///  Timer/Counter B2 capture
                TCB2_CAPT = 0xa4,
                ///  Timer/Counter B2 overflow
                TCB2_OVF = 0xa5,
                ///  Timer/Counter D0 event 0
                TCD0_CMPBCLR = 0xb0,
                ///  Timer/Counter D0 event 1
                TCD0_CMPASET = 0xb1,
                ///  Timer/Counter D0 event 2
                TCD0_CMPBSET = 0xb2,
                ///  Timer/Counter D0 event 3
                TCD0_PROGEV = 0xb3,
                _,
            };

            ///  Channel 6 generator select
            pub const EVSYS_CHANNEL6 = enum(u8) {
                ///  Off
                OFF = 0x0,
                ///  UPDI SYNCH character
                UPDI_SYNCH = 0x1,
                ///  MVIO VDDIO2 OK
                MVIO = 0x5,
                ///  Real Time Counter overflow
                RTC_OVF = 0x6,
                ///  Real Time Counter compare
                RTC_CMP = 0x7,
                ///  Periodic Interrupt Timer output 0
                RTC_PIT_DIV8192 = 0x8,
                ///  Periodic Interrupt Timer output 1
                RTC_PIT_DIV4096 = 0x9,
                ///  Periodic Interrupt Timer output 2
                RTC_PIT_DIV2048 = 0xa,
                ///  Periodic Interrupt Timer output 3
                RTC_PIT_DIV1024 = 0xb,
                ///  Configurable Custom Logic LUT0
                CCL_LUT0 = 0x10,
                ///  Configurable Custom Logic LUT1
                CCL_LUT1 = 0x11,
                ///  Configurable Custom Logic LUT2
                CCL_LUT2 = 0x12,
                ///  Configurable Custom Logic LUT3
                CCL_LUT3 = 0x13,
                ///  Analog Comparator 0 out
                AC0_OUT = 0x20,
                ///  Analog Comparator 1 out
                AC1_OUT = 0x21,
                ///  Analog Comparator 2 out
                AC2_OUT = 0x22,
                ///  ADC 0 Result Ready
                ADC0_RESRDY = 0x24,
                ///  Zero Cross Detect 0 out
                ZCD0 = 0x30,
                ///  OPAMP0 Ready
                OPAMP0_READY = 0x34,
                ///  OPAMP1 Ready
                OPAMP1_READY = 0x35,
                ///  USART 0 XCK
                USART0_XCK = 0x60,
                ///  USART 1 XCK
                USART1_XCK = 0x61,
                ///  USART 2 XCK
                USART2_XCK = 0x62,
                ///  SPI 0 SCK
                SPI0_SCK = 0x68,
                ///  SPI 1 SCK
                SPI1_SCK = 0x69,
                ///  Timer/Counter A0 overflow / low byte timer underflow
                TCA0_OVF_LUNF = 0x80,
                ///  Timer/Counter A0 high byte timer underflow
                TCA0_HUNF = 0x81,
                ///  Timer/Counter A0 compare 0 / low byte timer compare 0
                TCA0_CMP0_LCMP0 = 0x84,
                ///  Timer/Counter A0 compare 1 / low byte timer compare 1
                TCA0_CMP1_LCMP1 = 0x85,
                ///  Timer/Counter A0 compare 2 / low byte timer compare 2
                TCA0_CMP2_LCMP2 = 0x86,
                ///  Timer/Counter B0 capture
                TCB0_CAPT = 0xa0,
                ///  Timer/Counter B0 overflow
                TCB0_OVF = 0xa1,
                ///  Timer/Counter B1 capture
                TCB1_CAPT = 0xa2,
                ///  Timer/Counter B1 overflow
                TCB1_OVF = 0xa3,
                ///  Timer/Counter B2 capture
                TCB2_CAPT = 0xa4,
                ///  Timer/Counter B2 overflow
                TCB2_OVF = 0xa5,
                ///  Timer/Counter D0 event 0
                TCD0_CMPBCLR = 0xb0,
                ///  Timer/Counter D0 event 1
                TCD0_CMPASET = 0xb1,
                ///  Timer/Counter D0 event 2
                TCD0_CMPBSET = 0xb2,
                ///  Timer/Counter D0 event 3
                TCD0_PROGEV = 0xb3,
                _,
            };

            ///  Channel 7 generator select
            pub const EVSYS_CHANNEL7 = enum(u8) {
                ///  Off
                OFF = 0x0,
                ///  UPDI SYNCH character
                UPDI_SYNCH = 0x1,
                ///  MVIO VDDIO2 OK
                MVIO = 0x5,
                ///  Real Time Counter overflow
                RTC_OVF = 0x6,
                ///  Real Time Counter compare
                RTC_CMP = 0x7,
                ///  Periodic Interrupt Timer output 0
                RTC_PIT_DIV512 = 0x8,
                ///  Periodic Interrupt Timer output 1
                RTC_PIT_DIV256 = 0x9,
                ///  Periodic Interrupt Timer output 2
                RTC_PIT_DIV128 = 0xa,
                ///  Periodic Interrupt Timer output 3
                RTC_PIT_DIV64 = 0xb,
                ///  Configurable Custom Logic LUT0
                CCL_LUT0 = 0x10,
                ///  Configurable Custom Logic LUT1
                CCL_LUT1 = 0x11,
                ///  Configurable Custom Logic LUT2
                CCL_LUT2 = 0x12,
                ///  Configurable Custom Logic LUT3
                CCL_LUT3 = 0x13,
                ///  Analog Comparator 0 out
                AC0_OUT = 0x20,
                ///  Analog Comparator 1 out
                AC1_OUT = 0x21,
                ///  Analog Comparator 2 out
                AC2_OUT = 0x22,
                ///  ADC 0 Result Ready
                ADC0_RESRDY = 0x24,
                ///  Zero Cross Detect 0 out
                ZCD0 = 0x30,
                ///  OPAMP0 Ready
                OPAMP0_READY = 0x34,
                ///  OPAMP1 Ready
                OPAMP1_READY = 0x35,
                ///  USART 0 XCK
                USART0_XCK = 0x60,
                ///  USART 1 XCK
                USART1_XCK = 0x61,
                ///  USART 2 XCK
                USART2_XCK = 0x62,
                ///  SPI 0 SCK
                SPI0_SCK = 0x68,
                ///  SPI 1 SCK
                SPI1_SCK = 0x69,
                ///  Timer/Counter A0 overflow / low byte timer underflow
                TCA0_OVF_LUNF = 0x80,
                ///  Timer/Counter A0 high byte timer underflow
                TCA0_HUNF = 0x81,
                ///  Timer/Counter A0 compare 0 / low byte timer compare 0
                TCA0_CMP0_LCMP0 = 0x84,
                ///  Timer/Counter A0 compare 1 / low byte timer compare 1
                TCA0_CMP1_LCMP1 = 0x85,
                ///  Timer/Counter A0 compare 2 / low byte timer compare 2
                TCA0_CMP2_LCMP2 = 0x86,
                ///  Timer/Counter B0 capture
                TCB0_CAPT = 0xa0,
                ///  Timer/Counter B0 overflow
                TCB0_OVF = 0xa1,
                ///  Timer/Counter B1 capture
                TCB1_CAPT = 0xa2,
                ///  Timer/Counter B1 overflow
                TCB1_OVF = 0xa3,
                ///  Timer/Counter B2 capture
                TCB2_CAPT = 0xa4,
                ///  Timer/Counter B2 overflow
                TCB2_OVF = 0xa5,
                ///  Timer/Counter D0 event 0
                TCD0_CMPBCLR = 0xb0,
                ///  Timer/Counter D0 event 1
                TCD0_CMPASET = 0xb1,
                ///  Timer/Counter D0 event 2
                TCD0_CMPBSET = 0xb2,
                ///  Timer/Counter D0 event 3
                TCD0_PROGEV = 0xb3,
                _,
            };

            ///  Software event on channel select
            pub const EVSYS_SWEVENTA = enum(u8) {
                ///  Software event on channel 0
                CH0 = 0x1,
                ///  Software event on channel 1
                CH1 = 0x2,
                ///  Software event on channel 2
                CH2 = 0x4,
                ///  Software event on channel 3
                CH3 = 0x8,
                ///  Software event on channel 4
                CH4 = 0x10,
                ///  Software event on channel 5
                CH5 = 0x20,
                ///  Software event on channel 6
                CH6 = 0x40,
                ///  Software event on channel 7
                CH7 = 0x80,
                _,
            };

            ///  User channel select
            pub const EVSYS_USER = enum(u8) {
                ///  Off
                OFF = 0x0,
                ///  Connect user to event channel 0
                CHANNEL0 = 0x1,
                ///  Connect user to event channel 1
                CHANNEL1 = 0x2,
                ///  Connect user to event channel 2
                CHANNEL2 = 0x3,
                ///  Connect user to event channel 3
                CHANNEL3 = 0x4,
                ///  Connect user to event channel 4
                CHANNEL4 = 0x5,
                ///  Connect user to event channel 5
                CHANNEL5 = 0x6,
                ///  Connect user to event channel 6
                CHANNEL6 = 0x7,
                ///  Connect user to event channel 7
                CHANNEL7 = 0x8,
                _,
            };

            ///  Software Event A
            SWEVENTA: mmio.Mmio(packed struct(u8) {
                ///  Software event on channel select
                SWEVENTA: packed union {
                    raw: u8,
                    value: EVSYS_SWEVENTA,
                },
            }),
            reserved16: [15]u8,
            ///  Multiplexer Channel 0
            CHANNEL0: mmio.Mmio(packed struct(u8) {
                ///  Channel 0 generator select
                CHANNEL0: packed union {
                    raw: u8,
                    value: EVSYS_CHANNEL0,
                },
            }),
            ///  Multiplexer Channel 1
            CHANNEL1: mmio.Mmio(packed struct(u8) {
                ///  Channel 1 generator select
                CHANNEL1: packed union {
                    raw: u8,
                    value: EVSYS_CHANNEL1,
                },
            }),
            ///  Multiplexer Channel 2
            CHANNEL2: mmio.Mmio(packed struct(u8) {
                ///  Channel 2 generator select
                CHANNEL2: packed union {
                    raw: u8,
                    value: EVSYS_CHANNEL2,
                },
            }),
            ///  Multiplexer Channel 3
            CHANNEL3: mmio.Mmio(packed struct(u8) {
                ///  Channel 3 generator select
                CHANNEL3: packed union {
                    raw: u8,
                    value: EVSYS_CHANNEL3,
                },
            }),
            ///  Multiplexer Channel 4
            CHANNEL4: mmio.Mmio(packed struct(u8) {
                ///  Channel 4 generator select
                CHANNEL4: packed union {
                    raw: u8,
                    value: EVSYS_CHANNEL4,
                },
            }),
            ///  Multiplexer Channel 5
            CHANNEL5: mmio.Mmio(packed struct(u8) {
                ///  Channel 5 generator select
                CHANNEL5: packed union {
                    raw: u8,
                    value: EVSYS_CHANNEL5,
                },
            }),
            ///  Multiplexer Channel 6
            CHANNEL6: mmio.Mmio(packed struct(u8) {
                ///  Channel 6 generator select
                CHANNEL6: packed union {
                    raw: u8,
                    value: EVSYS_CHANNEL6,
                },
            }),
            ///  Multiplexer Channel 7
            CHANNEL7: mmio.Mmio(packed struct(u8) {
                ///  Channel 7 generator select
                CHANNEL7: packed union {
                    raw: u8,
                    value: EVSYS_CHANNEL7,
                },
            }),
            reserved32: [8]u8,
            ///  User 0 - CCL0 Event A
            USERCCLLUT0A: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 1 - CCL0 Event B
            USERCCLLUT0B: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 2 - CCL1 Event A
            USERCCLLUT1A: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 3 - CCL1 Event B
            USERCCLLUT1B: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 4 - CCL2 Event A
            USERCCLLUT2A: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 5 - CCL2 Event B
            USERCCLLUT2B: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 6 - CCL3 Event A
            USERCCLLUT3A: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 7 - CCL3 Event B
            USERCCLLUT3B: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            reserved44: [4]u8,
            ///  User 12 - ADC0
            USERADC0START: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 13 - EVOUTA
            USEREVSYSEVOUTA: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            reserved47: [1]u8,
            ///  User 15 - EVOUTC
            USEREVSYSEVOUTC: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 16 - EVOUTD
            USEREVSYSEVOUTD: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            reserved50: [1]u8,
            ///  User 18 - EVOUTF
            USEREVSYSEVOUTF: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            reserved52: [1]u8,
            ///  User 20 - USART0
            USERUSART0IRDA: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 21 - USART1
            USERUSART1IRDA: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 22 - USART2
            USERUSART2IRDA: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            reserved58: [3]u8,
            ///  User 26 - TCA0 Event A
            USERTCA0CNTA: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 27 - TCA0 Event B
            USERTCA0CNTB: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            reserved62: [2]u8,
            ///  User 30 - TCB0 Event A
            USERTCB0CAPT: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 31 - TCB0 Event B
            USERTCB0COUNT: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 32 - TCB1 Event A
            USERTCB1CAPT: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 33 - TCB1 Event B
            USERTCB1COUNT: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 34 - TCB2 Event A
            USERTCB2CAPT: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 35 - TCB2 Event B
            USERTCB2COUNT: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            reserved72: [4]u8,
            ///  User 40 - TCD0 Event A
            USERTCD0INPUTA: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 41 - TCD0 Event B
            USERTCD0INPUTB: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 42 - OPAMP0 Enable
            USEROPAMP0ENABLE: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 43 - OPAMP0 Disable
            USEROPAMP0DISABLE: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 44 - OPAMP0 Dump
            USEROPAMP0DUMP: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 45 - OPAMP0 Drive
            USEROPAMP0DRIVE: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 46 - OPAMP1 Enable
            USEROPAMP1ENABLE: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 47 - OPAMP1 Disable
            USEROPAMP1DISABLE: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 48 - OPAMP1 Dump
            USEROPAMP1DUMP: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
            ///  User 49 - OPAMP1 Drive
            USEROPAMP1DRIVE: mmio.Mmio(packed struct(u8) {
                ///  User channel select
                USER: packed union {
                    raw: u8,
                    value: EVSYS_USER,
                },
            }),
        };

        ///  Fuses
        pub const FUSE = extern struct {
            ///  BOD Operation in Active Mode select
            pub const FUSE_ACTIVE = enum(u2) {
                ///  BOD disabled
                DISABLE = 0x0,
                ///  BOD enabled in continuous mode
                ENABLE = 0x1,
                ///  BOD enabled in sampled mode
                SAMPLE = 0x2,
                ///  BOD enabled in continuous mode. Execution is halted at wake-up until BOD is running.
                ENABLEWAIT = 0x3,
            };

            ///  BOD Level select
            pub const FUSE_LVL = enum(u3) {
                ///  1.9V
                BODLEVEL0 = 0x0,
                ///  2.45V
                BODLEVEL1 = 0x1,
                ///  2.7V
                BODLEVEL2 = 0x2,
                ///  2.85V
                BODLEVEL3 = 0x3,
                _,
            };

            ///  BOD Sample Frequency select
            pub const FUSE_SAMPFREQ = enum(u1) {
                ///  Sample frequency is 128 Hz
                @"128Hz" = 0x0,
                ///  Sample frequency is 32 Hz
                @"32Hz" = 0x1,
            };

            ///  BOD Operation in Sleep Mode select
            pub const FUSE_SLEEP = enum(u2) {
                ///  BOD disabled
                DISABLE = 0x0,
                ///  BOD enabled in continuous mode
                ENABLE = 0x1,
                ///  BOD enabled in sampled mode
                SAMPLE = 0x2,
                _,
            };

            ///  Frequency Select
            pub const FUSE_CLKSEL = enum(u3) {
                ///  1-32MHz internal oscillator
                OSCHF = 0x0,
                ///  32.768kHz internal oscillator
                OSC32K = 0x1,
                _,
            };

            ///  CRC Select
            pub const FUSE_CRCSEL = enum(u1) {
                ///  Enable CRC16
                CRC16 = 0x0,
                ///  Enable CRC32
                CRC32 = 0x1,
            };

            ///  CRC Source select
            pub const FUSE_CRCSRC = enum(u2) {
                ///  CRC of full Flash (boot, application code and application data)
                FLASH = 0x0,
                ///  CRC of boot section
                BOOT = 0x1,
                ///  CRC of application code and boot sections
                BOOTAPP = 0x2,
                ///  No CRC
                NOCRC = 0x3,
            };

            ///  Reset Pin Configuration select
            pub const FUSE_RSTPINCFG = enum(u2) {
                ///  GPIO mode
                GPIO = 0x0,
                ///  Reset mode
                RST = 0x2,
                _,
            };

            ///  MVIO System Configuration select
            pub const FUSE_MVSYSCFG = enum(u2) {
                ///  Device used in a dual supply configuration
                DUAL = 0x1,
                ///  Device used in a single supply configuration
                SINGLE = 0x2,
                _,
            };

            ///  Startup Time select
            pub const FUSE_SUT = enum(u3) {
                ///  0 ms
                @"0MS" = 0x0,
                ///  1 ms
                @"1MS" = 0x1,
                ///  2 ms
                @"2MS" = 0x2,
                ///  4 ms
                @"4MS" = 0x3,
                ///  8 ms
                @"8MS" = 0x4,
                ///  16 ms
                @"16MS" = 0x5,
                ///  32 ms
                @"32MS" = 0x6,
                ///  64 ms
                @"64MS" = 0x7,
            };

            ///  Watchdog Timeout Period select
            pub const FUSE_PERIOD = enum(u4) {
                ///  Watch-Dog timer Off
                OFF = 0x0,
                ///  8 cycles (8ms)
                @"8CLK" = 0x1,
                ///  16 cycles (16ms)
                @"16CLK" = 0x2,
                ///  32 cycles (32ms)
                @"32CLK" = 0x3,
                ///  64 cycles (64ms)
                @"64CLK" = 0x4,
                ///  128 cycles (0.128s)
                @"128CLK" = 0x5,
                ///  256 cycles (0.256s)
                @"256CLK" = 0x6,
                ///  512 cycles (0.512s)
                @"512CLK" = 0x7,
                ///  1K cycles (1.0s)
                @"1KCLK" = 0x8,
                ///  2K cycles (2.0s)
                @"2KCLK" = 0x9,
                ///  4K cycles (4.0s)
                @"4KCLK" = 0xa,
                ///  8K cycles (8.0s)
                @"8KCLK" = 0xb,
                _,
            };

            ///  Watchdog Window Timeout Period select
            pub const FUSE_WINDOW = enum(u4) {
                ///  Window mode off
                OFF = 0x0,
                ///  8 cycles (8ms)
                @"8CLK" = 0x1,
                ///  16 cycles (16ms)
                @"16CLK" = 0x2,
                ///  32 cycles (32ms)
                @"32CLK" = 0x3,
                ///  64 cycles (64ms)
                @"64CLK" = 0x4,
                ///  128 cycles (0.128s)
                @"128CLK" = 0x5,
                ///  256 cycles (0.256s)
                @"256CLK" = 0x6,
                ///  512 cycles (0.512s)
                @"512CLK" = 0x7,
                ///  1K cycles (1.0s)
                @"1KCLK" = 0x8,
                ///  2K cycles (2.0s)
                @"2KCLK" = 0x9,
                ///  4K cycles (4.0s)
                @"4KCLK" = 0xa,
                ///  8K cycles (8.0s)
                @"8KCLK" = 0xb,
                _,
            };

            ///  Watchdog Configuration
            WDTCFG: mmio.Mmio(packed struct(u8) {
                ///  Watchdog Timeout Period
                PERIOD: packed union {
                    raw: u4,
                    value: FUSE_PERIOD,
                },
                ///  Watchdog Window Timeout Period
                WINDOW: packed union {
                    raw: u4,
                    value: FUSE_WINDOW,
                },
            }),
            ///  BOD Configuration
            BODCFG: mmio.Mmio(packed struct(u8) {
                ///  BOD Operation in Sleep Mode
                SLEEP: packed union {
                    raw: u2,
                    value: FUSE_SLEEP,
                },
                ///  BOD Operation in Active Mode
                ACTIVE: packed union {
                    raw: u2,
                    value: FUSE_ACTIVE,
                },
                ///  BOD Sample Frequency
                SAMPFREQ: packed union {
                    raw: u1,
                    value: FUSE_SAMPFREQ,
                },
                ///  BOD Level
                LVL: packed union {
                    raw: u3,
                    value: FUSE_LVL,
                },
            }),
            ///  Oscillator Configuration
            OSCCFG: mmio.Mmio(packed struct(u8) {
                ///  Frequency Select
                CLKSEL: packed union {
                    raw: u3,
                    value: FUSE_CLKSEL,
                },
                padding: u5,
            }),
            reserved5: [2]u8,
            ///  System Configuration 0
            SYSCFG0: mmio.Mmio(packed struct(u8) {
                ///  EEPROM Save
                EESAVE: u1,
                reserved2: u1,
                ///  Reset Pin Configuration
                RSTPINCFG: packed union {
                    raw: u2,
                    value: FUSE_RSTPINCFG,
                },
                reserved5: u1,
                ///  CRC Select
                CRCSEL: packed union {
                    raw: u1,
                    value: FUSE_CRCSEL,
                },
                ///  CRC Source
                CRCSRC: packed union {
                    raw: u2,
                    value: FUSE_CRCSRC,
                },
            }),
            ///  System Configuration 1
            SYSCFG1: mmio.Mmio(packed struct(u8) {
                ///  Startup Time
                SUT: packed union {
                    raw: u3,
                    value: FUSE_SUT,
                },
                ///  MVIO System Configuration
                MVSYSCFG: packed union {
                    raw: u2,
                    value: FUSE_MVSYSCFG,
                },
                padding: u3,
            }),
            ///  Code Section Size
            CODESIZE: u8,
            ///  Boot Section Size
            BOOTSIZE: u8,
        };

        ///  General Purpose Registers
        pub const GPR = extern struct {
            ///  General Purpose Register 0
            GPR0: u8,
            ///  General Purpose Register 1
            GPR1: u8,
            ///  General Purpose Register 2
            GPR2: u8,
            ///  General Purpose Register 3
            GPR3: u8,
        };

        ///  Lockbits
        pub const LOCK = extern struct {
            ///  Lock Key select
            pub const LOCK_KEY = enum(u32) {
                ///  No locks
                NOLOCK = 0x5cc5c55c,
                ///  Read and write lock
                RWLOCK = 0xa33a3aa3,
                _,
            };

            ///  Lock Key Bits
            KEY: mmio.Mmio(packed struct(u32) {
                ///  Lock Key
                KEY: packed union {
                    raw: u32,
                    value: LOCK_KEY,
                },
            }),
        };

        ///  Multi-Voltage I/O
        pub const MVIO = extern struct {
            ///  Interrupt Control
            INTCTRL: mmio.Mmio(packed struct(u8) {
                ///  VDDIO2 Interrupt Enable
                VDDIO2IE: u1,
                padding: u7,
            }),
            ///  Interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  VDDIO2 Interrupt Flag
                VDDIO2IF: u1,
                padding: u7,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  VDDIO2 Status
                VDDIO2S: u1,
                padding: u7,
            }),
        };

        ///  Non-volatile Memory Controller
        pub const NVMCTRL = extern struct {
            ///  Command select
            pub const NVMCTRL_CMD = enum(u7) {
                ///  No Command
                NONE = 0x0,
                ///  No Operation
                NOOP = 0x1,
                ///  Flash Write
                FLWR = 0x2,
                ///  Flash Page Erase
                FLPER = 0x8,
                ///  Flash Multi-Page Erase 2 pages
                FLMPER2 = 0x9,
                ///  Flash Multi-Page Erase 4 pages
                FLMPER4 = 0xa,
                ///  Flash Multi-Page Erase 8 pages
                FLMPER8 = 0xb,
                ///  Flash Multi-Page Erase 16 pages
                FLMPER16 = 0xc,
                ///  Flash Multi-Page Erase 32 pages
                FLMPER32 = 0xd,
                ///  EEPROM Write
                EEWR = 0x12,
                ///  EEPROM Erase and Write
                EEERWR = 0x13,
                ///  EEPROM Byte Erase
                EEBER = 0x18,
                ///  EEPROM Multi-Byte Erase 2 bytes
                EEMBER2 = 0x19,
                ///  EEPROM Multi-Byte Erase 4 bytes
                EEMBER4 = 0x1a,
                ///  EEPROM Multi-Byte Erase 8 bytes
                EEMBER8 = 0x1b,
                ///  EEPROM Multi-Byte Erase 16 bytes
                EEMBER16 = 0x1c,
                ///  EEPROM Multi-Byte Erase 32 bytes
                EEMBER32 = 0x1d,
                ///  Chip Erase Command
                CHER = 0x20,
                ///  EEPROM Erase Command
                EECHER = 0x30,
                _,
            };

            ///  Flash Mapping in Data space select
            pub const NVMCTRL_FLMAP = enum(u2) {
                ///  Flash section 0
                SECTION0 = 0x0,
                ///  Flash section 1
                SECTION1 = 0x1,
                ///  Flash section 2
                SECTION2 = 0x2,
                ///  Flash section 3
                SECTION3 = 0x3,
            };

            ///  Write error select
            pub const NVMCTRL_ERROR = enum(u3) {
                ///  No Error
                NOERROR = 0x0,
                ///  Write command not selected
                ILLEGALCMD = 0x1,
                ///  Write to section not allowed
                ILLEGALSADDR = 0x2,
                ///  Selecting new write command while write command already seleted
                DOUBLESELECT = 0x3,
                ///  Starting a new programming operation before previous is completed
                ONGOINGPROG = 0x4,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Command
                CMD: packed union {
                    raw: u7,
                    value: NVMCTRL_CMD,
                },
                padding: u1,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  Application Code Write Protect
                APPCODEWP: u1,
                ///  Boot Read Protect
                BOOTRP: u1,
                ///  Application Data Write Protect
                APPDATAWP: u1,
                reserved4: u1,
                ///  Flash Mapping in Data space
                FLMAP: packed union {
                    raw: u2,
                    value: NVMCTRL_FLMAP,
                },
                reserved7: u1,
                ///  Flash Mapping Lock
                FLMAPLOCK: u1,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  Flash busy
                FBUSY: u1,
                ///  EEPROM busy
                EEBUSY: u1,
                reserved4: u2,
                ///  Write error
                ERROR: packed union {
                    raw: u3,
                    value: NVMCTRL_ERROR,
                },
                padding: u1,
            }),
            ///  Interrupt Control
            INTCTRL: mmio.Mmio(packed struct(u8) {
                ///  EEPROM Ready
                EEREADY: u1,
                padding: u7,
            }),
            ///  Interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  EEPROM Ready
                EEREADY: u1,
                padding: u7,
            }),
            reserved6: [1]u8,
            ///  Data
            DATA: u16,
            ///  Address
            ADDR: u32,
        };

        ///  Operational Amplifier System
        pub const OPAMP = extern struct {
            ///  Output Mode select
            pub const OPAMP_OUTMODE = enum(u2) {
                ///  Output Driver Off
                OFF = 0x0,
                ///  Output Driver in Normal Mode
                NORMAL = 0x1,
                _,
            };

            ///  Negative Input Multiplexer select
            pub const OPAMP_MUXNEG = enum(u3) {
                ///  Negative input pin for OPn
                INN = 0x0,
                ///  Wiper from OPn's resistor ladder
                WIP = 0x1,
                ///  OPn output (unity gain)
                OUT = 0x2,
                ///  DAC output
                DAC = 0x3,
                _,
            };

            ///  Positive Input Multiplexer select
            pub const OPAMP_OP0_MUXPOS = enum(u3) {
                ///  Positive input pin for OPn
                INP = 0x0,
                ///  Wiper from OPn's resistor ladder
                WIP = 0x1,
                ///  DAC output
                DAC = 0x2,
                ///  Ground
                GND = 0x3,
                ///  VDD/2
                VDDDIV2 = 0x4,
                _,
            };

            ///  Positive Input Multiplexer select
            pub const OPAMP_OP1_MUXPOS = enum(u3) {
                ///  Positive input pin for OPn
                INP = 0x0,
                ///  Wiper from OPn's resistor ladder
                WIP = 0x1,
                ///  DAC output
                DAC = 0x2,
                ///  Ground
                GND = 0x3,
                ///  VDD/2
                VDDDIV2 = 0x4,
                ///  Output from OP0
                LINKOUT = 0x5,
                _,
            };

            ///  Multiplexer Bottom select
            pub const OPAMP_MUXBOT = enum(u3) {
                ///  Multiplexer off
                OFF = 0x0,
                ///  Positive input pin for OPn
                INP = 0x1,
                ///  Negative input pin for OPn
                INN = 0x2,
                ///  DAC output
                DAC = 0x3,
                ///  Link OP[n-1] output
                LINKOUT = 0x4,
                ///  Ground
                GND = 0x5,
                _,
            };

            ///  Multiplexer Top select
            pub const OPAMP_MUXTOP = enum(u2) {
                ///  Multiplexer off
                OFF = 0x0,
                ///  OPn output
                OUT = 0x1,
                ///  VDD
                VDD = 0x2,
                _,
            };

            ///  Multiplexer Wiper selector
            pub const OPAMP_MUXWIP = enum(u3) {
                ///  R1 = 15R, R2 = 1R, R2/R1 = 0.07
                WIP0 = 0x0,
                ///  R1 = 14R, R2 = 2R, R2/R1 = 0.14
                WIP1 = 0x1,
                ///  R1 = 12R, R2 = 4R, R2/R1 = 0.33
                WIP2 = 0x2,
                ///  R1 = 8R, R2 = 8R, R2/R1 = 1
                WIP3 = 0x3,
                ///  R1 = 6R, R2 = 10R, R2/R1 = 1.67
                WIP4 = 0x4,
                ///  R1 = 4R, R2 = 12R, R2/R1 = 3
                WIP5 = 0x5,
                ///  R1 = 2R, R2 = 14R, R2/R1 = 7
                WIP6 = 0x6,
                ///  R1 = 1R, R2 = 15R, R2/R1 = 15
                WIP7 = 0x7,
            };

            ///  Input Range Select
            pub const OPAMP_IRSEL = enum(u1) {
                ///  Full Input Range
                FULL = 0x0,
                ///  Reduced Input Range
                REDUCED = 0x1,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Op Amp System Enable
                ENABLE: u1,
                padding: u7,
            }),
            ///  Debug Control
            DBGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Run in Debug Mode
                DBGRUN: u1,
                padding: u7,
            }),
            ///  Timebase Value
            TIMEBASE: mmio.Mmio(packed struct(u8) {
                ///  Timebase Value
                TIMEBASE: u7,
                padding: u1,
            }),
            reserved15: [12]u8,
            ///  Power Control
            PWRCTRL: mmio.Mmio(packed struct(u8) {
                ///  Input Range Select
                IRSEL: packed union {
                    raw: u1,
                    value: OPAMP_IRSEL,
                },
                padding: u7,
            }),
            ///  Op Amp 0 Control A
            OP0CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Always On
                ALWAYSON: u1,
                ///  Enable Events
                EVENTEN: u1,
                ///  Output Mode
                OUTMODE: packed union {
                    raw: u2,
                    value: OPAMP_OUTMODE,
                },
                reserved7: u3,
                ///  Run in Standby Mode
                RUNSTBY: u1,
            }),
            ///  Op Amp 0 Status
            OP0STATUS: mmio.Mmio(packed struct(u8) {
                ///  Settled
                SETTLED: u1,
                padding: u7,
            }),
            ///  Op Amp 0 Resistor Ladder Multiplexer
            OP0RESMUX: mmio.Mmio(packed struct(u8) {
                ///  Multiplexer Top
                MUXTOP: packed union {
                    raw: u2,
                    value: OPAMP_MUXTOP,
                },
                ///  Multiplexer Bottom
                MUXBOT: packed union {
                    raw: u3,
                    value: OPAMP_MUXBOT,
                },
                ///  Multiplexer Wiper selector
                MUXWIP: packed union {
                    raw: u3,
                    value: OPAMP_MUXWIP,
                },
            }),
            ///  Op Amp 0 Input Multiplexer
            OP0INMUX: mmio.Mmio(packed struct(u8) {
                ///  Positive Input Multiplexer
                MUXPOS: packed union {
                    raw: u3,
                    value: OPAMP_OP0_MUXPOS,
                },
                reserved4: u1,
                ///  Negative Input Multiplexer
                MUXNEG: packed union {
                    raw: u3,
                    value: OPAMP_MUXNEG,
                },
                padding: u1,
            }),
            ///  Op Amp 0 Settle
            OP0SETTLE: mmio.Mmio(packed struct(u8) {
                ///  Settle Time
                SETTLE: u7,
                padding: u1,
            }),
            ///  Op Amp 0 Calibration
            OP0CAL: mmio.Mmio(packed struct(u8) {
                ///  Calibration (for input offset voltage)
                CAL: u8,
            }),
            reserved24: [2]u8,
            ///  Op Amp 1 Control A
            OP1CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Always On
                ALWAYSON: u1,
                ///  Enable Events
                EVENTEN: u1,
                ///  Output Mode
                OUTMODE: packed union {
                    raw: u2,
                    value: OPAMP_OUTMODE,
                },
                reserved7: u3,
                ///  Run in Standby Mode
                RUNSTBY: u1,
            }),
            ///  Op Amp 1 Status
            OP1STATUS: mmio.Mmio(packed struct(u8) {
                ///  Settled
                SETTLED: u1,
                padding: u7,
            }),
            ///  Op Amp 1 Resistor Ladder Multiplexer
            OP1RESMUX: mmio.Mmio(packed struct(u8) {
                ///  Multiplexer Top
                MUXTOP: packed union {
                    raw: u2,
                    value: OPAMP_MUXTOP,
                },
                ///  Multiplexer Bottom
                MUXBOT: packed union {
                    raw: u3,
                    value: OPAMP_MUXBOT,
                },
                ///  Multiplexer Wiper selector
                MUXWIP: packed union {
                    raw: u3,
                    value: OPAMP_MUXWIP,
                },
            }),
            ///  Op Amp 1 Input Multiplexer
            OP1INMUX: mmio.Mmio(packed struct(u8) {
                ///  Positive Input Multiplexer
                MUXPOS: packed union {
                    raw: u3,
                    value: OPAMP_OP1_MUXPOS,
                },
                reserved4: u1,
                ///  Negative Input Multiplexer
                MUXNEG: packed union {
                    raw: u3,
                    value: OPAMP_MUXNEG,
                },
                padding: u1,
            }),
            ///  Op Amp 1 Settle
            OP1SETTLE: mmio.Mmio(packed struct(u8) {
                ///  Settle Time
                SETTLE: u7,
                padding: u1,
            }),
            ///  Op Amp 1 Calibration
            OP1CAL: mmio.Mmio(packed struct(u8) {
                ///  Calibration (for input offset voltage)
                CAL: u8,
            }),
        };

        ///  I/O Ports
        pub const PORT = extern struct {
            ///  Input/Sense Configuration select
            pub const PORT_ISC = enum(u3) {
                ///  Interrupt disabled but input buffer enabled
                INTDISABLE = 0x0,
                ///  Sense Both Edges
                BOTHEDGES = 0x1,
                ///  Sense Rising Edge
                RISING = 0x2,
                ///  Sense Falling Edge
                FALLING = 0x3,
                ///  Digital Input Buffer disabled
                INPUT_DISABLE = 0x4,
                ///  Sense low Level
                LEVEL = 0x5,
                _,
            };

            ///  Data Direction
            DIR: u8,
            ///  Data Direction Set
            DIRSET: u8,
            ///  Data Direction Clear
            DIRCLR: u8,
            ///  Data Direction Toggle
            DIRTGL: u8,
            ///  Output Value
            OUT: u8,
            ///  Output Value Set
            OUTSET: u8,
            ///  Output Value Clear
            OUTCLR: u8,
            ///  Output Value Toggle
            OUTTGL: u8,
            ///  Input Value
            IN: u8,
            ///  Interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Pin Interrupt Flag
                INT: u8,
            }),
            ///  Port Control
            PORTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Slew Rate Limit Enable
                SRL: u1,
                padding: u7,
            }),
            ///  Pin Control Config
            PINCONFIG: mmio.Mmio(packed struct(u8) {
                ///  Input/Sense Configuration
                ISC: packed union {
                    raw: u3,
                    value: PORT_ISC,
                },
                ///  Pullup enable
                PULLUPEN: u1,
                reserved6: u2,
                ///  Input level select
                INLVL: u1,
                ///  Inverted I/O Enable
                INVEN: u1,
            }),
            ///  Pin Control Update
            PINCTRLUPD: mmio.Mmio(packed struct(u8) {
                ///  Pin control update mask
                PINCTRLUPD: u8,
            }),
            ///  Pin Control Set
            PINCTRLSET: mmio.Mmio(packed struct(u8) {
                ///  Pin control set mask
                PINCTRLSET: u8,
            }),
            ///  Pin Control Clear
            PINCTRLCLR: mmio.Mmio(packed struct(u8) {
                ///  Pin control clear mask
                PINCTRLCLR: u8,
            }),
            reserved16: [1]u8,
            ///  Pin 0 Control
            PIN0CTRL: mmio.Mmio(packed struct(u8) {
                ///  Input/Sense Configuration
                ISC: packed union {
                    raw: u3,
                    value: PORT_ISC,
                },
                ///  Pullup enable
                PULLUPEN: u1,
                reserved6: u2,
                ///  Input level select
                INLVL: u1,
                ///  Inverted I/O Enable
                INVEN: u1,
            }),
            ///  Pin 1 Control
            PIN1CTRL: mmio.Mmio(packed struct(u8) {
                ///  Input/Sense Configuration
                ISC: packed union {
                    raw: u3,
                    value: PORT_ISC,
                },
                ///  Pullup enable
                PULLUPEN: u1,
                reserved6: u2,
                ///  Input level select
                INLVL: u1,
                ///  Inverted I/O Enable
                INVEN: u1,
            }),
            ///  Pin 2 Control
            PIN2CTRL: mmio.Mmio(packed struct(u8) {
                ///  Input/Sense Configuration
                ISC: packed union {
                    raw: u3,
                    value: PORT_ISC,
                },
                ///  Pullup enable
                PULLUPEN: u1,
                reserved6: u2,
                ///  Input level select
                INLVL: u1,
                ///  Inverted I/O Enable
                INVEN: u1,
            }),
            ///  Pin 3 Control
            PIN3CTRL: mmio.Mmio(packed struct(u8) {
                ///  Input/Sense Configuration
                ISC: packed union {
                    raw: u3,
                    value: PORT_ISC,
                },
                ///  Pullup enable
                PULLUPEN: u1,
                reserved6: u2,
                ///  Input level select
                INLVL: u1,
                ///  Inverted I/O Enable
                INVEN: u1,
            }),
            ///  Pin 4 Control
            PIN4CTRL: mmio.Mmio(packed struct(u8) {
                ///  Input/Sense Configuration
                ISC: packed union {
                    raw: u3,
                    value: PORT_ISC,
                },
                ///  Pullup enable
                PULLUPEN: u1,
                reserved6: u2,
                ///  Input level select
                INLVL: u1,
                ///  Inverted I/O Enable
                INVEN: u1,
            }),
            ///  Pin 5 Control
            PIN5CTRL: mmio.Mmio(packed struct(u8) {
                ///  Input/Sense Configuration
                ISC: packed union {
                    raw: u3,
                    value: PORT_ISC,
                },
                ///  Pullup enable
                PULLUPEN: u1,
                reserved6: u2,
                ///  Input level select
                INLVL: u1,
                ///  Inverted I/O Enable
                INVEN: u1,
            }),
            ///  Pin 6 Control
            PIN6CTRL: mmio.Mmio(packed struct(u8) {
                ///  Input/Sense Configuration
                ISC: packed union {
                    raw: u3,
                    value: PORT_ISC,
                },
                ///  Pullup enable
                PULLUPEN: u1,
                reserved6: u2,
                ///  Input level select
                INLVL: u1,
                ///  Inverted I/O Enable
                INVEN: u1,
            }),
            ///  Pin 7 Control
            PIN7CTRL: mmio.Mmio(packed struct(u8) {
                ///  Input/Sense Configuration
                ISC: packed union {
                    raw: u3,
                    value: PORT_ISC,
                },
                ///  Pullup enable
                PULLUPEN: u1,
                reserved6: u2,
                ///  Input level select
                INLVL: u1,
                ///  Inverted I/O Enable
                INVEN: u1,
            }),
        };

        ///  Port Multiplexer
        pub const PORTMUX = extern struct {
            ///  Analog Comparator 0 Output select
            pub const PORTMUX_AC0 = enum(u1) {
                ///  OUT on PA7
                DEFAULT = 0x0,
                ///  OUT on PC6
                ALT1 = 0x1,
            };

            ///  Analog Comparator 1 Output select
            pub const PORTMUX_AC1 = enum(u1) {
                ///  OUT on PA7
                DEFAULT = 0x0,
                ///  OUT on PC6
                ALT1 = 0x1,
            };

            ///  Analog Comparator 2 Output select
            pub const PORTMUX_AC2 = enum(u1) {
                ///  OUT on PA7
                DEFAULT = 0x0,
                ///  OUT on PC6
                ALT1 = 0x1,
            };

            ///  CCL Look-Up Table 0 Signals select
            pub const PORTMUX_LUT0 = enum(u1) {
                ///  Out: PA3 In: PA0, PA1, PA2
                DEFAULT = 0x0,
                ///  Out: PA6 In: PA0, PA1, PA2
                ALT1 = 0x1,
            };

            ///  CCL Look-Up Table 1 Signals select
            pub const PORTMUX_LUT1 = enum(u1) {
                ///  Out: PC3 In: PC0, PC1, PC2
                DEFAULT = 0x0,
                ///  Out: PC6 In: PC0, PC1, PC2
                ALT1 = 0x1,
            };

            ///  CCL Look-Up Table 2 Signals select
            pub const PORTMUX_LUT2 = enum(u1) {
                ///  Out: PD3 In: PD0, PD1, PD2
                DEFAULT = 0x0,
                ///  Out: PD6 In: PD0, PD1, PD2
                ALT1 = 0x1,
            };

            ///  CCL Look-Up Table 3 Signals select
            pub const PORTMUX_LUT3 = enum(u1) {
                ///  Out: PF3 In: PF0, PF1, PF2
                DEFAULT = 0x0,
                _,
            };

            ///  Event Output A select
            pub const PORTMUX_EVOUTA = enum(u1) {
                ///  EVOUT on PA2
                DEFAULT = 0x0,
                ///  EVOUT on PA7
                ALT1 = 0x1,
            };

            ///  Event Output C select
            pub const PORTMUX_EVOUTC = enum(u1) {
                ///  EVOUT on PC2
                DEFAULT = 0x0,
                ///  EVOUT on PC7
                ALT1 = 0x1,
            };

            ///  Event Output D select
            pub const PORTMUX_EVOUTD = enum(u1) {
                ///  EVOUT on PD2
                DEFAULT = 0x0,
                ///  EVOUT on PD7
                ALT1 = 0x1,
            };

            ///  Event Output F select
            pub const PORTMUX_EVOUTF = enum(u1) {
                ///  EVOUT on PF2
                DEFAULT = 0x0,
                _,
            };

            ///  SPI0 Signals select
            pub const PORTMUX_SPI0 = enum(u2) {
                ///  PA4, PA5, PA6, PA7
                DEFAULT = 0x0,
                ///  PE0, PE1, PE2, PE3
                ALT1 = 0x1,
                ///  PG4, PG5, PG6, PG7
                ALT2 = 0x2,
                ///  Not connected to any pins
                NONE = 0x3,
            };

            ///  SPI1 Signals select
            pub const PORTMUX_SPI1 = enum(u2) {
                ///  PC0, PC1, PC2, PC3
                DEFAULT = 0x0,
                ///  PC4, PC5, PC6, PC7
                ALT1 = 0x1,
                ///  PB4, PB5, PB6, PB7
                ALT2 = 0x2,
                ///  Not connected to any pins
                NONE = 0x3,
            };

            ///  TCA0 Signals select
            pub const PORTMUX_TCA0 = enum(u3) {
                ///  PA0, PA1, PA2, PA3, PA4, PA5
                PORTA = 0x0,
                ///  PB0, PB1, PB2, PB3, PB4, PB5
                PORTB = 0x1,
                ///  PC0, PC1, PC2, PC3, PC4, PC5
                PORTC = 0x2,
                ///  PD0, PD1, PD2, PD3, PD4, PD5
                PORTD = 0x3,
                ///  PE0, PE1, PE2, PE3, PE4, PE5
                PORTE = 0x4,
                ///  PF0, PF1, PF2, PF3, PF4, PF5
                PORTF = 0x5,
                ///  PG0, PG1, PG2, PG3, PG4, PG5
                PORTG = 0x6,
                _,
            };

            ///  TCB0 Output select
            pub const PORTMUX_TCB0 = enum(u1) {
                ///  WO on PA2
                DEFAULT = 0x0,
                ///  WO on PF4
                ALT1 = 0x1,
            };

            ///  TCB1 Output select
            pub const PORTMUX_TCB1 = enum(u1) {
                ///  WO on PA3
                DEFAULT = 0x0,
                ///  WO on PF5
                ALT1 = 0x1,
            };

            ///  TCB2 Output select
            pub const PORTMUX_TCB2 = enum(u1) {
                ///  WO on PC0
                DEFAULT = 0x0,
                ///  WO on PB4
                ALT1 = 0x1,
            };

            ///  TCD0 Signals select
            pub const PORTMUX_TCD0 = enum(u3) {
                ///  PA4, PA5, PA6, PA7
                DEFAULT = 0x0,
                ///  PB4, PB5, PB6, PB7
                ALT1 = 0x1,
                ///  PF0, PF1, PF2, PF3
                ALT2 = 0x2,
                ///  PG4, PG5, PG6, PG7
                ALT3 = 0x3,
                _,
            };

            ///  TWI0 Signals select
            pub const PORTMUX_TWI0 = enum(u2) {
                ///  PA2, PA3, PC2, PC3
                DEFAULT = 0x0,
                ///  PA2, PA3, PC6, PC7
                ALT1 = 0x1,
                ///  PC2, PC3, PC6, PC7
                ALT2 = 0x2,
                _,
            };

            ///  USART0 Signals select
            pub const PORTMUX_USART0 = enum(u2) {
                ///  PA0, PA1, PA2, PA3
                DEFAULT = 0x0,
                ///  PA4, PA5, PA6, PA7
                ALT1 = 0x1,
                ///  Not connected to any pins
                NONE = 0x3,
                _,
            };

            ///  USART1 Signals select
            pub const PORTMUX_USART1 = enum(u2) {
                ///  PC0, PC1, PC2, PC3
                DEFAULT = 0x0,
                ///  PC4, PC5, PC6, PC7
                ALT1 = 0x1,
                ///  Not connected to any pins
                NONE = 0x3,
                _,
            };

            ///  USART2 Signals select
            pub const PORTMUX_USART2 = enum(u2) {
                ///  PF0, PF1, PF2, PF3
                DEFAULT = 0x0,
                ///  PF4, PF5
                ALT1 = 0x1,
                ///  Not connected to any pins
                NONE = 0x3,
                _,
            };

            ///  Zero Cross Detector 0 Output select
            pub const PORTMUX_ZCD0 = enum(u1) {
                ///  OUT on PA7
                DEFAULT = 0x0,
                ///  OUT on PC7
                ALT1 = 0x1,
            };

            ///  EVSYS route A
            EVSYSROUTEA: mmio.Mmio(packed struct(u8) {
                ///  Event Output A
                EVOUTA: packed union {
                    raw: u1,
                    value: PORTMUX_EVOUTA,
                },
                reserved2: u1,
                ///  Event Output C
                EVOUTC: packed union {
                    raw: u1,
                    value: PORTMUX_EVOUTC,
                },
                ///  Event Output D
                EVOUTD: packed union {
                    raw: u1,
                    value: PORTMUX_EVOUTD,
                },
                reserved5: u1,
                ///  Event Output F
                EVOUTF: packed union {
                    raw: u1,
                    value: PORTMUX_EVOUTF,
                },
                padding: u2,
            }),
            ///  CCL route A
            CCLROUTEA: mmio.Mmio(packed struct(u8) {
                ///  CCL Look-Up Table 0 Signals
                LUT0: packed union {
                    raw: u1,
                    value: PORTMUX_LUT0,
                },
                ///  CCL Look-Up Table 1 Signals
                LUT1: packed union {
                    raw: u1,
                    value: PORTMUX_LUT1,
                },
                ///  CCL Look-Up Table 2 Signals
                LUT2: packed union {
                    raw: u1,
                    value: PORTMUX_LUT2,
                },
                ///  CCL Look-Up Table 3 Signals
                LUT3: packed union {
                    raw: u1,
                    value: PORTMUX_LUT3,
                },
                padding: u4,
            }),
            ///  USART route A
            USARTROUTEA: mmio.Mmio(packed struct(u8) {
                ///  USART0 Signals
                USART0: packed union {
                    raw: u2,
                    value: PORTMUX_USART0,
                },
                ///  USART1 Signals
                USART1: packed union {
                    raw: u2,
                    value: PORTMUX_USART1,
                },
                ///  USART2 Signals
                USART2: packed union {
                    raw: u2,
                    value: PORTMUX_USART2,
                },
                padding: u2,
            }),
            reserved4: [1]u8,
            ///  SPI route A
            SPIROUTEA: mmio.Mmio(packed struct(u8) {
                ///  SPI0 Signals
                SPI0: packed union {
                    raw: u2,
                    value: PORTMUX_SPI0,
                },
                ///  SPI1 Signals
                SPI1: packed union {
                    raw: u2,
                    value: PORTMUX_SPI1,
                },
                padding: u4,
            }),
            ///  TWI route A
            TWIROUTEA: mmio.Mmio(packed struct(u8) {
                ///  TWI0 Signals
                TWI0: packed union {
                    raw: u2,
                    value: PORTMUX_TWI0,
                },
                padding: u6,
            }),
            ///  TCA route A
            TCAROUTEA: mmio.Mmio(packed struct(u8) {
                ///  TCA0 Signals
                TCA0: packed union {
                    raw: u3,
                    value: PORTMUX_TCA0,
                },
                padding: u5,
            }),
            ///  TCB route A
            TCBROUTEA: mmio.Mmio(packed struct(u8) {
                ///  TCB0 Output
                TCB0: packed union {
                    raw: u1,
                    value: PORTMUX_TCB0,
                },
                ///  TCB1 Output
                TCB1: packed union {
                    raw: u1,
                    value: PORTMUX_TCB1,
                },
                ///  TCB2 Output
                TCB2: packed union {
                    raw: u1,
                    value: PORTMUX_TCB2,
                },
                padding: u5,
            }),
            ///  TCD route A
            TCDROUTEA: mmio.Mmio(packed struct(u8) {
                ///  TCD0 Signals
                TCD0: packed union {
                    raw: u3,
                    value: PORTMUX_TCD0,
                },
                padding: u5,
            }),
            ///  AC route A
            ACROUTEA: mmio.Mmio(packed struct(u8) {
                ///  Analog Comparator 0 Output
                AC0: packed union {
                    raw: u1,
                    value: PORTMUX_AC0,
                },
                ///  Analog Comparator 1 Output
                AC1: packed union {
                    raw: u1,
                    value: PORTMUX_AC1,
                },
                ///  Analog Comparator 2 Output
                AC2: packed union {
                    raw: u1,
                    value: PORTMUX_AC2,
                },
                padding: u5,
            }),
            ///  ZCD route A
            ZCDROUTEA: mmio.Mmio(packed struct(u8) {
                ///  Zero Cross Detector 0 Output
                ZCD0: packed union {
                    raw: u1,
                    value: PORTMUX_ZCD0,
                },
                padding: u7,
            }),
        };

        ///  Reset controller
        pub const RSTCTRL = extern struct {
            ///  Reset Flags
            RSTFR: mmio.Mmio(packed struct(u8) {
                ///  Power on Reset flag
                PORF: u1,
                ///  Brown out detector Reset flag
                BORF: u1,
                ///  External Reset flag
                EXTRF: u1,
                ///  Watch dog Reset flag
                WDRF: u1,
                ///  Software Reset flag
                SWRF: u1,
                ///  UPDI Reset flag
                UPDIRF: u1,
                padding: u2,
            }),
            ///  Software Reset
            SWRR: mmio.Mmio(packed struct(u8) {
                ///  Software reset enable
                SWRST: u1,
                padding: u7,
            }),
        };

        ///  Real-Time Counter
        pub const RTC = extern struct {
            ///  Clock Select
            pub const RTC_CLKSEL = enum(u2) {
                ///  32.768 kHz from OSC32K
                OSC32K = 0x0,
                ///  1.024 kHz from OSC32K
                OSC1K = 0x1,
                ///  32.768 kHz from XOSC32K
                XOSC32K = 0x2,
                ///  External Clock
                EXTCLK = 0x3,
            };

            ///  Prescaling Factor select
            pub const RTC_PRESCALER = enum(u4) {
                ///  RTC Clock / 1
                DIV1 = 0x0,
                ///  RTC Clock / 2
                DIV2 = 0x1,
                ///  RTC Clock / 4
                DIV4 = 0x2,
                ///  RTC Clock / 8
                DIV8 = 0x3,
                ///  RTC Clock / 16
                DIV16 = 0x4,
                ///  RTC Clock / 32
                DIV32 = 0x5,
                ///  RTC Clock / 64
                DIV64 = 0x6,
                ///  RTC Clock / 128
                DIV128 = 0x7,
                ///  RTC Clock / 256
                DIV256 = 0x8,
                ///  RTC Clock / 512
                DIV512 = 0x9,
                ///  RTC Clock / 1024
                DIV1024 = 0xa,
                ///  RTC Clock / 2048
                DIV2048 = 0xb,
                ///  RTC Clock / 4096
                DIV4096 = 0xc,
                ///  RTC Clock / 8192
                DIV8192 = 0xd,
                ///  RTC Clock / 16384
                DIV16384 = 0xe,
                ///  RTC Clock / 32768
                DIV32768 = 0xf,
            };

            ///  Period select
            pub const RTC_PERIOD = enum(u4) {
                ///  Off
                OFF = 0x0,
                ///  RTC Clock Cycles 4
                CYC4 = 0x1,
                ///  RTC Clock Cycles 8
                CYC8 = 0x2,
                ///  RTC Clock Cycles 16
                CYC16 = 0x3,
                ///  RTC Clock Cycles 32
                CYC32 = 0x4,
                ///  RTC Clock Cycles 64
                CYC64 = 0x5,
                ///  RTC Clock Cycles 128
                CYC128 = 0x6,
                ///  RTC Clock Cycles 256
                CYC256 = 0x7,
                ///  RTC Clock Cycles 512
                CYC512 = 0x8,
                ///  RTC Clock Cycles 1024
                CYC1024 = 0x9,
                ///  RTC Clock Cycles 2048
                CYC2048 = 0xa,
                ///  RTC Clock Cycles 4096
                CYC4096 = 0xb,
                ///  RTC Clock Cycles 8192
                CYC8192 = 0xc,
                ///  RTC Clock Cycles 16384
                CYC16384 = 0xd,
                ///  RTC Clock Cycles 32768
                CYC32768 = 0xe,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable
                RTCEN: u1,
                reserved2: u1,
                ///  Correction enable
                CORREN: u1,
                ///  Prescaling Factor
                PRESCALER: packed union {
                    raw: u4,
                    value: RTC_PRESCALER,
                },
                ///  Run In Standby
                RUNSTDBY: u1,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  CTRLA Synchronization Busy Flag
                CTRLABUSY: u1,
                ///  Count Synchronization Busy Flag
                CNTBUSY: u1,
                ///  Period Synchronization Busy Flag
                PERBUSY: u1,
                ///  Comparator Synchronization Busy Flag
                CMPBUSY: u1,
                padding: u4,
            }),
            ///  Interrupt Control
            INTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Overflow Interrupt enable
                OVF: u1,
                ///  Compare Match Interrupt enable
                CMP: u1,
                padding: u6,
            }),
            ///  Interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Overflow Interrupt Flag
                OVF: u1,
                ///  Compare Match Interrupt
                CMP: u1,
                padding: u6,
            }),
            ///  Temporary
            TEMP: u8,
            ///  Debug control
            DBGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Run in debug
                DBGRUN: u1,
                padding: u7,
            }),
            ///  Calibration
            CALIB: mmio.Mmio(packed struct(u8) {
                ///  Error Correction Value
                ERROR: u7,
                ///  Error Correction Sign Bit
                SIGN: u1,
            }),
            ///  Clock Select
            CLKSEL: mmio.Mmio(packed struct(u8) {
                ///  Clock Select
                CLKSEL: packed union {
                    raw: u2,
                    value: RTC_CLKSEL,
                },
                padding: u6,
            }),
            ///  Counter
            CNT: u16,
            ///  Period
            PER: u16,
            ///  Compare
            CMP: u16,
            reserved16: [2]u8,
            ///  PIT Control A
            PITCTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable
                PITEN: u1,
                reserved3: u2,
                ///  Period
                PERIOD: packed union {
                    raw: u4,
                    value: RTC_PERIOD,
                },
                padding: u1,
            }),
            ///  PIT Status
            PITSTATUS: mmio.Mmio(packed struct(u8) {
                ///  CTRLA Synchronization Busy Flag
                CTRLBUSY: u1,
                padding: u7,
            }),
            ///  PIT Interrupt Control
            PITINTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Periodic Interrupt
                PI: u1,
                padding: u7,
            }),
            ///  PIT Interrupt Flags
            PITINTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Periodic Interrupt
                PI: u1,
                padding: u7,
            }),
            reserved21: [1]u8,
            ///  PIT Debug control
            PITDBGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Run in debug
                DBGRUN: u1,
                padding: u7,
            }),
        };

        ///  Signature row
        pub const SIGROW = extern struct {
            ///  Device ID Byte 0
            DEVICEID0: u8,
            ///  Device ID Byte 1
            DEVICEID1: u8,
            ///  Device ID Byte 2
            DEVICEID2: u8,
            reserved4: [1]u8,
            ///  Temperature Calibration 0
            TEMPSENSE0: mmio.Mmio(packed struct(u16) {
                ///  Temperature Calibration 0
                TEMPSENSE0: u16,
            }),
            ///  Temperature Calibration 1
            TEMPSENSE1: mmio.Mmio(packed struct(u16) {
                ///  Temperature Calibration 1
                TEMPSENSE1: u16,
            }),
            reserved16: [8]u8,
            ///  LOTNUM0
            SERNUM0: u8,
            ///  LOTNUM1
            SERNUM1: u8,
            ///  LOTNUM2
            SERNUM2: u8,
            ///  LOTNUM3
            SERNUM3: u8,
            ///  LOTNUM4
            SERNUM4: u8,
            ///  LOTNUM5
            SERNUM5: u8,
            ///  RANDOM
            SERNUM6: u8,
            ///  SCRIBE
            SERNUM7: u8,
            ///  XPOS0
            SERNUM8: u8,
            ///  XPOS1
            SERNUM9: u8,
            ///  YPOS0
            SERNUM10: u8,
            ///  YPOS1
            SERNUM11: u8,
            ///  RES0
            SERNUM12: u8,
            ///  RES1
            SERNUM13: u8,
            ///  RES2
            SERNUM14: u8,
            ///  RES3
            SERNUM15: u8,
        };

        ///  Sleep Controller
        pub const SLPCTRL = extern struct {
            ///  Sleep mode select
            pub const SLPCTRL_SMODE = enum(u2) {
                ///  Idle mode
                IDLE = 0x0,
                ///  Standby Mode
                STDBY = 0x1,
                ///  Power-down Mode
                PDOWN = 0x2,
                _,
            };

            ///  High Temperature Low Leakage Enable select
            pub const SLPCTRL_HTLLEN = enum(u1) {
                ///  Disabled
                OFF = 0x0,
                ///  Enabled
                ON = 0x1,
            };

            ///  Performance Mode select
            pub const SLPCTRL_PMODE = enum(u3) {
                AUTO = 0x0,
                FULL = 0x1,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Sleep enable
                SEN: u1,
                ///  Sleep mode
                SMODE: packed union {
                    raw: u2,
                    value: SLPCTRL_SMODE,
                },
                padding: u5,
            }),
            ///  Control B
            VREGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Performance Mode
                PMODE: packed union {
                    raw: u3,
                    value: SLPCTRL_PMODE,
                },
                reserved4: u1,
                ///  High Temperature Low Leakage Enable
                HTLLEN: packed union {
                    raw: u1,
                    value: SLPCTRL_HTLLEN,
                },
                padding: u3,
            }),
        };

        ///  Serial Peripheral Interface
        pub const SPI = extern struct {
            ///  Prescaler select
            pub const SPI_PRESC = enum(u2) {
                ///  System Clock / 4
                DIV4 = 0x0,
                ///  System Clock / 16
                DIV16 = 0x1,
                ///  System Clock / 64
                DIV64 = 0x2,
                ///  System Clock / 128
                DIV128 = 0x3,
            };

            ///  SPI Mode select
            pub const SPI_MODE = enum(u2) {
                ///  SPI Mode 0
                @"0" = 0x0,
                ///  SPI Mode 1
                @"1" = 0x1,
                ///  SPI Mode 2
                @"2" = 0x2,
                ///  SPI Mode 3
                @"3" = 0x3,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable Module
                ENABLE: u1,
                ///  Prescaler
                PRESC: packed union {
                    raw: u2,
                    value: SPI_PRESC,
                },
                reserved4: u1,
                ///  Enable Double Speed
                CLK2X: u1,
                ///  Host Operation Enable
                MASTER: u1,
                ///  Data Order Setting
                DORD: u1,
                padding: u1,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  SPI Mode
                MODE: packed union {
                    raw: u2,
                    value: SPI_MODE,
                },
                ///  SPI Select Disable
                SSD: u1,
                reserved6: u3,
                ///  Buffer Mode Wait for Receive
                BUFWR: u1,
                ///  Buffer Mode Enable
                BUFEN: u1,
            }),
            ///  Interrupt Control
            INTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Interrupt Enable
                IE: u1,
                reserved4: u3,
                ///  SPI Select Trigger Interrupt Enable
                SSIE: u1,
                ///  Data Register Empty Interrupt Enable
                DREIE: u1,
                ///  Transfer Complete Interrupt Enable
                TXCIE: u1,
                ///  Receive Complete Interrupt Enable
                RXCIE: u1,
            }),
            ///  Interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Buffer Overflow
                BUFOVF: u1,
                reserved4: u3,
                ///  SPI Select Trigger Interrupt Flag
                SSIF: u1,
                ///  Data Register Empty Interrupt Flag
                DREIF: u1,
                ///  Transfer Complete Interrupt Flag
                TXCIF: u1,
                ///  Receive Complete Interrupt Flag
                RXCIF: u1,
            }),
            ///  Data
            DATA: u8,
        };

        ///  System Configuration Registers
        pub const SYSCFG = extern struct {
            ///  Revision ID
            REVID: u8,
            reserved23: [22]u8,
            ///  OCD Message Control
            OCDMCTRL: u8,
            ///  OCD Message Status
            OCDMSTATUS: mmio.Mmio(packed struct(u8) {
                ///  OCD Message Read
                OCDMR: u1,
                padding: u7,
            }),
        };

        ///  16-bit Timer/Counter Type A
        pub const TCA = extern union {
            pub const Mode = enum {
                SINGLE,
                SPLIT,
            };

            pub fn get_mode(self: *volatile @This()) Mode {
                {
                    const value = self.SINGLE.CTRLD.read().SPLITM;
                    switch (value) {
                        0 => return .SINGLE,
                        else => {},
                    }
                }
                {
                    const value = self.SPLIT.CTRLD.read().SPLITM;
                    switch (value) {
                        1 => return .SPLIT,
                        else => {},
                    }
                }

                unreachable;
            }

            ///  Clock Selection
            pub const TCA_SINGLE_CLKSEL = enum(u3) {
                ///  System Clock
                DIV1 = 0x0,
                ///  System Clock / 2
                DIV2 = 0x1,
                ///  System Clock / 4
                DIV4 = 0x2,
                ///  System Clock / 8
                DIV8 = 0x3,
                ///  System Clock / 16
                DIV16 = 0x4,
                ///  System Clock / 64
                DIV64 = 0x5,
                ///  System Clock / 256
                DIV256 = 0x6,
                ///  System Clock / 1024
                DIV1024 = 0x7,
            };

            ///  Waveform generation mode select
            pub const TCA_SINGLE_WGMODE = enum(u3) {
                ///  Normal Mode
                NORMAL = 0x0,
                ///  Frequency Generation Mode
                FRQ = 0x1,
                ///  Single Slope PWM
                SINGLESLOPE = 0x3,
                ///  Dual Slope PWM, overflow on TOP
                DSTOP = 0x5,
                ///  Dual Slope PWM, overflow on TOP and BOTTOM
                DSBOTH = 0x6,
                ///  Dual Slope PWM, overflow on BOTTOM
                DSBOTTOM = 0x7,
                _,
            };

            ///  Command select
            pub const TCA_SINGLE_CMD = enum(u2) {
                ///  No Command
                NONE = 0x0,
                ///  Force Update
                UPDATE = 0x1,
                ///  Force Restart
                RESTART = 0x2,
                ///  Force Hard Reset
                RESET = 0x3,
            };

            ///  Direction select
            pub const TCA_SINGLE_DIR = enum(u1) {
                ///  Count up
                UP = 0x0,
                ///  Count down
                DOWN = 0x1,
            };

            ///  Event Action A select
            pub const TCA_SINGLE_EVACTA = enum(u3) {
                ///  Count on positive edge event
                CNT_POSEDGE = 0x0,
                ///  Count on any edge event
                CNT_ANYEDGE = 0x1,
                ///  Count on prescaled clock while event line is 1.
                CNT_HIGHLVL = 0x2,
                ///  Count on prescaled clock. Event controls count direction. Up-count when event line is 0, down-count when event line is 1.
                UPDOWN = 0x3,
                _,
            };

            ///  Event Action B select
            pub const TCA_SINGLE_EVACTB = enum(u3) {
                ///  No Action
                NONE = 0x0,
                ///  Count on prescaled clock. Event controls count direction. Up-count when event line is 0, down-count when event line is 1.
                UPDOWN = 0x3,
                ///  Restart counter at positive edge event
                RESTART_POSEDGE = 0x4,
                ///  Restart counter on any edge event
                RESTART_ANYEDGE = 0x5,
                ///  Restart counter while event line is 1.
                RESTART_HIGHLVL = 0x6,
                _,
            };

            ///  Clock Selection
            pub const TCA_SPLIT_CLKSEL = enum(u3) {
                ///  System Clock
                DIV1 = 0x0,
                ///  System Clock / 2
                DIV2 = 0x1,
                ///  System Clock / 4
                DIV4 = 0x2,
                ///  System Clock / 8
                DIV8 = 0x3,
                ///  System Clock / 16
                DIV16 = 0x4,
                ///  System Clock / 64
                DIV64 = 0x5,
                ///  System Clock / 256
                DIV256 = 0x6,
                ///  System Clock / 1024
                DIV1024 = 0x7,
            };

            ///  Command select
            pub const TCA_SPLIT_CMD = enum(u2) {
                ///  No Command
                NONE = 0x0,
                ///  Force Update
                UPDATE = 0x1,
                ///  Force Restart
                RESTART = 0x2,
                ///  Force Hard Reset
                RESET = 0x3,
            };

            ///  Command Enable select
            pub const TCA_SPLIT_CMDEN = enum(u2) {
                ///  None
                NONE = 0x0,
                ///  Both low byte and high byte counter
                BOTH = 0x3,
                _,
            };

            SINGLE: extern struct {
                ///  Control A
                CTRLA: mmio.Mmio(packed struct(u8) {
                    ///  Module Enable
                    ENABLE: u1,
                    ///  Clock Selection
                    CLKSEL: packed union {
                        raw: u3,
                        value: TCA_SINGLE_CLKSEL,
                    },
                    reserved7: u3,
                    ///  Run in Standby
                    RUNSTDBY: u1,
                }),
                ///  Control B
                CTRLB: mmio.Mmio(packed struct(u8) {
                    ///  Waveform generation mode
                    WGMODE: packed union {
                        raw: u3,
                        value: TCA_SINGLE_WGMODE,
                    },
                    ///  Auto Lock Update
                    ALUPD: u1,
                    ///  Compare 0 Enable
                    CMP0EN: u1,
                    ///  Compare 1 Enable
                    CMP1EN: u1,
                    ///  Compare 2 Enable
                    CMP2EN: u1,
                    padding: u1,
                }),
                ///  Control C
                CTRLC: mmio.Mmio(packed struct(u8) {
                    ///  Compare 0 Waveform Output Value
                    CMP0OV: u1,
                    ///  Compare 1 Waveform Output Value
                    CMP1OV: u1,
                    ///  Compare 2 Waveform Output Value
                    CMP2OV: u1,
                    padding: u5,
                }),
                ///  Control D
                CTRLD: mmio.Mmio(packed struct(u8) {
                    ///  Split Mode Enable
                    SPLITM: u1,
                    padding: u7,
                }),
                ///  Control E Clear
                CTRLECLR: mmio.Mmio(packed struct(u8) {
                    ///  Direction
                    DIR: u1,
                    ///  Lock Update
                    LUPD: u1,
                    ///  Command
                    CMD: packed union {
                        raw: u2,
                        value: TCA_SINGLE_CMD,
                    },
                    padding: u4,
                }),
                ///  Control E Set
                CTRLESET: mmio.Mmio(packed struct(u8) {
                    ///  Direction
                    DIR: packed union {
                        raw: u1,
                        value: TCA_SINGLE_DIR,
                    },
                    ///  Lock Update
                    LUPD: u1,
                    ///  Command
                    CMD: packed union {
                        raw: u2,
                        value: TCA_SINGLE_CMD,
                    },
                    padding: u4,
                }),
                ///  Control F Clear
                CTRLFCLR: mmio.Mmio(packed struct(u8) {
                    ///  Period Buffer Valid
                    PERBV: u1,
                    ///  Compare 0 Buffer Valid
                    CMP0BV: u1,
                    ///  Compare 1 Buffer Valid
                    CMP1BV: u1,
                    ///  Compare 2 Buffer Valid
                    CMP2BV: u1,
                    padding: u4,
                }),
                ///  Control F Set
                CTRLFSET: mmio.Mmio(packed struct(u8) {
                    ///  Period Buffer Valid
                    PERBV: u1,
                    ///  Compare 0 Buffer Valid
                    CMP0BV: u1,
                    ///  Compare 1 Buffer Valid
                    CMP1BV: u1,
                    ///  Compare 2 Buffer Valid
                    CMP2BV: u1,
                    padding: u4,
                }),
                reserved9: [1]u8,
                ///  Event Control
                EVCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Count on Event Input A
                    CNTAEI: u1,
                    ///  Event Action A
                    EVACTA: packed union {
                        raw: u3,
                        value: TCA_SINGLE_EVACTA,
                    },
                    ///  Count on Event Input B
                    CNTBEI: u1,
                    ///  Event Action B
                    EVACTB: packed union {
                        raw: u3,
                        value: TCA_SINGLE_EVACTB,
                    },
                }),
                ///  Interrupt Control
                INTCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Overflow Interrupt
                    OVF: u1,
                    reserved4: u3,
                    ///  Compare 0 Interrupt
                    CMP0: u1,
                    ///  Compare 1 Interrupt
                    CMP1: u1,
                    ///  Compare 2 Interrupt
                    CMP2: u1,
                    padding: u1,
                }),
                ///  Interrupt Flags
                INTFLAGS: mmio.Mmio(packed struct(u8) {
                    ///  Overflow Interrupt
                    OVF: u1,
                    reserved4: u3,
                    ///  Compare 0 Interrupt
                    CMP0: u1,
                    ///  Compare 1 Interrupt
                    CMP1: u1,
                    ///  Compare 2 Interrupt
                    CMP2: u1,
                    padding: u1,
                }),
                reserved14: [2]u8,
                ///  Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Run
                    DBGRUN: u1,
                    padding: u7,
                }),
                ///  Temporary data for 16-bit Access
                TEMP: u8,
                reserved32: [16]u8,
                ///  Count
                CNT: u16,
                reserved38: [4]u8,
                ///  Period
                PER: u16,
                ///  Compare 0
                CMP0: u16,
                ///  Compare 1
                CMP1: u16,
                ///  Compare 2
                CMP2: u16,
                reserved54: [8]u8,
                ///  Period Buffer
                PERBUF: u16,
                ///  Compare 0 Buffer
                CMP0BUF: u16,
                ///  Compare 1 Buffer
                CMP1BUF: u16,
                ///  Compare 2 Buffer
                CMP2BUF: u16,
            },
            SPLIT: extern struct {
                ///  Control A
                CTRLA: mmio.Mmio(packed struct(u8) {
                    ///  Module Enable
                    ENABLE: u1,
                    ///  Clock Selection
                    CLKSEL: packed union {
                        raw: u3,
                        value: TCA_SPLIT_CLKSEL,
                    },
                    reserved7: u3,
                    ///  Run in Standby
                    RUNSTDBY: u1,
                }),
                ///  Control B
                CTRLB: mmio.Mmio(packed struct(u8) {
                    ///  Low Compare 0 Enable
                    LCMP0EN: u1,
                    ///  Low Compare 1 Enable
                    LCMP1EN: u1,
                    ///  Low Compare 2 Enable
                    LCMP2EN: u1,
                    reserved4: u1,
                    ///  High Compare 0 Enable
                    HCMP0EN: u1,
                    ///  High Compare 1 Enable
                    HCMP1EN: u1,
                    ///  High Compare 2 Enable
                    HCMP2EN: u1,
                    padding: u1,
                }),
                ///  Control C
                CTRLC: mmio.Mmio(packed struct(u8) {
                    ///  Low Compare 0 Output Value
                    LCMP0OV: u1,
                    ///  Low Compare 1 Output Value
                    LCMP1OV: u1,
                    ///  Low Compare 2 Output Value
                    LCMP2OV: u1,
                    reserved4: u1,
                    ///  High Compare 0 Output Value
                    HCMP0OV: u1,
                    ///  High Compare 1 Output Value
                    HCMP1OV: u1,
                    ///  High Compare 2 Output Value
                    HCMP2OV: u1,
                    padding: u1,
                }),
                ///  Control D
                CTRLD: mmio.Mmio(packed struct(u8) {
                    ///  Split Mode Enable
                    SPLITM: u1,
                    padding: u7,
                }),
                ///  Control E Clear
                CTRLECLR: mmio.Mmio(packed struct(u8) {
                    ///  Command Enable
                    CMDEN: packed union {
                        raw: u2,
                        value: TCA_SPLIT_CMDEN,
                    },
                    ///  Command
                    CMD: packed union {
                        raw: u2,
                        value: TCA_SPLIT_CMD,
                    },
                    padding: u4,
                }),
                ///  Control E Set
                CTRLESET: mmio.Mmio(packed struct(u8) {
                    ///  Command Enable
                    CMDEN: packed union {
                        raw: u2,
                        value: TCA_SPLIT_CMDEN,
                    },
                    ///  Command
                    CMD: packed union {
                        raw: u2,
                        value: TCA_SPLIT_CMD,
                    },
                    padding: u4,
                }),
                reserved10: [4]u8,
                ///  Interrupt Control
                INTCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Low Underflow Interrupt Enable
                    LUNF: u1,
                    ///  High Underflow Interrupt Enable
                    HUNF: u1,
                    reserved4: u2,
                    ///  Low Compare 0 Interrupt Enable
                    LCMP0: u1,
                    ///  Low Compare 1 Interrupt Enable
                    LCMP1: u1,
                    ///  Low Compare 2 Interrupt Enable
                    LCMP2: u1,
                    padding: u1,
                }),
                ///  Interrupt Flags
                INTFLAGS: mmio.Mmio(packed struct(u8) {
                    ///  Low Underflow Interrupt Flag
                    LUNF: u1,
                    ///  High Underflow Interrupt Flag
                    HUNF: u1,
                    reserved4: u2,
                    ///  Low Compare 2 Interrupt Flag
                    LCMP0: u1,
                    ///  Low Compare 1 Interrupt Flag
                    LCMP1: u1,
                    ///  Low Compare 0 Interrupt Flag
                    LCMP2: u1,
                    padding: u1,
                }),
                reserved14: [2]u8,
                ///  Debug Control
                DBGCTRL: mmio.Mmio(packed struct(u8) {
                    ///  Debug Run
                    DBGRUN: u1,
                    padding: u7,
                }),
                reserved32: [17]u8,
                ///  Low Count
                LCNT: u8,
                ///  High Count
                HCNT: u8,
                reserved38: [4]u8,
                ///  Low Period
                LPER: u8,
                ///  High Period
                HPER: u8,
                ///  Low Compare
                LCMP0: u8,
                ///  High Compare
                HCMP0: u8,
                ///  Low Compare
                LCMP1: u8,
                ///  High Compare
                HCMP1: u8,
                ///  Low Compare
                LCMP2: u8,
                ///  High Compare
                HCMP2: u8,
            },
        };

        ///  16-bit Timer Type B
        pub const TCB = extern struct {
            ///  Clock Select
            pub const TCB_CLKSEL = enum(u3) {
                ///  CLK_PER
                DIV1 = 0x0,
                ///  CLK_PER/2
                DIV2 = 0x1,
                ///  Use CLK_TCA from TCA0
                TCA0 = 0x2,
                ///  Count on event edge
                EVENT = 0x7,
                _,
            };

            ///  Timer Mode select
            pub const TCB_CNTMODE = enum(u3) {
                ///  Periodic Interrupt
                INT = 0x0,
                ///  Periodic Timeout
                TIMEOUT = 0x1,
                ///  Input Capture Event
                CAPT = 0x2,
                ///  Input Capture Frequency measurement
                FRQ = 0x3,
                ///  Input Capture Pulse-Width measurement
                PW = 0x4,
                ///  Input Capture Frequency and Pulse-Width measurement
                FRQPW = 0x5,
                ///  Single Shot
                SINGLE = 0x6,
                ///  8-bit PWM
                PWM8 = 0x7,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable
                ENABLE: u1,
                ///  Clock Select
                CLKSEL: packed union {
                    raw: u3,
                    value: TCB_CLKSEL,
                },
                ///  Synchronize Update
                SYNCUPD: u1,
                ///  Cascade two timers
                CASCADE: u1,
                ///  Run Standby
                RUNSTDBY: u1,
                padding: u1,
            }),
            ///  Control Register B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  Timer Mode
                CNTMODE: packed union {
                    raw: u3,
                    value: TCB_CNTMODE,
                },
                reserved4: u1,
                ///  Pin Output Enable
                CCMPEN: u1,
                ///  Pin Initial State
                CCMPINIT: u1,
                ///  Asynchronous Enable
                ASYNC: u1,
                padding: u1,
            }),
            reserved4: [2]u8,
            ///  Event Control
            EVCTRL: mmio.Mmio(packed struct(u8) {
                ///  Event Input Enable
                CAPTEI: u1,
                reserved4: u3,
                ///  Event Edge
                EDGE: u1,
                reserved6: u1,
                ///  Input Capture Noise Cancellation Filter
                FILTER: u1,
                padding: u1,
            }),
            ///  Interrupt Control
            INTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Capture or Timeout
                CAPT: u1,
                ///  Overflow
                OVF: u1,
                padding: u6,
            }),
            ///  Interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Capture or Timeout
                CAPT: u1,
                ///  Overflow
                OVF: u1,
                padding: u6,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  Run
                RUN: u1,
                padding: u7,
            }),
            ///  Debug Control
            DBGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Debug Run
                DBGRUN: u1,
                padding: u7,
            }),
            ///  Temporary Value
            TEMP: u8,
            ///  Count
            CNT: u16,
            ///  Compare or Capture
            CCMP: u16,
        };

        ///  Timer Counter D
        pub const TCD = extern struct {
            ///  Clock select
            pub const TCD_CLKSEL = enum(u2) {
                ///  Internal High-Frequency oscillator
                OSCHF = 0x0,
                ///  PLL
                PLL = 0x1,
                ///  External Clock
                EXTCLK = 0x2,
                ///  Peripheral clock
                CLKPER = 0x3,
            };

            ///  Counter prescaler select
            pub const TCD_CNTPRES = enum(u2) {
                ///  Sync clock divided by 1
                DIV1 = 0x0,
                ///  Sync clock divided by 4
                DIV4 = 0x1,
                ///  Sync clock divided by 32
                DIV32 = 0x2,
                _,
            };

            ///  Synchronization prescaler select
            pub const TCD_SYNCPRES = enum(u2) {
                ///  Selected clock source divided by 1
                DIV1 = 0x0,
                ///  Selected clock source divided by 2
                DIV2 = 0x1,
                ///  Selected clock source divided by 4
                DIV4 = 0x2,
                ///  Selected clock source divided by 8
                DIV8 = 0x3,
            };

            ///  Waveform generation mode select
            pub const TCD_WGMODE = enum(u2) {
                ///  One ramp mode
                ONERAMP = 0x0,
                ///  Two ramp mode
                TWORAMP = 0x1,
                ///  Four ramp mode
                FOURRAMP = 0x2,
                ///  Dual slope mode
                DS = 0x3,
            };

            ///  Compare C output select
            pub const TCD_CMPCSEL = enum(u1) {
                ///  PWM A output
                PWMA = 0x0,
                ///  PWM B output
                PWMB = 0x1,
            };

            ///  Compare D output select
            pub const TCD_CMPDSEL = enum(u1) {
                ///  PWM A output
                PWMA = 0x0,
                ///  PWM B output
                PWMB = 0x1,
            };

            ///  Dither select
            pub const TCD_DITHERSEL = enum(u2) {
                ///  On-time ramp B
                ONTIMEB = 0x0,
                ///  On-time ramp A and B
                ONTIMEAB = 0x1,
                ///  Dead-time rampB
                DEADTIMEB = 0x2,
                ///  Dead-time ramp A and B
                DEADTIMEAB = 0x3,
            };

            ///  Delay prescaler select
            pub const TCD_DLYPRESC = enum(u2) {
                ///  No prescaling
                DIV1 = 0x0,
                ///  Prescale with 2
                DIV2 = 0x1,
                ///  Prescale with 4
                DIV4 = 0x2,
                ///  Prescale with 8
                DIV8 = 0x3,
            };

            ///  Delay select
            pub const TCD_DLYSEL = enum(u2) {
                ///  No delay
                OFF = 0x0,
                ///  Input blanking enabled
                INBLANK = 0x1,
                ///  Event delay enabled
                EVENT = 0x2,
                _,
            };

            ///  Delay trigger select
            pub const TCD_DLYTRIG = enum(u2) {
                ///  Compare A set
                CMPASET = 0x0,
                ///  Compare A clear
                CMPACLR = 0x1,
                ///  Compare B set
                CMPBSET = 0x2,
                ///  Compare B clear
                CMPBCLR = 0x3,
            };

            ///  Event action select
            pub const TCD_ACTION = enum(u1) {
                ///  Event trigger a fault
                FAULT = 0x0,
                ///  Event trigger a fault and capture
                CAPTURE = 0x1,
            };

            ///  Event config select
            pub const TCD_CFG = enum(u2) {
                ///  Neither Filter nor Asynchronous Event is enabled
                NEITHER = 0x0,
                ///  Input Capture Noise Cancellation Filter enabled
                FILTER = 0x1,
                ///  Asynchronous Event output qualification enabled
                ASYNC = 0x2,
                _,
            };

            ///  Edge select
            pub const TCD_EDGE = enum(u1) {
                ///  The falling edge or low level of event generates retrigger or fault action
                FALL_LOW = 0x0,
                ///  The rising edge or high level of event generates retrigger or fault action
                RISE_HIGH = 0x1,
            };

            ///  Input mode select
            pub const TCD_INPUTMODE = enum(u4) {
                ///  Input has no actions
                NONE = 0x0,
                ///  Stop output, jump to opposite compare cycle and wait
                JMPWAIT = 0x1,
                ///  Stop output, execute opposite compare cycle and wait
                EXECWAIT = 0x2,
                ///  stop output, execute opposite compare cycle while fault active
                EXECFAULT = 0x3,
                ///  Stop all outputs, maintain frequency
                FREQ = 0x4,
                ///  Stop all outputs, execute dead time while fault active
                EXECDT = 0x5,
                ///  Stop all outputs, jump to next compare cycle and wait
                WAIT = 0x6,
                ///  Stop all outputs, wait for software action
                WAITSW = 0x7,
                ///  Stop output on edge, jump to next compare cycle
                EDGETRIG = 0x8,
                ///  Stop output on edge, maintain frequency
                EDGETRIGFREQ = 0x9,
                ///  Stop output at level, maintain frequency
                LVLTRIGFREQ = 0xa,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable
                ENABLE: u1,
                ///  Synchronization prescaler
                SYNCPRES: packed union {
                    raw: u2,
                    value: TCD_SYNCPRES,
                },
                ///  Counter prescaler
                CNTPRES: packed union {
                    raw: u2,
                    value: TCD_CNTPRES,
                },
                ///  Clock select
                CLKSEL: packed union {
                    raw: u2,
                    value: TCD_CLKSEL,
                },
                padding: u1,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  Waveform generation mode
                WGMODE: packed union {
                    raw: u2,
                    value: TCD_WGMODE,
                },
                padding: u6,
            }),
            ///  Control C
            CTRLC: mmio.Mmio(packed struct(u8) {
                ///  Compare output value override
                CMPOVR: u1,
                ///  Auto update
                AUPDATE: u1,
                reserved3: u1,
                ///  Fifty percent waveform
                FIFTY: u1,
                reserved6: u2,
                ///  Compare C output select
                CMPCSEL: packed union {
                    raw: u1,
                    value: TCD_CMPCSEL,
                },
                ///  Compare D output select
                CMPDSEL: packed union {
                    raw: u1,
                    value: TCD_CMPDSEL,
                },
            }),
            ///  Control D
            CTRLD: mmio.Mmio(packed struct(u8) {
                ///  Compare A value
                CMPAVAL: u4,
                ///  Compare B value
                CMPBVAL: u4,
            }),
            ///  Control E
            CTRLE: mmio.Mmio(packed struct(u8) {
                ///  Synchronize end of cycle strobe
                SYNCEOC: u1,
                ///  synchronize strobe
                SYNC: u1,
                ///  Restart strobe
                RESTART: u1,
                ///  Software Capture A Strobe
                SCAPTUREA: u1,
                ///  Software Capture B Strobe
                SCAPTUREB: u1,
                reserved7: u2,
                ///  Disable at end of cycle
                DISEOC: u1,
            }),
            reserved8: [3]u8,
            ///  EVCTRLA
            EVCTRLA: mmio.Mmio(packed struct(u8) {
                ///  Trigger event enable
                TRIGEI: u1,
                reserved2: u1,
                ///  Event action
                ACTION: packed union {
                    raw: u1,
                    value: TCD_ACTION,
                },
                reserved4: u1,
                ///  Edge select
                EDGE: packed union {
                    raw: u1,
                    value: TCD_EDGE,
                },
                reserved6: u1,
                ///  Event config
                CFG: packed union {
                    raw: u2,
                    value: TCD_CFG,
                },
            }),
            ///  EVCTRLB
            EVCTRLB: mmio.Mmio(packed struct(u8) {
                ///  Trigger event enable
                TRIGEI: u1,
                reserved2: u1,
                ///  Event action
                ACTION: packed union {
                    raw: u1,
                    value: TCD_ACTION,
                },
                reserved4: u1,
                ///  Edge select
                EDGE: packed union {
                    raw: u1,
                    value: TCD_EDGE,
                },
                reserved6: u1,
                ///  Event config
                CFG: packed union {
                    raw: u2,
                    value: TCD_CFG,
                },
            }),
            reserved12: [2]u8,
            ///  Interrupt Control
            INTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Overflow interrupt enable
                OVF: u1,
                reserved2: u1,
                ///  Trigger A interrupt enable
                TRIGA: u1,
                ///  Trigger B interrupt enable
                TRIGB: u1,
                padding: u4,
            }),
            ///  Interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Overflow interrupt enable
                OVF: u1,
                reserved2: u1,
                ///  Trigger A interrupt enable
                TRIGA: u1,
                ///  Trigger B interrupt enable
                TRIGB: u1,
                padding: u4,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  Enable ready
                ENRDY: u1,
                ///  Command ready
                CMDRDY: u1,
                reserved6: u4,
                ///  PWM activity on A
                PWMACTA: u1,
                ///  PWM activity on B
                PWMACTB: u1,
            }),
            reserved16: [1]u8,
            ///  Input Control A
            INPUTCTRLA: mmio.Mmio(packed struct(u8) {
                ///  Input mode
                INPUTMODE: packed union {
                    raw: u4,
                    value: TCD_INPUTMODE,
                },
                padding: u4,
            }),
            ///  Input Control B
            INPUTCTRLB: mmio.Mmio(packed struct(u8) {
                ///  Input mode
                INPUTMODE: packed union {
                    raw: u4,
                    value: TCD_INPUTMODE,
                },
                padding: u4,
            }),
            ///  Fault Control
            FAULTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Compare A value
                CMPA: u1,
                ///  Compare B value
                CMPB: u1,
                ///  Compare C value
                CMPC: u1,
                ///  Compare D vaule
                CMPD: u1,
                ///  Compare A enable
                CMPAEN: u1,
                ///  Compare B enable
                CMPBEN: u1,
                ///  Compare C enable
                CMPCEN: u1,
                ///  Compare D enable
                CMPDEN: u1,
            }),
            reserved20: [1]u8,
            ///  Delay Control
            DLYCTRL: mmio.Mmio(packed struct(u8) {
                ///  Delay select
                DLYSEL: packed union {
                    raw: u2,
                    value: TCD_DLYSEL,
                },
                ///  Delay trigger
                DLYTRIG: packed union {
                    raw: u2,
                    value: TCD_DLYTRIG,
                },
                ///  Delay prescaler
                DLYPRESC: packed union {
                    raw: u2,
                    value: TCD_DLYPRESC,
                },
                padding: u2,
            }),
            ///  Delay value
            DLYVAL: mmio.Mmio(packed struct(u8) {
                ///  Delay value
                DLYVAL: u8,
            }),
            reserved24: [2]u8,
            ///  Dither Control A
            DITCTRL: mmio.Mmio(packed struct(u8) {
                ///  Dither select
                DITHERSEL: packed union {
                    raw: u2,
                    value: TCD_DITHERSEL,
                },
                padding: u6,
            }),
            ///  Dither value
            DITVAL: mmio.Mmio(packed struct(u8) {
                ///  Dither value
                DITHER: u4,
                padding: u4,
            }),
            reserved30: [4]u8,
            ///  Debug Control
            DBGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Debug run
                DBGRUN: u1,
                reserved2: u1,
                ///  Fault detection
                FAULTDET: u1,
                padding: u5,
            }),
            reserved34: [3]u8,
            ///  Capture A
            CAPTUREA: u16,
            ///  Capture B
            CAPTUREB: u16,
            reserved40: [2]u8,
            ///  Compare A Set
            CMPASET: u16,
            ///  Compare A Clear
            CMPACLR: u16,
            ///  Compare B Set
            CMPBSET: u16,
            ///  Compare B Clear
            CMPBCLR: u16,
        };

        ///  Two-Wire Interface
        pub const TWI = extern struct {
            ///  FM Plus Enable select
            pub const TWI_FMPEN = enum(u1) {
                ///  Operating in Standard-mode or Fast-mode
                OFF = 0x0,
                ///  Operating in Fast-mode Plus
                ON = 0x1,
            };

            ///  Input Voltage Transition Level select
            pub const TWI_INPUTLVL = enum(u1) {
                ///  I2C input voltage transition level
                I2C = 0x0,
                ///  SMBus 3.0 input voltage transition level
                SMBUS = 0x1,
            };

            ///  SDA Hold Time select
            pub const TWI_SDAHOLD = enum(u2) {
                ///  SDA hold time off
                OFF = 0x0,
                ///  Typical 50ns hold time
                @"50NS" = 0x1,
                ///  Typical 300ns hold time
                @"300NS" = 0x2,
                ///  Typical 500ns hold time
                @"500NS" = 0x3,
            };

            ///  SDA Setup Time select
            pub const TWI_SDASETUP = enum(u1) {
                ///  SDA setup time is 4 clock cycles
                @"4CYC" = 0x0,
                ///  SDA setup time is 8 clock cycles
                @"8CYC" = 0x1,
            };

            ///  Inactive Bus Timeout select
            pub const TWI_TIMEOUT = enum(u2) {
                ///  Bus Timeout Disabled
                DISABLED = 0x0,
                ///  50 Microseconds
                @"50US" = 0x1,
                ///  100 Microseconds
                @"100US" = 0x2,
                ///  200 Microseconds
                @"200US" = 0x3,
            };

            ///  Acknowledge Action select
            pub const TWI_ACKACT = enum(u1) {
                ///  Send ACK
                ACK = 0x0,
                ///  Send NACK
                NACK = 0x1,
            };

            ///  Command select
            pub const TWI_MCMD = enum(u2) {
                ///  No Action
                NOACT = 0x0,
                ///  Issue Repeated Start Condition
                REPSTART = 0x1,
                ///  Receive or Transmit Data, depending on DIR
                RECVTRANS = 0x2,
                ///  Issue Stop Condition
                STOP = 0x3,
            };

            ///  Bus State select
            pub const TWI_BUSSTATE = enum(u2) {
                ///  Unknown Bus State
                UNKNOWN = 0x0,
                ///  Bus is Idle
                IDLE = 0x1,
                ///  This Module Controls The Bus
                OWNER = 0x2,
                ///  The Bus is Busy
                BUSY = 0x3,
            };

            ///  Command select
            pub const TWI_SCMD = enum(u2) {
                ///  No Action
                NOACT = 0x0,
                ///  Used To Complete a Transaction
                COMPTRANS = 0x2,
                ///  Used in Response to Address/Data Interrupt
                RESPONSE = 0x3,
                _,
            };

            ///  Client Address or Stop select
            pub const TWI_AP = enum(u1) {
                ///  Stop condition generated APIF
                STOP = 0x0,
                ///  Address detection generated APIF
                ADR = 0x1,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                reserved1: u1,
                ///  FM Plus Enable
                FMPEN: packed union {
                    raw: u1,
                    value: TWI_FMPEN,
                },
                ///  SDA Hold Time
                SDAHOLD: packed union {
                    raw: u2,
                    value: TWI_SDAHOLD,
                },
                ///  SDA Setup Time
                SDASETUP: packed union {
                    raw: u1,
                    value: TWI_SDASETUP,
                },
                reserved6: u1,
                ///  Input Voltage Transition Level
                INPUTLVL: packed union {
                    raw: u1,
                    value: TWI_INPUTLVL,
                },
                padding: u1,
            }),
            ///  Dual Control
            DUALCTRL: mmio.Mmio(packed struct(u8) {
                ///  Dual Control Enable
                ENABLE: u1,
                ///  FM Plus Enable
                FMPEN: u1,
                ///  SDA Hold Time
                SDAHOLD: packed union {
                    raw: u2,
                    value: TWI_SDAHOLD,
                },
                reserved6: u2,
                ///  Input Voltage Transition Level
                INPUTLVL: packed union {
                    raw: u1,
                    value: TWI_INPUTLVL,
                },
                padding: u1,
            }),
            ///  Debug Control Register
            DBGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Debug Run
                DBGRUN: u1,
                padding: u7,
            }),
            ///  Host Control A
            MCTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable TWI Host
                ENABLE: u1,
                ///  Smart Mode Enable
                SMEN: u1,
                ///  Inactive Bus Timeout
                TIMEOUT: packed union {
                    raw: u2,
                    value: TWI_TIMEOUT,
                },
                ///  Quick Command Enable
                QCEN: u1,
                reserved6: u1,
                ///  Write Interrupt Enable
                WIEN: u1,
                ///  Read Interrupt Enable
                RIEN: u1,
            }),
            ///  Host Control B
            MCTRLB: mmio.Mmio(packed struct(u8) {
                ///  Command
                MCMD: packed union {
                    raw: u2,
                    value: TWI_MCMD,
                },
                ///  Acknowledge Action
                ACKACT: packed union {
                    raw: u1,
                    value: TWI_ACKACT,
                },
                ///  Flush
                FLUSH: u1,
                padding: u4,
            }),
            ///  Host Status
            MSTATUS: mmio.Mmio(packed struct(u8) {
                ///  Bus State
                BUSSTATE: packed union {
                    raw: u2,
                    value: TWI_BUSSTATE,
                },
                ///  Bus Error
                BUSERR: u1,
                ///  Arbitration Lost
                ARBLOST: u1,
                ///  Received Acknowledge
                RXACK: u1,
                ///  Clock Hold
                CLKHOLD: u1,
                ///  Write Interrupt Flag
                WIF: u1,
                ///  Read Interrupt Flag
                RIF: u1,
            }),
            ///  Host Baud Rate Control
            MBAUD: u8,
            ///  Host Address
            MADDR: u8,
            ///  Host Data
            MDATA: u8,
            ///  Client Control A
            SCTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable TWI Client
                ENABLE: u1,
                ///  Smart Mode Enable
                SMEN: u1,
                ///  Promiscuous Mode Enable
                PMEN: u1,
                reserved5: u2,
                ///  Stop Interrupt Enable
                PIEN: u1,
                ///  Address/Stop Interrupt Enable
                APIEN: u1,
                ///  Data Interrupt Enable
                DIEN: u1,
            }),
            ///  Client Control B
            SCTRLB: mmio.Mmio(packed struct(u8) {
                ///  Command
                SCMD: packed union {
                    raw: u2,
                    value: TWI_SCMD,
                },
                ///  Acknowledge Action
                ACKACT: packed union {
                    raw: u1,
                    value: TWI_ACKACT,
                },
                padding: u5,
            }),
            ///  Client Status
            SSTATUS: mmio.Mmio(packed struct(u8) {
                ///  Client Address or Stop
                AP: packed union {
                    raw: u1,
                    value: TWI_AP,
                },
                ///  Read/Write Direction
                DIR: u1,
                ///  Bus Error
                BUSERR: u1,
                ///  Collision
                COLL: u1,
                ///  Received Acknowledge
                RXACK: u1,
                ///  Clock Hold
                CLKHOLD: u1,
                ///  Address/Stop Interrupt Flag
                APIF: u1,
                ///  Data Interrupt Flag
                DIF: u1,
            }),
            ///  Client Address
            SADDR: u8,
            ///  Client Data
            SDATA: u8,
            ///  Client Address Mask
            SADDRMASK: mmio.Mmio(packed struct(u8) {
                ///  Address Enable
                ADDREN: u1,
                ///  Address Mask
                ADDRMASK: u7,
            }),
        };

        ///  Universal Synchronous and Asynchronous Receiver and Transmitter
        pub const USART = extern struct {
            ///  RS485 Mode internal transmitter select
            pub const USART_RS485 = enum(u1) {
                ///  RS485 Mode disabled
                DISABLE = 0x0,
                ///  RS485 Mode enabled
                ENABLE = 0x1,
            };

            ///  Receiver Mode select
            pub const USART_RXMODE = enum(u2) {
                ///  Normal mode
                NORMAL = 0x0,
                ///  CLK2x mode
                CLK2X = 0x1,
                ///  Generic autobaud mode
                GENAUTO = 0x2,
                ///  LIN constrained autobaud mode
                LINAUTO = 0x3,
            };

            ///  Communication Mode select
            pub const USART_CMODE = enum(u2) {
                ///  Asynchronous Mode
                ASYNCHRONOUS = 0x0,
                ///  Synchronous Mode
                SYNCHRONOUS = 0x1,
                ///  Infrared Communication
                IRCOM = 0x2,
                ///  SPI Host Mode
                MSPI = 0x3,
            };

            ///  Character Size select
            pub const USART_NORMAL_CHSIZE = enum(u3) {
                ///  Character size: 5 bit
                @"5BIT" = 0x0,
                ///  Character size: 6 bit
                @"6BIT" = 0x1,
                ///  Character size: 7 bit
                @"7BIT" = 0x2,
                ///  Character size: 8 bit
                @"8BIT" = 0x3,
                ///  Character size: 9 bit read low byte first
                @"9BITL" = 0x6,
                ///  Character size: 9 bit read high byte first
                @"9BITH" = 0x7,
                _,
            };

            ///  Parity Mode select
            pub const USART_NORMAL_PMODE = enum(u2) {
                ///  No Parity
                DISABLED = 0x0,
                ///  Even Parity
                EVEN = 0x2,
                ///  Odd Parity
                ODD = 0x3,
                _,
            };

            ///  Stop Bit Mode select
            pub const USART_NORMAL_SBMODE = enum(u1) {
                ///  1 stop bit
                @"1BIT" = 0x0,
                ///  2 stop bits
                @"2BIT" = 0x1,
            };

            ///  Auto Baud Window select
            pub const USART_ABW = enum(u2) {
                ///  18% tolerance
                WDW0 = 0x0,
                ///  15% tolerance
                WDW1 = 0x1,
                ///  21% tolerance
                WDW2 = 0x2,
                ///  25% tolerance
                WDW3 = 0x3,
            };

            ///  Receive Data Low Byte
            RXDATAL: mmio.Mmio(packed struct(u8) {
                ///  RX Data
                DATA: u8,
            }),
            ///  Receive Data High Byte
            RXDATAH: mmio.Mmio(packed struct(u8) {
                ///  Receiver Data Register
                DATA8: u1,
                ///  Parity Error
                PERR: u1,
                ///  Frame Error
                FERR: u1,
                reserved6: u3,
                ///  Buffer Overflow
                BUFOVF: u1,
                ///  Receive Complete Interrupt Flag
                RXCIF: u1,
            }),
            ///  Transmit Data Low Byte
            TXDATAL: mmio.Mmio(packed struct(u8) {
                ///  Transmit Data Register
                DATA: u8,
            }),
            ///  Transmit Data High Byte
            TXDATAH: mmio.Mmio(packed struct(u8) {
                ///  Transmit Data Register (CHSIZE=9bit)
                DATA8: u1,
                padding: u7,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  Wait For Break
                WFB: u1,
                ///  Break Detected Flag
                BDF: u1,
                reserved3: u1,
                ///  Inconsistent Sync Field Interrupt Flag
                ISFIF: u1,
                ///  Receive Start Interrupt
                RXSIF: u1,
                ///  Data Register Empty Flag
                DREIF: u1,
                ///  Transmit Interrupt Flag
                TXCIF: u1,
                ///  Receive Complete Interrupt Flag
                RXCIF: u1,
            }),
            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  RS485 Mode internal transmitter
                RS485: packed union {
                    raw: u1,
                    value: USART_RS485,
                },
                reserved2: u1,
                ///  Auto-baud Error Interrupt Enable
                ABEIE: u1,
                ///  Loop-back Mode Enable
                LBME: u1,
                ///  Receiver Start Frame Interrupt Enable
                RXSIE: u1,
                ///  Data Register Empty Interrupt Enable
                DREIE: u1,
                ///  Transmit Complete Interrupt Enable
                TXCIE: u1,
                ///  Receive Complete Interrupt Enable
                RXCIE: u1,
            }),
            ///  Control B
            CTRLB: mmio.Mmio(packed struct(u8) {
                ///  Multi-processor Communication Mode
                MPCM: u1,
                ///  Receiver Mode
                RXMODE: packed union {
                    raw: u2,
                    value: USART_RXMODE,
                },
                ///  Open Drain Mode Enable
                ODME: u1,
                ///  Start Frame Detection Enable
                SFDEN: u1,
                reserved6: u1,
                ///  Transmitter Enable
                TXEN: u1,
                ///  Reciever enable
                RXEN: u1,
            }),
            ///  Control C
            CTRLC: mmio.Mmio(packed struct(u8) {
                ///  Character Size
                CHSIZE: packed union {
                    raw: u3,
                    value: USART_NORMAL_CHSIZE,
                },
                ///  Stop Bit Mode
                SBMODE: packed union {
                    raw: u1,
                    value: USART_NORMAL_SBMODE,
                },
                ///  Parity Mode
                PMODE: packed union {
                    raw: u2,
                    value: USART_NORMAL_PMODE,
                },
                ///  Communication Mode
                CMODE: packed union {
                    raw: u2,
                    value: USART_CMODE,
                },
            }),
            ///  Baud Rate
            BAUD: u16,
            ///  Control D
            CTRLD: mmio.Mmio(packed struct(u8) {
                reserved6: u6,
                ///  Auto Baud Window
                ABW: packed union {
                    raw: u2,
                    value: USART_ABW,
                },
            }),
            ///  Debug Control
            DBGCTRL: mmio.Mmio(packed struct(u8) {
                ///  Debug Run
                DBGRUN: u1,
                padding: u7,
            }),
            ///  Event Control
            EVCTRL: mmio.Mmio(packed struct(u8) {
                ///  IrDA Event Input Enable
                IREI: u1,
                padding: u7,
            }),
            ///  IRCOM Transmitter Pulse Length Control
            TXPLCTRL: mmio.Mmio(packed struct(u8) {
                ///  Transmit pulse length
                TXPL: u8,
            }),
            ///  IRCOM Receiver Pulse Length Control
            RXPLCTRL: mmio.Mmio(packed struct(u8) {
                ///  Receiver Pulse Lenght
                RXPL: u7,
                padding: u1,
            }),
        };

        ///  User Row
        pub const USERROW = extern struct {
            ///  User Row Byte 0
            USERROW0: u8,
            ///  User Row Byte 1
            USERROW1: u8,
            ///  User Row Byte 2
            USERROW2: u8,
            ///  User Row Byte 3
            USERROW3: u8,
            ///  User Row Byte 4
            USERROW4: u8,
            ///  User Row Byte 5
            USERROW5: u8,
            ///  User Row Byte 6
            USERROW6: u8,
            ///  User Row Byte 7
            USERROW7: u8,
            ///  User Row Byte 8
            USERROW8: u8,
            ///  User Row Byte 9
            USERROW9: u8,
            ///  User Row Byte 10
            USERROW10: u8,
            ///  User Row Byte 11
            USERROW11: u8,
            ///  User Row Byte 12
            USERROW12: u8,
            ///  User Row Byte 13
            USERROW13: u8,
            ///  User Row Byte 14
            USERROW14: u8,
            ///  User Row Byte 15
            USERROW15: u8,
            ///  User Row Byte 16
            USERROW16: u8,
            ///  User Row Byte 17
            USERROW17: u8,
            ///  User Row Byte 18
            USERROW18: u8,
            ///  User Row Byte 19
            USERROW19: u8,
            ///  User Row Byte 20
            USERROW20: u8,
            ///  User Row Byte 21
            USERROW21: u8,
            ///  User Row Byte 22
            USERROW22: u8,
            ///  User Row Byte 23
            USERROW23: u8,
            ///  User Row Byte 24
            USERROW24: u8,
            ///  User Row Byte 25
            USERROW25: u8,
            ///  User Row Byte 26
            USERROW26: u8,
            ///  User Row Byte 27
            USERROW27: u8,
            ///  User Row Byte 28
            USERROW28: u8,
            ///  User Row Byte 29
            USERROW29: u8,
            ///  User Row Byte 30
            USERROW30: u8,
            ///  User Row Byte 31
            USERROW31: u8,
        };

        ///  Virtual Ports
        pub const VPORT = extern struct {
            ///  Data Direction
            DIR: u8,
            ///  Output Value
            OUT: u8,
            ///  Input Value
            IN: u8,
            ///  Interrupt Flags
            INTFLAGS: mmio.Mmio(packed struct(u8) {
                ///  Pin Interrupt Flag
                INT: u8,
            }),
        };

        ///  Voltage reference
        pub const VREF = extern struct {
            ///  Reference select
            pub const VREF_REFSEL = enum(u3) {
                ///  Internal 1.024V reference
                @"1V024" = 0x0,
                ///  Internal 2.048V reference
                @"2V048" = 0x1,
                ///  Internal 4.096V reference
                @"4V096" = 0x2,
                ///  Internal 2.500V reference
                @"2V500" = 0x3,
                ///  VDD as reference
                VDD = 0x5,
                ///  External reference on VREFA pin
                VREFA = 0x6,
                _,
            };

            ///  ADC0 Reference
            ADC0REF: mmio.Mmio(packed struct(u8) {
                ///  Reference select
                REFSEL: packed union {
                    raw: u3,
                    value: VREF_REFSEL,
                },
                reserved7: u4,
                ///  Always on
                ALWAYSON: u1,
            }),
            reserved2: [1]u8,
            ///  DAC0 Reference
            DAC0REF: mmio.Mmio(packed struct(u8) {
                ///  Reference select
                REFSEL: packed union {
                    raw: u3,
                    value: VREF_REFSEL,
                },
                reserved7: u4,
                ///  Always on
                ALWAYSON: u1,
            }),
            reserved4: [1]u8,
            ///  AC Reference
            ACREF: mmio.Mmio(packed struct(u8) {
                ///  Reference select
                REFSEL: packed union {
                    raw: u3,
                    value: VREF_REFSEL,
                },
                reserved7: u4,
                ///  Always on
                ALWAYSON: u1,
            }),
        };

        ///  Watch-Dog Timer
        pub const WDT = extern struct {
            ///  Period select
            pub const WDT_PERIOD = enum(u4) {
                ///  Off
                OFF = 0x0,
                ///  8 cycles (8ms)
                @"8CLK" = 0x1,
                ///  16 cycles (16ms)
                @"16CLK" = 0x2,
                ///  32 cycles (32ms)
                @"32CLK" = 0x3,
                ///  64 cycles (64ms)
                @"64CLK" = 0x4,
                ///  128 cycles (0.128s)
                @"128CLK" = 0x5,
                ///  256 cycles (0.256s)
                @"256CLK" = 0x6,
                ///  512 cycles (0.512s)
                @"512CLK" = 0x7,
                ///  1K cycles (1.0s)
                @"1KCLK" = 0x8,
                ///  2K cycles (2.0s)
                @"2KCLK" = 0x9,
                ///  4K cycles (4.1s)
                @"4KCLK" = 0xa,
                ///  8K cycles (8.2s)
                @"8KCLK" = 0xb,
                _,
            };

            ///  Window select
            pub const WDT_WINDOW = enum(u4) {
                ///  Off
                OFF = 0x0,
                ///  8 cycles (8ms)
                @"8CLK" = 0x1,
                ///  16 cycles (16ms)
                @"16CLK" = 0x2,
                ///  32 cycles (32ms)
                @"32CLK" = 0x3,
                ///  64 cycles (64ms)
                @"64CLK" = 0x4,
                ///  128 cycles (0.128s)
                @"128CLK" = 0x5,
                ///  256 cycles (0.256s)
                @"256CLK" = 0x6,
                ///  512 cycles (0.512s)
                @"512CLK" = 0x7,
                ///  1K cycles (1.0s)
                @"1KCLK" = 0x8,
                ///  2K cycles (2.0s)
                @"2KCLK" = 0x9,
                ///  4K cycles (4.1s)
                @"4KCLK" = 0xa,
                ///  8K cycles (8.2s)
                @"8KCLK" = 0xb,
                _,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Period
                PERIOD: packed union {
                    raw: u4,
                    value: WDT_PERIOD,
                },
                ///  Window
                WINDOW: packed union {
                    raw: u4,
                    value: WDT_WINDOW,
                },
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  Syncronization busy
                SYNCBUSY: u1,
                reserved7: u6,
                ///  Lock enable
                LOCK: u1,
            }),
        };

        ///  Zero Cross Detect
        pub const ZCD = extern struct {
            ///  Interrupt Mode select
            pub const ZCD_INTMODE = enum(u2) {
                ///  No interrupt
                NONE = 0x0,
                ///  Interrupt on rising input signal
                RISING = 0x1,
                ///  Interrupt on falling input signal
                FALLING = 0x2,
                ///  Interrupt on both rising and falling input signal
                BOTH = 0x3,
            };

            ///  ZCD State select
            pub const ZCD_STATE = enum(u1) {
                ///  Output is 0
                LOW = 0x0,
                ///  Output is 1
                HIGH = 0x1,
            };

            ///  Control A
            CTRLA: mmio.Mmio(packed struct(u8) {
                ///  Enable
                ENABLE: u1,
                reserved3: u2,
                ///  Invert signal from pin
                INVERT: u1,
                reserved6: u2,
                ///  Output Pad Enable
                OUTEN: u1,
                ///  Run in Standby Mode
                RUNSTDBY: u1,
            }),
            reserved2: [1]u8,
            ///  Interrupt Control
            INTCTRL: mmio.Mmio(packed struct(u8) {
                ///  Interrupt Mode
                INTMODE: packed union {
                    raw: u2,
                    value: ZCD_INTMODE,
                },
                padding: u6,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u8) {
                ///  ZCD Interrupt Flag
                CROSSIF: u1,
                reserved4: u3,
                ///  ZCD State
                STATE: packed union {
                    raw: u1,
                    value: ZCD_STATE,
                },
                padding: u3,
            }),
        };
    };
};
