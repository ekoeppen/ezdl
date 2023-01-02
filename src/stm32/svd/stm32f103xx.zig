const mmio = @import("mmio");

pub const devices = struct {
    ///  STM32F103xx
    pub const STM32F103xx = struct {
        pub const peripherals = struct {
            ///  General purpose timer
            pub const TIM2 = @intToPtr(*volatile types.TIM2, 0x40000000);
            ///  General purpose timer
            pub const TIM3 = @intToPtr(*volatile types.TIM2, 0x40000400);
            ///  General purpose timer
            pub const TIM4 = @intToPtr(*volatile types.TIM2, 0x40000800);
            ///  General purpose timer
            pub const TIM5 = @intToPtr(*volatile types.TIM2, 0x40000c00);
            ///  Basic timer
            pub const TIM6 = @intToPtr(*volatile types.TIM6, 0x40001000);
            ///  Basic timer
            pub const TIM7 = @intToPtr(*volatile types.TIM6, 0x40001400);
            ///  General purpose timer
            pub const TIM12 = @intToPtr(*volatile types.TIM9, 0x40001800);
            ///  General purpose timer
            pub const TIM13 = @intToPtr(*volatile types.TIM10, 0x40001c00);
            ///  General purpose timer
            pub const TIM14 = @intToPtr(*volatile types.TIM10, 0x40002000);
            ///  Real time clock
            pub const RTC = @intToPtr(*volatile types.RTC, 0x40002800);
            ///  Window watchdog
            pub const WWDG = @intToPtr(*volatile types.WWDG, 0x40002c00);
            ///  Independent watchdog
            pub const IWDG = @intToPtr(*volatile types.IWDG, 0x40003000);
            ///  Serial peripheral interface
            pub const SPI2 = @intToPtr(*volatile types.SPI1, 0x40003800);
            ///  Serial peripheral interface
            pub const SPI3 = @intToPtr(*volatile types.SPI1, 0x40003c00);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART2 = @intToPtr(*volatile types.USART1, 0x40004400);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART3 = @intToPtr(*volatile types.USART1, 0x40004800);
            ///  Universal asynchronous receiver transmitter
            pub const UART4 = @intToPtr(*volatile types.UART4, 0x40004c00);
            ///  Universal asynchronous receiver transmitter
            pub const UART5 = @intToPtr(*volatile types.UART5, 0x40005000);
            ///  Inter integrated circuit
            pub const I2C1 = @intToPtr(*volatile types.I2C1, 0x40005400);
            ///  Inter integrated circuit
            pub const I2C2 = @intToPtr(*volatile types.I2C1, 0x40005800);
            ///  Universal serial bus full-speed device interface
            pub const USB = @intToPtr(*volatile types.USB, 0x40005c00);
            ///  Controller area network
            pub const CAN = @intToPtr(*volatile types.CAN, 0x40006400);
            ///  Backup registers
            pub const BKP = @intToPtr(*volatile types.BKP, 0x40006c04);
            ///  Power control
            pub const PWR = @intToPtr(*volatile types.PWR, 0x40007000);
            ///  Digital to analog converter
            pub const DAC = @intToPtr(*volatile types.DAC, 0x40007400);
            ///  Alternate function I/O
            pub const AFIO = @intToPtr(*volatile types.AFIO, 0x40010000);
            ///  EXTI
            pub const EXTI = @intToPtr(*volatile types.EXTI, 0x40010400);
            ///  General purpose I/O
            pub const GPIOA = @intToPtr(*volatile types.GPIOA, 0x40010800);
            ///  General purpose I/O
            pub const GPIOB = @intToPtr(*volatile types.GPIOA, 0x40010c00);
            ///  General purpose I/O
            pub const GPIOC = @intToPtr(*volatile types.GPIOA, 0x40011000);
            ///  General purpose I/O
            pub const GPIOD = @intToPtr(*volatile types.GPIOA, 0x40011400);
            ///  General purpose I/O
            pub const GPIOE = @intToPtr(*volatile types.GPIOA, 0x40011800);
            ///  General purpose I/O
            pub const GPIOF = @intToPtr(*volatile types.GPIOA, 0x40011c00);
            ///  General purpose I/O
            pub const GPIOG = @intToPtr(*volatile types.GPIOA, 0x40012000);
            ///  Analog to digital converter
            pub const ADC1 = @intToPtr(*volatile types.ADC1, 0x40012400);
            ///  Analog to digital converter
            pub const ADC2 = @intToPtr(*volatile types.ADC2, 0x40012800);
            ///  Advanced timer
            pub const TIM1 = @intToPtr(*volatile types.TIM1, 0x40012c00);
            ///  Serial peripheral interface
            pub const SPI1 = @intToPtr(*volatile types.SPI1, 0x40013000);
            ///  Advanced timer
            pub const TIM8 = @intToPtr(*volatile types.TIM1, 0x40013400);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART1 = @intToPtr(*volatile types.USART1, 0x40013800);
            ///  Analog to digital converter
            pub const ADC3 = @intToPtr(*volatile types.ADC2, 0x40013c00);
            ///  General purpose timer
            pub const TIM9 = @intToPtr(*volatile types.TIM9, 0x40014c00);
            ///  General purpose timer
            pub const TIM10 = @intToPtr(*volatile types.TIM10, 0x40015000);
            ///  General purpose timer
            pub const TIM11 = @intToPtr(*volatile types.TIM10, 0x40015400);
            ///  Secure digital input/output interface
            pub const SDIO = @intToPtr(*volatile types.SDIO, 0x40018000);
            ///  DMA controller
            pub const DMA1 = @intToPtr(*volatile types.DMA1, 0x40020000);
            ///  DMA controller
            pub const DMA2 = @intToPtr(*volatile types.DMA1, 0x40020400);
            ///  Reset and clock control
            pub const RCC = @intToPtr(*volatile types.RCC, 0x40021000);
            ///  FLASH
            pub const FLASH = @intToPtr(*volatile types.FLASH, 0x40022000);
            ///  CRC calculation unit
            pub const CRC = @intToPtr(*volatile types.CRC, 0x40023000);
            ///  Flexible static memory controller
            pub const FSMC = @intToPtr(*volatile types.FSMC, 0xa0000000);
            ///  Nested Vectored Interrupt Controller
            pub const NVIC = @intToPtr(*volatile types.NVIC, 0xe000e000);
            ///  Debug support
            pub const DBG = @intToPtr(*volatile types.DBG, 0xe0042000);
        };
    };
};

