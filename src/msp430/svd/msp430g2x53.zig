const micro = @import("microzig");
const mmio = micro.mmio;

pub const devices = struct {
    pub const MSP430G2x53 = struct {
        pub const peripherals = struct {
            ///  Special Function
            pub const SPECIAL_FUNCTION = @intToPtr(*volatile types.SPECIAL_FUNCTION, 0x0);
            ///  Port 3
            pub const PORT_3 = @intToPtr(*volatile types.PORT_3, 0x10);
            ///  Port 1
            pub const PORT_1 = @intToPtr(*volatile types.PORT_1, 0x20);
            ///  Port 2
            pub const PORT_2 = @intToPtr(*volatile types.PORT_2, 0x20);
            ///  ADC10
            pub const ADC10 = @intToPtr(*volatile types.ADC10, 0x48);
            ///  System Clock
            pub const SYSTEM_CLOCK = @intToPtr(*volatile types.SYSTEM_CLOCK, 0x52);
            ///  Comparator A
            pub const COMPARATOR_A = @intToPtr(*volatile types.COMPARATOR_A, 0x58);
            ///  USCI_A0 UART Mode
            pub const USCI_A0_UART_MODE = @intToPtr(*volatile types.USCI_A0_UART_MODE, 0x5c);
            ///  USCI_A0 SPI Mode
            pub const USCI_A0_SPI_MODE = @intToPtr(*volatile types.USCI_A0_SPI_MODE, 0x60);
            ///  USCI_B0 I2C Mode
            pub const USCI_B0_I2C_MODE = @intToPtr(*volatile types.USCI_B0_I2C_MODE, 0x68);
            ///  USCI_B0 SPI Mode
            pub const USCI_B0_SPI_MODE = @intToPtr(*volatile types.USCI_B0_SPI_MODE, 0x68);
            ///  Timer1_A3
            pub const TIMER1_A3 = @intToPtr(*volatile types.TIMER0_A3, 0x11e);
            ///  Watchdog Timer
            pub const WATCHDOG_TIMER = @intToPtr(*volatile types.WATCHDOG_TIMER, 0x120);
            ///  Flash
            pub const FLASH = @intToPtr(*volatile types.FLASH, 0x128);
            ///  Timer A3
            pub const TIMER0_A3 = @intToPtr(*volatile types.TIMER0_A3, 0x12e);
            ///  TLV Calibration Data
            pub const TLV_CALIBRATION_DATA = @intToPtr(*volatile types.TLV_CALIBRATION_DATA, 0x10c0);
            ///  Calibration Data
            pub const CALIBRATION_DATA = @intToPtr(*volatile types.CALIBRATION_DATA, 0x10f8);
            pub const _INTERRUPTS = @intToPtr(*volatile types._INTERRUPTS, 0xffe0);
        };
        pub const VectorTable = extern struct {
            const Handler = micro.interrupt.Handler;
            const unhandled = micro.interrupt.unhandled;

            padding: [63]u16 = undefined,
            Reset: Handler = unhandled,
        };
    };
};

pub const types = struct {
    ///  Special Function
    pub const SPECIAL_FUNCTION = extern struct {
        ///  Interrupt Enable 1
        IE1: mmio.Mmio(packed struct(u8) {
            ///  Watchdog Interrupt Enable
            WDTIE: u1,
            ///  Osc. Fault Interrupt Enable
            OFIE: u1,
            reserved4: u2 = 0,
            ///  NMI Interrupt Enable
            NMIIE: u1,
            ///  Flash Access Violation Interrupt Enable
            ACCVIE: u1,
            padding: u2 = 0,
        }),
        ///  Interrupt Enable 2
        IE2: mmio.Mmio(packed struct(u8) {
            ///  RXIE
            RXIE: u1,
            ///  TXIE
            TXIE: u1,
            ///  RXIE
            RXIE: u1,
            ///  TXIE
            TXIE: u1,
            padding: u4 = 0,
        }),
        ///  Interrupt Flag 1
        IFG1: mmio.Mmio(packed struct(u8) {
            ///  Watchdog Interrupt Flag
            WDTIFG: u1,
            ///  Osc. Fault Interrupt Flag
            OFIFG: u1,
            ///  Power On Interrupt Flag
            PORIFG: u1,
            ///  Reset Interrupt Flag
            RSTIFG: u1,
            ///  NMI Interrupt Flag
            NMIIFG: u1,
            padding: u3 = 0,
        }),
        ///  Interrupt Flag 2
        IFG2: mmio.Mmio(packed struct(u8) {
            ///  RXIFG
            RXIFG: u1,
            ///  TXIFG
            TXIFG: u1,
            ///  RXIFG
            RXIFG: u1,
            ///  TXIFG
            TXIFG: u1,
            padding: u4 = 0,
        }),
    };

    ///  Port 3
    pub const PORT_3 = extern struct {
        ///  Port 3 Resistor Enable
        REN: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        reserved8: [7]u8,
        ///  Port 3 Input
        IN: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 3 Output
        OUT: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 3 Direction
        DIR: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 3 Selection
        SEL: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        reserved51: [39]u8,
        ///  Port 3 Selection 2
        SEL2: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
    };

    ///  Port 1
    pub const PORT_1 = extern struct {
        ///  Port 1 Input
        IN: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 1 Output
        OUT: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 1 Direction
        DIR: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 1 Interrupt Flag
        IFG: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 1 Interrupt Edge Select
        IES: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 1 Interrupt Enable
        IE: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 1 Selection
        SEL: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 1 Resistor Enable
        REN: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        reserved33: [25]u8,
        ///  Port 1 Selection 2
        SEL2: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
    };

    ///  Port 2
    pub const PORT_2 = extern struct {
        reserved8: [8]u8,
        ///  Port 2 Input
        IN: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 2 Output
        OUT: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 2 Direction
        DIR: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 2 Interrupt Flag
        IFG: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 2 Interrupt Edge Select
        IES: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 2 Interrupt Enable
        IE: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 2 Selection
        SEL: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        ///  Port 2 Resistor Enable
        REN: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
        reserved34: [18]u8,
        ///  Port 2 Selection 2
        SEL2: mmio.Mmio(packed struct(u8) {
            ///  P0
            P0: u1,
            ///  P1
            P1: u1,
            ///  P2
            P2: u1,
            ///  P3
            P3: u1,
            ///  P4
            P4: u1,
            ///  P5
            P5: u1,
            ///  P6
            P6: u1,
            ///  P7
            P7: u1,
        }),
    };

    ///  ADC10
    pub const ADC10 = extern struct {
        ///  ADC10 Data Transfer Control 0
        ADC10DTC0: mmio.Mmio(packed struct(u8) {
            ///  This bit should normally be reset
            ADC10FETCH: u1,
            ///  ADC10 block one
            ADC10B1: u1,
            ///  ADC10 continuous transfer
            ADC10CT: u1,
            ///  ADC10 two-block mode
            ADC10TB: u1,
            padding: u4 = 0,
        }),
        ///  ADC10 Data Transfer Control 1
        ADC10DTC1: mmio.Mmio(packed struct(u8) {
            ///  ADC10 Data Transfer Control 1 register
            ADC10DTC1: u8,
        }),
        ///  ADC10 Analog Enable 0
        ADC10AE0: mmio.Mmio(packed struct(u8) {
            ///  ADC10 Analog Enable 0 register
            ADC10AE0: u8,
        }),
        reserved360: [357]u8,
        ///  ADC10 Control 0
        ADC10CTL0: mmio.Mmio(packed struct(u16) {
            ///  ADC10 Start Conversion
            ADC10SC: u1,
            ///  ADC10 Enable Conversion
            ENC: u1,
            ///  ADC10 Interrupt Flag
            ADC10IFG: u1,
            ///  ADC10 Interrupt Enalbe
            ADC10IE: u1,
            ///  ADC10 On/Enable
            ADC10ON: u1,
            ///  ADC10 Reference on
            REFON: u1,
            ///  ADC10 Ref 0:1.5V / 1:2.5V
            REF2_5V: u1,
            ///  ADC10 Multiple SampleConversion
            MSC: u1,
            ///  ADC10 Reference Burst Mode
            REFBURST: u1,
            ///  ADC10 Enalbe output of Ref.
            REFOUT: u1,
            ///  ADC10 Sampling Rate 0:200ksps / 1:50ksps
            ADC10SR: u1,
            ///  ADC10 Sample Hold Select Bit: 0
            ADC10SHT: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  4 x ADC10CLKs
                    ADC10SHT_0 = 0x0,
                    ///  8 x ADC10CLKs
                    ADC10SHT_1 = 0x1,
                    ///  16 x ADC10CLKs
                    ADC10SHT_2 = 0x2,
                    ///  64 x ADC10CLKs
                    ADC10SHT_3 = 0x3,
                },
            },
            ///  ADC10 Reference Select Bit: 0
            SREF: packed union {
                raw: u3,
                value: enum(u3) {
                    ///  VR+ = AVCC and VR- = AVSS
                    SREF_0 = 0x0,
                    ///  VR+ = VREF+ and VR- = AVSS
                    SREF_1 = 0x1,
                    ///  VR+ = VEREF+ and VR- = AVSS
                    SREF_2 = 0x2,
                    ///  VR+ = VEREF+ and VR- = AVSS
                    SREF_3 = 0x3,
                    ///  VR+ = AVCC and VR- = VREF-/VEREF-
                    SREF_4 = 0x4,
                    ///  VR+ = VREF+ and VR- = VREF-/VEREF-
                    SREF_5 = 0x5,
                    ///  VR+ = VEREF+ and VR- = VREF-/VEREF-
                    SREF_6 = 0x6,
                    ///  VR+ = VEREF+ and VR- = VREF-/VEREF-
                    SREF_7 = 0x7,
                },
            },
        }),
        ///  ADC10 Control 1
        ADC10CTL1: mmio.Mmio(packed struct(u16) {
            ///  ADC10 BUSY
            ADC10BUSY: u1,
            ///  ADC10 Conversion Sequence Select 0
            CONSEQ: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Single channel single conversion
                    CONSEQ_0 = 0x0,
                    ///  Sequence of channels
                    CONSEQ_1 = 0x1,
                    ///  Repeat single channel
                    CONSEQ_2 = 0x2,
                    ///  Repeat sequence of channels
                    CONSEQ_3 = 0x3,
                },
            },
            ///  ADC10 Clock Source Select Bit: 0
            ADC10SSEL: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  ADC10OSC
                    ADC10SSEL_0 = 0x0,
                    ///  ACLK
                    ADC10SSEL_1 = 0x1,
                    ///  MCLK
                    ADC10SSEL_2 = 0x2,
                    ///  SMCLK
                    ADC10SSEL_3 = 0x3,
                },
            },
            ///  ADC10 Clock Divider Select Bit: 0
            ADC10DIV: packed union {
                raw: u3,
                value: enum(u3) {
                    ///  ADC10 Clock Divider Select 0
                    ADC10DIV_0 = 0x0,
                    ///  ADC10 Clock Divider Select 1
                    ADC10DIV_1 = 0x1,
                    ///  ADC10 Clock Divider Select 2
                    ADC10DIV_2 = 0x2,
                    ///  ADC10 Clock Divider Select 3
                    ADC10DIV_3 = 0x3,
                    ///  ADC10 Clock Divider Select 4
                    ADC10DIV_4 = 0x4,
                    ///  ADC10 Clock Divider Select 5
                    ADC10DIV_5 = 0x5,
                    ///  ADC10 Clock Divider Select 6
                    ADC10DIV_6 = 0x6,
                    ///  ADC10 Clock Divider Select 7
                    ADC10DIV_7 = 0x7,
                },
            },
            ///  ADC10 Invert Sample Hold Signal
            ISSH: u1,
            ///  ADC10 Data Format 0:binary 1:2's complement
            ADC10DF: u1,
            ///  ADC10 Sample/Hold Source Bit: 0
            SHS: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  ADC10SC
                    SHS_0 = 0x0,
                    ///  TA3 OUT1
                    SHS_1 = 0x1,
                    ///  TA3 OUT0
                    SHS_2 = 0x2,
                    ///  TA3 OUT2
                    SHS_3 = 0x3,
                },
            },
            ///  ADC10 Input Channel Select Bit: 0
            INCH: packed union {
                raw: u4,
                value: enum(u4) {
                    ///  Selects Channel 0
                    INCH_0 = 0x0,
                    ///  Selects Channel 1
                    INCH_1 = 0x1,
                    ///  Selects Channel 2
                    INCH_2 = 0x2,
                    ///  Selects Channel 3
                    INCH_3 = 0x3,
                    ///  Selects Channel 4
                    INCH_4 = 0x4,
                    ///  Selects Channel 5
                    INCH_5 = 0x5,
                    ///  Selects Channel 6
                    INCH_6 = 0x6,
                    ///  Selects Channel 7
                    INCH_7 = 0x7,
                    ///  Selects Channel 8
                    INCH_8 = 0x8,
                    ///  Selects Channel 9
                    INCH_9 = 0x9,
                    ///  Selects Channel 10
                    INCH_10 = 0xa,
                    ///  Selects Channel 11
                    INCH_11 = 0xb,
                    ///  Selects Channel 12
                    INCH_12 = 0xc,
                    ///  Selects Channel 13
                    INCH_13 = 0xd,
                    ///  Selects Channel 14
                    INCH_14 = 0xe,
                    ///  Selects Channel 15
                    INCH_15 = 0xf,
                },
            },
        }),
        ///  ADC10 Memory
        ADC10MEM: mmio.Mmio(packed struct(u16) {
            ///  ADC10 Memory register
            ADC10MEM: u16,
        }),
        reserved372: [6]u8,
        ///  ADC10 Data Transfer Start Address
        ADC10SA: mmio.Mmio(packed struct(u16) {
            ///  ADC10 Data Transfer Start Address register
            ADC10SA: u16,
        }),
    };

    ///  System Clock
    pub const SYSTEM_CLOCK = extern struct {
        reserved1: [1]u8,
        ///  Basic Clock System Control 3
        BCSCTL3: mmio.Mmio(packed struct(u8) {
            ///  Low/high Frequency Oscillator Fault Flag
            LFXT1OF: u1,
            ///  High frequency oscillator 2 fault flag
            XT2OF: u1,
            ///  XIN/XOUT Cap 0
            XCAP: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  XIN/XOUT Cap : 0 pF
                    XCAP_0 = 0x0,
                    ///  XIN/XOUT Cap : 6 pF
                    XCAP_1 = 0x1,
                    ///  XIN/XOUT Cap : 10 pF
                    XCAP_2 = 0x2,
                    ///  XIN/XOUT Cap : 12.5 pF
                    XCAP_3 = 0x3,
                },
            },
            ///  Mode 0 for LFXT1 (XTS = 0)
            LFXT1S: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Mode 0 for LFXT1 : Normal operation
                    LFXT1S_0 = 0x0,
                    ///  Mode 1 for LFXT1 : Reserved
                    LFXT1S_1 = 0x1,
                    ///  Mode 2 for LFXT1 : VLO
                    LFXT1S_2 = 0x2,
                    ///  Mode 3 for LFXT1 : Digital input signal
                    LFXT1S_3 = 0x3,
                },
            },
            ///  Mode 0 for XT2
            XT2S: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Mode 0 for XT2 : 0.4 - 1 MHz
                    XT2S_0 = 0x0,
                    ///  Mode 1 for XT2 : 1 - 4 MHz
                    XT2S_1 = 0x1,
                    ///  Mode 2 for XT2 : 2 - 16 MHz
                    XT2S_2 = 0x2,
                    ///  Mode 3 for XT2 : Digital input signal
                    XT2S_3 = 0x3,
                },
            },
        }),
        reserved4: [2]u8,
        ///  DCO Clock Frequency Control
        DCOCTL: mmio.Mmio(packed struct(u8) {
            ///  Modulation Bit 0
            MOD: u5,
            ///  DCO Select Bit 0
            DCO: u3,
        }),
        ///  Basic Clock System Control 1
        BCSCTL1: mmio.Mmio(packed struct(u8) {
            ///  Range Select Bit 0
            RSEL: u4,
            ///  ACLK Divider 0
            DIVA: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  ACLK Divider 0: /1
                    DIVA_0 = 0x0,
                    ///  ACLK Divider 1: /2
                    DIVA_1 = 0x1,
                    ///  ACLK Divider 2: /4
                    DIVA_2 = 0x2,
                    ///  ACLK Divider 3: /8
                    DIVA_3 = 0x3,
                },
            },
            ///  LFXTCLK 0:Low Freq. / 1: High Freq.
            XTS: u1,
            ///  Enable XT2CLK
            XT2OFF: u1,
        }),
        ///  Basic Clock System Control 2
        BCSCTL2: mmio.Mmio(packed struct(u8) {
            reserved1: u1 = 0,
            ///  SMCLK Divider 0
            DIVS: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  SMCLK Divider 0: /1
                    DIVS_0 = 0x0,
                    ///  SMCLK Divider 1: /2
                    DIVS_1 = 0x1,
                    ///  SMCLK Divider 2: /4
                    DIVS_2 = 0x2,
                    ///  SMCLK Divider 3: /8
                    DIVS_3 = 0x3,
                },
            },
            ///  SMCLK Source Select 0:DCOCLK / 1:XT2CLK/LFXTCLK
            SELS: u1,
            ///  MCLK Divider 0
            DIVM: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  MCLK Divider 0: /1
                    DIVM_0 = 0x0,
                    ///  MCLK Divider 1: /2
                    DIVM_1 = 0x1,
                    ///  MCLK Divider 2: /4
                    DIVM_2 = 0x2,
                    ///  MCLK Divider 3: /8
                    DIVM_3 = 0x3,
                },
            },
            ///  MCLK Source Select 0
            SELM: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  MCLK Source Select 0: DCOCLK
                    SELM_0 = 0x0,
                    ///  MCLK Source Select 1: DCOCLK
                    SELM_1 = 0x1,
                    ///  MCLK Source Select 2: XT2CLK/LFXTCLK
                    SELM_2 = 0x2,
                    ///  MCLK Source Select 3: LFXTCLK
                    SELM_3 = 0x3,
                },
            },
        }),
    };

    ///  Comparator A
    pub const COMPARATOR_A = extern struct {
        reserved1: [1]u8,
        ///  Comparator A Control 1
        CACTL1: mmio.Mmio(packed struct(u8) {
            ///  Comp. A Interrupt Flag
            CAIFG: u1,
            ///  Comp. A Interrupt Enable
            CAIE: u1,
            ///  Comp. A Int. Edge Select: 0:rising / 1:falling
            CAIES: u1,
            ///  Comp. A enable
            CAON: u1,
            ///  Comp. A Internal Reference Select 0
            CAREF: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Comp. A Int. Ref. Select 0 : Off
                    CAREF_0 = 0x0,
                    ///  Comp. A Int. Ref. Select 1 : 0.25*Vcc
                    CAREF_1 = 0x1,
                    ///  Comp. A Int. Ref. Select 2 : 0.5*Vcc
                    CAREF_2 = 0x2,
                    ///  Comp. A Int. Ref. Select 3 : Vt
                    CAREF_3 = 0x3,
                },
            },
            ///  Comp. A Internal Reference Enable
            CARSEL: u1,
            ///  Comp. A Exchange Inputs
            CAEX: u1,
        }),
        ///  Comparator A Control 2
        CACTL2: mmio.Mmio(packed struct(u8) {
            ///  Comp. A Output
            CAOUT: u1,
            ///  Comp. A Enable Output Filter
            CAF: u1,
            ///  Comp. A +Terminal Multiplexer
            P2CA: packed union {
                raw: u5,
                value: enum(u5) {
                    ///  No + or - connection
                    NONE_NONE = 0x0,
                    ///  No connection to +, connect - to CA1
                    NONE_CA1 = 0x2,
                    ///  No connection to +, connect - to CA2
                    NONE_CA2 = 0x4,
                    ///  No connection to +, connect - to CA3
                    NONE_CA3 = 0x6,
                    ///  No connection to +, connect - to CA4
                    NONE_CA4 = 0x8,
                    ///  No connection to +, connect - to CA5
                    NONE_CA5 = 0xa,
                    ///  No connection to +, connect - to CA6
                    NONE_CA6 = 0xc,
                    ///  No connection to +, connect - to CA7
                    NONE_CA7 = 0xe,
                    ///  Connect + to CA0, no connection to -
                    CA0_NONE = 0x1,
                    ///  Connect + to CA0, connect - to CA1
                    CA0_CA1 = 0x3,
                    ///  Connect + to CA0, connect - to CA2
                    CA0_CA2 = 0x5,
                    ///  Connect + to CA0, connect - to CA3
                    CA0_CA3 = 0x7,
                    ///  Connect + to CA0, connect - to CA4
                    CA0_CA4 = 0x9,
                    ///  Connect + to CA0, connect - to CA5
                    CA0_CA5 = 0xb,
                    ///  Connect + to CA0, connect - to CA6
                    CA0_CA6 = 0xd,
                    ///  Connect + to CA0, connect - to CA7
                    CA0_CA7 = 0xf,
                    ///  Connect + to CA1, no connection to -
                    CA1_NONE = 0x10,
                    ///  Connect + to CA1, connect - to CA1
                    CA1_CA1 = 0x12,
                    ///  Connect + to CA1, connect - to CA2
                    CA1_CA2 = 0x14,
                    ///  Connect + to CA1, connect - to CA3
                    CA1_CA3 = 0x16,
                    ///  Connect + to CA1, connect - to CA4
                    CA1_CA4 = 0x18,
                    ///  Connect + to CA1, connect - to CA5
                    CA1_CA5 = 0x1a,
                    ///  Connect + to CA1, connect - to CA6
                    CA1_CA6 = 0x1c,
                    ///  Connect + to CA1, connect - to CA7
                    CA1_CA7 = 0x1e,
                    ///  Connect + to CA2, no connection to -
                    CA2_NONE = 0x11,
                    ///  Connect + to CA2, connect - to CA1
                    CA2_CA1 = 0x13,
                    ///  Connect + to CA2, connect - to CA2
                    CA2_CA2 = 0x15,
                    ///  Connect + to CA2, connect - to CA3
                    CA2_CA3 = 0x17,
                    ///  Connect + to CA2, connect - to CA4
                    CA2_CA4 = 0x19,
                    ///  Connect + to CA2, connect - to CA5
                    CA2_CA5 = 0x1b,
                    ///  Connect + to CA2, connect - to CA6
                    CA2_CA6 = 0x1d,
                    ///  Connect + to CA2, connect - to CA7
                    CA2_CA7 = 0x1f,
                },
            },
            ///  Comp. A Short + and - Terminals
            CASHORT: u1,
        }),
        ///  Comparator A Port Disable
        CAPD: mmio.Mmio(packed struct(u8) {
            ///  Comp. A Disable Input Buffer of Port Register .0
            CAPD0: u1,
            ///  Comp. A Disable Input Buffer of Port Register .1
            CAPD1: u1,
            ///  Comp. A Disable Input Buffer of Port Register .2
            CAPD2: u1,
            ///  Comp. A Disable Input Buffer of Port Register .3
            CAPD3: u1,
            ///  Comp. A Disable Input Buffer of Port Register .4
            CAPD4: u1,
            ///  Comp. A Disable Input Buffer of Port Register .5
            CAPD5: u1,
            ///  Comp. A Disable Input Buffer of Port Register .6
            CAPD6: u1,
            ///  Comp. A Disable Input Buffer of Port Register .7
            CAPD7: u1,
        }),
    };

    ///  USCI_A0 UART Mode
    pub const USCI_A0_UART_MODE = extern struct {
        reserved1: [1]u8,
        ///  USCI A0 LIN Control
        ABCTL: mmio.Mmio(packed struct(u8) {
            ///  Auto Baud Rate detect enable
            UCABDEN: u1,
            reserved2: u1 = 0,
            ///  Break Timeout error
            UCBTOE: u1,
            ///  Sync-Field Timeout error
            UCSTOE: u1,
            ///  Break Sync Delimiter 0
            UCDELIM: u2,
            padding: u2 = 0,
        }),
        ///  USCI A0 IrDA Transmit Control
        IRTCTL: mmio.Mmio(packed struct(u8) {
            ///  IRDA Encoder/Decoder enable
            UCIREN: u1,
            ///  IRDA Transmit Pulse Clock Select
            UCIRTXCLK: u1,
            ///  IRDA Transmit Pulse Length 0
            UCIRTXPL: u6,
        }),
        ///  USCI A0 IrDA Receive Control
        IRRCTL: mmio.Mmio(packed struct(u8) {
            ///  IRDA Receive Filter enable
            UCIRRXFE: u1,
            ///  IRDA Receive Input Polarity
            UCIRRXPL: u1,
            ///  IRDA Receive Filter Length 0
            UCIRRXFL: u6,
        }),
        ///  USCI A0 Control Register 0
        CTL0: mmio.Mmio(packed struct(u8) {
            ///  Sync-Mode 0:UART-Mode / 1:SPI-Mode
            UCSYNC: u1,
            ///  Async. Mode: USCI Mode 1
            UCMODE: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Sync. Mode: USCI Mode: 0
                    UCMODE_0 = 0x0,
                    ///  Sync. Mode: USCI Mode: 1
                    UCMODE_1 = 0x1,
                    ///  Sync. Mode: USCI Mode: 2
                    UCMODE_2 = 0x2,
                    ///  Sync. Mode: USCI Mode: 3
                    UCMODE_3 = 0x3,
                },
            },
            ///  Async. Mode: Stop Bits 0:one / 1: two
            UCSPB: u1,
            ///  Async. Mode: Data Bits 0:8-bits / 1:7-bits
            UC7BIT: u1,
            ///  Async. Mode: MSB first 0:LSB / 1:MSB
            UCMSB: u1,
            ///  Async. Mode: Parity 0:odd / 1:even
            UCPAR: u1,
            ///  Async. Mode: Parity enable
            UCPEN: u1,
        }),
        ///  USCI A0 Control Register 1
        CTL1: mmio.Mmio(packed struct(u8) {
            ///  USCI Software Reset
            UCSWRST: u1,
            ///  Send next Data as Break
            UCTXBRK: u1,
            ///  Send next Data as Address
            UCTXADDR: u1,
            ///  Dormant (Sleep) Mode
            UCDORM: u1,
            ///  Break interrupt enable
            UCBRKIE: u1,
            ///  RX Error interrupt enable
            UCRXEIE: u1,
            ///  USCI 0 Clock Source Select 1
            UCSSEL: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  USCI 0 Clock Source: 0
                    UCSSEL_0 = 0x0,
                    ///  USCI 0 Clock Source: 1
                    UCSSEL_1 = 0x1,
                    ///  USCI 0 Clock Source: 2
                    UCSSEL_2 = 0x2,
                    ///  USCI 0 Clock Source: 3
                    UCSSEL_3 = 0x3,
                },
            },
        }),
        ///  USCI A0 Baud Rate 0
        BR0: mmio.Mmio(packed struct(u8) {
            ///  USCI A0 Baud Rate 0 register
            BR0: u8,
        }),
        ///  USCI A0 Baud Rate 1
        BR1: mmio.Mmio(packed struct(u8) {
            ///  USCI A0 Baud Rate 1 register
            BR1: u8,
        }),
        ///  USCI A0 Modulation Control
        MCTL: mmio.Mmio(packed struct(u8) {
            ///  USCI 16-times Oversampling enable
            UCOS16: u1,
            ///  USCI Second Stage Modulation Select 2
            UCBRS: packed union {
                raw: u3,
                value: enum(u3) {
                    ///  USCI Second Stage Modulation: 0
                    UCBRS_0 = 0x0,
                    ///  USCI Second Stage Modulation: 1
                    UCBRS_1 = 0x1,
                    ///  USCI Second Stage Modulation: 2
                    UCBRS_2 = 0x2,
                    ///  USCI Second Stage Modulation: 3
                    UCBRS_3 = 0x3,
                    ///  USCI Second Stage Modulation: 4
                    UCBRS_4 = 0x4,
                    ///  USCI Second Stage Modulation: 5
                    UCBRS_5 = 0x5,
                    ///  USCI Second Stage Modulation: 6
                    UCBRS_6 = 0x6,
                    ///  USCI Second Stage Modulation: 7
                    UCBRS_7 = 0x7,
                },
            },
            ///  USCI First Stage Modulation Select 3
            UCBRF: packed union {
                raw: u4,
                value: enum(u4) {
                    ///  USCI First Stage Modulation: 0
                    UCBRF_0 = 0x0,
                    ///  USCI First Stage Modulation: 1
                    UCBRF_1 = 0x1,
                    ///  USCI First Stage Modulation: 2
                    UCBRF_2 = 0x2,
                    ///  USCI First Stage Modulation: 3
                    UCBRF_3 = 0x3,
                    ///  USCI First Stage Modulation: 4
                    UCBRF_4 = 0x4,
                    ///  USCI First Stage Modulation: 5
                    UCBRF_5 = 0x5,
                    ///  USCI First Stage Modulation: 6
                    UCBRF_6 = 0x6,
                    ///  USCI First Stage Modulation: 7
                    UCBRF_7 = 0x7,
                    ///  USCI First Stage Modulation: 8
                    UCBRF_8 = 0x8,
                    ///  USCI First Stage Modulation: 9
                    UCBRF_9 = 0x9,
                    ///  USCI First Stage Modulation: A
                    UCBRF_10 = 0xa,
                    ///  USCI First Stage Modulation: B
                    UCBRF_11 = 0xb,
                    ///  USCI First Stage Modulation: C
                    UCBRF_12 = 0xc,
                    ///  USCI First Stage Modulation: D
                    UCBRF_13 = 0xd,
                    ///  USCI First Stage Modulation: E
                    UCBRF_14 = 0xe,
                    ///  USCI First Stage Modulation: F
                    UCBRF_15 = 0xf,
                },
            },
        }),
        ///  USCI A0 Status Register
        STAT: mmio.Mmio(packed struct(u8) {
            ///  USCI Busy Flag
            UCBUSY: u1,
            ///  USCI Address received Flag
            UCADDR: u1,
            ///  USCI RX Error Flag
            UCRXERR: u1,
            ///  USCI Break received
            UCBRK: u1,
            ///  USCI Parity Error Flag
            UCPE: u1,
            ///  USCI Overrun Error Flag
            UCOE: u1,
            ///  USCI Frame Error Flag
            UCFE: u1,
            ///  USCI Listen mode
            UCLISTEN: u1,
        }),
        ///  USCI A0 Receive Buffer
        RXBUF: mmio.Mmio(packed struct(u8) {
            ///  USCI A0 Receive Buffer register
            RXBUF: u8,
        }),
        ///  USCI A0 Transmit Buffer
        TXBUF: mmio.Mmio(packed struct(u8) {
            ///  USCI A0 Transmit Buffer register
            TXBUF: u8,
        }),
    };

    ///  USCI_A0 SPI Mode
    pub const USCI_A0_SPI_MODE = extern struct {
        ///  USCI A0 Control Register 0
        CTL0: mmio.Mmio(packed struct(u8) {
            ///  Sync-Mode 0:UART-Mode / 1:SPI-Mode
            UCSYNC: u1,
            ///  Sync. Mode: USCI Mode 1
            UCMODE: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Sync. Mode: USCI Mode: 0
                    UCMODE_0 = 0x0,
                    ///  Sync. Mode: USCI Mode: 1
                    UCMODE_1 = 0x1,
                    ///  Sync. Mode: USCI Mode: 2
                    UCMODE_2 = 0x2,
                    ///  Sync. Mode: USCI Mode: 3
                    UCMODE_3 = 0x3,
                },
            },
            ///  Sync. Mode: Master Select
            UCMST: u1,
            ///  Sync. Mode: Data Bits 0:8-bits / 1:7-bits
            UC7BIT: u1,
            ///  Sync. Mode: MSB first 0:LSB / 1:MSB
            UCMSB: u1,
            ///  Sync. Mode: Clock Polarity
            UCCKPL: u1,
            ///  Sync. Mode: Clock Phase
            UCCKPH: u1,
        }),
        ///  USCI A0 Control Register 1
        CTL1: mmio.Mmio(packed struct(u8) {
            ///  USCI Software Reset
            UCSWRST: u1,
            reserved6: u5 = 0,
            ///  USCI 1 Clock Source Select 1
            UCSSEL: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  USCI 0 Clock Source: 0
                    UCSSEL_0 = 0x0,
                    ///  USCI 0 Clock Source: 1
                    UCSSEL_1 = 0x1,
                    ///  USCI 0 Clock Source: 2
                    UCSSEL_2 = 0x2,
                    ///  USCI 0 Clock Source: 3
                    UCSSEL_3 = 0x3,
                },
            },
        }),
        ///  USCI A0 Baud Rate 0
        BR0: mmio.Mmio(packed struct(u8) {
            ///  USCI A0 Baud Rate 0 register
            BR0: u8,
        }),
        ///  USCI A0 Baud Rate 1
        BR1: mmio.Mmio(packed struct(u8) {
            ///  USCI A0 Baud Rate 1 register
            BR1: u8,
        }),
        reserved5: [1]u8,
        ///  USCI A0 Status Register
        STAT: mmio.Mmio(packed struct(u8) {
            ///  USCI Busy Flag
            UCBUSY: u1,
            reserved5: u4 = 0,
            ///  USCI Overrun Error Flag
            UCOE: u1,
            ///  USCI Frame Error Flag
            UCFE: u1,
            ///  USCI Listen mode
            UCLISTEN: u1,
        }),
        ///  USCI A0 Receive Buffer
        RXBUF: mmio.Mmio(packed struct(u8) {
            ///  USCI A0 Receive Buffer register
            RXBUF: u8,
        }),
        ///  USCI A0 Transmit Buffer
        TXBUF: mmio.Mmio(packed struct(u8) {
            ///  USCI A0 Transmit Buffer register
            TXBUF: u8,
        }),
    };

    ///  USCI_B0 I2C Mode
    pub const USCI_B0_I2C_MODE = extern struct {
        ///  USCI B0 Control Register 0
        CTL0: mmio.Mmio(packed struct(u8) {
            ///  Sync-Mode 0:UART-Mode / 1:SPI-Mode
            UCSYNC: u1,
            ///  Sync. Mode: USCI Mode 1
            UCMODE: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Sync. Mode: USCI Mode: 0
                    UCMODE_0 = 0x0,
                    ///  Sync. Mode: USCI Mode: 1
                    UCMODE_1 = 0x1,
                    ///  Sync. Mode: USCI Mode: 2
                    UCMODE_2 = 0x2,
                    ///  Sync. Mode: USCI Mode: 3
                    UCMODE_3 = 0x3,
                },
            },
            ///  Sync. Mode: Master Select
            UCMST: u1,
            reserved5: u1 = 0,
            ///  Multi-Master Environment
            UCMM: u1,
            ///  10-bit Slave Address Mode
            UCSLA10: u1,
            ///  10-bit Address Mode
            UCA10: u1,
        }),
        ///  USCI B0 Control Register 1
        CTL1: mmio.Mmio(packed struct(u8) {
            ///  USCI Software Reset
            UCSWRST: u1,
            ///  Transmit START
            UCTXSTT: u1,
            ///  Transmit STOP
            UCTXSTP: u1,
            ///  Transmit NACK
            UCTXNACK: u1,
            ///  Transmit/Receive Select/Flag
            UCTR: u1,
            reserved6: u1 = 0,
            ///  USCI 1 Clock Source Select 1
            UCSSEL: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  USCI 0 Clock Source: 0
                    UCSSEL_0 = 0x0,
                    ///  USCI 0 Clock Source: 1
                    UCSSEL_1 = 0x1,
                    ///  USCI 0 Clock Source: 2
                    UCSSEL_2 = 0x2,
                    ///  USCI 0 Clock Source: 3
                    UCSSEL_3 = 0x3,
                },
            },
        }),
        ///  USCI B0 Baud Rate 0
        BR0: mmio.Mmio(packed struct(u8) {
            ///  USCI B0 Baud Rate 0 register
            BR0: u8,
        }),
        ///  USCI B0 Baud Rate 1
        BR1: mmio.Mmio(packed struct(u8) {
            ///  USCI B0 Baud Rate 1 register
            BR1: u8,
        }),
        ///  USCI B0 I2C Interrupt Enable Register
        I2CIE: mmio.Mmio(packed struct(u8) {
            ///  Arbitration Lost interrupt enable
            UCALIE: u1,
            ///  START Condition interrupt enable
            UCSTTIE: u1,
            ///  STOP Condition interrupt enable
            UCSTPIE: u1,
            ///  NACK Condition interrupt enable
            UCNACKIE: u1,
            padding: u4 = 0,
        }),
        ///  USCI B0 Status Register
        STAT: mmio.Mmio(packed struct(u8) {
            ///  Arbitration Lost interrupt Flag
            UCALIFG: u1,
            ///  START Condition interrupt Flag
            UCSTTIFG: u1,
            ///  STOP Condition interrupt Flag
            UCSTPIFG: u1,
            ///  NAK Condition interrupt Flag
            UCNACKIFG: u1,
            ///  Bus Busy Flag
            UCBBUSY: u1,
            ///  General Call address received Flag
            UCGC: u1,
            ///  SCL low
            UCSCLLOW: u1,
            ///  USCI Listen mode
            UCLISTEN: u1,
        }),
        ///  USCI B0 Receive Buffer
        RXBUF: mmio.Mmio(packed struct(u8) {
            ///  USCI B0 Receive Buffer register
            RXBUF: u8,
        }),
        ///  USCI B0 Transmit Buffer
        TXBUF: mmio.Mmio(packed struct(u8) {
            ///  USCI B0 Transmit Buffer register
            TXBUF: u8,
        }),
        reserved176: [168]u8,
        ///  USCI B0 I2C Own Address
        I2COA: mmio.Mmio(packed struct(u16) {
            ///  I2C Own Address 0
            UCOA: u10,
            reserved15: u5 = 0,
            ///  I2C General Call enable
            UCGCEN: u1,
        }),
        ///  USCI B0 I2C Slave Address
        I2CSA: mmio.Mmio(packed struct(u16) {
            ///  I2C Slave Address 0
            UCSA: u10,
            padding: u6 = 0,
        }),
    };

    ///  USCI_B0 SPI Mode
    pub const USCI_B0_SPI_MODE = extern struct {
        ///  USCI B0 Control Register 0
        CTL0: mmio.Mmio(packed struct(u8) {
            ///  Sync-Mode 0:UART-Mode / 1:SPI-Mode
            UCSYNC: u1,
            ///  Sync. Mode: USCI Mode 1
            UCMODE: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Sync. Mode: USCI Mode: 0
                    UCMODE_0 = 0x0,
                    ///  Sync. Mode: USCI Mode: 1
                    UCMODE_1 = 0x1,
                    ///  Sync. Mode: USCI Mode: 2
                    UCMODE_2 = 0x2,
                    ///  Sync. Mode: USCI Mode: 3
                    UCMODE_3 = 0x3,
                },
            },
            ///  Sync. Mode: Master Select
            UCMST: u1,
            ///  Sync. Mode: Data Bits 0:8-bits / 1:7-bits
            UC7BIT: u1,
            ///  Sync. Mode: MSB first 0:LSB / 1:MSB
            UCMSB: u1,
            ///  Sync. Mode: Clock Polarity
            UCCKPL: u1,
            ///  Sync. Mode: Clock Phase
            UCCKPH: u1,
        }),
        ///  USCI B0 Control Register 1
        CTL1: mmio.Mmio(packed struct(u8) {
            ///  USCI Software Reset
            UCSWRST: u1,
            reserved6: u5 = 0,
            ///  USCI 1 Clock Source Select 1
            UCSSEL: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  USCI 0 Clock Source: 0
                    UCSSEL_0 = 0x0,
                    ///  USCI 0 Clock Source: 1
                    UCSSEL_1 = 0x1,
                    ///  USCI 0 Clock Source: 2
                    UCSSEL_2 = 0x2,
                    ///  USCI 0 Clock Source: 3
                    UCSSEL_3 = 0x3,
                },
            },
        }),
        ///  USCI B0 Baud Rate 0
        BR0: mmio.Mmio(packed struct(u8) {
            ///  USCI B0 Baud Rate 0 register
            BR0: u8,
        }),
        ///  USCI B0 Baud Rate 1
        BR1: mmio.Mmio(packed struct(u8) {
            ///  USCI B0 Baud Rate 1 register
            BR1: u8,
        }),
        reserved5: [1]u8,
        ///  USCI B0 Status Register
        STAT: mmio.Mmio(packed struct(u8) {
            ///  USCI Busy Flag
            UCBUSY: u1,
            reserved5: u4 = 0,
            ///  USCI Overrun Error Flag
            UCOE: u1,
            ///  USCI Frame Error Flag
            UCFE: u1,
            ///  USCI Listen mode
            UCLISTEN: u1,
        }),
        ///  USCI B0 Receive Buffer
        RXBUF: mmio.Mmio(packed struct(u8) {
            ///  USCI B0 Receive Buffer register
            RXBUF: u8,
        }),
        ///  USCI B0 Transmit Buffer
        TXBUF: mmio.Mmio(packed struct(u8) {
            ///  USCI B0 Transmit Buffer register
            TXBUF: u8,
        }),
    };

    ///  TLV Calibration Data
    pub const TLV_CALIBRATION_DATA = extern struct {
        ///  TLV CHECK SUM
        TLV_CHECKSUM: mmio.Mmio(packed struct(u16) {
            ///  TLV CHECK SUM register
            TLV_CHECKSUM: u16,
        }),
        reserved26: [24]u8,
        ///  TLV ADC10_1 TAG
        TLV_ADC10_1_TAG: mmio.Mmio(packed struct(u8) {
            ///  TLV ADC10_1 TAG register
            TLV_ADC10_1_TAG: u8,
        }),
        ///  TLV ADC10_1 LEN
        TLV_ADC10_1_LEN: mmio.Mmio(packed struct(u8) {
            ///  TLV ADC10_1 LEN register
            TLV_ADC10_1_LEN: u8,
        }),
        reserved54: [26]u8,
        ///  TLV TAG_DCO30 TAG
        TLV_DCO_30_TAG: mmio.Mmio(packed struct(u8) {
            ///  TLV TAG_DCO30 TAG register
            TLV_DCO_30_TAG: u8,
        }),
        ///  TLV TAG_DCO30 LEN
        TLV_DCO_30_LEN: mmio.Mmio(packed struct(u8) {
            ///  TLV TAG_DCO30 LEN register
            TLV_DCO_30_LEN: u8,
        }),
    };

    ///  Calibration Data
    pub const CALIBRATION_DATA = extern struct {
        ///  DCOCTL Calibration Data for 16MHz
        CALDCO_16MHZ: mmio.Mmio(packed struct(u8) {
            ///  DCOCTL Calibration Data for 16MHz register
            CALDCO_16MHZ: u8,
        }),
        ///  BCSCTL1 Calibration Data for 16MHz
        CALBC1_16MHZ: mmio.Mmio(packed struct(u8) {
            ///  BCSCTL1 Calibration Data for 16MHz register
            CALBC1_16MHZ: u8,
        }),
        ///  DCOCTL Calibration Data for 12MHz
        CALDCO_12MHZ: mmio.Mmio(packed struct(u8) {
            ///  DCOCTL Calibration Data for 12MHz register
            CALDCO_12MHZ: u8,
        }),
        ///  BCSCTL1 Calibration Data for 12MHz
        CALBC1_12MHZ: mmio.Mmio(packed struct(u8) {
            ///  BCSCTL1 Calibration Data for 12MHz register
            CALBC1_12MHZ: u8,
        }),
        ///  DCOCTL Calibration Data for 8MHz
        CALDCO_8MHZ: mmio.Mmio(packed struct(u8) {
            ///  DCOCTL Calibration Data for 8MHz register
            CALDCO_8MHZ: u8,
        }),
        ///  BCSCTL1 Calibration Data for 8MHz
        CALBC1_8MHZ: mmio.Mmio(packed struct(u8) {
            ///  BCSCTL1 Calibration Data for 8MHz register
            CALBC1_8MHZ: u8,
        }),
        ///  DCOCTL Calibration Data for 1MHz
        CALDCO_1MHZ: mmio.Mmio(packed struct(u8) {
            ///  DCOCTL Calibration Data for 1MHz register
            CALDCO_1MHZ: u8,
        }),
        ///  BCSCTL1 Calibration Data for 1MHz
        CALBC1_1MHZ: mmio.Mmio(packed struct(u8) {
            ///  BCSCTL1 Calibration Data for 1MHz register
            CALBC1_1MHZ: u8,
        }),
    };

    ///  Watchdog Timer
    pub const WATCHDOG_TIMER = extern struct {
        ///  Watchdog Timer Control
        WDTCTL: mmio.Mmio(packed struct(u16) {
            ///  WDTIS0
            WDTIS: u2,
            ///  WDTSSEL
            WDTSSEL: u1,
            ///  WDTCNTCL
            WDTCNTCL: u1,
            ///  WDTTMSEL
            WDTTMSEL: u1,
            ///  WDTNMI
            WDTNMI: u1,
            ///  WDTNMIES
            WDTNMIES: u1,
            ///  WDTHOLD
            WDTHOLD: u1,
            ///  Watchdog Timer Password
            WDTPW: packed union {
                raw: u8,
                value: enum(u8) {
                    ///  Value always read from the Watchdog Password register
                    PASSWORD = 0x69,
                    _,
                },
            },
        }),
    };

    ///  Flash
    pub const FLASH = extern struct {
        ///  FLASH Control 1
        FCTL1: mmio.Mmio(packed struct(u16) {
            reserved1: u1 = 0,
            ///  Enable bit for Flash segment erase
            ERASE: u1,
            ///  Enable bit for Flash mass erase
            MERAS: u1,
            reserved6: u3 = 0,
            ///  Enable bit for Flash write
            WRT: u1,
            ///  Enable bit for Flash segment write
            BLKWRT: u1,
            ///  FCTL1 Password
            FWKEY: packed union {
                raw: u8,
                value: enum(u8) {
                    ///  Value always read from the FCTL1 Password register
                    PASSWORD = 0x96,
                    _,
                },
            },
        }),
        ///  FLASH Control 2
        FCTL2: mmio.Mmio(packed struct(u16) {
            ///  Divide Flash clock by 1 to 64 using FN0 to FN5 according to:
            FN: u6,
            ///  Flash clock select 0 */ /* to distinguish from USART SSELx
            FSSEL: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Flash clock select: 0 - ACLK
                    FSSEL_0 = 0x0,
                    ///  Flash clock select: 1 - MCLK
                    FSSEL_1 = 0x1,
                    ///  Flash clock select: 2 - SMCLK
                    FSSEL_2 = 0x2,
                    ///  Flash clock select: 3 - SMCLK
                    FSSEL_3 = 0x3,
                },
            },
            ///  FCTL2 Password
            FWKEY: packed union {
                raw: u8,
                value: enum(u8) {
                    ///  Value always read from the FCTL2 Password register
                    PASSWORD = 0x96,
                    _,
                },
            },
        }),
        ///  FLASH Control 3
        FCTL3: mmio.Mmio(packed struct(u16) {
            ///  Flash busy: 1
            BUSY: u1,
            ///  Flash Key violation flag
            KEYV: u1,
            ///  Flash Access violation flag
            ACCVIFG: u1,
            ///  Wait flag for segment write
            WAIT: u1,
            ///  Lock bit: 1 - Flash is locked (read only)
            LOCK: u1,
            ///  Flash Emergency Exit
            EMEX: u1,
            ///  Segment A Lock bit: read = 1 - Segment is locked (read only)
            LOCKA: u1,
            ///  Last Program or Erase failed
            FAIL: u1,
            ///  FCTL3 Password
            FWKEY: packed union {
                raw: u8,
                value: enum(u8) {
                    ///  Value always read from the FCTL3 Password register
                    PASSWORD = 0x96,
                    _,
                },
            },
        }),
    };

    ///  Timer A3
    pub const TIMER0_A3 = extern struct {
        ///  Timer0_A3 Interrupt Vector Word
        TAIV: mmio.Mmio(packed struct(u16) {
            ///  Timer A Interrupt Vector value
            TAIV: packed union {
                raw: u4,
                value: enum(u4) {
                    ///  No interrupt pending
                    NONE = 0x0,
                    ///  Capture/Compare 1
                    TACCR1 = 0x2,
                    ///  Capture/Compare 2
                    TACCR2 = 0x4,
                    ///  Timer overflow
                    TAIFG = 0xa,
                    _,
                },
            },
            padding: u12 = 0,
        }),
        reserved50: [48]u8,
        ///  Timer0_A3 Control
        TACTL: mmio.Mmio(packed struct(u16) {
            ///  Timer A counter interrupt flag
            TAIFG: u1,
            ///  Timer A counter interrupt enable
            TAIE: u1,
            ///  Timer A counter clear
            TACLR: u1,
            reserved4: u1 = 0,
            ///  Timer A mode control 1
            MC: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Timer A mode control: 0 - Stop
                    MC_0 = 0x0,
                    ///  Timer A mode control: 1 - Up to CCR0
                    MC_1 = 0x1,
                    ///  Timer A mode control: 2 - Continous up
                    MC_2 = 0x2,
                    ///  Timer A mode control: 3 - Up/Down
                    MC_3 = 0x3,
                },
            },
            ///  Timer A clock input divider 1
            ID: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Timer A input divider: 0 - /1
                    ID_0 = 0x0,
                    ///  Timer A input divider: 1 - /2
                    ID_1 = 0x1,
                    ///  Timer A input divider: 2 - /4
                    ID_2 = 0x2,
                    ///  Timer A input divider: 3 - /8
                    ID_3 = 0x3,
                },
            },
            ///  Timer A clock source select 1
            TASSEL: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Timer A clock source select: 0 - TACLK
                    TASSEL_0 = 0x0,
                    ///  Timer A clock source select: 1 - ACLK
                    TASSEL_1 = 0x1,
                    ///  Timer A clock source select: 2 - SMCLK
                    TASSEL_2 = 0x2,
                    ///  Timer A clock source select: 3 - INCLK
                    TASSEL_3 = 0x3,
                },
            },
            padding: u6 = 0,
        }),
        ///  Timer0_A3 Capture/Compare Control 0
        TACCTL0: mmio.Mmio(packed struct(u16) {
            ///  Capture/compare interrupt flag
            CCIFG: u1,
            ///  Capture/compare overflow flag
            COV: u1,
            ///  PWM Output signal if output mode 0
            OUT: u1,
            ///  Capture input signal (read)
            CCI: u1,
            ///  Capture/compare interrupt enable
            CCIE: u1,
            ///  Output mode 2
            OUTMOD: packed union {
                raw: u3,
                value: enum(u3) {
                    ///  PWM output mode: 0 - output only
                    OUTMOD_0 = 0x0,
                    ///  PWM output mode: 1 - set
                    OUTMOD_1 = 0x1,
                    ///  PWM output mode: 2 - PWM toggle/reset
                    OUTMOD_2 = 0x2,
                    ///  PWM output mode: 3 - PWM set/reset
                    OUTMOD_3 = 0x3,
                    ///  PWM output mode: 4 - toggle
                    OUTMOD_4 = 0x4,
                    ///  PWM output mode: 5 - Reset
                    OUTMOD_5 = 0x5,
                    ///  PWM output mode: 6 - PWM toggle/set
                    OUTMOD_6 = 0x6,
                    ///  PWM output mode: 7 - PWM reset/set
                    OUTMOD_7 = 0x7,
                },
            },
            ///  Capture mode: 1 /Compare mode : 0
            CAP: u1,
            reserved10: u1 = 0,
            ///  Latched capture signal (read)
            SCCI: u1,
            ///  Capture sychronize
            SCS: u1,
            ///  Capture input select 1
            CCIS: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Capture input select: 0 - CCIxA
                    CCIS_0 = 0x0,
                    ///  Capture input select: 1 - CCIxB
                    CCIS_1 = 0x1,
                    ///  Capture input select: 2 - GND
                    CCIS_2 = 0x2,
                    ///  Capture input select: 3 - Vcc
                    CCIS_3 = 0x3,
                },
            },
            ///  Capture mode 1
            CM: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Capture mode: 0 - disabled
                    CM_0 = 0x0,
                    ///  Capture mode: 1 - pos. edge
                    CM_1 = 0x1,
                    ///  Capture mode: 1 - neg. edge
                    CM_2 = 0x2,
                    ///  Capture mode: 1 - both edges
                    CM_3 = 0x3,
                },
            },
        }),
        ///  Timer0_A3 Capture/Compare Control 1
        TACCTL1: mmio.Mmio(packed struct(u16) {
            ///  Capture/compare interrupt flag
            CCIFG: u1,
            ///  Capture/compare overflow flag
            COV: u1,
            ///  PWM Output signal if output mode 0
            OUT: u1,
            ///  Capture input signal (read)
            CCI: u1,
            ///  Capture/compare interrupt enable
            CCIE: u1,
            ///  Output mode 2
            OUTMOD: packed union {
                raw: u3,
                value: enum(u3) {
                    ///  PWM output mode: 0 - output only
                    OUTMOD_0 = 0x0,
                    ///  PWM output mode: 1 - set
                    OUTMOD_1 = 0x1,
                    ///  PWM output mode: 2 - PWM toggle/reset
                    OUTMOD_2 = 0x2,
                    ///  PWM output mode: 3 - PWM set/reset
                    OUTMOD_3 = 0x3,
                    ///  PWM output mode: 4 - toggle
                    OUTMOD_4 = 0x4,
                    ///  PWM output mode: 5 - Reset
                    OUTMOD_5 = 0x5,
                    ///  PWM output mode: 6 - PWM toggle/set
                    OUTMOD_6 = 0x6,
                    ///  PWM output mode: 7 - PWM reset/set
                    OUTMOD_7 = 0x7,
                },
            },
            ///  Capture mode: 1 /Compare mode : 0
            CAP: u1,
            reserved10: u1 = 0,
            ///  Latched capture signal (read)
            SCCI: u1,
            ///  Capture sychronize
            SCS: u1,
            ///  Capture input select 1
            CCIS: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Capture input select: 0 - CCIxA
                    CCIS_0 = 0x0,
                    ///  Capture input select: 1 - CCIxB
                    CCIS_1 = 0x1,
                    ///  Capture input select: 2 - GND
                    CCIS_2 = 0x2,
                    ///  Capture input select: 3 - Vcc
                    CCIS_3 = 0x3,
                },
            },
            ///  Capture mode 1
            CM: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Capture mode: 0 - disabled
                    CM_0 = 0x0,
                    ///  Capture mode: 1 - pos. edge
                    CM_1 = 0x1,
                    ///  Capture mode: 1 - neg. edge
                    CM_2 = 0x2,
                    ///  Capture mode: 1 - both edges
                    CM_3 = 0x3,
                },
            },
        }),
        ///  Timer0_A3 Capture/Compare Control 2
        TACCTL2: mmio.Mmio(packed struct(u16) {
            ///  Capture/compare interrupt flag
            CCIFG: u1,
            ///  Capture/compare overflow flag
            COV: u1,
            ///  PWM Output signal if output mode 0
            OUT: u1,
            ///  Capture input signal (read)
            CCI: u1,
            ///  Capture/compare interrupt enable
            CCIE: u1,
            ///  Output mode 2
            OUTMOD: packed union {
                raw: u3,
                value: enum(u3) {
                    ///  PWM output mode: 0 - output only
                    OUTMOD_0 = 0x0,
                    ///  PWM output mode: 1 - set
                    OUTMOD_1 = 0x1,
                    ///  PWM output mode: 2 - PWM toggle/reset
                    OUTMOD_2 = 0x2,
                    ///  PWM output mode: 3 - PWM set/reset
                    OUTMOD_3 = 0x3,
                    ///  PWM output mode: 4 - toggle
                    OUTMOD_4 = 0x4,
                    ///  PWM output mode: 5 - Reset
                    OUTMOD_5 = 0x5,
                    ///  PWM output mode: 6 - PWM toggle/set
                    OUTMOD_6 = 0x6,
                    ///  PWM output mode: 7 - PWM reset/set
                    OUTMOD_7 = 0x7,
                },
            },
            ///  Capture mode: 1 /Compare mode : 0
            CAP: u1,
            reserved10: u1 = 0,
            ///  Latched capture signal (read)
            SCCI: u1,
            ///  Capture sychronize
            SCS: u1,
            ///  Capture input select 1
            CCIS: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Capture input select: 0 - CCIxA
                    CCIS_0 = 0x0,
                    ///  Capture input select: 1 - CCIxB
                    CCIS_1 = 0x1,
                    ///  Capture input select: 2 - GND
                    CCIS_2 = 0x2,
                    ///  Capture input select: 3 - Vcc
                    CCIS_3 = 0x3,
                },
            },
            ///  Capture mode 1
            CM: packed union {
                raw: u2,
                value: enum(u2) {
                    ///  Capture mode: 0 - disabled
                    CM_0 = 0x0,
                    ///  Capture mode: 1 - pos. edge
                    CM_1 = 0x1,
                    ///  Capture mode: 1 - neg. edge
                    CM_2 = 0x2,
                    ///  Capture mode: 1 - both edges
                    CM_3 = 0x3,
                },
            },
        }),
        reserved66: [8]u8,
        ///  Timer0_A3 Counter Register
        TAR: mmio.Mmio(packed struct(u16) {
            ///  Timer A Counter Register
            TAR: u16,
        }),
        ///  Timer0_A3 Capture/Compare 0
        TACCR0: mmio.Mmio(packed struct(u16) {
            ///  Timer A Capture/Compare register 0
            TACCR0: u16,
        }),
        ///  Timer0_A3 Capture/Compare 1
        TACCR1: mmio.Mmio(packed struct(u16) {
            ///  Timer A Capture/Compare register 1
            TACCR1: u16,
        }),
        ///  Timer0_A3 Capture/Compare 2
        TACCR2: mmio.Mmio(packed struct(u16) {
            ///  Timer A Capture/Compare register 2
            TACCR2: u16,
        }),
    };
};