pub const types = struct {
    ///  Flexible static memory controller
    pub const FSMC = extern struct {
        ///  SRAM/NOR-Flash chip-select control register 1
        BCR1: mmio.Mmio(32, packed struct {
            ///  MBKEN
            MBKEN: u1,
            ///  MUXEN
            MUXEN: u1,
            ///  MTYP
            MTYP: u2,
            ///  MWID
            MWID: u2,
            ///  FACCEN
            FACCEN: u1,
            reserved8: u1 = 0,
            ///  BURSTEN
            BURSTEN: u1,
            ///  WAITPOL
            WAITPOL: u1,
            reserved11: u1 = 0,
            ///  WAITCFG
            WAITCFG: u1,
            ///  WREN
            WREN: u1,
            ///  WAITEN
            WAITEN: u1,
            ///  EXTMOD
            EXTMOD: u1,
            ///  ASYNCWAIT
            ASYNCWAIT: u1,
            reserved19: u3 = 0,
            ///  CBURSTRW
            CBURSTRW: u1,
            padding: u12 = 0,
        }),
        ///  SRAM/NOR-Flash chip-select timing register 1
        BTR1: mmio.Mmio(32, packed struct {
            ///  ADDSET
            ADDSET: u4,
            ///  ADDHLD
            ADDHLD: u4,
            ///  DATAST
            DATAST: u8,
            ///  BUSTURN
            BUSTURN: u4,
            ///  CLKDIV
            CLKDIV: u4,
            ///  DATLAT
            DATLAT: u4,
            ///  ACCMOD
            ACCMOD: u2,
            padding: u2 = 0,
        }),
        ///  SRAM/NOR-Flash chip-select control register 2
        BCR2: mmio.Mmio(32, packed struct {
            ///  MBKEN
            MBKEN: u1,
            ///  MUXEN
            MUXEN: u1,
            ///  MTYP
            MTYP: u2,
            ///  MWID
            MWID: u2,
            ///  FACCEN
            FACCEN: u1,
            reserved8: u1 = 0,
            ///  BURSTEN
            BURSTEN: u1,
            ///  WAITPOL
            WAITPOL: u1,
            ///  WRAPMOD
            WRAPMOD: u1,
            ///  WAITCFG
            WAITCFG: u1,
            ///  WREN
            WREN: u1,
            ///  WAITEN
            WAITEN: u1,
            ///  EXTMOD
            EXTMOD: u1,
            ///  ASYNCWAIT
            ASYNCWAIT: u1,
            reserved19: u3 = 0,
            ///  CBURSTRW
            CBURSTRW: u1,
            padding: u12 = 0,
        }),
        ///  SRAM/NOR-Flash chip-select timing register 2
        BTR2: mmio.Mmio(32, packed struct {
            ///  ADDSET
            ADDSET: u4,
            ///  ADDHLD
            ADDHLD: u4,
            ///  DATAST
            DATAST: u8,
            ///  BUSTURN
            BUSTURN: u4,
            ///  CLKDIV
            CLKDIV: u4,
            ///  DATLAT
            DATLAT: u4,
            ///  ACCMOD
            ACCMOD: u2,
            padding: u2 = 0,
        }),
        ///  SRAM/NOR-Flash chip-select control register 3
        BCR3: mmio.Mmio(32, packed struct {
            ///  MBKEN
            MBKEN: u1,
            ///  MUXEN
            MUXEN: u1,
            ///  MTYP
            MTYP: u2,
            ///  MWID
            MWID: u2,
            ///  FACCEN
            FACCEN: u1,
            reserved8: u1 = 0,
            ///  BURSTEN
            BURSTEN: u1,
            ///  WAITPOL
            WAITPOL: u1,
            ///  WRAPMOD
            WRAPMOD: u1,
            ///  WAITCFG
            WAITCFG: u1,
            ///  WREN
            WREN: u1,
            ///  WAITEN
            WAITEN: u1,
            ///  EXTMOD
            EXTMOD: u1,
            ///  ASYNCWAIT
            ASYNCWAIT: u1,
            reserved19: u3 = 0,
            ///  CBURSTRW
            CBURSTRW: u1,
            padding: u12 = 0,
        }),
        ///  SRAM/NOR-Flash chip-select timing register 3
        BTR3: mmio.Mmio(32, packed struct {
            ///  ADDSET
            ADDSET: u4,
            ///  ADDHLD
            ADDHLD: u4,
            ///  DATAST
            DATAST: u8,
            ///  BUSTURN
            BUSTURN: u4,
            ///  CLKDIV
            CLKDIV: u4,
            ///  DATLAT
            DATLAT: u4,
            ///  ACCMOD
            ACCMOD: u2,
            padding: u2 = 0,
        }),
        ///  SRAM/NOR-Flash chip-select control register 4
        BCR4: mmio.Mmio(32, packed struct {
            ///  MBKEN
            MBKEN: u1,
            ///  MUXEN
            MUXEN: u1,
            ///  MTYP
            MTYP: u2,
            ///  MWID
            MWID: u2,
            ///  FACCEN
            FACCEN: u1,
            reserved8: u1 = 0,
            ///  BURSTEN
            BURSTEN: u1,
            ///  WAITPOL
            WAITPOL: u1,
            ///  WRAPMOD
            WRAPMOD: u1,
            ///  WAITCFG
            WAITCFG: u1,
            ///  WREN
            WREN: u1,
            ///  WAITEN
            WAITEN: u1,
            ///  EXTMOD
            EXTMOD: u1,
            ///  ASYNCWAIT
            ASYNCWAIT: u1,
            reserved19: u3 = 0,
            ///  CBURSTRW
            CBURSTRW: u1,
            padding: u12 = 0,
        }),
        ///  SRAM/NOR-Flash chip-select timing register 4
        BTR4: mmio.Mmio(32, packed struct {
            ///  ADDSET
            ADDSET: u4,
            ///  ADDHLD
            ADDHLD: u4,
            ///  DATAST
            DATAST: u8,
            ///  BUSTURN
            BUSTURN: u4,
            ///  CLKDIV
            CLKDIV: u4,
            ///  DATLAT
            DATLAT: u4,
            ///  ACCMOD
            ACCMOD: u2,
            padding: u2 = 0,
        }),
        reserved96: [64]u8,
        ///  PC Card/NAND Flash control register 2
        PCR2: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  PWAITEN
            PWAITEN: u1,
            ///  PBKEN
            PBKEN: u1,
            ///  PTYP
            PTYP: u1,
            ///  PWID
            PWID: u2,
            ///  ECCEN
            ECCEN: u1,
            reserved9: u2 = 0,
            ///  TCLR
            TCLR: u4,
            ///  TAR
            TAR: u4,
            ///  ECCPS
            ECCPS: u3,
            padding: u12 = 0,
        }),
        ///  FIFO status and interrupt register 2
        SR2: mmio.Mmio(32, packed struct {
            ///  IRS
            IRS: u1,
            ///  ILS
            ILS: u1,
            ///  IFS
            IFS: u1,
            ///  IREN
            IREN: u1,
            ///  ILEN
            ILEN: u1,
            ///  IFEN
            IFEN: u1,
            ///  FEMPT
            FEMPT: u1,
            padding: u25 = 0,
        }),
        ///  Common memory space timing register 2
        PMEM2: mmio.Mmio(32, packed struct {
            ///  MEMSETx
            MEMSETx: u8,
            ///  MEMWAITx
            MEMWAITx: u8,
            ///  MEMHOLDx
            MEMHOLDx: u8,
            ///  MEMHIZx
            MEMHIZx: u8,
        }),
        ///  Attribute memory space timing register 2
        PATT2: mmio.Mmio(32, packed struct {
            ///  Attribute memory x setup time
            ATTSETx: u8,
            ///  Attribute memory x wait time
            ATTWAITx: u8,
            ///  Attribute memory x hold time
            ATTHOLDx: u8,
            ///  Attribute memory x databus HiZ time
            ATTHIZx: u8,
        }),
        reserved116: [4]u8,
        ///  ECC result register 2
        ECCR2: mmio.Mmio(32, packed struct {
            ///  ECC result
            ECCx: u32,
        }),
        reserved128: [8]u8,
        ///  PC Card/NAND Flash control register 3
        PCR3: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  PWAITEN
            PWAITEN: u1,
            ///  PBKEN
            PBKEN: u1,
            ///  PTYP
            PTYP: u1,
            ///  PWID
            PWID: u2,
            ///  ECCEN
            ECCEN: u1,
            reserved9: u2 = 0,
            ///  TCLR
            TCLR: u4,
            ///  TAR
            TAR: u4,
            ///  ECCPS
            ECCPS: u3,
            padding: u12 = 0,
        }),
        ///  FIFO status and interrupt register 3
        SR3: mmio.Mmio(32, packed struct {
            ///  IRS
            IRS: u1,
            ///  ILS
            ILS: u1,
            ///  IFS
            IFS: u1,
            ///  IREN
            IREN: u1,
            ///  ILEN
            ILEN: u1,
            ///  IFEN
            IFEN: u1,
            ///  FEMPT
            FEMPT: u1,
            padding: u25 = 0,
        }),
        ///  Common memory space timing register 3
        PMEM3: mmio.Mmio(32, packed struct {
            ///  MEMSETx
            MEMSETx: u8,
            ///  MEMWAITx
            MEMWAITx: u8,
            ///  MEMHOLDx
            MEMHOLDx: u8,
            ///  MEMHIZx
            MEMHIZx: u8,
        }),
        ///  Attribute memory space timing register 3
        PATT3: mmio.Mmio(32, packed struct {
            ///  ATTSETx
            ATTSETx: u8,
            ///  ATTWAITx
            ATTWAITx: u8,
            ///  ATTHOLDx
            ATTHOLDx: u8,
            ///  ATTHIZx
            ATTHIZx: u8,
        }),
        reserved148: [4]u8,
        ///  ECC result register 3
        ECCR3: mmio.Mmio(32, packed struct {
            ///  ECCx
            ECCx: u32,
        }),
        reserved160: [8]u8,
        ///  PC Card/NAND Flash control register 4
        PCR4: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  PWAITEN
            PWAITEN: u1,
            ///  PBKEN
            PBKEN: u1,
            ///  PTYP
            PTYP: u1,
            ///  PWID
            PWID: u2,
            ///  ECCEN
            ECCEN: u1,
            reserved9: u2 = 0,
            ///  TCLR
            TCLR: u4,
            ///  TAR
            TAR: u4,
            ///  ECCPS
            ECCPS: u3,
            padding: u12 = 0,
        }),
        ///  FIFO status and interrupt register 4
        SR4: mmio.Mmio(32, packed struct {
            ///  IRS
            IRS: u1,
            ///  ILS
            ILS: u1,
            ///  IFS
            IFS: u1,
            ///  IREN
            IREN: u1,
            ///  ILEN
            ILEN: u1,
            ///  IFEN
            IFEN: u1,
            ///  FEMPT
            FEMPT: u1,
            padding: u25 = 0,
        }),
        ///  Common memory space timing register 4
        PMEM4: mmio.Mmio(32, packed struct {
            ///  MEMSETx
            MEMSETx: u8,
            ///  MEMWAITx
            MEMWAITx: u8,
            ///  MEMHOLDx
            MEMHOLDx: u8,
            ///  MEMHIZx
            MEMHIZx: u8,
        }),
        ///  Attribute memory space timing register 4
        PATT4: mmio.Mmio(32, packed struct {
            ///  ATTSETx
            ATTSETx: u8,
            ///  ATTWAITx
            ATTWAITx: u8,
            ///  ATTHOLDx
            ATTHOLDx: u8,
            ///  ATTHIZx
            ATTHIZx: u8,
        }),
        ///  I/O space timing register 4
        PIO4: mmio.Mmio(32, packed struct {
            ///  IOSETx
            IOSETx: u8,
            ///  IOWAITx
            IOWAITx: u8,
            ///  IOHOLDx
            IOHOLDx: u8,
            ///  IOHIZx
            IOHIZx: u8,
        }),
        reserved260: [80]u8,
        ///  SRAM/NOR-Flash write timing registers 1
        BWTR1: mmio.Mmio(32, packed struct {
            ///  ADDSET
            ADDSET: u4,
            ///  ADDHLD
            ADDHLD: u4,
            ///  DATAST
            DATAST: u8,
            reserved20: u4 = 0,
            ///  CLKDIV
            CLKDIV: u4,
            ///  DATLAT
            DATLAT: u4,
            ///  ACCMOD
            ACCMOD: u2,
            padding: u2 = 0,
        }),
        reserved268: [4]u8,
        ///  SRAM/NOR-Flash write timing registers 2
        BWTR2: mmio.Mmio(32, packed struct {
            ///  ADDSET
            ADDSET: u4,
            ///  ADDHLD
            ADDHLD: u4,
            ///  DATAST
            DATAST: u8,
            reserved20: u4 = 0,
            ///  CLKDIV
            CLKDIV: u4,
            ///  DATLAT
            DATLAT: u4,
            ///  ACCMOD
            ACCMOD: u2,
            padding: u2 = 0,
        }),
        reserved276: [4]u8,
        ///  SRAM/NOR-Flash write timing registers 3
        BWTR3: mmio.Mmio(32, packed struct {
            ///  ADDSET
            ADDSET: u4,
            ///  ADDHLD
            ADDHLD: u4,
            ///  DATAST
            DATAST: u8,
            reserved20: u4 = 0,
            ///  CLKDIV
            CLKDIV: u4,
            ///  DATLAT
            DATLAT: u4,
            ///  ACCMOD
            ACCMOD: u2,
            padding: u2 = 0,
        }),
        reserved284: [4]u8,
        ///  SRAM/NOR-Flash write timing registers 4
        BWTR4: mmio.Mmio(32, packed struct {
            ///  ADDSET
            ADDSET: u4,
            ///  ADDHLD
            ADDHLD: u4,
            ///  DATAST
            DATAST: u8,
            reserved20: u4 = 0,
            ///  CLKDIV
            CLKDIV: u4,
            ///  DATLAT
            DATLAT: u4,
            ///  ACCMOD
            ACCMOD: u2,
            padding: u2 = 0,
        }),
    };

    ///  Power control
    pub const PWR = extern struct {
        ///  Power control register (PWR_CR)
        CR: mmio.Mmio(32, packed struct {
            ///  Low Power Deep Sleep
            LPDS: u1,
            ///  Power Down Deep Sleep
            PDDS: u1,
            ///  Clear Wake-up Flag
            CWUF: u1,
            ///  Clear STANDBY Flag
            CSBF: u1,
            ///  Power Voltage Detector Enable
            PVDE: u1,
            ///  PVD Level Selection
            PLS: u3,
            ///  Disable Backup Domain write protection
            DBP: u1,
            padding: u23 = 0,
        }),
        ///  Power control register (PWR_CR)
        CSR: mmio.Mmio(32, packed struct {
            ///  Wake-Up Flag
            WUF: u1,
            ///  STANDBY Flag
            SBF: u1,
            ///  PVD Output
            PVDO: u1,
            reserved8: u5 = 0,
            ///  Enable WKUP pin
            EWUP: u1,
            padding: u23 = 0,
        }),
    };

    ///  Reset and clock control
    pub const RCC = extern struct {
        ///  Clock control register
        CR: mmio.Mmio(32, packed struct {
            ///  Internal High Speed clock enable
            HSION: u1,
            ///  Internal High Speed clock ready flag
            HSIRDY: u1,
            reserved3: u1 = 0,
            ///  Internal High Speed clock trimming
            HSITRIM: u5,
            ///  Internal High Speed clock Calibration
            HSICAL: u8,
            ///  External High Speed clock enable
            HSEON: u1,
            ///  External High Speed clock ready flag
            HSERDY: u1,
            ///  External High Speed clock Bypass
            HSEBYP: u1,
            ///  Clock Security System enable
            CSSON: u1,
            reserved24: u4 = 0,
            ///  PLL enable
            PLLON: u1,
            ///  PLL clock ready flag
            PLLRDY: u1,
            padding: u6 = 0,
        }),
        ///  Clock configuration register (RCC_CFGR)
        CFGR: mmio.Mmio(32, packed struct {
            ///  System clock Switch
            SW: u2,
            ///  System Clock Switch Status
            SWS: u2,
            ///  AHB prescaler
            HPRE: u4,
            ///  APB Low speed prescaler (APB1)
            PPRE1: u3,
            ///  APB High speed prescaler (APB2)
            PPRE2: u3,
            ///  ADC prescaler
            ADCPRE: u2,
            ///  PLL entry clock source
            PLLSRC: u1,
            ///  HSE divider for PLL entry
            PLLXTPRE: u1,
            ///  PLL Multiplication Factor
            PLLMUL: u4,
            ///  USB OTG FS prescaler
            OTGFSPRE: u1,
            reserved24: u1 = 0,
            ///  Microcontroller clock output
            MCO: u3,
            padding: u5 = 0,
        }),
        ///  Clock interrupt register (RCC_CIR)
        CIR: mmio.Mmio(32, packed struct {
            ///  LSI Ready Interrupt flag
            LSIRDYF: u1,
            ///  LSE Ready Interrupt flag
            LSERDYF: u1,
            ///  HSI Ready Interrupt flag
            HSIRDYF: u1,
            ///  HSE Ready Interrupt flag
            HSERDYF: u1,
            ///  PLL Ready Interrupt flag
            PLLRDYF: u1,
            reserved7: u2 = 0,
            ///  Clock Security System Interrupt flag
            CSSF: u1,
            ///  LSI Ready Interrupt Enable
            LSIRDYIE: u1,
            ///  LSE Ready Interrupt Enable
            LSERDYIE: u1,
            ///  HSI Ready Interrupt Enable
            HSIRDYIE: u1,
            ///  HSE Ready Interrupt Enable
            HSERDYIE: u1,
            ///  PLL Ready Interrupt Enable
            PLLRDYIE: u1,
            reserved16: u3 = 0,
            ///  LSI Ready Interrupt Clear
            LSIRDYC: u1,
            ///  LSE Ready Interrupt Clear
            LSERDYC: u1,
            ///  HSI Ready Interrupt Clear
            HSIRDYC: u1,
            ///  HSE Ready Interrupt Clear
            HSERDYC: u1,
            ///  PLL Ready Interrupt Clear
            PLLRDYC: u1,
            reserved23: u2 = 0,
            ///  Clock security system interrupt clear
            CSSC: u1,
            padding: u8 = 0,
        }),
        ///  APB2 peripheral reset register (RCC_APB2RSTR)
        APB2RSTR: mmio.Mmio(32, packed struct {
            ///  Alternate function I/O reset
            AFIORST: u1,
            reserved2: u1 = 0,
            ///  IO port A reset
            IOPARST: u1,
            ///  IO port B reset
            IOPBRST: u1,
            ///  IO port C reset
            IOPCRST: u1,
            ///  IO port D reset
            IOPDRST: u1,
            ///  IO port E reset
            IOPERST: u1,
            ///  IO port F reset
            IOPFRST: u1,
            ///  IO port G reset
            IOPGRST: u1,
            ///  ADC 1 interface reset
            ADC1RST: u1,
            ///  ADC 2 interface reset
            ADC2RST: u1,
            ///  TIM1 timer reset
            TIM1RST: u1,
            ///  SPI 1 reset
            SPI1RST: u1,
            ///  TIM8 timer reset
            TIM8RST: u1,
            ///  USART1 reset
            USART1RST: u1,
            ///  ADC 3 interface reset
            ADC3RST: u1,
            reserved19: u3 = 0,
            ///  TIM9 timer reset
            TIM9RST: u1,
            ///  TIM10 timer reset
            TIM10RST: u1,
            ///  TIM11 timer reset
            TIM11RST: u1,
            padding: u10 = 0,
        }),
        ///  APB1 peripheral reset register (RCC_APB1RSTR)
        APB1RSTR: mmio.Mmio(32, packed struct {
            ///  Timer 2 reset
            TIM2RST: u1,
            ///  Timer 3 reset
            TIM3RST: u1,
            ///  Timer 4 reset
            TIM4RST: u1,
            ///  Timer 5 reset
            TIM5RST: u1,
            ///  Timer 6 reset
            TIM6RST: u1,
            ///  Timer 7 reset
            TIM7RST: u1,
            ///  Timer 12 reset
            TIM12RST: u1,
            ///  Timer 13 reset
            TIM13RST: u1,
            ///  Timer 14 reset
            TIM14RST: u1,
            reserved11: u2 = 0,
            ///  Window watchdog reset
            WWDGRST: u1,
            reserved14: u2 = 0,
            ///  SPI2 reset
            SPI2RST: u1,
            ///  SPI3 reset
            SPI3RST: u1,
            reserved17: u1 = 0,
            ///  USART 2 reset
            USART2RST: u1,
            ///  USART 3 reset
            USART3RST: u1,
            ///  UART 4 reset
            UART4RST: u1,
            ///  UART 5 reset
            UART5RST: u1,
            ///  I2C1 reset
            I2C1RST: u1,
            ///  I2C2 reset
            I2C2RST: u1,
            ///  USB reset
            USBRST: u1,
            reserved25: u1 = 0,
            ///  CAN reset
            CANRST: u1,
            reserved27: u1 = 0,
            ///  Backup interface reset
            BKPRST: u1,
            ///  Power interface reset
            PWRRST: u1,
            ///  DAC interface reset
            DACRST: u1,
            padding: u2 = 0,
        }),
        ///  AHB Peripheral Clock enable register (RCC_AHBENR)
        AHBENR: mmio.Mmio(32, packed struct {
            ///  DMA1 clock enable
            DMA1EN: u1,
            ///  DMA2 clock enable
            DMA2EN: u1,
            ///  SRAM interface clock enable
            SRAMEN: u1,
            reserved4: u1 = 0,
            ///  FLITF clock enable
            FLITFEN: u1,
            reserved6: u1 = 0,
            ///  CRC clock enable
            CRCEN: u1,
            reserved8: u1 = 0,
            ///  FSMC clock enable
            FSMCEN: u1,
            reserved10: u1 = 0,
            ///  SDIO clock enable
            SDIOEN: u1,
            padding: u21 = 0,
        }),
        ///  APB2 peripheral clock enable register (RCC_APB2ENR)
        APB2ENR: mmio.Mmio(32, packed struct {
            ///  Alternate function I/O clock enable
            AFIOEN: u1,
            reserved2: u1 = 0,
            ///  I/O port A clock enable
            IOPAEN: u1,
            ///  I/O port B clock enable
            IOPBEN: u1,
            ///  I/O port C clock enable
            IOPCEN: u1,
            ///  I/O port D clock enable
            IOPDEN: u1,
            ///  I/O port E clock enable
            IOPEEN: u1,
            ///  I/O port F clock enable
            IOPFEN: u1,
            ///  I/O port G clock enable
            IOPGEN: u1,
            ///  ADC 1 interface clock enable
            ADC1EN: u1,
            ///  ADC 2 interface clock enable
            ADC2EN: u1,
            ///  TIM1 Timer clock enable
            TIM1EN: u1,
            ///  SPI 1 clock enable
            SPI1EN: u1,
            ///  TIM8 Timer clock enable
            TIM8EN: u1,
            ///  USART1 clock enable
            USART1EN: u1,
            ///  ADC3 interface clock enable
            ADC3EN: u1,
            reserved19: u3 = 0,
            ///  TIM9 Timer clock enable
            TIM9EN: u1,
            ///  TIM10 Timer clock enable
            TIM10EN: u1,
            ///  TIM11 Timer clock enable
            TIM11EN: u1,
            padding: u10 = 0,
        }),
        ///  APB1 peripheral clock enable register (RCC_APB1ENR)
        APB1ENR: mmio.Mmio(32, packed struct {
            ///  Timer 2 clock enable
            TIM2EN: u1,
            ///  Timer 3 clock enable
            TIM3EN: u1,
            ///  Timer 4 clock enable
            TIM4EN: u1,
            ///  Timer 5 clock enable
            TIM5EN: u1,
            ///  Timer 6 clock enable
            TIM6EN: u1,
            ///  Timer 7 clock enable
            TIM7EN: u1,
            ///  Timer 12 clock enable
            TIM12EN: u1,
            ///  Timer 13 clock enable
            TIM13EN: u1,
            ///  Timer 14 clock enable
            TIM14EN: u1,
            reserved11: u2 = 0,
            ///  Window watchdog clock enable
            WWDGEN: u1,
            reserved14: u2 = 0,
            ///  SPI 2 clock enable
            SPI2EN: u1,
            ///  SPI 3 clock enable
            SPI3EN: u1,
            reserved17: u1 = 0,
            ///  USART 2 clock enable
            USART2EN: u1,
            ///  USART 3 clock enable
            USART3EN: u1,
            ///  UART 4 clock enable
            UART4EN: u1,
            ///  UART 5 clock enable
            UART5EN: u1,
            ///  I2C 1 clock enable
            I2C1EN: u1,
            ///  I2C 2 clock enable
            I2C2EN: u1,
            ///  USB clock enable
            USBEN: u1,
            reserved25: u1 = 0,
            ///  CAN clock enable
            CANEN: u1,
            reserved27: u1 = 0,
            ///  Backup interface clock enable
            BKPEN: u1,
            ///  Power interface clock enable
            PWREN: u1,
            ///  DAC interface clock enable
            DACEN: u1,
            padding: u2 = 0,
        }),
        ///  Backup domain control register (RCC_BDCR)
        BDCR: mmio.Mmio(32, packed struct {
            ///  External Low Speed oscillator enable
            LSEON: u1,
            ///  External Low Speed oscillator ready
            LSERDY: u1,
            ///  External Low Speed oscillator bypass
            LSEBYP: u1,
            reserved8: u5 = 0,
            ///  RTC clock source selection
            RTCSEL: u2,
            reserved15: u5 = 0,
            ///  RTC clock enable
            RTCEN: u1,
            ///  Backup domain software reset
            BDRST: u1,
            padding: u15 = 0,
        }),
        ///  Control/status register (RCC_CSR)
        CSR: mmio.Mmio(32, packed struct {
            ///  Internal low speed oscillator enable
            LSION: u1,
            ///  Internal low speed oscillator ready
            LSIRDY: u1,
            reserved24: u22 = 0,
            ///  Remove reset flag
            RMVF: u1,
            reserved26: u1 = 0,
            ///  PIN reset flag
            PINRSTF: u1,
            ///  POR/PDR reset flag
            PORRSTF: u1,
            ///  Software reset flag
            SFTRSTF: u1,
            ///  Independent watchdog reset flag
            IWDGRSTF: u1,
            ///  Window watchdog reset flag
            WWDGRSTF: u1,
            ///  Low-power reset flag
            LPWRRSTF: u1,
        }),
    };

    ///  General purpose I/O
    pub const GPIOA = extern struct {
        ///  Port configuration register low (GPIOn_CRL)
        CRL: mmio.Mmio(32, packed struct {
            ///  Port n.0 mode bits
            MODE0: u2,
            ///  Port n.0 configuration bits
            CNF0: u2,
            ///  Port n.1 mode bits
            MODE1: u2,
            ///  Port n.1 configuration bits
            CNF1: u2,
            ///  Port n.2 mode bits
            MODE2: u2,
            ///  Port n.2 configuration bits
            CNF2: u2,
            ///  Port n.3 mode bits
            MODE3: u2,
            ///  Port n.3 configuration bits
            CNF3: u2,
            ///  Port n.4 mode bits
            MODE4: u2,
            ///  Port n.4 configuration bits
            CNF4: u2,
            ///  Port n.5 mode bits
            MODE5: u2,
            ///  Port n.5 configuration bits
            CNF5: u2,
            ///  Port n.6 mode bits
            MODE6: u2,
            ///  Port n.6 configuration bits
            CNF6: u2,
            ///  Port n.7 mode bits
            MODE7: u2,
            ///  Port n.7 configuration bits
            CNF7: u2,
        }),
        ///  Port configuration register high (GPIOn_CRL)
        CRH: mmio.Mmio(32, packed struct {
            ///  Port n.8 mode bits
            MODE8: u2,
            ///  Port n.8 configuration bits
            CNF8: u2,
            ///  Port n.9 mode bits
            MODE9: u2,
            ///  Port n.9 configuration bits
            CNF9: u2,
            ///  Port n.10 mode bits
            MODE10: u2,
            ///  Port n.10 configuration bits
            CNF10: u2,
            ///  Port n.11 mode bits
            MODE11: u2,
            ///  Port n.11 configuration bits
            CNF11: u2,
            ///  Port n.12 mode bits
            MODE12: u2,
            ///  Port n.12 configuration bits
            CNF12: u2,
            ///  Port n.13 mode bits
            MODE13: u2,
            ///  Port n.13 configuration bits
            CNF13: u2,
            ///  Port n.14 mode bits
            MODE14: u2,
            ///  Port n.14 configuration bits
            CNF14: u2,
            ///  Port n.15 mode bits
            MODE15: u2,
            ///  Port n.15 configuration bits
            CNF15: u2,
        }),
        ///  Port input data register (GPIOn_IDR)
        IDR: mmio.Mmio(32, packed struct {
            ///  Port input data
            IDR0: u1,
            ///  Port input data
            IDR1: u1,
            ///  Port input data
            IDR2: u1,
            ///  Port input data
            IDR3: u1,
            ///  Port input data
            IDR4: u1,
            ///  Port input data
            IDR5: u1,
            ///  Port input data
            IDR6: u1,
            ///  Port input data
            IDR7: u1,
            ///  Port input data
            IDR8: u1,
            ///  Port input data
            IDR9: u1,
            ///  Port input data
            IDR10: u1,
            ///  Port input data
            IDR11: u1,
            ///  Port input data
            IDR12: u1,
            ///  Port input data
            IDR13: u1,
            ///  Port input data
            IDR14: u1,
            ///  Port input data
            IDR15: u1,
            padding: u16 = 0,
        }),
        ///  Port output data register (GPIOn_ODR)
        ODR: mmio.Mmio(32, packed struct {
            ///  Port output data
            ODR0: u1,
            ///  Port output data
            ODR1: u1,
            ///  Port output data
            ODR2: u1,
            ///  Port output data
            ODR3: u1,
            ///  Port output data
            ODR4: u1,
            ///  Port output data
            ODR5: u1,
            ///  Port output data
            ODR6: u1,
            ///  Port output data
            ODR7: u1,
            ///  Port output data
            ODR8: u1,
            ///  Port output data
            ODR9: u1,
            ///  Port output data
            ODR10: u1,
            ///  Port output data
            ODR11: u1,
            ///  Port output data
            ODR12: u1,
            ///  Port output data
            ODR13: u1,
            ///  Port output data
            ODR14: u1,
            ///  Port output data
            ODR15: u1,
            padding: u16 = 0,
        }),
        ///  Port bit set/reset register (GPIOn_BSRR)
        BSRR: mmio.Mmio(32, packed struct {
            ///  Set bit 0
            BS0: u1,
            ///  Set bit 1
            BS1: u1,
            ///  Set bit 1
            BS2: u1,
            ///  Set bit 3
            BS3: u1,
            ///  Set bit 4
            BS4: u1,
            ///  Set bit 5
            BS5: u1,
            ///  Set bit 6
            BS6: u1,
            ///  Set bit 7
            BS7: u1,
            ///  Set bit 8
            BS8: u1,
            ///  Set bit 9
            BS9: u1,
            ///  Set bit 10
            BS10: u1,
            ///  Set bit 11
            BS11: u1,
            ///  Set bit 12
            BS12: u1,
            ///  Set bit 13
            BS13: u1,
            ///  Set bit 14
            BS14: u1,
            ///  Set bit 15
            BS15: u1,
            ///  Reset bit 0
            BR0: u1,
            ///  Reset bit 1
            BR1: u1,
            ///  Reset bit 2
            BR2: u1,
            ///  Reset bit 3
            BR3: u1,
            ///  Reset bit 4
            BR4: u1,
            ///  Reset bit 5
            BR5: u1,
            ///  Reset bit 6
            BR6: u1,
            ///  Reset bit 7
            BR7: u1,
            ///  Reset bit 8
            BR8: u1,
            ///  Reset bit 9
            BR9: u1,
            ///  Reset bit 10
            BR10: u1,
            ///  Reset bit 11
            BR11: u1,
            ///  Reset bit 12
            BR12: u1,
            ///  Reset bit 13
            BR13: u1,
            ///  Reset bit 14
            BR14: u1,
            ///  Reset bit 15
            BR15: u1,
        }),
        ///  Port bit reset register (GPIOn_BRR)
        BRR: mmio.Mmio(32, packed struct {
            ///  Reset bit 0
            BR0: u1,
            ///  Reset bit 1
            BR1: u1,
            ///  Reset bit 1
            BR2: u1,
            ///  Reset bit 3
            BR3: u1,
            ///  Reset bit 4
            BR4: u1,
            ///  Reset bit 5
            BR5: u1,
            ///  Reset bit 6
            BR6: u1,
            ///  Reset bit 7
            BR7: u1,
            ///  Reset bit 8
            BR8: u1,
            ///  Reset bit 9
            BR9: u1,
            ///  Reset bit 10
            BR10: u1,
            ///  Reset bit 11
            BR11: u1,
            ///  Reset bit 12
            BR12: u1,
            ///  Reset bit 13
            BR13: u1,
            ///  Reset bit 14
            BR14: u1,
            ///  Reset bit 15
            BR15: u1,
            padding: u16 = 0,
        }),
        ///  Port configuration lock register
        LCKR: mmio.Mmio(32, packed struct {
            ///  Port A Lock bit 0
            LCK0: u1,
            ///  Port A Lock bit 1
            LCK1: u1,
            ///  Port A Lock bit 2
            LCK2: u1,
            ///  Port A Lock bit 3
            LCK3: u1,
            ///  Port A Lock bit 4
            LCK4: u1,
            ///  Port A Lock bit 5
            LCK5: u1,
            ///  Port A Lock bit 6
            LCK6: u1,
            ///  Port A Lock bit 7
            LCK7: u1,
            ///  Port A Lock bit 8
            LCK8: u1,
            ///  Port A Lock bit 9
            LCK9: u1,
            ///  Port A Lock bit 10
            LCK10: u1,
            ///  Port A Lock bit 11
            LCK11: u1,
            ///  Port A Lock bit 12
            LCK12: u1,
            ///  Port A Lock bit 13
            LCK13: u1,
            ///  Port A Lock bit 14
            LCK14: u1,
            ///  Port A Lock bit 15
            LCK15: u1,
            ///  Lock key
            LCKK: u1,
            padding: u15 = 0,
        }),
    };

    ///  Alternate function I/O
    pub const AFIO = extern struct {
        ///  Event Control Register (AFIO_EVCR)
        EVCR: mmio.Mmio(32, packed struct {
            ///  Pin selection
            PIN: u4,
            ///  Port selection
            PORT: u3,
            ///  Event Output Enable
            EVOE: u1,
            padding: u24 = 0,
        }),
        ///  AF remap and debug I/O configuration register (AFIO_MAPR)
        MAPR: mmio.Mmio(32, packed struct {
            ///  SPI1 remapping
            SPI1_REMAP: u1,
            ///  I2C1 remapping
            I2C1_REMAP: u1,
            ///  USART1 remapping
            USART1_REMAP: u1,
            ///  USART2 remapping
            USART2_REMAP: u1,
            ///  USART3 remapping
            USART3_REMAP: u2,
            ///  TIM1 remapping
            TIM1_REMAP: u2,
            ///  TIM2 remapping
            TIM2_REMAP: u2,
            ///  TIM3 remapping
            TIM3_REMAP: u2,
            ///  TIM4 remapping
            TIM4_REMAP: u1,
            ///  CAN1 remapping
            CAN_REMAP: u2,
            ///  Port D0/Port D1 mapping on OSCIN/OSCOUT
            PD01_REMAP: u1,
            ///  Set and cleared by software
            TIM5CH4_IREMAP: u1,
            ///  ADC 1 External trigger injected conversion remapping
            ADC1_ETRGINJ_REMAP: u1,
            ///  ADC 1 external trigger regular conversion remapping
            ADC1_ETRGREG_REMAP: u1,
            ///  ADC 2 external trigger injected conversion remapping
            ADC2_ETRGINJ_REMAP: u1,
            ///  ADC 2 external trigger regular conversion remapping
            ADC2_ETRGREG_REMAP: u1,
            reserved24: u3 = 0,
            ///  Serial wire JTAG configuration
            SWJ_CFG: u3,
            padding: u5 = 0,
        }),
        ///  External interrupt configuration register 1 (AFIO_EXTICR1)
        EXTICR1: mmio.Mmio(32, packed struct {
            ///  EXTI0 configuration
            EXTI0: u4,
            ///  EXTI1 configuration
            EXTI1: u4,
            ///  EXTI2 configuration
            EXTI2: u4,
            ///  EXTI3 configuration
            EXTI3: u4,
            padding: u16 = 0,
        }),
        ///  External interrupt configuration register 2 (AFIO_EXTICR2)
        EXTICR2: mmio.Mmio(32, packed struct {
            ///  EXTI4 configuration
            EXTI4: u4,
            ///  EXTI5 configuration
            EXTI5: u4,
            ///  EXTI6 configuration
            EXTI6: u4,
            ///  EXTI7 configuration
            EXTI7: u4,
            padding: u16 = 0,
        }),
        ///  External interrupt configuration register 3 (AFIO_EXTICR3)
        EXTICR3: mmio.Mmio(32, packed struct {
            ///  EXTI8 configuration
            EXTI8: u4,
            ///  EXTI9 configuration
            EXTI9: u4,
            ///  EXTI10 configuration
            EXTI10: u4,
            ///  EXTI11 configuration
            EXTI11: u4,
            padding: u16 = 0,
        }),
        ///  External interrupt configuration register 4 (AFIO_EXTICR4)
        EXTICR4: mmio.Mmio(32, packed struct {
            ///  EXTI12 configuration
            EXTI12: u4,
            ///  EXTI13 configuration
            EXTI13: u4,
            ///  EXTI14 configuration
            EXTI14: u4,
            ///  EXTI15 configuration
            EXTI15: u4,
            padding: u16 = 0,
        }),
        reserved28: [4]u8,
        ///  AF remap and debug I/O configuration register
        MAPR2: mmio.Mmio(32, packed struct {
            reserved5: u5 = 0,
            ///  TIM9 remapping
            TIM9_REMAP: u1,
            ///  TIM10 remapping
            TIM10_REMAP: u1,
            ///  TIM11 remapping
            TIM11_REMAP: u1,
            ///  TIM13 remapping
            TIM13_REMAP: u1,
            ///  TIM14 remapping
            TIM14_REMAP: u1,
            ///  NADV connect/disconnect
            FSMC_NADV: u1,
            padding: u21 = 0,
        }),
    };

    ///  EXTI
    pub const EXTI = extern struct {
        ///  Interrupt mask register (EXTI_IMR)
        IMR: mmio.Mmio(32, packed struct {
            ///  Interrupt Mask on line 0
            MR0: u1,
            ///  Interrupt Mask on line 1
            MR1: u1,
            ///  Interrupt Mask on line 2
            MR2: u1,
            ///  Interrupt Mask on line 3
            MR3: u1,
            ///  Interrupt Mask on line 4
            MR4: u1,
            ///  Interrupt Mask on line 5
            MR5: u1,
            ///  Interrupt Mask on line 6
            MR6: u1,
            ///  Interrupt Mask on line 7
            MR7: u1,
            ///  Interrupt Mask on line 8
            MR8: u1,
            ///  Interrupt Mask on line 9
            MR9: u1,
            ///  Interrupt Mask on line 10
            MR10: u1,
            ///  Interrupt Mask on line 11
            MR11: u1,
            ///  Interrupt Mask on line 12
            MR12: u1,
            ///  Interrupt Mask on line 13
            MR13: u1,
            ///  Interrupt Mask on line 14
            MR14: u1,
            ///  Interrupt Mask on line 15
            MR15: u1,
            ///  Interrupt Mask on line 16
            MR16: u1,
            ///  Interrupt Mask on line 17
            MR17: u1,
            ///  Interrupt Mask on line 18
            MR18: u1,
            padding: u13 = 0,
        }),
        ///  Event mask register (EXTI_EMR)
        EMR: mmio.Mmio(32, packed struct {
            ///  Event Mask on line 0
            MR0: u1,
            ///  Event Mask on line 1
            MR1: u1,
            ///  Event Mask on line 2
            MR2: u1,
            ///  Event Mask on line 3
            MR3: u1,
            ///  Event Mask on line 4
            MR4: u1,
            ///  Event Mask on line 5
            MR5: u1,
            ///  Event Mask on line 6
            MR6: u1,
            ///  Event Mask on line 7
            MR7: u1,
            ///  Event Mask on line 8
            MR8: u1,
            ///  Event Mask on line 9
            MR9: u1,
            ///  Event Mask on line 10
            MR10: u1,
            ///  Event Mask on line 11
            MR11: u1,
            ///  Event Mask on line 12
            MR12: u1,
            ///  Event Mask on line 13
            MR13: u1,
            ///  Event Mask on line 14
            MR14: u1,
            ///  Event Mask on line 15
            MR15: u1,
            ///  Event Mask on line 16
            MR16: u1,
            ///  Event Mask on line 17
            MR17: u1,
            ///  Event Mask on line 18
            MR18: u1,
            padding: u13 = 0,
        }),
        ///  Rising Trigger selection register (EXTI_RTSR)
        RTSR: mmio.Mmio(32, packed struct {
            ///  Rising trigger event configuration of line 0
            TR0: u1,
            ///  Rising trigger event configuration of line 1
            TR1: u1,
            ///  Rising trigger event configuration of line 2
            TR2: u1,
            ///  Rising trigger event configuration of line 3
            TR3: u1,
            ///  Rising trigger event configuration of line 4
            TR4: u1,
            ///  Rising trigger event configuration of line 5
            TR5: u1,
            ///  Rising trigger event configuration of line 6
            TR6: u1,
            ///  Rising trigger event configuration of line 7
            TR7: u1,
            ///  Rising trigger event configuration of line 8
            TR8: u1,
            ///  Rising trigger event configuration of line 9
            TR9: u1,
            ///  Rising trigger event configuration of line 10
            TR10: u1,
            ///  Rising trigger event configuration of line 11
            TR11: u1,
            ///  Rising trigger event configuration of line 12
            TR12: u1,
            ///  Rising trigger event configuration of line 13
            TR13: u1,
            ///  Rising trigger event configuration of line 14
            TR14: u1,
            ///  Rising trigger event configuration of line 15
            TR15: u1,
            ///  Rising trigger event configuration of line 16
            TR16: u1,
            ///  Rising trigger event configuration of line 17
            TR17: u1,
            ///  Rising trigger event configuration of line 18
            TR18: u1,
            padding: u13 = 0,
        }),
        ///  Falling Trigger selection register (EXTI_FTSR)
        FTSR: mmio.Mmio(32, packed struct {
            ///  Falling trigger event configuration of line 0
            TR0: u1,
            ///  Falling trigger event configuration of line 1
            TR1: u1,
            ///  Falling trigger event configuration of line 2
            TR2: u1,
            ///  Falling trigger event configuration of line 3
            TR3: u1,
            ///  Falling trigger event configuration of line 4
            TR4: u1,
            ///  Falling trigger event configuration of line 5
            TR5: u1,
            ///  Falling trigger event configuration of line 6
            TR6: u1,
            ///  Falling trigger event configuration of line 7
            TR7: u1,
            ///  Falling trigger event configuration of line 8
            TR8: u1,
            ///  Falling trigger event configuration of line 9
            TR9: u1,
            ///  Falling trigger event configuration of line 10
            TR10: u1,
            ///  Falling trigger event configuration of line 11
            TR11: u1,
            ///  Falling trigger event configuration of line 12
            TR12: u1,
            ///  Falling trigger event configuration of line 13
            TR13: u1,
            ///  Falling trigger event configuration of line 14
            TR14: u1,
            ///  Falling trigger event configuration of line 15
            TR15: u1,
            ///  Falling trigger event configuration of line 16
            TR16: u1,
            ///  Falling trigger event configuration of line 17
            TR17: u1,
            ///  Falling trigger event configuration of line 18
            TR18: u1,
            padding: u13 = 0,
        }),
        ///  Software interrupt event register (EXTI_SWIER)
        SWIER: mmio.Mmio(32, packed struct {
            ///  Software Interrupt on line 0
            SWIER0: u1,
            ///  Software Interrupt on line 1
            SWIER1: u1,
            ///  Software Interrupt on line 2
            SWIER2: u1,
            ///  Software Interrupt on line 3
            SWIER3: u1,
            ///  Software Interrupt on line 4
            SWIER4: u1,
            ///  Software Interrupt on line 5
            SWIER5: u1,
            ///  Software Interrupt on line 6
            SWIER6: u1,
            ///  Software Interrupt on line 7
            SWIER7: u1,
            ///  Software Interrupt on line 8
            SWIER8: u1,
            ///  Software Interrupt on line 9
            SWIER9: u1,
            ///  Software Interrupt on line 10
            SWIER10: u1,
            ///  Software Interrupt on line 11
            SWIER11: u1,
            ///  Software Interrupt on line 12
            SWIER12: u1,
            ///  Software Interrupt on line 13
            SWIER13: u1,
            ///  Software Interrupt on line 14
            SWIER14: u1,
            ///  Software Interrupt on line 15
            SWIER15: u1,
            ///  Software Interrupt on line 16
            SWIER16: u1,
            ///  Software Interrupt on line 17
            SWIER17: u1,
            ///  Software Interrupt on line 18
            SWIER18: u1,
            padding: u13 = 0,
        }),
        ///  Pending register (EXTI_PR)
        PR: mmio.Mmio(32, packed struct {
            ///  Pending bit 0
            PR0: u1,
            ///  Pending bit 1
            PR1: u1,
            ///  Pending bit 2
            PR2: u1,
            ///  Pending bit 3
            PR3: u1,
            ///  Pending bit 4
            PR4: u1,
            ///  Pending bit 5
            PR5: u1,
            ///  Pending bit 6
            PR6: u1,
            ///  Pending bit 7
            PR7: u1,
            ///  Pending bit 8
            PR8: u1,
            ///  Pending bit 9
            PR9: u1,
            ///  Pending bit 10
            PR10: u1,
            ///  Pending bit 11
            PR11: u1,
            ///  Pending bit 12
            PR12: u1,
            ///  Pending bit 13
            PR13: u1,
            ///  Pending bit 14
            PR14: u1,
            ///  Pending bit 15
            PR15: u1,
            ///  Pending bit 16
            PR16: u1,
            ///  Pending bit 17
            PR17: u1,
            ///  Pending bit 18
            PR18: u1,
            padding: u13 = 0,
        }),
    };

    ///  DMA controller
    pub const DMA1 = extern struct {
        ///  DMA interrupt status register (DMA_ISR)
        ISR: mmio.Mmio(32, packed struct {
            ///  Channel 1 Global interrupt flag
            GIF1: u1,
            ///  Channel 1 Transfer Complete flag
            TCIF1: u1,
            ///  Channel 1 Half Transfer Complete flag
            HTIF1: u1,
            ///  Channel 1 Transfer Error flag
            TEIF1: u1,
            ///  Channel 2 Global interrupt flag
            GIF2: u1,
            ///  Channel 2 Transfer Complete flag
            TCIF2: u1,
            ///  Channel 2 Half Transfer Complete flag
            HTIF2: u1,
            ///  Channel 2 Transfer Error flag
            TEIF2: u1,
            ///  Channel 3 Global interrupt flag
            GIF3: u1,
            ///  Channel 3 Transfer Complete flag
            TCIF3: u1,
            ///  Channel 3 Half Transfer Complete flag
            HTIF3: u1,
            ///  Channel 3 Transfer Error flag
            TEIF3: u1,
            ///  Channel 4 Global interrupt flag
            GIF4: u1,
            ///  Channel 4 Transfer Complete flag
            TCIF4: u1,
            ///  Channel 4 Half Transfer Complete flag
            HTIF4: u1,
            ///  Channel 4 Transfer Error flag
            TEIF4: u1,
            ///  Channel 5 Global interrupt flag
            GIF5: u1,
            ///  Channel 5 Transfer Complete flag
            TCIF5: u1,
            ///  Channel 5 Half Transfer Complete flag
            HTIF5: u1,
            ///  Channel 5 Transfer Error flag
            TEIF5: u1,
            ///  Channel 6 Global interrupt flag
            GIF6: u1,
            ///  Channel 6 Transfer Complete flag
            TCIF6: u1,
            ///  Channel 6 Half Transfer Complete flag
            HTIF6: u1,
            ///  Channel 6 Transfer Error flag
            TEIF6: u1,
            ///  Channel 7 Global interrupt flag
            GIF7: u1,
            ///  Channel 7 Transfer Complete flag
            TCIF7: u1,
            ///  Channel 7 Half Transfer Complete flag
            HTIF7: u1,
            ///  Channel 7 Transfer Error flag
            TEIF7: u1,
            padding: u4 = 0,
        }),
        ///  DMA interrupt flag clear register (DMA_IFCR)
        IFCR: mmio.Mmio(32, packed struct {
            ///  Channel 1 Global interrupt clear
            CGIF1: u1,
            ///  Channel 1 Transfer Complete clear
            CTCIF1: u1,
            ///  Channel 1 Half Transfer clear
            CHTIF1: u1,
            ///  Channel 1 Transfer Error clear
            CTEIF1: u1,
            ///  Channel 2 Global interrupt clear
            CGIF2: u1,
            ///  Channel 2 Transfer Complete clear
            CTCIF2: u1,
            ///  Channel 2 Half Transfer clear
            CHTIF2: u1,
            ///  Channel 2 Transfer Error clear
            CTEIF2: u1,
            ///  Channel 3 Global interrupt clear
            CGIF3: u1,
            ///  Channel 3 Transfer Complete clear
            CTCIF3: u1,
            ///  Channel 3 Half Transfer clear
            CHTIF3: u1,
            ///  Channel 3 Transfer Error clear
            CTEIF3: u1,
            ///  Channel 4 Global interrupt clear
            CGIF4: u1,
            ///  Channel 4 Transfer Complete clear
            CTCIF4: u1,
            ///  Channel 4 Half Transfer clear
            CHTIF4: u1,
            ///  Channel 4 Transfer Error clear
            CTEIF4: u1,
            ///  Channel 5 Global interrupt clear
            CGIF5: u1,
            ///  Channel 5 Transfer Complete clear
            CTCIF5: u1,
            ///  Channel 5 Half Transfer clear
            CHTIF5: u1,
            ///  Channel 5 Transfer Error clear
            CTEIF5: u1,
            ///  Channel 6 Global interrupt clear
            CGIF6: u1,
            ///  Channel 6 Transfer Complete clear
            CTCIF6: u1,
            ///  Channel 6 Half Transfer clear
            CHTIF6: u1,
            ///  Channel 6 Transfer Error clear
            CTEIF6: u1,
            ///  Channel 7 Global interrupt clear
            CGIF7: u1,
            ///  Channel 7 Transfer Complete clear
            CTCIF7: u1,
            ///  Channel 7 Half Transfer clear
            CHTIF7: u1,
            ///  Channel 7 Transfer Error clear
            CTEIF7: u1,
            padding: u4 = 0,
        }),
        ///  DMA channel configuration register (DMA_CCR)
        CCR1: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half Transfer interrupt enable
            HTIE: u1,
            ///  Transfer error interrupt enable
            TEIE: u1,
            ///  Data transfer direction
            DIR: u1,
            ///  Circular mode
            CIRC: u1,
            ///  Peripheral increment mode
            PINC: u1,
            ///  Memory increment mode
            MINC: u1,
            ///  Peripheral size
            PSIZE: u2,
            ///  Memory size
            MSIZE: u2,
            ///  Channel Priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  DMA channel 1 number of data register
        CNDTR1: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  DMA channel 1 peripheral address register
        CPAR1: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  DMA channel 1 memory address register
        CMAR1: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved28: [4]u8,
        ///  DMA channel configuration register (DMA_CCR)
        CCR2: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half Transfer interrupt enable
            HTIE: u1,
            ///  Transfer error interrupt enable
            TEIE: u1,
            ///  Data transfer direction
            DIR: u1,
            ///  Circular mode
            CIRC: u1,
            ///  Peripheral increment mode
            PINC: u1,
            ///  Memory increment mode
            MINC: u1,
            ///  Peripheral size
            PSIZE: u2,
            ///  Memory size
            MSIZE: u2,
            ///  Channel Priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  DMA channel 2 number of data register
        CNDTR2: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  DMA channel 2 peripheral address register
        CPAR2: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  DMA channel 2 memory address register
        CMAR2: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved48: [4]u8,
        ///  DMA channel configuration register (DMA_CCR)
        CCR3: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half Transfer interrupt enable
            HTIE: u1,
            ///  Transfer error interrupt enable
            TEIE: u1,
            ///  Data transfer direction
            DIR: u1,
            ///  Circular mode
            CIRC: u1,
            ///  Peripheral increment mode
            PINC: u1,
            ///  Memory increment mode
            MINC: u1,
            ///  Peripheral size
            PSIZE: u2,
            ///  Memory size
            MSIZE: u2,
            ///  Channel Priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  DMA channel 3 number of data register
        CNDTR3: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  DMA channel 3 peripheral address register
        CPAR3: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  DMA channel 3 memory address register
        CMAR3: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved68: [4]u8,
        ///  DMA channel configuration register (DMA_CCR)
        CCR4: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half Transfer interrupt enable
            HTIE: u1,
            ///  Transfer error interrupt enable
            TEIE: u1,
            ///  Data transfer direction
            DIR: u1,
            ///  Circular mode
            CIRC: u1,
            ///  Peripheral increment mode
            PINC: u1,
            ///  Memory increment mode
            MINC: u1,
            ///  Peripheral size
            PSIZE: u2,
            ///  Memory size
            MSIZE: u2,
            ///  Channel Priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  DMA channel 4 number of data register
        CNDTR4: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  DMA channel 4 peripheral address register
        CPAR4: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  DMA channel 4 memory address register
        CMAR4: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved88: [4]u8,
        ///  DMA channel configuration register (DMA_CCR)
        CCR5: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half Transfer interrupt enable
            HTIE: u1,
            ///  Transfer error interrupt enable
            TEIE: u1,
            ///  Data transfer direction
            DIR: u1,
            ///  Circular mode
            CIRC: u1,
            ///  Peripheral increment mode
            PINC: u1,
            ///  Memory increment mode
            MINC: u1,
            ///  Peripheral size
            PSIZE: u2,
            ///  Memory size
            MSIZE: u2,
            ///  Channel Priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  DMA channel 5 number of data register
        CNDTR5: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  DMA channel 5 peripheral address register
        CPAR5: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  DMA channel 5 memory address register
        CMAR5: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved108: [4]u8,
        ///  DMA channel configuration register (DMA_CCR)
        CCR6: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half Transfer interrupt enable
            HTIE: u1,
            ///  Transfer error interrupt enable
            TEIE: u1,
            ///  Data transfer direction
            DIR: u1,
            ///  Circular mode
            CIRC: u1,
            ///  Peripheral increment mode
            PINC: u1,
            ///  Memory increment mode
            MINC: u1,
            ///  Peripheral size
            PSIZE: u2,
            ///  Memory size
            MSIZE: u2,
            ///  Channel Priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  DMA channel 6 number of data register
        CNDTR6: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  DMA channel 6 peripheral address register
        CPAR6: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  DMA channel 6 memory address register
        CMAR6: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved128: [4]u8,
        ///  DMA channel configuration register (DMA_CCR)
        CCR7: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half Transfer interrupt enable
            HTIE: u1,
            ///  Transfer error interrupt enable
            TEIE: u1,
            ///  Data transfer direction
            DIR: u1,
            ///  Circular mode
            CIRC: u1,
            ///  Peripheral increment mode
            PINC: u1,
            ///  Memory increment mode
            MINC: u1,
            ///  Peripheral size
            PSIZE: u2,
            ///  Memory size
            MSIZE: u2,
            ///  Channel Priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  DMA channel 7 number of data register
        CNDTR7: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  DMA channel 7 peripheral address register
        CPAR7: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  DMA channel 7 memory address register
        CMAR7: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
    };

    ///  Secure digital input/output interface
    pub const SDIO = extern struct {
        ///  Bits 1:0 = PWRCTRL: Power supply control bits
        POWER: mmio.Mmio(32, packed struct {
            ///  PWRCTRL
            PWRCTRL: u2,
            padding: u30 = 0,
        }),
        ///  SDI clock control register (SDIO_CLKCR)
        CLKCR: mmio.Mmio(32, packed struct {
            ///  Clock divide factor
            CLKDIV: u8,
            ///  Clock enable bit
            CLKEN: u1,
            ///  Power saving configuration bit
            PWRSAV: u1,
            ///  Clock divider bypass enable bit
            BYPASS: u1,
            ///  Wide bus mode enable bit
            WIDBUS: u2,
            ///  SDIO_CK dephasing selection bit
            NEGEDGE: u1,
            ///  HW Flow Control enable
            HWFC_EN: u1,
            padding: u17 = 0,
        }),
        ///  Bits 31:0 = : Command argument
        ARG: mmio.Mmio(32, packed struct {
            ///  Command argument
            CMDARG: u32,
        }),
        ///  SDIO command register (SDIO_CMD)
        CMD: mmio.Mmio(32, packed struct {
            ///  CMDINDEX
            CMDINDEX: u6,
            ///  WAITRESP
            WAITRESP: u2,
            ///  WAITINT
            WAITINT: u1,
            ///  WAITPEND
            WAITPEND: u1,
            ///  CPSMEN
            CPSMEN: u1,
            ///  SDIOSuspend
            SDIOSuspend: u1,
            ///  ENCMDcompl
            ENCMDcompl: u1,
            ///  nIEN
            nIEN: u1,
            ///  CE_ATACMD
            CE_ATACMD: u1,
            padding: u17 = 0,
        }),
        ///  SDIO command register
        RESPCMD: mmio.Mmio(32, packed struct {
            ///  RESPCMD
            RESPCMD: u6,
            padding: u26 = 0,
        }),
        ///  Bits 31:0 = CARDSTATUS1
        RESPI1: mmio.Mmio(32, packed struct {
            ///  CARDSTATUS1
            CARDSTATUS1: u32,
        }),
        ///  Bits 31:0 = CARDSTATUS2
        RESP2: mmio.Mmio(32, packed struct {
            ///  CARDSTATUS2
            CARDSTATUS2: u32,
        }),
        ///  Bits 31:0 = CARDSTATUS3
        RESP3: mmio.Mmio(32, packed struct {
            ///  CARDSTATUS3
            CARDSTATUS3: u32,
        }),
        ///  Bits 31:0 = CARDSTATUS4
        RESP4: mmio.Mmio(32, packed struct {
            ///  CARDSTATUS4
            CARDSTATUS4: u32,
        }),
        ///  Bits 31:0 = DATATIME: Data timeout period
        DTIMER: mmio.Mmio(32, packed struct {
            ///  Data timeout period
            DATATIME: u32,
        }),
        ///  Bits 24:0 = DATALENGTH: Data length value
        DLEN: mmio.Mmio(32, packed struct {
            ///  Data length value
            DATALENGTH: u25,
            padding: u7 = 0,
        }),
        ///  SDIO data control register (SDIO_DCTRL)
        DCTRL: mmio.Mmio(32, packed struct {
            ///  DTEN
            DTEN: u1,
            ///  DTDIR
            DTDIR: u1,
            ///  DTMODE
            DTMODE: u1,
            ///  DMAEN
            DMAEN: u1,
            ///  DBLOCKSIZE
            DBLOCKSIZE: u4,
            ///  PWSTART
            PWSTART: u1,
            ///  PWSTOP
            PWSTOP: u1,
            ///  RWMOD
            RWMOD: u1,
            ///  SDIOEN
            SDIOEN: u1,
            padding: u20 = 0,
        }),
        ///  Bits 24:0 = DATACOUNT: Data count value
        DCOUNT: mmio.Mmio(32, packed struct {
            ///  Data count value
            DATACOUNT: u25,
            padding: u7 = 0,
        }),
        ///  SDIO status register (SDIO_STA)
        STA: mmio.Mmio(32, packed struct {
            ///  CCRCFAIL
            CCRCFAIL: u1,
            ///  DCRCFAIL
            DCRCFAIL: u1,
            ///  CTIMEOUT
            CTIMEOUT: u1,
            ///  DTIMEOUT
            DTIMEOUT: u1,
            ///  TXUNDERR
            TXUNDERR: u1,
            ///  RXOVERR
            RXOVERR: u1,
            ///  CMDREND
            CMDREND: u1,
            ///  CMDSENT
            CMDSENT: u1,
            ///  DATAEND
            DATAEND: u1,
            ///  STBITERR
            STBITERR: u1,
            ///  DBCKEND
            DBCKEND: u1,
            ///  CMDACT
            CMDACT: u1,
            ///  TXACT
            TXACT: u1,
            ///  RXACT
            RXACT: u1,
            ///  TXFIFOHE
            TXFIFOHE: u1,
            ///  RXFIFOHF
            RXFIFOHF: u1,
            ///  TXFIFOF
            TXFIFOF: u1,
            ///  RXFIFOF
            RXFIFOF: u1,
            ///  TXFIFOE
            TXFIFOE: u1,
            ///  RXFIFOE
            RXFIFOE: u1,
            ///  TXDAVL
            TXDAVL: u1,
            ///  RXDAVL
            RXDAVL: u1,
            ///  SDIOIT
            SDIOIT: u1,
            ///  CEATAEND
            CEATAEND: u1,
            padding: u8 = 0,
        }),
        ///  SDIO interrupt clear register (SDIO_ICR)
        ICR: mmio.Mmio(32, packed struct {
            ///  CCRCFAILC
            CCRCFAILC: u1,
            ///  DCRCFAILC
            DCRCFAILC: u1,
            ///  CTIMEOUTC
            CTIMEOUTC: u1,
            ///  DTIMEOUTC
            DTIMEOUTC: u1,
            ///  TXUNDERRC
            TXUNDERRC: u1,
            ///  RXOVERRC
            RXOVERRC: u1,
            ///  CMDRENDC
            CMDRENDC: u1,
            ///  CMDSENTC
            CMDSENTC: u1,
            ///  DATAENDC
            DATAENDC: u1,
            ///  STBITERRC
            STBITERRC: u1,
            ///  DBCKENDC
            DBCKENDC: u1,
            reserved22: u11 = 0,
            ///  SDIOITC
            SDIOITC: u1,
            ///  CEATAENDC
            CEATAENDC: u1,
            padding: u8 = 0,
        }),
        ///  SDIO mask register (SDIO_MASK)
        MASK: mmio.Mmio(32, packed struct {
            ///  CCRCFAILIE
            CCRCFAILIE: u1,
            ///  DCRCFAILIE
            DCRCFAILIE: u1,
            ///  CTIMEOUTIE
            CTIMEOUTIE: u1,
            ///  DTIMEOUTIE
            DTIMEOUTIE: u1,
            ///  TXUNDERRIE
            TXUNDERRIE: u1,
            ///  RXOVERRIE
            RXOVERRIE: u1,
            ///  CMDRENDIE
            CMDRENDIE: u1,
            ///  CMDSENTIE
            CMDSENTIE: u1,
            ///  DATAENDIE
            DATAENDIE: u1,
            ///  STBITERRIE
            STBITERRIE: u1,
            ///  DBACKENDIE
            DBACKENDIE: u1,
            ///  CMDACTIE
            CMDACTIE: u1,
            ///  TXACTIE
            TXACTIE: u1,
            ///  RXACTIE
            RXACTIE: u1,
            ///  TXFIFOHEIE
            TXFIFOHEIE: u1,
            ///  RXFIFOHFIE
            RXFIFOHFIE: u1,
            ///  TXFIFOFIE
            TXFIFOFIE: u1,
            ///  RXFIFOFIE
            RXFIFOFIE: u1,
            ///  TXFIFOEIE
            TXFIFOEIE: u1,
            ///  RXFIFOEIE
            RXFIFOEIE: u1,
            ///  TXDAVLIE
            TXDAVLIE: u1,
            ///  RXDAVLIE
            RXDAVLIE: u1,
            ///  SDIOITIE
            SDIOITIE: u1,
            ///  CEATENDIE
            CEATENDIE: u1,
            padding: u8 = 0,
        }),
        reserved72: [8]u8,
        ///  Bits 23:0 = FIFOCOUNT: Remaining number of words to be written to or read from the FIFO
        FIFOCNT: mmio.Mmio(32, packed struct {
            ///  FIF0COUNT
            FIF0COUNT: u24,
            padding: u8 = 0,
        }),
        reserved128: [52]u8,
        ///  bits 31:0 = FIFOData: Receive and transmit FIFO data
        FIFO: mmio.Mmio(32, packed struct {
            ///  FIFOData
            FIFOData: u32,
        }),
    };

    ///  Real time clock
    pub const RTC = extern struct {
        ///  RTC Control Register High
        CRH: mmio.Mmio(32, packed struct {
            ///  Second interrupt Enable
            SECIE: u1,
            ///  Alarm interrupt Enable
            ALRIE: u1,
            ///  Overflow interrupt Enable
            OWIE: u1,
            padding: u29 = 0,
        }),
        ///  RTC Control Register Low
        CRL: mmio.Mmio(32, packed struct {
            ///  Second Flag
            SECF: u1,
            ///  Alarm Flag
            ALRF: u1,
            ///  Overflow Flag
            OWF: u1,
            ///  Registers Synchronized Flag
            RSF: u1,
            ///  Configuration Flag
            CNF: u1,
            ///  RTC operation OFF
            RTOFF: u1,
            padding: u26 = 0,
        }),
        ///  RTC Prescaler Load Register High
        PRLH: mmio.Mmio(32, packed struct {
            ///  RTC Prescaler Load Register High
            PRLH: u4,
            padding: u28 = 0,
        }),
        ///  RTC Prescaler Load Register Low
        PRLL: mmio.Mmio(32, packed struct {
            ///  RTC Prescaler Divider Register Low
            PRLL: u16,
            padding: u16 = 0,
        }),
        ///  RTC Prescaler Divider Register High
        DIVH: mmio.Mmio(32, packed struct {
            ///  RTC prescaler divider register high
            DIVH: u4,
            padding: u28 = 0,
        }),
        ///  RTC Prescaler Divider Register Low
        DIVL: mmio.Mmio(32, packed struct {
            ///  RTC prescaler divider register Low
            DIVL: u16,
            padding: u16 = 0,
        }),
        ///  RTC Counter Register High
        CNTH: mmio.Mmio(32, packed struct {
            ///  RTC counter register high
            CNTH: u16,
            padding: u16 = 0,
        }),
        ///  RTC Counter Register Low
        CNTL: mmio.Mmio(32, packed struct {
            ///  RTC counter register Low
            CNTL: u16,
            padding: u16 = 0,
        }),
        ///  RTC Alarm Register High
        ALRH: mmio.Mmio(32, packed struct {
            ///  RTC alarm register high
            ALRH: u16,
            padding: u16 = 0,
        }),
        ///  RTC Alarm Register Low
        ALRL: mmio.Mmio(32, packed struct {
            ///  RTC alarm register low
            ALRL: u16,
            padding: u16 = 0,
        }),
    };

    ///  Backup registers
    pub const BKP = extern struct {
        ///  Backup data register (BKP_DR)
        DR1: mmio.Mmio(32, packed struct {
            ///  Backup data
            D1: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR2: mmio.Mmio(32, packed struct {
            ///  Backup data
            D2: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR3: mmio.Mmio(32, packed struct {
            ///  Backup data
            D3: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR4: mmio.Mmio(32, packed struct {
            ///  Backup data
            D4: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR5: mmio.Mmio(32, packed struct {
            ///  Backup data
            D5: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR6: mmio.Mmio(32, packed struct {
            ///  Backup data
            D6: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR7: mmio.Mmio(32, packed struct {
            ///  Backup data
            D7: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR8: mmio.Mmio(32, packed struct {
            ///  Backup data
            D8: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR9: mmio.Mmio(32, packed struct {
            ///  Backup data
            D9: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR10: mmio.Mmio(32, packed struct {
            ///  Backup data
            D10: u16,
            padding: u16 = 0,
        }),
        ///  RTC clock calibration register (BKP_RTCCR)
        RTCCR: mmio.Mmio(32, packed struct {
            ///  Calibration value
            CAL: u7,
            ///  Calibration Clock Output
            CCO: u1,
            ///  Alarm or second output enable
            ASOE: u1,
            ///  Alarm or second output selection
            ASOS: u1,
            padding: u22 = 0,
        }),
        ///  Backup control register (BKP_CR)
        CR: mmio.Mmio(32, packed struct {
            ///  Tamper pin enable
            TPE: u1,
            ///  Tamper pin active level
            TPAL: u1,
            padding: u30 = 0,
        }),
        ///  BKP_CSR control/status register (BKP_CSR)
        CSR: mmio.Mmio(32, packed struct {
            ///  Clear Tamper event
            CTE: u1,
            ///  Clear Tamper Interrupt
            CTI: u1,
            ///  Tamper Pin interrupt enable
            TPIE: u1,
            reserved8: u5 = 0,
            ///  Tamper Event Flag
            TEF: u1,
            ///  Tamper Interrupt Flag
            TIF: u1,
            padding: u22 = 0,
        }),
        reserved60: [8]u8,
        ///  Backup data register (BKP_DR)
        DR11: mmio.Mmio(32, packed struct {
            ///  Backup data
            DR11: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR12: mmio.Mmio(32, packed struct {
            ///  Backup data
            DR12: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR13: mmio.Mmio(32, packed struct {
            ///  Backup data
            DR13: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR14: mmio.Mmio(32, packed struct {
            ///  Backup data
            D14: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR15: mmio.Mmio(32, packed struct {
            ///  Backup data
            D15: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR16: mmio.Mmio(32, packed struct {
            ///  Backup data
            D16: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR17: mmio.Mmio(32, packed struct {
            ///  Backup data
            D17: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR18: mmio.Mmio(32, packed struct {
            ///  Backup data
            D18: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR19: mmio.Mmio(32, packed struct {
            ///  Backup data
            D19: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR20: mmio.Mmio(32, packed struct {
            ///  Backup data
            D20: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR21: mmio.Mmio(32, packed struct {
            ///  Backup data
            D21: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR22: mmio.Mmio(32, packed struct {
            ///  Backup data
            D22: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR23: mmio.Mmio(32, packed struct {
            ///  Backup data
            D23: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR24: mmio.Mmio(32, packed struct {
            ///  Backup data
            D24: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR25: mmio.Mmio(32, packed struct {
            ///  Backup data
            D25: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR26: mmio.Mmio(32, packed struct {
            ///  Backup data
            D26: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR27: mmio.Mmio(32, packed struct {
            ///  Backup data
            D27: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR28: mmio.Mmio(32, packed struct {
            ///  Backup data
            D28: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR29: mmio.Mmio(32, packed struct {
            ///  Backup data
            D29: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR30: mmio.Mmio(32, packed struct {
            ///  Backup data
            D30: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR31: mmio.Mmio(32, packed struct {
            ///  Backup data
            D31: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR32: mmio.Mmio(32, packed struct {
            ///  Backup data
            D32: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR33: mmio.Mmio(32, packed struct {
            ///  Backup data
            D33: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR34: mmio.Mmio(32, packed struct {
            ///  Backup data
            D34: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR35: mmio.Mmio(32, packed struct {
            ///  Backup data
            D35: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR36: mmio.Mmio(32, packed struct {
            ///  Backup data
            D36: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR37: mmio.Mmio(32, packed struct {
            ///  Backup data
            D37: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR38: mmio.Mmio(32, packed struct {
            ///  Backup data
            D38: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR39: mmio.Mmio(32, packed struct {
            ///  Backup data
            D39: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR40: mmio.Mmio(32, packed struct {
            ///  Backup data
            D40: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR41: mmio.Mmio(32, packed struct {
            ///  Backup data
            D41: u16,
            padding: u16 = 0,
        }),
        ///  Backup data register (BKP_DR)
        DR42: mmio.Mmio(32, packed struct {
            ///  Backup data
            D42: u16,
            padding: u16 = 0,
        }),
    };

    ///  Independent watchdog
    pub const IWDG = extern struct {
        ///  Key register (IWDG_KR)
        KR: mmio.Mmio(32, packed struct {
            ///  Key value
            KEY: u16,
            padding: u16 = 0,
        }),
        ///  Prescaler register (IWDG_PR)
        PR: mmio.Mmio(32, packed struct {
            ///  Prescaler divider
            PR: u3,
            padding: u29 = 0,
        }),
        ///  Reload register (IWDG_RLR)
        RLR: mmio.Mmio(32, packed struct {
            ///  Watchdog counter reload value
            RL: u12,
            padding: u20 = 0,
        }),
        ///  Status register (IWDG_SR)
        SR: mmio.Mmio(32, packed struct {
            ///  Watchdog prescaler value update
            PVU: u1,
            ///  Watchdog counter reload value update
            RVU: u1,
            padding: u30 = 0,
        }),
    };

    ///  Window watchdog
    pub const WWDG = extern struct {
        ///  Control register (WWDG_CR)
        CR: mmio.Mmio(32, packed struct {
            ///  7-bit counter (MSB to LSB)
            T: u7,
            ///  Activation bit
            WDGA: u1,
            padding: u24 = 0,
        }),
        ///  Configuration register (WWDG_CFR)
        CFR: mmio.Mmio(32, packed struct {
            ///  7-bit window value
            W: u7,
            ///  Timer Base
            WDGTB: u2,
            ///  Early Wakeup Interrupt
            EWI: u1,
            padding: u22 = 0,
        }),
        ///  Status register (WWDG_SR)
        SR: mmio.Mmio(32, packed struct {
            ///  Early Wakeup Interrupt
            EWI: u1,
            padding: u31 = 0,
        }),
    };

    ///  Advanced timer
    pub const TIM1 = extern struct {
        ///  control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Counter enable
            CEN: u1,
            ///  Update disable
            UDIS: u1,
            ///  Update request source
            URS: u1,
            ///  One-pulse mode
            OPM: u1,
            ///  Direction
            DIR: u1,
            ///  Center-aligned mode selection
            CMS: u2,
            ///  Auto-reload preload enable
            ARPE: u1,
            ///  Clock division
            CKD: u2,
            padding: u22 = 0,
        }),
        ///  control register 2
        CR2: mmio.Mmio(32, packed struct {
            ///  Capture/compare preloaded control
            CCPC: u1,
            reserved2: u1 = 0,
            ///  Capture/compare control update selection
            CCUS: u1,
            ///  Capture/compare DMA selection
            CCDS: u1,
            ///  Master mode selection
            MMS: u3,
            ///  TI1 selection
            TI1S: u1,
            ///  Output Idle state 1
            OIS1: u1,
            ///  Output Idle state 1
            OIS1N: u1,
            ///  Output Idle state 2
            OIS2: u1,
            ///  Output Idle state 2
            OIS2N: u1,
            ///  Output Idle state 3
            OIS3: u1,
            ///  Output Idle state 3
            OIS3N: u1,
            ///  Output Idle state 4
            OIS4: u1,
            padding: u17 = 0,
        }),
        ///  slave mode control register
        SMCR: mmio.Mmio(32, packed struct {
            ///  Slave mode selection
            SMS: u3,
            reserved4: u1 = 0,
            ///  Trigger selection
            TS: u3,
            ///  Master/Slave mode
            MSM: u1,
            ///  External trigger filter
            ETF: u4,
            ///  External trigger prescaler
            ETPS: u2,
            ///  External clock enable
            ECE: u1,
            ///  External trigger polarity
            ETP: u1,
            padding: u16 = 0,
        }),
        ///  DMA/Interrupt enable register
        DIER: mmio.Mmio(32, packed struct {
            ///  Update interrupt enable
            UIE: u1,
            ///  Capture/Compare 1 interrupt enable
            CC1IE: u1,
            ///  Capture/Compare 2 interrupt enable
            CC2IE: u1,
            ///  Capture/Compare 3 interrupt enable
            CC3IE: u1,
            ///  Capture/Compare 4 interrupt enable
            CC4IE: u1,
            ///  COM interrupt enable
            COMIE: u1,
            ///  Trigger interrupt enable
            TIE: u1,
            ///  Break interrupt enable
            BIE: u1,
            ///  Update DMA request enable
            UDE: u1,
            ///  Capture/Compare 1 DMA request enable
            CC1DE: u1,
            ///  Capture/Compare 2 DMA request enable
            CC2DE: u1,
            ///  Capture/Compare 3 DMA request enable
            CC3DE: u1,
            ///  Capture/Compare 4 DMA request enable
            CC4DE: u1,
            ///  COM DMA request enable
            COMDE: u1,
            ///  Trigger DMA request enable
            TDE: u1,
            padding: u17 = 0,
        }),
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            ///  Update interrupt flag
            UIF: u1,
            ///  Capture/compare 1 interrupt flag
            CC1IF: u1,
            ///  Capture/Compare 2 interrupt flag
            CC2IF: u1,
            ///  Capture/Compare 3 interrupt flag
            CC3IF: u1,
            ///  Capture/Compare 4 interrupt flag
            CC4IF: u1,
            ///  COM interrupt flag
            COMIF: u1,
            ///  Trigger interrupt flag
            TIF: u1,
            ///  Break interrupt flag
            BIF: u1,
            reserved9: u1 = 0,
            ///  Capture/Compare 1 overcapture flag
            CC1OF: u1,
            ///  Capture/compare 2 overcapture flag
            CC2OF: u1,
            ///  Capture/Compare 3 overcapture flag
            CC3OF: u1,
            ///  Capture/Compare 4 overcapture flag
            CC4OF: u1,
            padding: u19 = 0,
        }),
        ///  event generation register
        EGR: mmio.Mmio(32, packed struct {
            ///  Update generation
            UG: u1,
            ///  Capture/compare 1 generation
            CC1G: u1,
            ///  Capture/compare 2 generation
            CC2G: u1,
            ///  Capture/compare 3 generation
            CC3G: u1,
            ///  Capture/compare 4 generation
            CC4G: u1,
            ///  Capture/Compare control update generation
            COMG: u1,
            ///  Trigger generation
            TG: u1,
            ///  Break generation
            BG: u1,
            padding: u24 = 0,
        }),
        ///  capture/compare mode register (output mode)
        CCMR1_Output: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 selection
            CC1S: u2,
            ///  Output Compare 1 fast enable
            OC1FE: u1,
            ///  Output Compare 1 preload enable
            OC1PE: u1,
            ///  Output Compare 1 mode
            OC1M: u3,
            ///  Output Compare 1 clear enable
            OC1CE: u1,
            ///  Capture/Compare 2 selection
            CC2S: u2,
            ///  Output Compare 2 fast enable
            OC2FE: u1,
            ///  Output Compare 2 preload enable
            OC2PE: u1,
            ///  Output Compare 2 mode
            OC2M: u3,
            ///  Output Compare 2 clear enable
            OC2CE: u1,
            padding: u16 = 0,
        }),
        ///  capture/compare mode register (output mode)
        CCMR2_Output: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 3 selection
            CC3S: u2,
            ///  Output compare 3 fast enable
            OC3FE: u1,
            ///  Output compare 3 preload enable
            OC3PE: u1,
            ///  Output compare 3 mode
            OC3M: u3,
            ///  Output compare 3 clear enable
            OC3CE: u1,
            ///  Capture/Compare 4 selection
            CC4S: u2,
            ///  Output compare 4 fast enable
            OC4FE: u1,
            ///  Output compare 4 preload enable
            OC4PE: u1,
            ///  Output compare 4 mode
            OC4M: u3,
            ///  Output compare 4 clear enable
            OC4CE: u1,
            padding: u16 = 0,
        }),
        ///  capture/compare enable register
        CCER: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 output enable
            CC1E: u1,
            ///  Capture/Compare 1 output Polarity
            CC1P: u1,
            ///  Capture/Compare 1 complementary output enable
            CC1NE: u1,
            ///  Capture/Compare 1 output Polarity
            CC1NP: u1,
            ///  Capture/Compare 2 output enable
            CC2E: u1,
            ///  Capture/Compare 2 output Polarity
            CC2P: u1,
            ///  Capture/Compare 2 complementary output enable
            CC2NE: u1,
            ///  Capture/Compare 2 output Polarity
            CC2NP: u1,
            ///  Capture/Compare 3 output enable
            CC3E: u1,
            ///  Capture/Compare 3 output Polarity
            CC3P: u1,
            ///  Capture/Compare 3 complementary output enable
            CC3NE: u1,
            ///  Capture/Compare 3 output Polarity
            CC3NP: u1,
            ///  Capture/Compare 4 output enable
            CC4E: u1,
            ///  Capture/Compare 3 output Polarity
            CC4P: u1,
            padding: u18 = 0,
        }),
        ///  counter
        CNT: mmio.Mmio(32, packed struct {
            ///  counter value
            CNT: u16,
            padding: u16 = 0,
        }),
        ///  prescaler
        PSC: mmio.Mmio(32, packed struct {
            ///  Prescaler value
            PSC: u16,
            padding: u16 = 0,
        }),
        ///  auto-reload register
        ARR: mmio.Mmio(32, packed struct {
            ///  Auto-reload value
            ARR: u16,
            padding: u16 = 0,
        }),
        ///  repetition counter register
        RCR: mmio.Mmio(32, packed struct {
            ///  Repetition counter value
            REP: u8,
            padding: u24 = 0,
        }),
        ///  capture/compare register 1
        CCR1: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 value
            CCR1: u16,
            padding: u16 = 0,
        }),
        ///  capture/compare register 2
        CCR2: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 2 value
            CCR2: u16,
            padding: u16 = 0,
        }),
        ///  capture/compare register 3
        CCR3: mmio.Mmio(32, packed struct {
            ///  Capture/Compare value
            CCR3: u16,
            padding: u16 = 0,
        }),
        ///  capture/compare register 4
        CCR4: mmio.Mmio(32, packed struct {
            ///  Capture/Compare value
            CCR4: u16,
            padding: u16 = 0,
        }),
        ///  break and dead-time register
        BDTR: mmio.Mmio(32, packed struct {
            ///  Dead-time generator setup
            DTG: u8,
            ///  Lock configuration
            LOCK: u2,
            ///  Off-state selection for Idle mode
            OSSI: u1,
            ///  Off-state selection for Run mode
            OSSR: u1,
            ///  Break enable
            BKE: u1,
            ///  Break polarity
            BKP: u1,
            ///  Automatic output enable
            AOE: u1,
            ///  Main output enable
            MOE: u1,
            padding: u16 = 0,
        }),
        ///  DMA control register
        DCR: mmio.Mmio(32, packed struct {
            ///  DMA base address
            DBA: u5,
            reserved8: u3 = 0,
            ///  DMA burst length
            DBL: u5,
            padding: u19 = 0,
        }),
        ///  DMA address for full transfer
        DMAR: mmio.Mmio(32, packed struct {
            ///  DMA register for burst accesses
            DMAB: u16,
            padding: u16 = 0,
        }),
    };

    ///  General purpose timer
    pub const TIM2 = extern struct {
        ///  control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Counter enable
            CEN: u1,
            ///  Update disable
            UDIS: u1,
            ///  Update request source
            URS: u1,
            ///  One-pulse mode
            OPM: u1,
            ///  Direction
            DIR: u1,
            ///  Center-aligned mode selection
            CMS: u2,
            ///  Auto-reload preload enable
            ARPE: u1,
            ///  Clock division
            CKD: u2,
            padding: u22 = 0,
        }),
        ///  control register 2
        CR2: mmio.Mmio(32, packed struct {
            reserved3: u3 = 0,
            ///  Capture/compare DMA selection
            CCDS: u1,
            ///  Master mode selection
            MMS: u3,
            ///  TI1 selection
            TI1S: u1,
            padding: u24 = 0,
        }),
        ///  slave mode control register
        SMCR: mmio.Mmio(32, packed struct {
            ///  Slave mode selection
            SMS: u3,
            reserved4: u1 = 0,
            ///  Trigger selection
            TS: u3,
            ///  Master/Slave mode
            MSM: u1,
            ///  External trigger filter
            ETF: u4,
            ///  External trigger prescaler
            ETPS: u2,
            ///  External clock enable
            ECE: u1,
            ///  External trigger polarity
            ETP: u1,
            padding: u16 = 0,
        }),
        ///  DMA/Interrupt enable register
        DIER: mmio.Mmio(32, packed struct {
            ///  Update interrupt enable
            UIE: u1,
            ///  Capture/Compare 1 interrupt enable
            CC1IE: u1,
            ///  Capture/Compare 2 interrupt enable
            CC2IE: u1,
            ///  Capture/Compare 3 interrupt enable
            CC3IE: u1,
            ///  Capture/Compare 4 interrupt enable
            CC4IE: u1,
            reserved6: u1 = 0,
            ///  Trigger interrupt enable
            TIE: u1,
            reserved8: u1 = 0,
            ///  Update DMA request enable
            UDE: u1,
            ///  Capture/Compare 1 DMA request enable
            CC1DE: u1,
            ///  Capture/Compare 2 DMA request enable
            CC2DE: u1,
            ///  Capture/Compare 3 DMA request enable
            CC3DE: u1,
            ///  Capture/Compare 4 DMA request enable
            CC4DE: u1,
            reserved14: u1 = 0,
            ///  Trigger DMA request enable
            TDE: u1,
            padding: u17 = 0,
        }),
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            ///  Update interrupt flag
            UIF: u1,
            ///  Capture/compare 1 interrupt flag
            CC1IF: u1,
            ///  Capture/Compare 2 interrupt flag
            CC2IF: u1,
            ///  Capture/Compare 3 interrupt flag
            CC3IF: u1,
            ///  Capture/Compare 4 interrupt flag
            CC4IF: u1,
            reserved6: u1 = 0,
            ///  Trigger interrupt flag
            TIF: u1,
            reserved9: u2 = 0,
            ///  Capture/Compare 1 overcapture flag
            CC1OF: u1,
            ///  Capture/compare 2 overcapture flag
            CC2OF: u1,
            ///  Capture/Compare 3 overcapture flag
            CC3OF: u1,
            ///  Capture/Compare 4 overcapture flag
            CC4OF: u1,
            padding: u19 = 0,
        }),
        ///  event generation register
        EGR: mmio.Mmio(32, packed struct {
            ///  Update generation
            UG: u1,
            ///  Capture/compare 1 generation
            CC1G: u1,
            ///  Capture/compare 2 generation
            CC2G: u1,
            ///  Capture/compare 3 generation
            CC3G: u1,
            ///  Capture/compare 4 generation
            CC4G: u1,
            reserved6: u1 = 0,
            ///  Trigger generation
            TG: u1,
            padding: u25 = 0,
        }),
        ///  capture/compare mode register 1 (output mode)
        CCMR1_Output: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 selection
            CC1S: u2,
            ///  Output compare 1 fast enable
            OC1FE: u1,
            ///  Output compare 1 preload enable
            OC1PE: u1,
            ///  Output compare 1 mode
            OC1M: u3,
            ///  Output compare 1 clear enable
            OC1CE: u1,
            ///  Capture/Compare 2 selection
            CC2S: u2,
            ///  Output compare 2 fast enable
            OC2FE: u1,
            ///  Output compare 2 preload enable
            OC2PE: u1,
            ///  Output compare 2 mode
            OC2M: u3,
            ///  Output compare 2 clear enable
            OC2CE: u1,
            padding: u16 = 0,
        }),
        ///  capture/compare mode register 2 (output mode)
        CCMR2_Output: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 3 selection
            CC3S: u2,
            ///  Output compare 3 fast enable
            OC3FE: u1,
            ///  Output compare 3 preload enable
            OC3PE: u1,
            ///  Output compare 3 mode
            OC3M: u3,
            ///  Output compare 3 clear enable
            OC3CE: u1,
            ///  Capture/Compare 4 selection
            CC4S: u2,
            ///  Output compare 4 fast enable
            OC4FE: u1,
            ///  Output compare 4 preload enable
            OC4PE: u1,
            ///  Output compare 4 mode
            OC4M: u3,
            ///  Output compare 4 clear enable
            O24CE: u1,
            padding: u16 = 0,
        }),
        ///  capture/compare enable register
        CCER: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 output enable
            CC1E: u1,
            ///  Capture/Compare 1 output Polarity
            CC1P: u1,
            reserved4: u2 = 0,
            ///  Capture/Compare 2 output enable
            CC2E: u1,
            ///  Capture/Compare 2 output Polarity
            CC2P: u1,
            reserved8: u2 = 0,
            ///  Capture/Compare 3 output enable
            CC3E: u1,
            ///  Capture/Compare 3 output Polarity
            CC3P: u1,
            reserved12: u2 = 0,
            ///  Capture/Compare 4 output enable
            CC4E: u1,
            ///  Capture/Compare 3 output Polarity
            CC4P: u1,
            padding: u18 = 0,
        }),
        ///  counter
        CNT: mmio.Mmio(32, packed struct {
            ///  counter value
            CNT: u16,
            padding: u16 = 0,
        }),
        ///  prescaler
        PSC: mmio.Mmio(32, packed struct {
            ///  Prescaler value
            PSC: u16,
            padding: u16 = 0,
        }),
        ///  auto-reload register
        ARR: mmio.Mmio(32, packed struct {
            ///  Auto-reload value
            ARR: u16,
            padding: u16 = 0,
        }),
        reserved52: [4]u8,
        ///  capture/compare register 1
        CCR1: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 value
            CCR1: u16,
            padding: u16 = 0,
        }),
        ///  capture/compare register 2
        CCR2: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 2 value
            CCR2: u16,
            padding: u16 = 0,
        }),
        ///  capture/compare register 3
        CCR3: mmio.Mmio(32, packed struct {
            ///  Capture/Compare value
            CCR3: u16,
            padding: u16 = 0,
        }),
        ///  capture/compare register 4
        CCR4: mmio.Mmio(32, packed struct {
            ///  Capture/Compare value
            CCR4: u16,
            padding: u16 = 0,
        }),
        reserved72: [4]u8,
        ///  DMA control register
        DCR: mmio.Mmio(32, packed struct {
            ///  DMA base address
            DBA: u5,
            reserved8: u3 = 0,
            ///  DMA burst length
            DBL: u5,
            padding: u19 = 0,
        }),
        ///  DMA address for full transfer
        DMAR: mmio.Mmio(32, packed struct {
            ///  DMA register for burst accesses
            DMAB: u16,
            padding: u16 = 0,
        }),
    };

    ///  General purpose timer
    pub const TIM9 = extern struct {
        ///  control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Counter enable
            CEN: u1,
            ///  Update disable
            UDIS: u1,
            ///  Update request source
            URS: u1,
            ///  One-pulse mode
            OPM: u1,
            reserved7: u3 = 0,
            ///  Auto-reload preload enable
            ARPE: u1,
            ///  Clock division
            CKD: u2,
            padding: u22 = 0,
        }),
        ///  control register 2
        CR2: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  Master mode selection
            MMS: u3,
            padding: u25 = 0,
        }),
        ///  slave mode control register
        SMCR: mmio.Mmio(32, packed struct {
            ///  Slave mode selection
            SMS: u3,
            reserved4: u1 = 0,
            ///  Trigger selection
            TS: u3,
            ///  Master/Slave mode
            MSM: u1,
            padding: u24 = 0,
        }),
        ///  DMA/Interrupt enable register
        DIER: mmio.Mmio(32, packed struct {
            ///  Update interrupt enable
            UIE: u1,
            ///  Capture/Compare 1 interrupt enable
            CC1IE: u1,
            ///  Capture/Compare 2 interrupt enable
            CC2IE: u1,
            reserved6: u3 = 0,
            ///  Trigger interrupt enable
            TIE: u1,
            padding: u25 = 0,
        }),
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            ///  Update interrupt flag
            UIF: u1,
            ///  Capture/compare 1 interrupt flag
            CC1IF: u1,
            ///  Capture/Compare 2 interrupt flag
            CC2IF: u1,
            reserved6: u3 = 0,
            ///  Trigger interrupt flag
            TIF: u1,
            reserved9: u2 = 0,
            ///  Capture/Compare 1 overcapture flag
            CC1OF: u1,
            ///  Capture/compare 2 overcapture flag
            CC2OF: u1,
            padding: u21 = 0,
        }),
        ///  event generation register
        EGR: mmio.Mmio(32, packed struct {
            ///  Update generation
            UG: u1,
            ///  Capture/compare 1 generation
            CC1G: u1,
            ///  Capture/compare 2 generation
            CC2G: u1,
            reserved6: u3 = 0,
            ///  Trigger generation
            TG: u1,
            padding: u25 = 0,
        }),
        ///  capture/compare mode register 1 (output mode)
        CCMR1_Output: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 selection
            CC1S: u2,
            ///  Output Compare 1 fast enable
            OC1FE: u1,
            ///  Output Compare 1 preload enable
            OC1PE: u1,
            ///  Output Compare 1 mode
            OC1M: u3,
            reserved8: u1 = 0,
            ///  Capture/Compare 2 selection
            CC2S: u2,
            ///  Output Compare 2 fast enable
            OC2FE: u1,
            ///  Output Compare 2 preload enable
            OC2PE: u1,
            ///  Output Compare 2 mode
            OC2M: u3,
            padding: u17 = 0,
        }),
        reserved32: [4]u8,
        ///  capture/compare enable register
        CCER: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 output enable
            CC1E: u1,
            ///  Capture/Compare 1 output Polarity
            CC1P: u1,
            reserved3: u1 = 0,
            ///  Capture/Compare 1 output Polarity
            CC1NP: u1,
            ///  Capture/Compare 2 output enable
            CC2E: u1,
            ///  Capture/Compare 2 output Polarity
            CC2P: u1,
            reserved7: u1 = 0,
            ///  Capture/Compare 2 output Polarity
            CC2NP: u1,
            padding: u24 = 0,
        }),
        ///  counter
        CNT: mmio.Mmio(32, packed struct {
            ///  counter value
            CNT: u16,
            padding: u16 = 0,
        }),
        ///  prescaler
        PSC: mmio.Mmio(32, packed struct {
            ///  Prescaler value
            PSC: u16,
            padding: u16 = 0,
        }),
        ///  auto-reload register
        ARR: mmio.Mmio(32, packed struct {
            ///  Auto-reload value
            ARR: u16,
            padding: u16 = 0,
        }),
        reserved52: [4]u8,
        ///  capture/compare register 1
        CCR1: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 value
            CCR1: u16,
            padding: u16 = 0,
        }),
        ///  capture/compare register 2
        CCR2: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 2 value
            CCR2: u16,
            padding: u16 = 0,
        }),
    };

    ///  General purpose timer
    pub const TIM10 = extern struct {
        ///  control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Counter enable
            CEN: u1,
            ///  Update disable
            UDIS: u1,
            ///  Update request source
            URS: u1,
            reserved7: u4 = 0,
            ///  Auto-reload preload enable
            ARPE: u1,
            ///  Clock division
            CKD: u2,
            padding: u22 = 0,
        }),
        ///  control register 2
        CR2: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  Master mode selection
            MMS: u3,
            padding: u25 = 0,
        }),
        reserved12: [4]u8,
        ///  DMA/Interrupt enable register
        DIER: mmio.Mmio(32, packed struct {
            ///  Update interrupt enable
            UIE: u1,
            ///  Capture/Compare 1 interrupt enable
            CC1IE: u1,
            padding: u30 = 0,
        }),
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            ///  Update interrupt flag
            UIF: u1,
            ///  Capture/compare 1 interrupt flag
            CC1IF: u1,
            reserved9: u7 = 0,
            ///  Capture/Compare 1 overcapture flag
            CC1OF: u1,
            padding: u22 = 0,
        }),
        ///  event generation register
        EGR: mmio.Mmio(32, packed struct {
            ///  Update generation
            UG: u1,
            ///  Capture/compare 1 generation
            CC1G: u1,
            padding: u30 = 0,
        }),
        ///  capture/compare mode register (output mode)
        CCMR1_Output: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 selection
            CC1S: u2,
            reserved3: u1 = 0,
            ///  Output Compare 1 preload enable
            OC1PE: u1,
            ///  Output Compare 1 mode
            OC1M: u3,
            padding: u25 = 0,
        }),
        reserved32: [4]u8,
        ///  capture/compare enable register
        CCER: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 output enable
            CC1E: u1,
            ///  Capture/Compare 1 output Polarity
            CC1P: u1,
            reserved3: u1 = 0,
            ///  Capture/Compare 1 output Polarity
            CC1NP: u1,
            padding: u28 = 0,
        }),
        ///  counter
        CNT: mmio.Mmio(32, packed struct {
            ///  counter value
            CNT: u16,
            padding: u16 = 0,
        }),
        ///  prescaler
        PSC: mmio.Mmio(32, packed struct {
            ///  Prescaler value
            PSC: u16,
            padding: u16 = 0,
        }),
        ///  auto-reload register
        ARR: mmio.Mmio(32, packed struct {
            ///  Auto-reload value
            ARR: u16,
            padding: u16 = 0,
        }),
        reserved52: [4]u8,
        ///  capture/compare register 1
        CCR1: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 1 value
            CCR1: u16,
            padding: u16 = 0,
        }),
    };

    ///  Basic timer
    pub const TIM6 = extern struct {
        ///  control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Counter enable
            CEN: u1,
            ///  Update disable
            UDIS: u1,
            ///  Update request source
            URS: u1,
            ///  One-pulse mode
            OPM: u1,
            reserved7: u3 = 0,
            ///  Auto-reload preload enable
            ARPE: u1,
            padding: u24 = 0,
        }),
        ///  control register 2
        CR2: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  Master mode selection
            MMS: u3,
            padding: u25 = 0,
        }),
        reserved12: [4]u8,
        ///  DMA/Interrupt enable register
        DIER: mmio.Mmio(32, packed struct {
            ///  Update interrupt enable
            UIE: u1,
            reserved8: u7 = 0,
            ///  Update DMA request enable
            UDE: u1,
            padding: u23 = 0,
        }),
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            ///  Update interrupt flag
            UIF: u1,
            padding: u31 = 0,
        }),
        ///  event generation register
        EGR: mmio.Mmio(32, packed struct {
            ///  Update generation
            UG: u1,
            padding: u31 = 0,
        }),
        reserved36: [12]u8,
        ///  counter
        CNT: mmio.Mmio(32, packed struct {
            ///  Low counter value
            CNT: u16,
            padding: u16 = 0,
        }),
        ///  prescaler
        PSC: mmio.Mmio(32, packed struct {
            ///  Prescaler value
            PSC: u16,
            padding: u16 = 0,
        }),
        ///  auto-reload register
        ARR: mmio.Mmio(32, packed struct {
            ///  Low Auto-reload value
            ARR: u16,
            padding: u16 = 0,
        }),
    };

    ///  Inter integrated circuit
    pub const I2C1 = extern struct {
        ///  Control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Peripheral enable
            PE: u1,
            ///  SMBus mode
            SMBUS: u1,
            reserved3: u1 = 0,
            ///  SMBus type
            SMBTYPE: u1,
            ///  ARP enable
            ENARP: u1,
            ///  PEC enable
            ENPEC: u1,
            ///  General call enable
            ENGC: u1,
            ///  Clock stretching disable (Slave mode)
            NOSTRETCH: u1,
            ///  Start generation
            START: u1,
            ///  Stop generation
            STOP: u1,
            ///  Acknowledge enable
            ACK: u1,
            ///  Acknowledge/PEC Position (for data reception)
            POS: u1,
            ///  Packet error checking
            PEC: u1,
            ///  SMBus alert
            ALERT: u1,
            reserved15: u1 = 0,
            ///  Software reset
            SWRST: u1,
            padding: u16 = 0,
        }),
        ///  Control register 2
        CR2: mmio.Mmio(32, packed struct {
            ///  Peripheral clock frequency
            FREQ: u6,
            reserved8: u2 = 0,
            ///  Error interrupt enable
            ITERREN: u1,
            ///  Event interrupt enable
            ITEVTEN: u1,
            ///  Buffer interrupt enable
            ITBUFEN: u1,
            ///  DMA requests enable
            DMAEN: u1,
            ///  DMA last transfer
            LAST: u1,
            padding: u19 = 0,
        }),
        ///  Own address register 1
        OAR1: mmio.Mmio(32, packed struct {
            ///  Interface address
            ADD0: u1,
            ///  Interface address
            ADD7: u7,
            ///  Interface address
            ADD10: u2,
            reserved15: u5 = 0,
            ///  Addressing mode (slave mode)
            ADDMODE: u1,
            padding: u16 = 0,
        }),
        ///  Own address register 2
        OAR2: mmio.Mmio(32, packed struct {
            ///  Dual addressing mode enable
            ENDUAL: u1,
            ///  Interface address
            ADD2: u7,
            padding: u24 = 0,
        }),
        ///  Data register
        DR: mmio.Mmio(32, packed struct {
            ///  8-bit data register
            DR: u8,
            padding: u24 = 0,
        }),
        ///  Status register 1
        SR1: mmio.Mmio(32, packed struct {
            ///  Start bit (Master mode)
            SB: u1,
            ///  Address sent (master mode)/matched (slave mode)
            ADDR: u1,
            ///  Byte transfer finished
            BTF: u1,
            ///  10-bit header sent (Master mode)
            ADD10: u1,
            ///  Stop detection (slave mode)
            STOPF: u1,
            reserved6: u1 = 0,
            ///  Data register not empty (receivers)
            RxNE: u1,
            ///  Data register empty (transmitters)
            TxE: u1,
            ///  Bus error
            BERR: u1,
            ///  Arbitration lost (master mode)
            ARLO: u1,
            ///  Acknowledge failure
            AF: u1,
            ///  Overrun/Underrun
            OVR: u1,
            ///  PEC Error in reception
            PECERR: u1,
            reserved14: u1 = 0,
            ///  Timeout or Tlow error
            TIMEOUT: u1,
            ///  SMBus alert
            SMBALERT: u1,
            padding: u16 = 0,
        }),
        ///  Status register 2
        SR2: mmio.Mmio(32, packed struct {
            ///  Master/slave
            MSL: u1,
            ///  Bus busy
            BUSY: u1,
            ///  Transmitter/receiver
            TRA: u1,
            reserved4: u1 = 0,
            ///  General call address (Slave mode)
            GENCALL: u1,
            ///  SMBus device default address (Slave mode)
            SMBDEFAULT: u1,
            ///  SMBus host header (Slave mode)
            SMBHOST: u1,
            ///  Dual flag (Slave mode)
            DUALF: u1,
            ///  acket error checking register
            PEC: u8,
            padding: u16 = 0,
        }),
        ///  Clock control register
        CCR: mmio.Mmio(32, packed struct {
            ///  Clock control register in Fast/Standard mode (Master mode)
            CCR: u12,
            reserved14: u2 = 0,
            ///  Fast mode duty cycle
            DUTY: u1,
            ///  I2C master mode selection
            F_S: u1,
            padding: u16 = 0,
        }),
        ///  TRISE register
        TRISE: mmio.Mmio(32, packed struct {
            ///  Maximum rise time in Fast/Standard mode (Master mode)
            TRISE: u6,
            padding: u26 = 0,
        }),
    };

    ///  Serial peripheral interface
    pub const SPI1 = extern struct {
        ///  control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Clock phase
            CPHA: u1,
            ///  Clock polarity
            CPOL: u1,
            ///  Master selection
            MSTR: u1,
            ///  Baud rate control
            BR: u3,
            ///  SPI enable
            SPE: u1,
            ///  Frame format
            LSBFIRST: u1,
            ///  Internal slave select
            SSI: u1,
            ///  Software slave management
            SSM: u1,
            ///  Receive only
            RXONLY: u1,
            ///  Data frame format
            DFF: u1,
            ///  CRC transfer next
            CRCNEXT: u1,
            ///  Hardware CRC calculation enable
            CRCEN: u1,
            ///  Output enable in bidirectional mode
            BIDIOE: u1,
            ///  Bidirectional data mode enable
            BIDIMODE: u1,
            padding: u16 = 0,
        }),
        ///  control register 2
        CR2: mmio.Mmio(32, packed struct {
            ///  Rx buffer DMA enable
            RXDMAEN: u1,
            ///  Tx buffer DMA enable
            TXDMAEN: u1,
            ///  SS output enable
            SSOE: u1,
            reserved5: u2 = 0,
            ///  Error interrupt enable
            ERRIE: u1,
            ///  RX buffer not empty interrupt enable
            RXNEIE: u1,
            ///  Tx buffer empty interrupt enable
            TXEIE: u1,
            padding: u24 = 0,
        }),
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            ///  Receive buffer not empty
            RXNE: u1,
            ///  Transmit buffer empty
            TXE: u1,
            ///  Channel side
            CHSIDE: u1,
            ///  Underrun flag
            UDR: u1,
            ///  CRC error flag
            CRCERR: u1,
            ///  Mode fault
            MODF: u1,
            ///  Overrun flag
            OVR: u1,
            ///  Busy flag
            BSY: u1,
            padding: u24 = 0,
        }),
        ///  data register
        DR: mmio.Mmio(32, packed struct {
            ///  Data register
            DR: u16,
            padding: u16 = 0,
        }),
        ///  CRC polynomial register
        CRCPR: mmio.Mmio(32, packed struct {
            ///  CRC polynomial register
            CRCPOLY: u16,
            padding: u16 = 0,
        }),
        ///  RX CRC register
        RXCRCR: mmio.Mmio(32, packed struct {
            ///  Rx CRC register
            RxCRC: u16,
            padding: u16 = 0,
        }),
        ///  TX CRC register
        TXCRCR: mmio.Mmio(32, packed struct {
            ///  Tx CRC register
            TxCRC: u16,
            padding: u16 = 0,
        }),
        ///  I2S configuration register
        I2SCFGR: mmio.Mmio(32, packed struct {
            ///  Channel length (number of bits per audio channel)
            CHLEN: u1,
            ///  Data length to be transferred
            DATLEN: u2,
            ///  Steady state clock polarity
            CKPOL: u1,
            ///  I2S standard selection
            I2SSTD: u2,
            reserved7: u1 = 0,
            ///  PCM frame synchronization
            PCMSYNC: u1,
            ///  I2S configuration mode
            I2SCFG: u2,
            ///  I2S Enable
            I2SE: u1,
            ///  I2S mode selection
            I2SMOD: u1,
            padding: u20 = 0,
        }),
        ///  I2S prescaler register
        I2SPR: mmio.Mmio(32, packed struct {
            ///  I2S Linear prescaler
            I2SDIV: u8,
            ///  Odd factor for the prescaler
            ODD: u1,
            ///  Master clock output enable
            MCKOE: u1,
            padding: u22 = 0,
        }),
    };

    ///  Universal synchronous asynchronous receiver transmitter
    pub const USART1 = extern struct {
        ///  Status register
        SR: mmio.Mmio(32, packed struct {
            ///  Parity error
            PE: u1,
            ///  Framing error
            FE: u1,
            ///  Noise error flag
            NE: u1,
            ///  Overrun error
            ORE: u1,
            ///  IDLE line detected
            IDLE: u1,
            ///  Read data register not empty
            RXNE: u1,
            ///  Transmission complete
            TC: u1,
            ///  Transmit data register empty
            TXE: u1,
            ///  LIN break detection flag
            LBD: u1,
            ///  CTS flag
            CTS: u1,
            padding: u22 = 0,
        }),
        ///  Data register
        DR: mmio.Mmio(32, packed struct {
            ///  Data value
            DR: u9,
            padding: u23 = 0,
        }),
        ///  Baud rate register
        BRR: mmio.Mmio(32, packed struct {
            ///  fraction of USARTDIV
            DIV_Fraction: u4,
            ///  mantissa of USARTDIV
            DIV_Mantissa: u12,
            padding: u16 = 0,
        }),
        ///  Control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Send break
            SBK: u1,
            ///  Receiver wakeup
            RWU: u1,
            ///  Receiver enable
            RE: u1,
            ///  Transmitter enable
            TE: u1,
            ///  IDLE interrupt enable
            IDLEIE: u1,
            ///  RXNE interrupt enable
            RXNEIE: u1,
            ///  Transmission complete interrupt enable
            TCIE: u1,
            ///  TXE interrupt enable
            TXEIE: u1,
            ///  PE interrupt enable
            PEIE: u1,
            ///  Parity selection
            PS: u1,
            ///  Parity control enable
            PCE: u1,
            ///  Wakeup method
            WAKE: u1,
            ///  Word length
            M: u1,
            ///  USART enable
            UE: u1,
            padding: u18 = 0,
        }),
        ///  Control register 2
        CR2: mmio.Mmio(32, packed struct {
            ///  Address of the USART node
            ADD: u4,
            reserved5: u1 = 0,
            ///  lin break detection length
            LBDL: u1,
            ///  LIN break detection interrupt enable
            LBDIE: u1,
            reserved8: u1 = 0,
            ///  Last bit clock pulse
            LBCL: u1,
            ///  Clock phase
            CPHA: u1,
            ///  Clock polarity
            CPOL: u1,
            ///  Clock enable
            CLKEN: u1,
            ///  STOP bits
            STOP: u2,
            ///  LIN mode enable
            LINEN: u1,
            padding: u17 = 0,
        }),
        ///  Control register 3
        CR3: mmio.Mmio(32, packed struct {
            ///  Error interrupt enable
            EIE: u1,
            ///  IrDA mode enable
            IREN: u1,
            ///  IrDA low-power
            IRLP: u1,
            ///  Half-duplex selection
            HDSEL: u1,
            ///  Smartcard NACK enable
            NACK: u1,
            ///  Smartcard mode enable
            SCEN: u1,
            ///  DMA enable receiver
            DMAR: u1,
            ///  DMA enable transmitter
            DMAT: u1,
            ///  RTS enable
            RTSE: u1,
            ///  CTS enable
            CTSE: u1,
            ///  CTS interrupt enable
            CTSIE: u1,
            padding: u21 = 0,
        }),
        ///  Guard time and prescaler register
        GTPR: mmio.Mmio(32, packed struct {
            ///  Prescaler value
            PSC: u8,
            ///  Guard time value
            GT: u8,
            padding: u16 = 0,
        }),
    };

    ///  Analog to digital converter
    pub const ADC1 = extern struct {
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            ///  Analog watchdog flag
            AWD: u1,
            ///  Regular channel end of conversion
            EOC: u1,
            ///  Injected channel end of conversion
            JEOC: u1,
            ///  Injected channel start flag
            JSTRT: u1,
            ///  Regular channel start flag
            STRT: u1,
            padding: u27 = 0,
        }),
        ///  control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Analog watchdog channel select bits
            AWDCH: u5,
            ///  Interrupt enable for EOC
            EOCIE: u1,
            ///  Analog watchdog interrupt enable
            AWDIE: u1,
            ///  Interrupt enable for injected channels
            JEOCIE: u1,
            ///  Scan mode
            SCAN: u1,
            ///  Enable the watchdog on a single channel in scan mode
            AWDSGL: u1,
            ///  Automatic injected group conversion
            JAUTO: u1,
            ///  Discontinuous mode on regular channels
            DISCEN: u1,
            ///  Discontinuous mode on injected channels
            JDISCEN: u1,
            ///  Discontinuous mode channel count
            DISCNUM: u3,
            ///  Dual mode selection
            DUALMOD: u4,
            reserved22: u2 = 0,
            ///  Analog watchdog enable on injected channels
            JAWDEN: u1,
            ///  Analog watchdog enable on regular channels
            AWDEN: u1,
            padding: u8 = 0,
        }),
        ///  control register 2
        CR2: mmio.Mmio(32, packed struct {
            ///  A/D converter ON / OFF
            ADON: u1,
            ///  Continuous conversion
            CONT: u1,
            ///  A/D calibration
            CAL: u1,
            ///  Reset calibration
            RSTCAL: u1,
            reserved8: u4 = 0,
            ///  Direct memory access mode
            DMA: u1,
            reserved11: u2 = 0,
            ///  Data alignment
            ALIGN: u1,
            ///  External event select for injected group
            JEXTSEL: u3,
            ///  External trigger conversion mode for injected channels
            JEXTTRIG: u1,
            reserved17: u1 = 0,
            ///  External event select for regular group
            EXTSEL: u3,
            ///  External trigger conversion mode for regular channels
            EXTTRIG: u1,
            ///  Start conversion of injected channels
            JSWSTART: u1,
            ///  Start conversion of regular channels
            SWSTART: u1,
            ///  Temperature sensor and VREFINT enable
            TSVREFE: u1,
            padding: u8 = 0,
        }),
        ///  sample time register 1
        SMPR1: mmio.Mmio(32, packed struct {
            ///  Channel 10 sample time selection
            SMP10: u3,
            ///  Channel 11 sample time selection
            SMP11: u3,
            ///  Channel 12 sample time selection
            SMP12: u3,
            ///  Channel 13 sample time selection
            SMP13: u3,
            ///  Channel 14 sample time selection
            SMP14: u3,
            ///  Channel 15 sample time selection
            SMP15: u3,
            ///  Channel 16 sample time selection
            SMP16: u3,
            ///  Channel 17 sample time selection
            SMP17: u3,
            padding: u8 = 0,
        }),
        ///  sample time register 2
        SMPR2: mmio.Mmio(32, packed struct {
            ///  Channel 0 sample time selection
            SMP0: u3,
            ///  Channel 1 sample time selection
            SMP1: u3,
            ///  Channel 2 sample time selection
            SMP2: u3,
            ///  Channel 3 sample time selection
            SMP3: u3,
            ///  Channel 4 sample time selection
            SMP4: u3,
            ///  Channel 5 sample time selection
            SMP5: u3,
            ///  Channel 6 sample time selection
            SMP6: u3,
            ///  Channel 7 sample time selection
            SMP7: u3,
            ///  Channel 8 sample time selection
            SMP8: u3,
            ///  Channel 9 sample time selection
            SMP9: u3,
            padding: u2 = 0,
        }),
        ///  injected channel data offset register x
        JOFR1: mmio.Mmio(32, packed struct {
            ///  Data offset for injected channel x
            JOFFSET1: u12,
            padding: u20 = 0,
        }),
        ///  injected channel data offset register x
        JOFR2: mmio.Mmio(32, packed struct {
            ///  Data offset for injected channel x
            JOFFSET2: u12,
            padding: u20 = 0,
        }),
        ///  injected channel data offset register x
        JOFR3: mmio.Mmio(32, packed struct {
            ///  Data offset for injected channel x
            JOFFSET3: u12,
            padding: u20 = 0,
        }),
        ///  injected channel data offset register x
        JOFR4: mmio.Mmio(32, packed struct {
            ///  Data offset for injected channel x
            JOFFSET4: u12,
            padding: u20 = 0,
        }),
        ///  watchdog higher threshold register
        HTR: mmio.Mmio(32, packed struct {
            ///  Analog watchdog higher threshold
            HT: u12,
            padding: u20 = 0,
        }),
        ///  watchdog lower threshold register
        LTR: mmio.Mmio(32, packed struct {
            ///  Analog watchdog lower threshold
            LT: u12,
            padding: u20 = 0,
        }),
        ///  regular sequence register 1
        SQR1: mmio.Mmio(32, packed struct {
            ///  13th conversion in regular sequence
            SQ13: u5,
            ///  14th conversion in regular sequence
            SQ14: u5,
            ///  15th conversion in regular sequence
            SQ15: u5,
            ///  16th conversion in regular sequence
            SQ16: u5,
            ///  Regular channel sequence length
            L: u4,
            padding: u8 = 0,
        }),
        ///  regular sequence register 2
        SQR2: mmio.Mmio(32, packed struct {
            ///  7th conversion in regular sequence
            SQ7: u5,
            ///  8th conversion in regular sequence
            SQ8: u5,
            ///  9th conversion in regular sequence
            SQ9: u5,
            ///  10th conversion in regular sequence
            SQ10: u5,
            ///  11th conversion in regular sequence
            SQ11: u5,
            ///  12th conversion in regular sequence
            SQ12: u5,
            padding: u2 = 0,
        }),
        ///  regular sequence register 3
        SQR3: mmio.Mmio(32, packed struct {
            ///  1st conversion in regular sequence
            SQ1: u5,
            ///  2nd conversion in regular sequence
            SQ2: u5,
            ///  3rd conversion in regular sequence
            SQ3: u5,
            ///  4th conversion in regular sequence
            SQ4: u5,
            ///  5th conversion in regular sequence
            SQ5: u5,
            ///  6th conversion in regular sequence
            SQ6: u5,
            padding: u2 = 0,
        }),
        ///  injected sequence register
        JSQR: mmio.Mmio(32, packed struct {
            ///  1st conversion in injected sequence
            JSQ1: u5,
            ///  2nd conversion in injected sequence
            JSQ2: u5,
            ///  3rd conversion in injected sequence
            JSQ3: u5,
            ///  4th conversion in injected sequence
            JSQ4: u5,
            ///  Injected sequence length
            JL: u2,
            padding: u10 = 0,
        }),
        ///  injected data register x
        JDR1: mmio.Mmio(32, packed struct {
            ///  Injected data
            JDATA: u16,
            padding: u16 = 0,
        }),
        ///  injected data register x
        JDR2: mmio.Mmio(32, packed struct {
            ///  Injected data
            JDATA: u16,
            padding: u16 = 0,
        }),
        ///  injected data register x
        JDR3: mmio.Mmio(32, packed struct {
            ///  Injected data
            JDATA: u16,
            padding: u16 = 0,
        }),
        ///  injected data register x
        JDR4: mmio.Mmio(32, packed struct {
            ///  Injected data
            JDATA: u16,
            padding: u16 = 0,
        }),
        ///  regular data register
        DR: mmio.Mmio(32, packed struct {
            ///  Regular data
            DATA: u16,
            ///  ADC2 data
            ADC2DATA: u16,
        }),
    };

    ///  Analog to digital converter
    pub const ADC2 = extern struct {
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            ///  Analog watchdog flag
            AWD: u1,
            ///  Regular channel end of conversion
            EOC: u1,
            ///  Injected channel end of conversion
            JEOC: u1,
            ///  Injected channel start flag
            JSTRT: u1,
            ///  Regular channel start flag
            STRT: u1,
            padding: u27 = 0,
        }),
        ///  control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Analog watchdog channel select bits
            AWDCH: u5,
            ///  Interrupt enable for EOC
            EOCIE: u1,
            ///  Analog watchdog interrupt enable
            AWDIE: u1,
            ///  Interrupt enable for injected channels
            JEOCIE: u1,
            ///  Scan mode
            SCAN: u1,
            ///  Enable the watchdog on a single channel in scan mode
            AWDSGL: u1,
            ///  Automatic injected group conversion
            JAUTO: u1,
            ///  Discontinuous mode on regular channels
            DISCEN: u1,
            ///  Discontinuous mode on injected channels
            JDISCEN: u1,
            ///  Discontinuous mode channel count
            DISCNUM: u3,
            reserved22: u6 = 0,
            ///  Analog watchdog enable on injected channels
            JAWDEN: u1,
            ///  Analog watchdog enable on regular channels
            AWDEN: u1,
            padding: u8 = 0,
        }),
        ///  control register 2
        CR2: mmio.Mmio(32, packed struct {
            ///  A/D converter ON / OFF
            ADON: u1,
            ///  Continuous conversion
            CONT: u1,
            ///  A/D calibration
            CAL: u1,
            ///  Reset calibration
            RSTCAL: u1,
            reserved8: u4 = 0,
            ///  Direct memory access mode
            DMA: u1,
            reserved11: u2 = 0,
            ///  Data alignment
            ALIGN: u1,
            ///  External event select for injected group
            JEXTSEL: u3,
            ///  External trigger conversion mode for injected channels
            JEXTTRIG: u1,
            reserved17: u1 = 0,
            ///  External event select for regular group
            EXTSEL: u3,
            ///  External trigger conversion mode for regular channels
            EXTTRIG: u1,
            ///  Start conversion of injected channels
            JSWSTART: u1,
            ///  Start conversion of regular channels
            SWSTART: u1,
            ///  Temperature sensor and VREFINT enable
            TSVREFE: u1,
            padding: u8 = 0,
        }),
        ///  sample time register 1
        SMPR1: mmio.Mmio(32, packed struct {
            ///  Channel 10 sample time selection
            SMP10: u3,
            ///  Channel 11 sample time selection
            SMP11: u3,
            ///  Channel 12 sample time selection
            SMP12: u3,
            ///  Channel 13 sample time selection
            SMP13: u3,
            ///  Channel 14 sample time selection
            SMP14: u3,
            ///  Channel 15 sample time selection
            SMP15: u3,
            ///  Channel 16 sample time selection
            SMP16: u3,
            ///  Channel 17 sample time selection
            SMP17: u3,
            padding: u8 = 0,
        }),
        ///  sample time register 2
        SMPR2: mmio.Mmio(32, packed struct {
            ///  Channel 0 sample time selection
            SMP0: u3,
            ///  Channel 1 sample time selection
            SMP1: u3,
            ///  Channel 2 sample time selection
            SMP2: u3,
            ///  Channel 3 sample time selection
            SMP3: u3,
            ///  Channel 4 sample time selection
            SMP4: u3,
            ///  Channel 5 sample time selection
            SMP5: u3,
            ///  Channel 6 sample time selection
            SMP6: u3,
            ///  Channel 7 sample time selection
            SMP7: u3,
            ///  Channel 8 sample time selection
            SMP8: u3,
            ///  Channel 9 sample time selection
            SMP9: u3,
            padding: u2 = 0,
        }),
        ///  injected channel data offset register x
        JOFR1: mmio.Mmio(32, packed struct {
            ///  Data offset for injected channel x
            JOFFSET1: u12,
            padding: u20 = 0,
        }),
        ///  injected channel data offset register x
        JOFR2: mmio.Mmio(32, packed struct {
            ///  Data offset for injected channel x
            JOFFSET2: u12,
            padding: u20 = 0,
        }),
        ///  injected channel data offset register x
        JOFR3: mmio.Mmio(32, packed struct {
            ///  Data offset for injected channel x
            JOFFSET3: u12,
            padding: u20 = 0,
        }),
        ///  injected channel data offset register x
        JOFR4: mmio.Mmio(32, packed struct {
            ///  Data offset for injected channel x
            JOFFSET4: u12,
            padding: u20 = 0,
        }),
        ///  watchdog higher threshold register
        HTR: mmio.Mmio(32, packed struct {
            ///  Analog watchdog higher threshold
            HT: u12,
            padding: u20 = 0,
        }),
        ///  watchdog lower threshold register
        LTR: mmio.Mmio(32, packed struct {
            ///  Analog watchdog lower threshold
            LT: u12,
            padding: u20 = 0,
        }),
        ///  regular sequence register 1
        SQR1: mmio.Mmio(32, packed struct {
            ///  13th conversion in regular sequence
            SQ13: u5,
            ///  14th conversion in regular sequence
            SQ14: u5,
            ///  15th conversion in regular sequence
            SQ15: u5,
            ///  16th conversion in regular sequence
            SQ16: u5,
            ///  Regular channel sequence length
            L: u4,
            padding: u8 = 0,
        }),
        ///  regular sequence register 2
        SQR2: mmio.Mmio(32, packed struct {
            ///  7th conversion in regular sequence
            SQ7: u5,
            ///  8th conversion in regular sequence
            SQ8: u5,
            ///  9th conversion in regular sequence
            SQ9: u5,
            ///  10th conversion in regular sequence
            SQ10: u5,
            ///  11th conversion in regular sequence
            SQ11: u5,
            ///  12th conversion in regular sequence
            SQ12: u5,
            padding: u2 = 0,
        }),
        ///  regular sequence register 3
        SQR3: mmio.Mmio(32, packed struct {
            ///  1st conversion in regular sequence
            SQ1: u5,
            ///  2nd conversion in regular sequence
            SQ2: u5,
            ///  3rd conversion in regular sequence
            SQ3: u5,
            ///  4th conversion in regular sequence
            SQ4: u5,
            ///  5th conversion in regular sequence
            SQ5: u5,
            ///  6th conversion in regular sequence
            SQ6: u5,
            padding: u2 = 0,
        }),
        ///  injected sequence register
        JSQR: mmio.Mmio(32, packed struct {
            ///  1st conversion in injected sequence
            JSQ1: u5,
            ///  2nd conversion in injected sequence
            JSQ2: u5,
            ///  3rd conversion in injected sequence
            JSQ3: u5,
            ///  4th conversion in injected sequence
            JSQ4: u5,
            ///  Injected sequence length
            JL: u2,
            padding: u10 = 0,
        }),
        ///  injected data register x
        JDR1: mmio.Mmio(32, packed struct {
            ///  Injected data
            JDATA: u16,
            padding: u16 = 0,
        }),
        ///  injected data register x
        JDR2: mmio.Mmio(32, packed struct {
            ///  Injected data
            JDATA: u16,
            padding: u16 = 0,
        }),
        ///  injected data register x
        JDR3: mmio.Mmio(32, packed struct {
            ///  Injected data
            JDATA: u16,
            padding: u16 = 0,
        }),
        ///  injected data register x
        JDR4: mmio.Mmio(32, packed struct {
            ///  Injected data
            JDATA: u16,
            padding: u16 = 0,
        }),
        ///  regular data register
        DR: mmio.Mmio(32, packed struct {
            ///  Regular data
            DATA: u16,
            padding: u16 = 0,
        }),
    };

    ///  Controller area network
    pub const CAN = extern struct {
        ///  CAN_MCR
        CAN_MCR: mmio.Mmio(32, packed struct {
            ///  INRQ
            INRQ: u1,
            ///  SLEEP
            SLEEP: u1,
            ///  TXFP
            TXFP: u1,
            ///  RFLM
            RFLM: u1,
            ///  NART
            NART: u1,
            ///  AWUM
            AWUM: u1,
            ///  ABOM
            ABOM: u1,
            ///  TTCM
            TTCM: u1,
            reserved15: u7 = 0,
            ///  RESET
            RESET: u1,
            ///  DBF
            DBF: u1,
            padding: u15 = 0,
        }),
        ///  CAN_MSR
        CAN_MSR: mmio.Mmio(32, packed struct {
            ///  INAK
            INAK: u1,
            ///  SLAK
            SLAK: u1,
            ///  ERRI
            ERRI: u1,
            ///  WKUI
            WKUI: u1,
            ///  SLAKI
            SLAKI: u1,
            reserved8: u3 = 0,
            ///  TXM
            TXM: u1,
            ///  RXM
            RXM: u1,
            ///  SAMP
            SAMP: u1,
            ///  RX
            RX: u1,
            padding: u20 = 0,
        }),
        ///  CAN_TSR
        CAN_TSR: mmio.Mmio(32, packed struct {
            ///  RQCP0
            RQCP0: u1,
            ///  TXOK0
            TXOK0: u1,
            ///  ALST0
            ALST0: u1,
            ///  TERR0
            TERR0: u1,
            reserved7: u3 = 0,
            ///  ABRQ0
            ABRQ0: u1,
            ///  RQCP1
            RQCP1: u1,
            ///  TXOK1
            TXOK1: u1,
            ///  ALST1
            ALST1: u1,
            ///  TERR1
            TERR1: u1,
            reserved15: u3 = 0,
            ///  ABRQ1
            ABRQ1: u1,
            ///  RQCP2
            RQCP2: u1,
            ///  TXOK2
            TXOK2: u1,
            ///  ALST2
            ALST2: u1,
            ///  TERR2
            TERR2: u1,
            reserved23: u3 = 0,
            ///  ABRQ2
            ABRQ2: u1,
            ///  CODE
            CODE: u2,
            ///  Lowest priority flag for mailbox 0
            TME0: u1,
            ///  Lowest priority flag for mailbox 1
            TME1: u1,
            ///  Lowest priority flag for mailbox 2
            TME2: u1,
            ///  Lowest priority flag for mailbox 0
            LOW0: u1,
            ///  Lowest priority flag for mailbox 1
            LOW1: u1,
            ///  Lowest priority flag for mailbox 2
            LOW2: u1,
        }),
        ///  CAN_RF0R
        CAN_RF0R: mmio.Mmio(32, packed struct {
            ///  FMP0
            FMP0: u2,
            reserved3: u1 = 0,
            ///  FULL0
            FULL0: u1,
            ///  FOVR0
            FOVR0: u1,
            ///  RFOM0
            RFOM0: u1,
            padding: u26 = 0,
        }),
        ///  CAN_RF1R
        CAN_RF1R: mmio.Mmio(32, packed struct {
            ///  FMP1
            FMP1: u2,
            reserved3: u1 = 0,
            ///  FULL1
            FULL1: u1,
            ///  FOVR1
            FOVR1: u1,
            ///  RFOM1
            RFOM1: u1,
            padding: u26 = 0,
        }),
        ///  CAN_IER
        CAN_IER: mmio.Mmio(32, packed struct {
            ///  TMEIE
            TMEIE: u1,
            ///  FMPIE0
            FMPIE0: u1,
            ///  FFIE0
            FFIE0: u1,
            ///  FOVIE0
            FOVIE0: u1,
            ///  FMPIE1
            FMPIE1: u1,
            ///  FFIE1
            FFIE1: u1,
            ///  FOVIE1
            FOVIE1: u1,
            reserved8: u1 = 0,
            ///  EWGIE
            EWGIE: u1,
            ///  EPVIE
            EPVIE: u1,
            ///  BOFIE
            BOFIE: u1,
            ///  LECIE
            LECIE: u1,
            reserved15: u3 = 0,
            ///  ERRIE
            ERRIE: u1,
            ///  WKUIE
            WKUIE: u1,
            ///  SLKIE
            SLKIE: u1,
            padding: u14 = 0,
        }),
        ///  CAN_ESR
        CAN_ESR: mmio.Mmio(32, packed struct {
            ///  EWGF
            EWGF: u1,
            ///  EPVF
            EPVF: u1,
            ///  BOFF
            BOFF: u1,
            reserved4: u1 = 0,
            ///  LEC
            LEC: u3,
            reserved16: u9 = 0,
            ///  TEC
            TEC: u8,
            ///  REC
            REC: u8,
        }),
        ///  CAN_BTR
        CAN_BTR: mmio.Mmio(32, packed struct {
            ///  BRP
            BRP: u10,
            reserved16: u6 = 0,
            ///  TS1
            TS1: u4,
            ///  TS2
            TS2: u3,
            reserved24: u1 = 0,
            ///  SJW
            SJW: u2,
            reserved30: u4 = 0,
            ///  LBKM
            LBKM: u1,
            ///  SILM
            SILM: u1,
        }),
        reserved384: [352]u8,
        ///  CAN_TI0R
        CAN_TI0R: mmio.Mmio(32, packed struct {
            ///  TXRQ
            TXRQ: u1,
            ///  RTR
            RTR: u1,
            ///  IDE
            IDE: u1,
            ///  EXID
            EXID: u18,
            ///  STID
            STID: u11,
        }),
        ///  CAN_TDT0R
        CAN_TDT0R: mmio.Mmio(32, packed struct {
            ///  DLC
            DLC: u4,
            reserved8: u4 = 0,
            ///  TGT
            TGT: u1,
            reserved16: u7 = 0,
            ///  TIME
            TIME: u16,
        }),
        ///  CAN_TDL0R
        CAN_TDL0R: mmio.Mmio(32, packed struct {
            ///  DATA0
            DATA0: u8,
            ///  DATA1
            DATA1: u8,
            ///  DATA2
            DATA2: u8,
            ///  DATA3
            DATA3: u8,
        }),
        ///  CAN_TDH0R
        CAN_TDH0R: mmio.Mmio(32, packed struct {
            ///  DATA4
            DATA4: u8,
            ///  DATA5
            DATA5: u8,
            ///  DATA6
            DATA6: u8,
            ///  DATA7
            DATA7: u8,
        }),
        ///  CAN_TI1R
        CAN_TI1R: mmio.Mmio(32, packed struct {
            ///  TXRQ
            TXRQ: u1,
            ///  RTR
            RTR: u1,
            ///  IDE
            IDE: u1,
            ///  EXID
            EXID: u18,
            ///  STID
            STID: u11,
        }),
        ///  CAN_TDT1R
        CAN_TDT1R: mmio.Mmio(32, packed struct {
            ///  DLC
            DLC: u4,
            reserved8: u4 = 0,
            ///  TGT
            TGT: u1,
            reserved16: u7 = 0,
            ///  TIME
            TIME: u16,
        }),
        ///  CAN_TDL1R
        CAN_TDL1R: mmio.Mmio(32, packed struct {
            ///  DATA0
            DATA0: u8,
            ///  DATA1
            DATA1: u8,
            ///  DATA2
            DATA2: u8,
            ///  DATA3
            DATA3: u8,
        }),
        ///  CAN_TDH1R
        CAN_TDH1R: mmio.Mmio(32, packed struct {
            ///  DATA4
            DATA4: u8,
            ///  DATA5
            DATA5: u8,
            ///  DATA6
            DATA6: u8,
            ///  DATA7
            DATA7: u8,
        }),
        ///  CAN_TI2R
        CAN_TI2R: mmio.Mmio(32, packed struct {
            ///  TXRQ
            TXRQ: u1,
            ///  RTR
            RTR: u1,
            ///  IDE
            IDE: u1,
            ///  EXID
            EXID: u18,
            ///  STID
            STID: u11,
        }),
        ///  CAN_TDT2R
        CAN_TDT2R: mmio.Mmio(32, packed struct {
            ///  DLC
            DLC: u4,
            reserved8: u4 = 0,
            ///  TGT
            TGT: u1,
            reserved16: u7 = 0,
            ///  TIME
            TIME: u16,
        }),
        ///  CAN_TDL2R
        CAN_TDL2R: mmio.Mmio(32, packed struct {
            ///  DATA0
            DATA0: u8,
            ///  DATA1
            DATA1: u8,
            ///  DATA2
            DATA2: u8,
            ///  DATA3
            DATA3: u8,
        }),
        ///  CAN_TDH2R
        CAN_TDH2R: mmio.Mmio(32, packed struct {
            ///  DATA4
            DATA4: u8,
            ///  DATA5
            DATA5: u8,
            ///  DATA6
            DATA6: u8,
            ///  DATA7
            DATA7: u8,
        }),
        ///  CAN_RI0R
        CAN_RI0R: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  RTR
            RTR: u1,
            ///  IDE
            IDE: u1,
            ///  EXID
            EXID: u18,
            ///  STID
            STID: u11,
        }),
        ///  CAN_RDT0R
        CAN_RDT0R: mmio.Mmio(32, packed struct {
            ///  DLC
            DLC: u4,
            reserved8: u4 = 0,
            ///  FMI
            FMI: u8,
            ///  TIME
            TIME: u16,
        }),
        ///  CAN_RDL0R
        CAN_RDL0R: mmio.Mmio(32, packed struct {
            ///  DATA0
            DATA0: u8,
            ///  DATA1
            DATA1: u8,
            ///  DATA2
            DATA2: u8,
            ///  DATA3
            DATA3: u8,
        }),
        ///  CAN_RDH0R
        CAN_RDH0R: mmio.Mmio(32, packed struct {
            ///  DATA4
            DATA4: u8,
            ///  DATA5
            DATA5: u8,
            ///  DATA6
            DATA6: u8,
            ///  DATA7
            DATA7: u8,
        }),
        ///  CAN_RI1R
        CAN_RI1R: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  RTR
            RTR: u1,
            ///  IDE
            IDE: u1,
            ///  EXID
            EXID: u18,
            ///  STID
            STID: u11,
        }),
        ///  CAN_RDT1R
        CAN_RDT1R: mmio.Mmio(32, packed struct {
            ///  DLC
            DLC: u4,
            reserved8: u4 = 0,
            ///  FMI
            FMI: u8,
            ///  TIME
            TIME: u16,
        }),
        ///  CAN_RDL1R
        CAN_RDL1R: mmio.Mmio(32, packed struct {
            ///  DATA0
            DATA0: u8,
            ///  DATA1
            DATA1: u8,
            ///  DATA2
            DATA2: u8,
            ///  DATA3
            DATA3: u8,
        }),
        ///  CAN_RDH1R
        CAN_RDH1R: mmio.Mmio(32, packed struct {
            ///  DATA4
            DATA4: u8,
            ///  DATA5
            DATA5: u8,
            ///  DATA6
            DATA6: u8,
            ///  DATA7
            DATA7: u8,
        }),
        reserved512: [48]u8,
        ///  CAN_FMR
        CAN_FMR: mmio.Mmio(32, packed struct {
            ///  FINIT
            FINIT: u1,
            padding: u31 = 0,
        }),
        ///  CAN_FM1R
        CAN_FM1R: mmio.Mmio(32, packed struct {
            ///  Filter mode
            FBM0: u1,
            ///  Filter mode
            FBM1: u1,
            ///  Filter mode
            FBM2: u1,
            ///  Filter mode
            FBM3: u1,
            ///  Filter mode
            FBM4: u1,
            ///  Filter mode
            FBM5: u1,
            ///  Filter mode
            FBM6: u1,
            ///  Filter mode
            FBM7: u1,
            ///  Filter mode
            FBM8: u1,
            ///  Filter mode
            FBM9: u1,
            ///  Filter mode
            FBM10: u1,
            ///  Filter mode
            FBM11: u1,
            ///  Filter mode
            FBM12: u1,
            ///  Filter mode
            FBM13: u1,
            padding: u18 = 0,
        }),
        reserved524: [4]u8,
        ///  CAN_FS1R
        CAN_FS1R: mmio.Mmio(32, packed struct {
            ///  Filter scale configuration
            FSC0: u1,
            ///  Filter scale configuration
            FSC1: u1,
            ///  Filter scale configuration
            FSC2: u1,
            ///  Filter scale configuration
            FSC3: u1,
            ///  Filter scale configuration
            FSC4: u1,
            ///  Filter scale configuration
            FSC5: u1,
            ///  Filter scale configuration
            FSC6: u1,
            ///  Filter scale configuration
            FSC7: u1,
            ///  Filter scale configuration
            FSC8: u1,
            ///  Filter scale configuration
            FSC9: u1,
            ///  Filter scale configuration
            FSC10: u1,
            ///  Filter scale configuration
            FSC11: u1,
            ///  Filter scale configuration
            FSC12: u1,
            ///  Filter scale configuration
            FSC13: u1,
            padding: u18 = 0,
        }),
        reserved532: [4]u8,
        ///  CAN_FFA1R
        CAN_FFA1R: mmio.Mmio(32, packed struct {
            ///  Filter FIFO assignment for filter 0
            FFA0: u1,
            ///  Filter FIFO assignment for filter 1
            FFA1: u1,
            ///  Filter FIFO assignment for filter 2
            FFA2: u1,
            ///  Filter FIFO assignment for filter 3
            FFA3: u1,
            ///  Filter FIFO assignment for filter 4
            FFA4: u1,
            ///  Filter FIFO assignment for filter 5
            FFA5: u1,
            ///  Filter FIFO assignment for filter 6
            FFA6: u1,
            ///  Filter FIFO assignment for filter 7
            FFA7: u1,
            ///  Filter FIFO assignment for filter 8
            FFA8: u1,
            ///  Filter FIFO assignment for filter 9
            FFA9: u1,
            ///  Filter FIFO assignment for filter 10
            FFA10: u1,
            ///  Filter FIFO assignment for filter 11
            FFA11: u1,
            ///  Filter FIFO assignment for filter 12
            FFA12: u1,
            ///  Filter FIFO assignment for filter 13
            FFA13: u1,
            padding: u18 = 0,
        }),
        reserved540: [4]u8,
        ///  CAN_FA1R
        CAN_FA1R: mmio.Mmio(32, packed struct {
            ///  Filter active
            FACT0: u1,
            ///  Filter active
            FACT1: u1,
            ///  Filter active
            FACT2: u1,
            ///  Filter active
            FACT3: u1,
            ///  Filter active
            FACT4: u1,
            ///  Filter active
            FACT5: u1,
            ///  Filter active
            FACT6: u1,
            ///  Filter active
            FACT7: u1,
            ///  Filter active
            FACT8: u1,
            ///  Filter active
            FACT9: u1,
            ///  Filter active
            FACT10: u1,
            ///  Filter active
            FACT11: u1,
            ///  Filter active
            FACT12: u1,
            ///  Filter active
            FACT13: u1,
            padding: u18 = 0,
        }),
        reserved576: [32]u8,
        ///  Filter bank 0 register 1
        F0R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 0 register 2
        F0R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 1 register 1
        F1R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 1 register 2
        F1R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 2 register 1
        F2R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 2 register 2
        F2R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 3 register 1
        F3R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 3 register 2
        F3R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 4 register 1
        F4R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 4 register 2
        F4R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 5 register 1
        F5R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 5 register 2
        F5R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 6 register 1
        F6R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 6 register 2
        F6R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 7 register 1
        F7R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 7 register 2
        F7R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 8 register 1
        F8R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 8 register 2
        F8R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 9 register 1
        F9R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 9 register 2
        F9R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 10 register 1
        F10R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 10 register 2
        F10R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 11 register 1
        F11R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 11 register 2
        F11R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 4 register 1
        F12R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 12 register 2
        F12R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 13 register 1
        F13R1: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
        ///  Filter bank 13 register 2
        F13R2: mmio.Mmio(32, packed struct {
            ///  Filter bits
            FB0: u1,
            ///  Filter bits
            FB1: u1,
            ///  Filter bits
            FB2: u1,
            ///  Filter bits
            FB3: u1,
            ///  Filter bits
            FB4: u1,
            ///  Filter bits
            FB5: u1,
            ///  Filter bits
            FB6: u1,
            ///  Filter bits
            FB7: u1,
            ///  Filter bits
            FB8: u1,
            ///  Filter bits
            FB9: u1,
            ///  Filter bits
            FB10: u1,
            ///  Filter bits
            FB11: u1,
            ///  Filter bits
            FB12: u1,
            ///  Filter bits
            FB13: u1,
            ///  Filter bits
            FB14: u1,
            ///  Filter bits
            FB15: u1,
            ///  Filter bits
            FB16: u1,
            ///  Filter bits
            FB17: u1,
            ///  Filter bits
            FB18: u1,
            ///  Filter bits
            FB19: u1,
            ///  Filter bits
            FB20: u1,
            ///  Filter bits
            FB21: u1,
            ///  Filter bits
            FB22: u1,
            ///  Filter bits
            FB23: u1,
            ///  Filter bits
            FB24: u1,
            ///  Filter bits
            FB25: u1,
            ///  Filter bits
            FB26: u1,
            ///  Filter bits
            FB27: u1,
            ///  Filter bits
            FB28: u1,
            ///  Filter bits
            FB29: u1,
            ///  Filter bits
            FB30: u1,
            ///  Filter bits
            FB31: u1,
        }),
    };

    ///  Digital to analog converter
    pub const DAC = extern struct {
        ///  Control register (DAC_CR)
        CR: mmio.Mmio(32, packed struct {
            ///  DAC channel1 enable
            EN1: u1,
            ///  DAC channel1 output buffer disable
            BOFF1: u1,
            ///  DAC channel1 trigger enable
            TEN1: u1,
            ///  DAC channel1 trigger selection
            TSEL1: u3,
            ///  DAC channel1 noise/triangle wave generation enable
            WAVE1: u2,
            ///  DAC channel1 mask/amplitude selector
            MAMP1: u4,
            ///  DAC channel1 DMA enable
            DMAEN1: u1,
            reserved16: u3 = 0,
            ///  DAC channel2 enable
            EN2: u1,
            ///  DAC channel2 output buffer disable
            BOFF2: u1,
            ///  DAC channel2 trigger enable
            TEN2: u1,
            ///  DAC channel2 trigger selection
            TSEL2: u3,
            ///  DAC channel2 noise/triangle wave generation enable
            WAVE2: u2,
            ///  DAC channel2 mask/amplitude selector
            MAMP2: u4,
            ///  DAC channel2 DMA enable
            DMAEN2: u1,
            padding: u3 = 0,
        }),
        ///  DAC software trigger register (DAC_SWTRIGR)
        SWTRIGR: mmio.Mmio(32, packed struct {
            ///  DAC channel1 software trigger
            SWTRIG1: u1,
            ///  DAC channel2 software trigger
            SWTRIG2: u1,
            padding: u30 = 0,
        }),
        ///  DAC channel1 12-bit right-aligned data holding register(DAC_DHR12R1)
        DHR12R1: mmio.Mmio(32, packed struct {
            ///  DAC channel1 12-bit right-aligned data
            DACC1DHR: u12,
            padding: u20 = 0,
        }),
        ///  DAC channel1 12-bit left aligned data holding register (DAC_DHR12L1)
        DHR12L1: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  DAC channel1 12-bit left-aligned data
            DACC1DHR: u12,
            padding: u16 = 0,
        }),
        ///  DAC channel1 8-bit right aligned data holding register (DAC_DHR8R1)
        DHR8R1: mmio.Mmio(32, packed struct {
            ///  DAC channel1 8-bit right-aligned data
            DACC1DHR: u8,
            padding: u24 = 0,
        }),
        ///  DAC channel2 12-bit right aligned data holding register (DAC_DHR12R2)
        DHR12R2: mmio.Mmio(32, packed struct {
            ///  DAC channel2 12-bit right-aligned data
            DACC2DHR: u12,
            padding: u20 = 0,
        }),
        ///  DAC channel2 12-bit left aligned data holding register (DAC_DHR12L2)
        DHR12L2: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  DAC channel2 12-bit left-aligned data
            DACC2DHR: u12,
            padding: u16 = 0,
        }),
        ///  DAC channel2 8-bit right-aligned data holding register (DAC_DHR8R2)
        DHR8R2: mmio.Mmio(32, packed struct {
            ///  DAC channel2 8-bit right-aligned data
            DACC2DHR: u8,
            padding: u24 = 0,
        }),
        ///  Dual DAC 12-bit right-aligned data holding register (DAC_DHR12RD), Bits 31:28 Reserved, Bits 15:12 Reserved
        DHR12RD: mmio.Mmio(32, packed struct {
            ///  DAC channel1 12-bit right-aligned data
            DACC1DHR: u12,
            reserved16: u4 = 0,
            ///  DAC channel2 12-bit right-aligned data
            DACC2DHR: u12,
            padding: u4 = 0,
        }),
        ///  DUAL DAC 12-bit left aligned data holding register (DAC_DHR12LD), Bits 19:16 Reserved, Bits 3:0 Reserved
        DHR12LD: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  DAC channel1 12-bit left-aligned data
            DACC1DHR: u12,
            reserved20: u4 = 0,
            ///  DAC channel2 12-bit right-aligned data
            DACC2DHR: u12,
        }),
        ///  DUAL DAC 8-bit right aligned data holding register (DAC_DHR8RD), Bits 31:16 Reserved
        DHR8RD: mmio.Mmio(32, packed struct {
            ///  DAC channel1 8-bit right-aligned data
            DACC1DHR: u8,
            ///  DAC channel2 8-bit right-aligned data
            DACC2DHR: u8,
            padding: u16 = 0,
        }),
        ///  DAC channel1 data output register (DAC_DOR1)
        DOR1: mmio.Mmio(32, packed struct {
            ///  DAC channel1 data output
            DACC1DOR: u12,
            padding: u20 = 0,
        }),
        ///  DAC channel2 data output register (DAC_DOR2)
        DOR2: mmio.Mmio(32, packed struct {
            ///  DAC channel2 data output
            DACC2DOR: u12,
            padding: u20 = 0,
        }),
    };

    ///  Debug support
    pub const DBG = extern struct {
        ///  DBGMCU_IDCODE
        IDCODE: mmio.Mmio(32, packed struct {
            ///  DEV_ID
            DEV_ID: u12,
            reserved16: u4 = 0,
            ///  REV_ID
            REV_ID: u16,
        }),
        ///  DBGMCU_CR
        CR: mmio.Mmio(32, packed struct {
            ///  DBG_SLEEP
            DBG_SLEEP: u1,
            ///  DBG_STOP
            DBG_STOP: u1,
            ///  DBG_STANDBY
            DBG_STANDBY: u1,
            reserved5: u2 = 0,
            ///  TRACE_IOEN
            TRACE_IOEN: u1,
            ///  TRACE_MODE
            TRACE_MODE: u2,
            ///  DBG_IWDG_STOP
            DBG_IWDG_STOP: u1,
            ///  DBG_WWDG_STOP
            DBG_WWDG_STOP: u1,
            ///  DBG_TIM1_STOP
            DBG_TIM1_STOP: u1,
            ///  DBG_TIM2_STOP
            DBG_TIM2_STOP: u1,
            ///  DBG_TIM3_STOP
            DBG_TIM3_STOP: u1,
            ///  DBG_TIM4_STOP
            DBG_TIM4_STOP: u1,
            ///  DBG_CAN1_STOP
            DBG_CAN1_STOP: u1,
            ///  DBG_I2C1_SMBUS_TIMEOUT
            DBG_I2C1_SMBUS_TIMEOUT: u1,
            ///  DBG_I2C2_SMBUS_TIMEOUT
            DBG_I2C2_SMBUS_TIMEOUT: u1,
            ///  DBG_TIM8_STOP
            DBG_TIM8_STOP: u1,
            ///  DBG_TIM5_STOP
            DBG_TIM5_STOP: u1,
            ///  DBG_TIM6_STOP
            DBG_TIM6_STOP: u1,
            ///  DBG_TIM7_STOP
            DBG_TIM7_STOP: u1,
            ///  DBG_CAN2_STOP
            DBG_CAN2_STOP: u1,
            padding: u10 = 0,
        }),
    };

    ///  Universal asynchronous receiver transmitter
    pub const UART4 = extern struct {
        ///  UART4_SR
        SR: mmio.Mmio(32, packed struct {
            ///  Parity error
            PE: u1,
            ///  Framing error
            FE: u1,
            ///  Noise error flag
            NE: u1,
            ///  Overrun error
            ORE: u1,
            ///  IDLE line detected
            IDLE: u1,
            ///  Read data register not empty
            RXNE: u1,
            ///  Transmission complete
            TC: u1,
            ///  Transmit data register empty
            TXE: u1,
            ///  LIN break detection flag
            LBD: u1,
            padding: u23 = 0,
        }),
        ///  UART4_DR
        DR: mmio.Mmio(32, packed struct {
            ///  DR
            DR: u9,
            padding: u23 = 0,
        }),
        ///  UART4_BRR
        BRR: mmio.Mmio(32, packed struct {
            ///  DIV_Fraction
            DIV_Fraction: u4,
            ///  DIV_Mantissa
            DIV_Mantissa: u12,
            padding: u16 = 0,
        }),
        ///  UART4_CR1
        CR1: mmio.Mmio(32, packed struct {
            ///  Send break
            SBK: u1,
            ///  Receiver wakeup
            RWU: u1,
            ///  Receiver enable
            RE: u1,
            ///  Transmitter enable
            TE: u1,
            ///  IDLE interrupt enable
            IDLEIE: u1,
            ///  RXNE interrupt enable
            RXNEIE: u1,
            ///  Transmission complete interrupt enable
            TCIE: u1,
            ///  TXE interrupt enable
            TXEIE: u1,
            ///  PE interrupt enable
            PEIE: u1,
            ///  Parity selection
            PS: u1,
            ///  Parity control enable
            PCE: u1,
            ///  Wakeup method
            WAKE: u1,
            ///  Word length
            M: u1,
            ///  USART enable
            UE: u1,
            padding: u18 = 0,
        }),
        ///  UART4_CR2
        CR2: mmio.Mmio(32, packed struct {
            ///  Address of the USART node
            ADD: u4,
            reserved5: u1 = 0,
            ///  lin break detection length
            LBDL: u1,
            ///  LIN break detection interrupt enable
            LBDIE: u1,
            reserved12: u5 = 0,
            ///  STOP bits
            STOP: u2,
            ///  LIN mode enable
            LINEN: u1,
            padding: u17 = 0,
        }),
        ///  UART4_CR3
        CR3: mmio.Mmio(32, packed struct {
            ///  Error interrupt enable
            EIE: u1,
            ///  IrDA mode enable
            IREN: u1,
            ///  IrDA low-power
            IRLP: u1,
            ///  Half-duplex selection
            HDSEL: u1,
            reserved6: u2 = 0,
            ///  DMA enable receiver
            DMAR: u1,
            ///  DMA enable transmitter
            DMAT: u1,
            padding: u24 = 0,
        }),
    };

    ///  Universal asynchronous receiver transmitter
    pub const UART5 = extern struct {
        ///  UART4_SR
        SR: mmio.Mmio(32, packed struct {
            ///  PE
            PE: u1,
            ///  FE
            FE: u1,
            ///  NE
            NE: u1,
            ///  ORE
            ORE: u1,
            ///  IDLE
            IDLE: u1,
            ///  RXNE
            RXNE: u1,
            ///  TC
            TC: u1,
            ///  TXE
            TXE: u1,
            ///  LBD
            LBD: u1,
            padding: u23 = 0,
        }),
        ///  UART4_DR
        DR: mmio.Mmio(32, packed struct {
            ///  DR
            DR: u9,
            padding: u23 = 0,
        }),
        ///  UART4_BRR
        BRR: mmio.Mmio(32, packed struct {
            ///  DIV_Fraction
            DIV_Fraction: u4,
            ///  DIV_Mantissa
            DIV_Mantissa: u12,
            padding: u16 = 0,
        }),
        ///  UART4_CR1
        CR1: mmio.Mmio(32, packed struct {
            ///  SBK
            SBK: u1,
            ///  RWU
            RWU: u1,
            ///  RE
            RE: u1,
            ///  TE
            TE: u1,
            ///  IDLEIE
            IDLEIE: u1,
            ///  RXNEIE
            RXNEIE: u1,
            ///  TCIE
            TCIE: u1,
            ///  TXEIE
            TXEIE: u1,
            ///  PEIE
            PEIE: u1,
            ///  PS
            PS: u1,
            ///  PCE
            PCE: u1,
            ///  WAKE
            WAKE: u1,
            ///  M
            M: u1,
            ///  UE
            UE: u1,
            padding: u18 = 0,
        }),
        ///  UART4_CR2
        CR2: mmio.Mmio(32, packed struct {
            ///  ADD
            ADD: u4,
            reserved5: u1 = 0,
            ///  LBDL
            LBDL: u1,
            ///  LBDIE
            LBDIE: u1,
            reserved12: u5 = 0,
            ///  STOP
            STOP: u2,
            ///  LINEN
            LINEN: u1,
            padding: u17 = 0,
        }),
        ///  UART4_CR3
        CR3: mmio.Mmio(32, packed struct {
            ///  Error interrupt enable
            EIE: u1,
            ///  IrDA mode enable
            IREN: u1,
            ///  IrDA low-power
            IRLP: u1,
            ///  Half-duplex selection
            HDSEL: u1,
            reserved7: u3 = 0,
            ///  DMA enable transmitter
            DMAT: u1,
            padding: u24 = 0,
        }),
    };

    ///  CRC calculation unit
    pub const CRC = extern struct {
        ///  Data register
        DR: mmio.Mmio(32, packed struct {
            ///  Data Register
            DR: u32,
        }),
        ///  Independent Data register
        IDR: mmio.Mmio(32, packed struct {
            ///  Independent Data register
            IDR: u8,
            padding: u24 = 0,
        }),
        ///  Control register
        CR: mmio.Mmio(32, packed struct {
            ///  Reset bit
            RESET: u1,
            padding: u31 = 0,
        }),
    };

    ///  FLASH
    pub const FLASH = extern struct {
        ///  Flash access control register
        ACR: mmio.Mmio(32, packed struct {
            ///  Latency
            LATENCY: u3,
            ///  Flash half cycle access enable
            HLFCYA: u1,
            ///  Prefetch buffer enable
            PRFTBE: u1,
            ///  Prefetch buffer status
            PRFTBS: u1,
            padding: u26 = 0,
        }),
        ///  Flash key register
        KEYR: mmio.Mmio(32, packed struct {
            ///  FPEC key
            KEY: u32,
        }),
        ///  Flash option key register
        OPTKEYR: mmio.Mmio(32, packed struct {
            ///  Option byte key
            OPTKEY: u32,
        }),
        ///  Status register
        SR: mmio.Mmio(32, packed struct {
            ///  Busy
            BSY: u1,
            reserved2: u1 = 0,
            ///  Programming error
            PGERR: u1,
            reserved4: u1 = 0,
            ///  Write protection error
            WRPRTERR: u1,
            ///  End of operation
            EOP: u1,
            padding: u26 = 0,
        }),
        ///  Control register
        CR: mmio.Mmio(32, packed struct {
            ///  Programming
            PG: u1,
            ///  Page Erase
            PER: u1,
            ///  Mass Erase
            MER: u1,
            reserved4: u1 = 0,
            ///  Option byte programming
            OPTPG: u1,
            ///  Option byte erase
            OPTER: u1,
            ///  Start
            STRT: u1,
            ///  Lock
            LOCK: u1,
            reserved9: u1 = 0,
            ///  Option bytes write enable
            OPTWRE: u1,
            ///  Error interrupt enable
            ERRIE: u1,
            reserved12: u1 = 0,
            ///  End of operation interrupt enable
            EOPIE: u1,
            padding: u19 = 0,
        }),
        ///  Flash address register
        AR: mmio.Mmio(32, packed struct {
            ///  Flash Address
            FAR: u32,
        }),
        reserved28: [4]u8,
        ///  Option byte register
        OBR: mmio.Mmio(32, packed struct {
            ///  Option byte error
            OPTERR: u1,
            ///  Read protection
            RDPRT: u1,
            ///  WDG_SW
            WDG_SW: u1,
            ///  nRST_STOP
            nRST_STOP: u1,
            ///  nRST_STDBY
            nRST_STDBY: u1,
            reserved10: u5 = 0,
            ///  Data0
            Data0: u8,
            ///  Data1
            Data1: u8,
            padding: u6 = 0,
        }),
        ///  Write protection register
        WRPR: mmio.Mmio(32, packed struct {
            ///  Write protect
            WRP: u32,
        }),
    };

    ///  Nested Vectored Interrupt Controller
    pub const NVIC = extern struct {
        reserved4: [4]u8,
        ///  Interrupt Controller Type Register
        ICTR: mmio.Mmio(32, packed struct {
            ///  Total number of interrupt lines in groups
            INTLINESNUM: u4,
            padding: u28 = 0,
        }),
        reserved256: [248]u8,
        ///  Interrupt Set-Enable Register
        ISER0: mmio.Mmio(32, packed struct {
            ///  SETENA
            SETENA: u32,
        }),
        ///  Interrupt Set-Enable Register
        ISER1: mmio.Mmio(32, packed struct {
            ///  SETENA
            SETENA: u32,
        }),
        reserved384: [120]u8,
        ///  Interrupt Clear-Enable Register
        ICER0: mmio.Mmio(32, packed struct {
            ///  CLRENA
            CLRENA: u32,
        }),
        ///  Interrupt Clear-Enable Register
        ICER1: mmio.Mmio(32, packed struct {
            ///  CLRENA
            CLRENA: u32,
        }),
        reserved512: [120]u8,
        ///  Interrupt Set-Pending Register
        ISPR0: mmio.Mmio(32, packed struct {
            ///  SETPEND
            SETPEND: u32,
        }),
        ///  Interrupt Set-Pending Register
        ISPR1: mmio.Mmio(32, packed struct {
            ///  SETPEND
            SETPEND: u32,
        }),
        reserved640: [120]u8,
        ///  Interrupt Clear-Pending Register
        ICPR0: mmio.Mmio(32, packed struct {
            ///  CLRPEND
            CLRPEND: u32,
        }),
        ///  Interrupt Clear-Pending Register
        ICPR1: mmio.Mmio(32, packed struct {
            ///  CLRPEND
            CLRPEND: u32,
        }),
        reserved768: [120]u8,
        ///  Interrupt Active Bit Register
        IABR0: mmio.Mmio(32, packed struct {
            ///  ACTIVE
            ACTIVE: u32,
        }),
        ///  Interrupt Active Bit Register
        IABR1: mmio.Mmio(32, packed struct {
            ///  ACTIVE
            ACTIVE: u32,
        }),
        reserved1024: [248]u8,
        ///  Interrupt Priority Register
        IPR0: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR1: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR2: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR3: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR4: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR5: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR6: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR7: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR8: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR9: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR10: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR11: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR12: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR13: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        ///  Interrupt Priority Register
        IPR14: mmio.Mmio(32, packed struct {
            ///  IPR_N0
            IPR_N0: u8,
            ///  IPR_N1
            IPR_N1: u8,
            ///  IPR_N2
            IPR_N2: u8,
            ///  IPR_N3
            IPR_N3: u8,
        }),
        reserved3840: [2756]u8,
        ///  Software Triggered Interrupt Register
        STIR: mmio.Mmio(32, packed struct {
            ///  interrupt to be triggered
            INTID: u9,
            padding: u23 = 0,
        }),
    };

    ///  Universal serial bus full-speed device interface
    pub const USB = extern struct {
        ///  endpoint 0 register
        EP0R: mmio.Mmio(32, packed struct {
            ///  Endpoint address
            EA: u4,
            ///  Status bits, for transmission transfers
            STAT_TX: u2,
            ///  Data Toggle, for transmission transfers
            DTOG_TX: u1,
            ///  Correct Transfer for transmission
            CTR_TX: u1,
            ///  Endpoint kind
            EP_KIND: u1,
            ///  Endpoint type
            EP_TYPE: u2,
            ///  Setup transaction completed
            SETUP: u1,
            ///  Status bits, for reception transfers
            STAT_RX: u2,
            ///  Data Toggle, for reception transfers
            DTOG_RX: u1,
            ///  Correct transfer for reception
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint 1 register
        EP1R: mmio.Mmio(32, packed struct {
            ///  Endpoint address
            EA: u4,
            ///  Status bits, for transmission transfers
            STAT_TX: u2,
            ///  Data Toggle, for transmission transfers
            DTOG_TX: u1,
            ///  Correct Transfer for transmission
            CTR_TX: u1,
            ///  Endpoint kind
            EP_KIND: u1,
            ///  Endpoint type
            EP_TYPE: u2,
            ///  Setup transaction completed
            SETUP: u1,
            ///  Status bits, for reception transfers
            STAT_RX: u2,
            ///  Data Toggle, for reception transfers
            DTOG_RX: u1,
            ///  Correct transfer for reception
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint 2 register
        EP2R: mmio.Mmio(32, packed struct {
            ///  Endpoint address
            EA: u4,
            ///  Status bits, for transmission transfers
            STAT_TX: u2,
            ///  Data Toggle, for transmission transfers
            DTOG_TX: u1,
            ///  Correct Transfer for transmission
            CTR_TX: u1,
            ///  Endpoint kind
            EP_KIND: u1,
            ///  Endpoint type
            EP_TYPE: u2,
            ///  Setup transaction completed
            SETUP: u1,
            ///  Status bits, for reception transfers
            STAT_RX: u2,
            ///  Data Toggle, for reception transfers
            DTOG_RX: u1,
            ///  Correct transfer for reception
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint 3 register
        EP3R: mmio.Mmio(32, packed struct {
            ///  Endpoint address
            EA: u4,
            ///  Status bits, for transmission transfers
            STAT_TX: u2,
            ///  Data Toggle, for transmission transfers
            DTOG_TX: u1,
            ///  Correct Transfer for transmission
            CTR_TX: u1,
            ///  Endpoint kind
            EP_KIND: u1,
            ///  Endpoint type
            EP_TYPE: u2,
            ///  Setup transaction completed
            SETUP: u1,
            ///  Status bits, for reception transfers
            STAT_RX: u2,
            ///  Data Toggle, for reception transfers
            DTOG_RX: u1,
            ///  Correct transfer for reception
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint 4 register
        EP4R: mmio.Mmio(32, packed struct {
            ///  Endpoint address
            EA: u4,
            ///  Status bits, for transmission transfers
            STAT_TX: u2,
            ///  Data Toggle, for transmission transfers
            DTOG_TX: u1,
            ///  Correct Transfer for transmission
            CTR_TX: u1,
            ///  Endpoint kind
            EP_KIND: u1,
            ///  Endpoint type
            EP_TYPE: u2,
            ///  Setup transaction completed
            SETUP: u1,
            ///  Status bits, for reception transfers
            STAT_RX: u2,
            ///  Data Toggle, for reception transfers
            DTOG_RX: u1,
            ///  Correct transfer for reception
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint 5 register
        EP5R: mmio.Mmio(32, packed struct {
            ///  Endpoint address
            EA: u4,
            ///  Status bits, for transmission transfers
            STAT_TX: u2,
            ///  Data Toggle, for transmission transfers
            DTOG_TX: u1,
            ///  Correct Transfer for transmission
            CTR_TX: u1,
            ///  Endpoint kind
            EP_KIND: u1,
            ///  Endpoint type
            EP_TYPE: u2,
            ///  Setup transaction completed
            SETUP: u1,
            ///  Status bits, for reception transfers
            STAT_RX: u2,
            ///  Data Toggle, for reception transfers
            DTOG_RX: u1,
            ///  Correct transfer for reception
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint 6 register
        EP6R: mmio.Mmio(32, packed struct {
            ///  Endpoint address
            EA: u4,
            ///  Status bits, for transmission transfers
            STAT_TX: u2,
            ///  Data Toggle, for transmission transfers
            DTOG_TX: u1,
            ///  Correct Transfer for transmission
            CTR_TX: u1,
            ///  Endpoint kind
            EP_KIND: u1,
            ///  Endpoint type
            EP_TYPE: u2,
            ///  Setup transaction completed
            SETUP: u1,
            ///  Status bits, for reception transfers
            STAT_RX: u2,
            ///  Data Toggle, for reception transfers
            DTOG_RX: u1,
            ///  Correct transfer for reception
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint 7 register
        EP7R: mmio.Mmio(32, packed struct {
            ///  Endpoint address
            EA: u4,
            ///  Status bits, for transmission transfers
            STAT_TX: u2,
            ///  Data Toggle, for transmission transfers
            DTOG_TX: u1,
            ///  Correct Transfer for transmission
            CTR_TX: u1,
            ///  Endpoint kind
            EP_KIND: u1,
            ///  Endpoint type
            EP_TYPE: u2,
            ///  Setup transaction completed
            SETUP: u1,
            ///  Status bits, for reception transfers
            STAT_RX: u2,
            ///  Data Toggle, for reception transfers
            DTOG_RX: u1,
            ///  Correct transfer for reception
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        reserved64: [32]u8,
        ///  control register
        CNTR: mmio.Mmio(32, packed struct {
            ///  Force USB Reset
            FRES: u1,
            ///  Power down
            PDWN: u1,
            ///  Low-power mode
            LPMODE: u1,
            ///  Force suspend
            FSUSP: u1,
            ///  Resume request
            RESUME: u1,
            reserved8: u3 = 0,
            ///  Expected start of frame interrupt mask
            ESOFM: u1,
            ///  Start of frame interrupt mask
            SOFM: u1,
            ///  USB reset interrupt mask
            RESETM: u1,
            ///  Suspend mode interrupt mask
            SUSPM: u1,
            ///  Wakeup interrupt mask
            WKUPM: u1,
            ///  Error interrupt mask
            ERRM: u1,
            ///  Packet memory area over / underrun interrupt mask
            PMAOVRM: u1,
            ///  Correct transfer interrupt mask
            CTRM: u1,
            padding: u16 = 0,
        }),
        ///  interrupt status register
        ISTR: mmio.Mmio(32, packed struct {
            ///  Endpoint Identifier
            EP_ID: u4,
            ///  Direction of transaction
            DIR: u1,
            reserved8: u3 = 0,
            ///  Expected start frame
            ESOF: u1,
            ///  start of frame
            SOF: u1,
            ///  reset request
            RESET: u1,
            ///  Suspend mode request
            SUSP: u1,
            ///  Wakeup
            WKUP: u1,
            ///  Error
            ERR: u1,
            ///  Packet memory area over / underrun
            PMAOVR: u1,
            ///  Correct transfer
            CTR: u1,
            padding: u16 = 0,
        }),
        ///  frame number register
        FNR: mmio.Mmio(32, packed struct {
            ///  Frame number
            FN: u11,
            ///  Lost SOF
            LSOF: u2,
            ///  Locked
            LCK: u1,
            ///  Receive data - line status
            RXDM: u1,
            ///  Receive data + line status
            RXDP: u1,
            padding: u16 = 0,
        }),
        ///  device address
        DADDR: mmio.Mmio(32, packed struct {
            ///  Device address
            ADD: u7,
            ///  Enable function
            EF: u1,
            padding: u24 = 0,
        }),
        ///  Buffer table address
        BTABLE: mmio.Mmio(32, packed struct {
            reserved3: u3 = 0,
            ///  Buffer table
            BTABLE: u13,
            padding: u16 = 0,
        }),
    };
};
