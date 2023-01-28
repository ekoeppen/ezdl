const mmio = @import("mmio");

pub const devices = struct {
    ///  STM32L0x2
    pub const STM32L0x2 = struct {
        pub const properties = struct {
            pub const @"cpu.nvic_prio_bits" = "3";
            pub const @"cpu.mpu" = "false";
            pub const @"cpu.fpu" = "false";
            pub const @"cpu.revision" = "r0p0";
            pub const @"cpu.vendor_systick_config" = "false";
            pub const @"cpu.endian" = "little";
            pub const @"cpu.name" = "CM0+";
        };

        pub const interrupts = extern struct {
            pub const NMI = -14;
            pub const HardFault = -13;
            pub const SVCall = -5;
            pub const PendSV = -2;
            pub const SysTick = -1;
            ///  Window Watchdog interrupt
            pub const WWDG = 0;
            ///  PVD through EXTI line detection
            pub const PVD = 1;
            ///  RTC global interrupt
            pub const RTC = 2;
            ///  RCC global interrupt
            pub const RCC = 4;
            ///  EXTI Line[1:0] interrupts
            pub const EXTI0_1 = 5;
            ///  EXTI Line[3:2] interrupts
            pub const EXTI2_3 = 6;
            ///  EXTI Line15 and EXTI4 interrupts
            pub const EXTI4_15 = 7;
            ///  Touch sensing interrupt
            pub const TSC = 8;
            ///  DMA1 Channel1 global interrupt
            pub const DMA1_Channel1 = 9;
            ///  DMA1 Channel2 and 3 interrupts
            pub const DMA1_Channel2_3 = 10;
            ///  DMA1 Channel4 to 7 interrupts
            pub const DMA1_Channel4_7 = 11;
            ///  ADC and comparator 1 and 2
            pub const ADC_COMP = 12;
            ///  LPTIMER1 interrupt through EXTI29
            pub const LPTIM1 = 13;
            ///  USART4/USART5 global interrupt
            pub const USART4_USART5 = 14;
            ///  TIM2 global interrupt
            pub const TIM2 = 15;
            ///  TIM3 global interrupt
            pub const TIM3 = 16;
            ///  TIM6 global interrupt and DAC
            pub const TIM6_DAC = 17;
            ///  TIM7 global interrupt and DAC
            pub const TIM7 = 18;
            ///  TIMER21 global interrupt
            pub const TIM21 = 20;
            ///  I2C3 global interrupt
            pub const I2C3 = 21;
            ///  TIMER22 global interrupt
            pub const TIM22 = 22;
            ///  I2C1 global interrupt
            pub const I2C1 = 23;
            ///  I2C2 global interrupt
            pub const I2C2 = 24;
            ///  SPI1_global_interrupt
            pub const SPI1 = 25;
            ///  SPI2 global interrupt
            pub const SPI2 = 26;
            ///  USART1 global interrupt
            pub const USART1 = 27;
            ///  USART2 global interrupt
            pub const USART2 = 28;
            ///  AES global interrupt RNG global interrupt and LPUART1 global interrupt through
            pub const AES_RNG_LPUART1 = 29;
            ///  USB event interrupt through EXTI18
            pub const USB = 31;
        };

        pub const peripherals = struct {
            ///  General-purpose-timers
            pub const TIM2 = @intToPtr(*volatile types.TIM2, 0x40000000);
            ///  General-purpose-timers
            pub const TIM3 = @intToPtr(*volatile types.TIM2, 0x40000400);
            ///  Basic-timers
            pub const TIM6 = @intToPtr(*volatile types.TIM6, 0x40001000);
            ///  Basic-timers
            pub const TIM7 = @intToPtr(*volatile types.TIM6, 0x40001400);
            ///  Real-time clock
            pub const RTC = @intToPtr(*volatile types.RTC, 0x40002800);
            ///  System window watchdog
            pub const WWDG = @intToPtr(*volatile types.WWDG, 0x40002c00);
            ///  Independent watchdog
            pub const IWDG = @intToPtr(*volatile types.IWDG, 0x40003000);
            ///  Serial peripheral interface
            pub const SPI2 = @intToPtr(*volatile types.SPI1, 0x40003800);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART2 = @intToPtr(*volatile types.USART1, 0x40004400);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const LPUSART1 = @intToPtr(*volatile types.LPUSART1, 0x40004800);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART4 = @intToPtr(*volatile types.USART1, 0x40004c00);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART5 = @intToPtr(*volatile types.USART1, 0x40005000);
            ///  Inter-integrated circuit
            pub const I2C1 = @intToPtr(*volatile types.I2C1, 0x40005400);
            ///  Inter-integrated circuit
            pub const I2C2 = @intToPtr(*volatile types.I2C1, 0x40005800);
            ///  Universal serial bus full-speed device interface
            pub const USB_FS = @intToPtr(*volatile types.USB_FS, 0x40005c00);
            ///  Universal serial bus full-speed device interface
            pub const USB_SRAM = @intToPtr(*volatile types.USB_SRAM, 0x40006000);
            ///  Clock recovery system
            pub const CRS = @intToPtr(*volatile types.CRS, 0x40006c00);
            ///  Power control
            pub const PWR = @intToPtr(*volatile types.PWR, 0x40007000);
            ///  Digital-to-analog converter
            pub const DAC = @intToPtr(*volatile types.DAC, 0x40007400);
            ///  Inter-integrated circuit
            pub const I2C3 = @intToPtr(*volatile types.I2C1, 0x40007800);
            ///  Low power timer
            pub const LPTIM = @intToPtr(*volatile types.LPTIM, 0x40007c00);
            ///  System configuration controller and Comparator
            pub const SYSCFG_COMP = @intToPtr(*volatile types.SYSCFG_COMP, 0x40010000);
            ///  External interrupt/event controller
            pub const EXTI = @intToPtr(*volatile types.EXTI, 0x40010400);
            ///  General-purpose-timers
            pub const TIM21 = @intToPtr(*volatile types.TIM21, 0x40010800);
            ///  General-purpose-timers
            pub const TIM22 = @intToPtr(*volatile types.TIM22, 0x40011400);
            ///  Firewall
            pub const Firewall = @intToPtr(*volatile types.Firewall, 0x40011c00);
            ///  Analog-to-digital converter
            pub const ADC = @intToPtr(*volatile types.ADC, 0x40012400);
            ///  Serial peripheral interface
            pub const SPI1 = @intToPtr(*volatile types.SPI1, 0x40013000);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART1 = @intToPtr(*volatile types.USART1, 0x40013800);
            ///  Debug support
            pub const DBGMCU = @intToPtr(*volatile types.DBGMCU, 0x40015800);
            ///  Direct memory access controller
            pub const DMA1 = @intToPtr(*volatile types.DMA1, 0x40020000);
            ///  Reset and clock control
            pub const RCC = @intToPtr(*volatile types.RCC, 0x40021000);
            ///  Flash
            pub const Flash = @intToPtr(*volatile types.Flash, 0x40022000);
            ///  Cyclic redundancy check calculation unit
            pub const CRC = @intToPtr(*volatile types.CRC, 0x40023000);
            ///  Touch sensing controller
            pub const TSC = @intToPtr(*volatile types.TSC, 0x40024000);
            ///  Random number generator
            pub const RNG = @intToPtr(*volatile types.RNG, 0x40025000);
            ///  Advanced encryption standard hardware accelerator
            pub const AES = @intToPtr(*volatile types.AES, 0x40026000);
            ///  General-purpose I/Os
            pub const GPIOA = @intToPtr(*volatile types.GPIOA, 0x50000000);
            ///  General-purpose I/Os
            pub const GPIOB = @intToPtr(*volatile types.GPIOB, 0x50000400);
            ///  General-purpose I/Os
            pub const GPIOC = @intToPtr(*volatile types.GPIOB, 0x50000800);
            ///  General-purpose I/Os
            pub const GPIOD = @intToPtr(*volatile types.GPIOB, 0x50000c00);
            ///  General-purpose I/Os
            pub const GPIOE = @intToPtr(*volatile types.GPIOB, 0x50001000);
            ///  General-purpose I/Os
            pub const GPIOH = @intToPtr(*volatile types.GPIOB, 0x50001c00);
            ///  SysTick timer
            pub const STK = @intToPtr(*volatile types.STK, 0xe000e010);
            ///  Nested Vectored Interrupt Controller
            pub const NVIC = @intToPtr(*volatile types.NVIC, 0xe000e100);
            ///  System control block
            pub const SCB = @intToPtr(*volatile types.SCB, 0xe000ed00);
            ///  Memory protection unit
            pub const MPU = @intToPtr(*volatile types.MPU, 0xe000ed90);
        };
    };
};

pub const types = struct {
    ///  Advanced encryption standard hardware accelerator
    pub const AES = extern struct {
        ///  control register
        CR: mmio.Mmio(32, packed struct {
            ///  AES enable
            EN: u1,
            ///  Data type selection (for data in and data out to/from the cryptographic block)
            DATATYPE: u2,
            ///  AES operating mode
            MODE: u2,
            ///  AES chaining mode
            CHMOD: u2,
            ///  Computation Complete Flag Clear
            CCFC: u1,
            ///  Error clear
            ERRC: u1,
            ///  CCF flag interrupt enable
            CCFIE: u1,
            ///  Error interrupt enable
            ERRIE: u1,
            ///  Enable DMA management of data input phase
            DMAINEN: u1,
            ///  Enable DMA management of data output phase
            DMAOUTEN: u1,
            padding: u19 = 0,
        }),
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            ///  Computation complete flag
            CCF: u1,
            ///  Read error flag
            RDERR: u1,
            ///  Write error flag
            WRERR: u1,
            padding: u29 = 0,
        }),
        ///  data input register
        DINR: mmio.Mmio(32, packed struct {
            ///  Data Input Register.
            AES_DINR: u32,
        }),
        ///  data output register
        DOUTR: mmio.Mmio(32, packed struct {
            ///  Data output register
            AES_DOUTR: u32,
        }),
        ///  key register 0
        KEYR0: mmio.Mmio(32, packed struct {
            ///  Data Output Register (LSB key [31:0])
            AES_KEYR0: u32,
        }),
        ///  key register 1
        KEYR1: mmio.Mmio(32, packed struct {
            ///  AES key register (key [63:32])
            AES_KEYR1: u32,
        }),
        ///  key register 2
        KEYR2: mmio.Mmio(32, packed struct {
            ///  AES key register (key [95:64])
            AES_KEYR2: u32,
        }),
        ///  key register 3
        KEYR3: mmio.Mmio(32, packed struct {
            ///  AES key register (MSB key [127:96])
            AES_KEYR3: u32,
        }),
        ///  initialization vector register 0
        IVR0: mmio.Mmio(32, packed struct {
            ///  initialization vector register (LSB IVR [31:0])
            AES_IVR0: u32,
        }),
        ///  initialization vector register 1
        IVR1: mmio.Mmio(32, packed struct {
            ///  Initialization Vector Register (IVR [63:32])
            AES_IVR1: u32,
        }),
        ///  initialization vector register 2
        IVR2: mmio.Mmio(32, packed struct {
            ///  Initialization Vector Register (IVR [95:64])
            AES_IVR2: u32,
        }),
        ///  initialization vector register 3
        IVR3: mmio.Mmio(32, packed struct {
            ///  Initialization Vector Register (MSB IVR [127:96])
            AES_IVR3: u32,
        }),
    };

    ///  Digital-to-analog converter
    pub const DAC = extern struct {
        ///  control register
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
            ///  DAC channel1 DMA Underrun Interrupt enable
            DMAUDRIE1: u1,
            padding: u18 = 0,
        }),
        ///  software trigger register
        SWTRIGR: mmio.Mmio(32, packed struct {
            ///  DAC channel1 software trigger
            SWTRIG1: u1,
            padding: u31 = 0,
        }),
        ///  channel1 12-bit right-aligned data holding register
        DHR12R1: mmio.Mmio(32, packed struct {
            ///  DAC channel1 12-bit right-aligned data
            DACC1DHR: u12,
            padding: u20 = 0,
        }),
        ///  channel1 12-bit left-aligned data holding register
        DHR12L1: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  DAC channel1 12-bit left-aligned data
            DACC1DHR: u12,
            padding: u16 = 0,
        }),
        ///  channel1 8-bit right-aligned data holding register
        DHR8R1: mmio.Mmio(32, packed struct {
            ///  DAC channel1 8-bit right-aligned data
            DACC1DHR: u8,
            padding: u24 = 0,
        }),
        ///  channel2 12-bit right-aligned data holding register
        DHR12R2: mmio.Mmio(32, packed struct {
            ///  DAC channel2 12-bit right-aligned data
            DACC2DHR: u12,
            padding: u20 = 0,
        }),
        ///  channel2 12-bit left-aligned data holding register
        DHR12L2: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  DAC channel2 12-bit left-aligned data
            DACC2DHR: u12,
            padding: u16 = 0,
        }),
        ///  channel2 8-bit right-aligned data holding register
        DHR8R2: mmio.Mmio(32, packed struct {
            ///  DAC channel2 8-bit right-aligned data
            DACC2DHR: u8,
            padding: u24 = 0,
        }),
        ///  Dual DAC 12-bit right-aligned data holding register
        DHR12RD: mmio.Mmio(32, packed struct {
            ///  DAC channel1 12-bit right-aligned data
            DACC1DHR: u12,
            reserved16: u4 = 0,
            ///  DAC channel2 12-bit right-aligned data
            DACC2DHR: u12,
            padding: u4 = 0,
        }),
        ///  Dual DAC 12-bit left-aligned data holding register
        DHR12LD: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  DAC channel1 12-bit left-aligned data
            DACC1DHR: u12,
            reserved20: u4 = 0,
            ///  DAC channel2 12-bit left-aligned data
            DACC2DHR: u12,
        }),
        ///  Dual DAC 8-bit right-aligned data holding register
        DHR8RD: mmio.Mmio(32, packed struct {
            ///  DAC channel1 8-bit right-aligned data
            DACC1DHR: u8,
            ///  DAC channel2 8-bit right-aligned data
            DACC2DHR: u8,
            padding: u16 = 0,
        }),
        ///  channel1 data output register
        DOR1: mmio.Mmio(32, packed struct {
            ///  DAC channel1 data output
            DACC1DOR: u12,
            padding: u20 = 0,
        }),
        ///  channel2 data output register
        DOR2: mmio.Mmio(32, packed struct {
            ///  DAC channel2 data output
            DACC2DOR: u12,
            padding: u20 = 0,
        }),
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            reserved13: u13 = 0,
            ///  DAC channel1 DMA underrun flag
            DMAUDR1: u1,
            padding: u18 = 0,
        }),
    };

    ///  Direct memory access controller
    pub const DMA1 = extern struct {
        ///  interrupt status register
        ISR: mmio.Mmio(32, packed struct {
            ///  Channel x global interrupt flag (x = 1 ..7)
            GIF1: u1,
            ///  Channel x transfer complete flag (x = 1 ..7)
            TCIF1: u1,
            ///  Channel x half transfer flag (x = 1 ..7)
            HTIF1: u1,
            ///  Channel x transfer error flag (x = 1 ..7)
            TEIF1: u1,
            ///  Channel x global interrupt flag (x = 1 ..7)
            GIF2: u1,
            ///  Channel x transfer complete flag (x = 1 ..7)
            TCIF2: u1,
            ///  Channel x half transfer flag (x = 1 ..7)
            HTIF2: u1,
            ///  Channel x transfer error flag (x = 1 ..7)
            TEIF2: u1,
            ///  Channel x global interrupt flag (x = 1 ..7)
            GIF3: u1,
            ///  Channel x transfer complete flag (x = 1 ..7)
            TCIF3: u1,
            ///  Channel x half transfer flag (x = 1 ..7)
            HTIF3: u1,
            ///  Channel x transfer error flag (x = 1 ..7)
            TEIF3: u1,
            ///  Channel x global interrupt flag (x = 1 ..7)
            GIF4: u1,
            ///  Channel x transfer complete flag (x = 1 ..7)
            TCIF4: u1,
            ///  Channel x half transfer flag (x = 1 ..7)
            HTIF4: u1,
            ///  Channel x transfer error flag (x = 1 ..7)
            TEIF4: u1,
            ///  Channel x global interrupt flag (x = 1 ..7)
            GIF5: u1,
            ///  Channel x transfer complete flag (x = 1 ..7)
            TCIF5: u1,
            ///  Channel x half transfer flag (x = 1 ..7)
            HTIF5: u1,
            ///  Channel x transfer error flag (x = 1 ..7)
            TEIF5: u1,
            ///  Channel x global interrupt flag (x = 1 ..7)
            GIF6: u1,
            ///  Channel x transfer complete flag (x = 1 ..7)
            TCIF6: u1,
            ///  Channel x half transfer flag (x = 1 ..7)
            HTIF6: u1,
            ///  Channel x transfer error flag (x = 1 ..7)
            TEIF6: u1,
            ///  Channel x global interrupt flag (x = 1 ..7)
            GIF7: u1,
            ///  Channel x transfer complete flag (x = 1 ..7)
            TCIF7: u1,
            ///  Channel x half transfer flag (x = 1 ..7)
            HTIF7: u1,
            ///  Channel x transfer error flag (x = 1 ..7)
            TEIF7: u1,
            padding: u4 = 0,
        }),
        ///  interrupt flag clear register
        IFCR: mmio.Mmio(32, packed struct {
            ///  Channel x global interrupt clear (x = 1 ..7)
            CGIF1: u1,
            ///  Channel x transfer complete clear (x = 1 ..7)
            CTCIF1: u1,
            ///  Channel x half transfer clear (x = 1 ..7)
            CHTIF1: u1,
            ///  Channel x transfer error clear (x = 1 ..7)
            CTEIF1: u1,
            ///  Channel x global interrupt clear (x = 1 ..7)
            CGIF2: u1,
            ///  Channel x transfer complete clear (x = 1 ..7)
            CTCIF2: u1,
            ///  Channel x half transfer clear (x = 1 ..7)
            CHTIF2: u1,
            ///  Channel x transfer error clear (x = 1 ..7)
            CTEIF2: u1,
            ///  Channel x global interrupt clear (x = 1 ..7)
            CGIF3: u1,
            ///  Channel x transfer complete clear (x = 1 ..7)
            CTCIF3: u1,
            ///  Channel x half transfer clear (x = 1 ..7)
            CHTIF3: u1,
            ///  Channel x transfer error clear (x = 1 ..7)
            CTEIF3: u1,
            ///  Channel x global interrupt clear (x = 1 ..7)
            CGIF4: u1,
            ///  Channel x transfer complete clear (x = 1 ..7)
            CTCIF4: u1,
            ///  Channel x half transfer clear (x = 1 ..7)
            CHTIF4: u1,
            ///  Channel x transfer error clear (x = 1 ..7)
            CTEIF4: u1,
            ///  Channel x global interrupt clear (x = 1 ..7)
            CGIF5: u1,
            ///  Channel x transfer complete clear (x = 1 ..7)
            CTCIF5: u1,
            ///  Channel x half transfer clear (x = 1 ..7)
            CHTIF5: u1,
            ///  Channel x transfer error clear (x = 1 ..7)
            CTEIF5: u1,
            ///  Channel x global interrupt clear (x = 1 ..7)
            CGIF6: u1,
            ///  Channel x transfer complete clear (x = 1 ..7)
            CTCIF6: u1,
            ///  Channel x half transfer clear (x = 1 ..7)
            CHTIF6: u1,
            ///  Channel x transfer error clear (x = 1 ..7)
            CTEIF6: u1,
            ///  Channel x global interrupt clear (x = 1 ..7)
            CGIF7: u1,
            ///  Channel x transfer complete clear (x = 1 ..7)
            CTCIF7: u1,
            ///  Channel x half transfer clear (x = 1 ..7)
            CHTIF7: u1,
            ///  Channel x transfer error clear (x = 1 ..7)
            CTEIF7: u1,
            padding: u4 = 0,
        }),
        ///  channel x configuration register
        CCR1: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half transfer interrupt enable
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
            ///  Channel priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  channel x number of data register
        CNDTR1: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  channel x peripheral address register
        CPAR1: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  channel x memory address register
        CMAR1: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved28: [4]u8,
        ///  channel x configuration register
        CCR2: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half transfer interrupt enable
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
            ///  Channel priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  channel x number of data register
        CNDTR2: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  channel x peripheral address register
        CPAR2: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  channel x memory address register
        CMAR2: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved48: [4]u8,
        ///  channel x configuration register
        CCR3: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half transfer interrupt enable
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
            ///  Channel priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  channel x number of data register
        CNDTR3: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  channel x peripheral address register
        CPAR3: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  channel x memory address register
        CMAR3: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved68: [4]u8,
        ///  channel x configuration register
        CCR4: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half transfer interrupt enable
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
            ///  Channel priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  channel x number of data register
        CNDTR4: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  channel x peripheral address register
        CPAR4: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  channel x memory address register
        CMAR4: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved88: [4]u8,
        ///  channel x configuration register
        CCR5: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half transfer interrupt enable
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
            ///  Channel priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  channel x number of data register
        CNDTR5: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  channel x peripheral address register
        CPAR5: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  channel x memory address register
        CMAR5: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved108: [4]u8,
        ///  channel x configuration register
        CCR6: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half transfer interrupt enable
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
            ///  Channel priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  channel x number of data register
        CNDTR6: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  channel x peripheral address register
        CPAR6: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  channel x memory address register
        CMAR6: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved128: [4]u8,
        ///  channel x configuration register
        CCR7: mmio.Mmio(32, packed struct {
            ///  Channel enable
            EN: u1,
            ///  Transfer complete interrupt enable
            TCIE: u1,
            ///  Half transfer interrupt enable
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
            ///  Channel priority level
            PL: u2,
            ///  Memory to memory mode
            MEM2MEM: u1,
            padding: u17 = 0,
        }),
        ///  channel x number of data register
        CNDTR7: mmio.Mmio(32, packed struct {
            ///  Number of data to transfer
            NDT: u16,
            padding: u16 = 0,
        }),
        ///  channel x peripheral address register
        CPAR7: mmio.Mmio(32, packed struct {
            ///  Peripheral address
            PA: u32,
        }),
        ///  channel x memory address register
        CMAR7: mmio.Mmio(32, packed struct {
            ///  Memory address
            MA: u32,
        }),
        reserved168: [24]u8,
        ///  channel selection register
        CSELR: mmio.Mmio(32, packed struct {
            ///  DMA channel 1 selection
            C1S: u4,
            ///  DMA channel 2 selection
            C2S: u4,
            ///  DMA channel 3 selection
            C3S: u4,
            ///  DMA channel 4 selection
            C4S: u4,
            ///  DMA channel 5 selection
            C5S: u4,
            ///  DMA channel 6 selection
            C6S: u4,
            ///  DMA channel 7 selection
            C7S: u4,
            padding: u4 = 0,
        }),
    };

    ///  Cyclic redundancy check calculation unit
    pub const CRC = extern struct {
        ///  Data register
        DR: mmio.Mmio(32, packed struct {
            ///  Data register bits
            DR: u32,
        }),
        ///  Independent data register
        IDR: mmio.Mmio(32, packed struct {
            ///  General-purpose 8-bit data register bits
            IDR: u8,
            padding: u24 = 0,
        }),
        ///  Control register
        CR: mmio.Mmio(32, packed struct {
            ///  RESET bit
            RESET: u1,
            reserved3: u2 = 0,
            ///  Polynomial size
            POLYSIZE: u2,
            ///  Reverse input data
            REV_IN: u2,
            ///  Reverse output data
            REV_OUT: u1,
            padding: u24 = 0,
        }),
        reserved16: [4]u8,
        ///  Initial CRC value
        INIT: mmio.Mmio(32, packed struct {
            ///  Programmable initial CRC value
            CRC_INIT: u32,
        }),
        ///  polynomial
        POL: mmio.Mmio(32, packed struct {
            ///  Programmable polynomial
            Polynomialcoefficients: u32,
        }),
    };

    ///  General-purpose I/Os
    pub const GPIOA = extern struct {
        ///  GPIO port mode register
        MODER: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            MODE0: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE1: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE2: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE3: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE4: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE5: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE6: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE7: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE8: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE9: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE10: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE11: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE12: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE13: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE14: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE15: u2,
        }),
        ///  GPIO port output type register
        OTYPER: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            OT0: u1,
            ///  Port x configuration bits (y = 0..15)
            OT1: u1,
            ///  Port x configuration bits (y = 0..15)
            OT2: u1,
            ///  Port x configuration bits (y = 0..15)
            OT3: u1,
            ///  Port x configuration bits (y = 0..15)
            OT4: u1,
            ///  Port x configuration bits (y = 0..15)
            OT5: u1,
            ///  Port x configuration bits (y = 0..15)
            OT6: u1,
            ///  Port x configuration bits (y = 0..15)
            OT7: u1,
            ///  Port x configuration bits (y = 0..15)
            OT8: u1,
            ///  Port x configuration bits (y = 0..15)
            OT9: u1,
            ///  Port x configuration bits (y = 0..15)
            OT10: u1,
            ///  Port x configuration bits (y = 0..15)
            OT11: u1,
            ///  Port x configuration bits (y = 0..15)
            OT12: u1,
            ///  Port x configuration bits (y = 0..15)
            OT13: u1,
            ///  Port x configuration bits (y = 0..15)
            OT14: u1,
            ///  Port x configuration bits (y = 0..15)
            OT15: u1,
            padding: u16 = 0,
        }),
        ///  GPIO port output speed register
        OSPEEDR: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            OSPEED0: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED1: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED2: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED3: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED4: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED5: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED6: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED7: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED8: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED9: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED10: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED11: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED12: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED13: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED14: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED15: u2,
        }),
        ///  GPIO port pull-up/pull-down register
        PUPDR: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            PUPD0: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD1: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD2: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD3: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD4: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD5: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD6: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD7: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD8: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD9: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD10: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD11: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD12: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD13: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD14: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD15: u2,
        }),
        ///  GPIO port input data register
        IDR: mmio.Mmio(32, packed struct {
            ///  Port input data bit (y = 0..15)
            ID0: u1,
            ///  Port input data bit (y = 0..15)
            ID1: u1,
            ///  Port input data bit (y = 0..15)
            ID2: u1,
            ///  Port input data bit (y = 0..15)
            ID3: u1,
            ///  Port input data bit (y = 0..15)
            ID4: u1,
            ///  Port input data bit (y = 0..15)
            ID5: u1,
            ///  Port input data bit (y = 0..15)
            ID6: u1,
            ///  Port input data bit (y = 0..15)
            ID7: u1,
            ///  Port input data bit (y = 0..15)
            ID8: u1,
            ///  Port input data bit (y = 0..15)
            ID9: u1,
            ///  Port input data bit (y = 0..15)
            ID10: u1,
            ///  Port input data bit (y = 0..15)
            ID11: u1,
            ///  Port input data bit (y = 0..15)
            ID12: u1,
            ///  Port input data bit (y = 0..15)
            ID13: u1,
            ///  Port input data bit (y = 0..15)
            ID14: u1,
            ///  Port input data bit (y = 0..15)
            ID15: u1,
            padding: u16 = 0,
        }),
        ///  GPIO port output data register
        ODR: mmio.Mmio(32, packed struct {
            ///  Port output data bit (y = 0..15)
            OD0: u1,
            ///  Port output data bit (y = 0..15)
            OD1: u1,
            ///  Port output data bit (y = 0..15)
            OD2: u1,
            ///  Port output data bit (y = 0..15)
            OD3: u1,
            ///  Port output data bit (y = 0..15)
            OD4: u1,
            ///  Port output data bit (y = 0..15)
            OD5: u1,
            ///  Port output data bit (y = 0..15)
            OD6: u1,
            ///  Port output data bit (y = 0..15)
            OD7: u1,
            ///  Port output data bit (y = 0..15)
            OD8: u1,
            ///  Port output data bit (y = 0..15)
            OD9: u1,
            ///  Port output data bit (y = 0..15)
            OD10: u1,
            ///  Port output data bit (y = 0..15)
            OD11: u1,
            ///  Port output data bit (y = 0..15)
            OD12: u1,
            ///  Port output data bit (y = 0..15)
            OD13: u1,
            ///  Port output data bit (y = 0..15)
            OD14: u1,
            ///  Port output data bit (y = 0..15)
            OD15: u1,
            padding: u16 = 0,
        }),
        ///  GPIO port bit set/reset register
        BSRR: mmio.Mmio(32, packed struct {
            ///  Port x set bit y (y= 0..15)
            BS0: u1,
            ///  Port x set bit y (y= 0..15)
            BS1: u1,
            ///  Port x set bit y (y= 0..15)
            BS2: u1,
            ///  Port x set bit y (y= 0..15)
            BS3: u1,
            ///  Port x set bit y (y= 0..15)
            BS4: u1,
            ///  Port x set bit y (y= 0..15)
            BS5: u1,
            ///  Port x set bit y (y= 0..15)
            BS6: u1,
            ///  Port x set bit y (y= 0..15)
            BS7: u1,
            ///  Port x set bit y (y= 0..15)
            BS8: u1,
            ///  Port x set bit y (y= 0..15)
            BS9: u1,
            ///  Port x set bit y (y= 0..15)
            BS10: u1,
            ///  Port x set bit y (y= 0..15)
            BS11: u1,
            ///  Port x set bit y (y= 0..15)
            BS12: u1,
            ///  Port x set bit y (y= 0..15)
            BS13: u1,
            ///  Port x set bit y (y= 0..15)
            BS14: u1,
            ///  Port x set bit y (y= 0..15)
            BS15: u1,
            ///  Port x reset bit y (y = 0..15)
            BR0: u1,
            ///  Port x reset bit y (y = 0..15)
            BR1: u1,
            ///  Port x reset bit y (y = 0..15)
            BR2: u1,
            ///  Port x reset bit y (y = 0..15)
            BR3: u1,
            ///  Port x reset bit y (y = 0..15)
            BR4: u1,
            ///  Port x reset bit y (y = 0..15)
            BR5: u1,
            ///  Port x reset bit y (y = 0..15)
            BR6: u1,
            ///  Port x reset bit y (y = 0..15)
            BR7: u1,
            ///  Port x reset bit y (y = 0..15)
            BR8: u1,
            ///  Port x reset bit y (y = 0..15)
            BR9: u1,
            ///  Port x reset bit y (y = 0..15)
            BR10: u1,
            ///  Port x reset bit y (y = 0..15)
            BR11: u1,
            ///  Port x reset bit y (y = 0..15)
            BR12: u1,
            ///  Port x reset bit y (y = 0..15)
            BR13: u1,
            ///  Port x reset bit y (y = 0..15)
            BR14: u1,
            ///  Port x reset bit y (y = 0..15)
            BR15: u1,
        }),
        ///  GPIO port configuration lock register
        LCKR: mmio.Mmio(32, packed struct {
            ///  Port x lock bit y (y= 0..15)
            LCK0: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK1: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK2: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK3: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK4: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK5: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK6: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK7: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK8: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK9: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK10: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK11: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK12: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK13: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK14: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK15: u1,
            ///  Port x lock bit y (y= 0..15)
            LCKK: u1,
            padding: u15 = 0,
        }),
        ///  GPIO alternate function low register
        AFRL: mmio.Mmio(32, packed struct {
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL0: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL1: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL2: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL3: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL4: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL5: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL6: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL7: u4,
        }),
        ///  GPIO alternate function high register
        AFRH: mmio.Mmio(32, packed struct {
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL8: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL9: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL10: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL11: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL12: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL13: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL14: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL15: u4,
        }),
        ///  GPIO port bit reset register
        BRR: mmio.Mmio(32, packed struct {
            ///  Port x Reset bit y (y= 0 .. 15)
            BR0: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR1: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR2: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR3: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR4: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR5: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR6: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR7: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR8: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR9: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR10: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR11: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR12: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR13: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR14: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR15: u1,
            padding: u16 = 0,
        }),
    };

    ///  General-purpose I/Os
    pub const GPIOB = extern struct {
        ///  GPIO port mode register
        MODER: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            MODE0: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE1: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE2: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE3: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE4: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE5: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE6: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE7: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE8: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE9: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE10: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE11: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE12: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE13: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE14: u2,
            ///  Port x configuration bits (y = 0..15)
            MODE15: u2,
        }),
        ///  GPIO port output type register
        OTYPER: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            OT0: u1,
            ///  Port x configuration bits (y = 0..15)
            OT1: u1,
            ///  Port x configuration bits (y = 0..15)
            OT2: u1,
            ///  Port x configuration bits (y = 0..15)
            OT3: u1,
            ///  Port x configuration bits (y = 0..15)
            OT4: u1,
            ///  Port x configuration bits (y = 0..15)
            OT5: u1,
            ///  Port x configuration bits (y = 0..15)
            OT6: u1,
            ///  Port x configuration bits (y = 0..15)
            OT7: u1,
            ///  Port x configuration bits (y = 0..15)
            OT8: u1,
            ///  Port x configuration bits (y = 0..15)
            OT9: u1,
            ///  Port x configuration bits (y = 0..15)
            OT10: u1,
            ///  Port x configuration bits (y = 0..15)
            OT11: u1,
            ///  Port x configuration bits (y = 0..15)
            OT12: u1,
            ///  Port x configuration bits (y = 0..15)
            OT13: u1,
            ///  Port x configuration bits (y = 0..15)
            OT14: u1,
            ///  Port x configuration bits (y = 0..15)
            OT15: u1,
            padding: u16 = 0,
        }),
        ///  GPIO port output speed register
        OSPEEDR: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            OSPEED0: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED1: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED2: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED3: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED4: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED5: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED6: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED7: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED8: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED9: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED10: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED11: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED12: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED13: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED14: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEED15: u2,
        }),
        ///  GPIO port pull-up/pull-down register
        PUPDR: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            PUPD0: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD1: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD2: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD3: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD4: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD5: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD6: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD7: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD8: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD9: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD10: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD11: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD12: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD13: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD14: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPD15: u2,
        }),
        ///  GPIO port input data register
        IDR: mmio.Mmio(32, packed struct {
            ///  Port input data bit (y = 0..15)
            ID0: u1,
            ///  Port input data bit (y = 0..15)
            ID1: u1,
            ///  Port input data bit (y = 0..15)
            ID2: u1,
            ///  Port input data bit (y = 0..15)
            ID3: u1,
            ///  Port input data bit (y = 0..15)
            ID4: u1,
            ///  Port input data bit (y = 0..15)
            ID5: u1,
            ///  Port input data bit (y = 0..15)
            ID6: u1,
            ///  Port input data bit (y = 0..15)
            ID7: u1,
            ///  Port input data bit (y = 0..15)
            ID8: u1,
            ///  Port input data bit (y = 0..15)
            ID9: u1,
            ///  Port input data bit (y = 0..15)
            ID10: u1,
            ///  Port input data bit (y = 0..15)
            ID11: u1,
            ///  Port input data bit (y = 0..15)
            ID12: u1,
            ///  Port input data bit (y = 0..15)
            ID13: u1,
            ///  Port input data bit (y = 0..15)
            ID14: u1,
            ///  Port input data bit (y = 0..15)
            ID15: u1,
            padding: u16 = 0,
        }),
        ///  GPIO port output data register
        ODR: mmio.Mmio(32, packed struct {
            ///  Port output data bit (y = 0..15)
            OD0: u1,
            ///  Port output data bit (y = 0..15)
            OD1: u1,
            ///  Port output data bit (y = 0..15)
            OD2: u1,
            ///  Port output data bit (y = 0..15)
            OD3: u1,
            ///  Port output data bit (y = 0..15)
            OD4: u1,
            ///  Port output data bit (y = 0..15)
            OD5: u1,
            ///  Port output data bit (y = 0..15)
            OD6: u1,
            ///  Port output data bit (y = 0..15)
            OD7: u1,
            ///  Port output data bit (y = 0..15)
            OD8: u1,
            ///  Port output data bit (y = 0..15)
            OD9: u1,
            ///  Port output data bit (y = 0..15)
            OD10: u1,
            ///  Port output data bit (y = 0..15)
            OD11: u1,
            ///  Port output data bit (y = 0..15)
            OD12: u1,
            ///  Port output data bit (y = 0..15)
            OD13: u1,
            ///  Port output data bit (y = 0..15)
            OD14: u1,
            ///  Port output data bit (y = 0..15)
            OD15: u1,
            padding: u16 = 0,
        }),
        ///  GPIO port bit set/reset register
        BSRR: mmio.Mmio(32, packed struct {
            ///  Port x set bit y (y= 0..15)
            BS0: u1,
            ///  Port x set bit y (y= 0..15)
            BS1: u1,
            ///  Port x set bit y (y= 0..15)
            BS2: u1,
            ///  Port x set bit y (y= 0..15)
            BS3: u1,
            ///  Port x set bit y (y= 0..15)
            BS4: u1,
            ///  Port x set bit y (y= 0..15)
            BS5: u1,
            ///  Port x set bit y (y= 0..15)
            BS6: u1,
            ///  Port x set bit y (y= 0..15)
            BS7: u1,
            ///  Port x set bit y (y= 0..15)
            BS8: u1,
            ///  Port x set bit y (y= 0..15)
            BS9: u1,
            ///  Port x set bit y (y= 0..15)
            BS10: u1,
            ///  Port x set bit y (y= 0..15)
            BS11: u1,
            ///  Port x set bit y (y= 0..15)
            BS12: u1,
            ///  Port x set bit y (y= 0..15)
            BS13: u1,
            ///  Port x set bit y (y= 0..15)
            BS14: u1,
            ///  Port x set bit y (y= 0..15)
            BS15: u1,
            ///  Port x reset bit y (y = 0..15)
            BR0: u1,
            ///  Port x reset bit y (y = 0..15)
            BR1: u1,
            ///  Port x reset bit y (y = 0..15)
            BR2: u1,
            ///  Port x reset bit y (y = 0..15)
            BR3: u1,
            ///  Port x reset bit y (y = 0..15)
            BR4: u1,
            ///  Port x reset bit y (y = 0..15)
            BR5: u1,
            ///  Port x reset bit y (y = 0..15)
            BR6: u1,
            ///  Port x reset bit y (y = 0..15)
            BR7: u1,
            ///  Port x reset bit y (y = 0..15)
            BR8: u1,
            ///  Port x reset bit y (y = 0..15)
            BR9: u1,
            ///  Port x reset bit y (y = 0..15)
            BR10: u1,
            ///  Port x reset bit y (y = 0..15)
            BR11: u1,
            ///  Port x reset bit y (y = 0..15)
            BR12: u1,
            ///  Port x reset bit y (y = 0..15)
            BR13: u1,
            ///  Port x reset bit y (y = 0..15)
            BR14: u1,
            ///  Port x reset bit y (y = 0..15)
            BR15: u1,
        }),
        ///  GPIO port configuration lock register
        LCKR: mmio.Mmio(32, packed struct {
            ///  Port x lock bit y (y= 0..15)
            LCK0: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK1: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK2: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK3: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK4: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK5: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK6: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK7: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK8: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK9: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK10: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK11: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK12: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK13: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK14: u1,
            ///  Port x lock bit y (y= 0..15)
            LCK15: u1,
            ///  Port x lock bit y (y= 0..15)
            LCKK: u1,
            padding: u15 = 0,
        }),
        ///  GPIO alternate function low register
        AFRL: mmio.Mmio(32, packed struct {
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL0: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL1: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL2: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL3: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL4: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL5: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL6: u4,
            ///  Alternate function selection for port x pin y (y = 0..7)
            AFSEL7: u4,
        }),
        ///  GPIO alternate function high register
        AFRH: mmio.Mmio(32, packed struct {
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL8: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL9: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL10: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL11: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL12: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL13: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL14: u4,
            ///  Alternate function selection for port x pin y (y = 8..15)
            AFSEL15: u4,
        }),
        ///  GPIO port bit reset register
        BRR: mmio.Mmio(32, packed struct {
            ///  Port x Reset bit y (y= 0 .. 15)
            BR0: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR1: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR2: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR3: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR4: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR5: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR6: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR7: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR8: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR9: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR10: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR11: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR12: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR13: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR14: u1,
            ///  Port x Reset bit y (y= 0 .. 15)
            BR15: u1,
            padding: u16 = 0,
        }),
    };

    ///  Low power timer
    pub const LPTIM = extern struct {
        ///  Interrupt and Status Register
        ISR: mmio.Mmio(32, packed struct {
            ///  Compare match
            CMPM: u1,
            ///  Autoreload match
            ARRM: u1,
            ///  External trigger edge event
            EXTTRIG: u1,
            ///  Compare register update OK
            CMPOK: u1,
            ///  Autoreload register update OK
            ARROK: u1,
            ///  Counter direction change down to up
            UP: u1,
            ///  Counter direction change up to down
            DOWN: u1,
            padding: u25 = 0,
        }),
        ///  Interrupt Clear Register
        ICR: mmio.Mmio(32, packed struct {
            ///  compare match Clear Flag
            CMPMCF: u1,
            ///  Autoreload match Clear Flag
            ARRMCF: u1,
            ///  External trigger valid edge Clear Flag
            EXTTRIGCF: u1,
            ///  Compare register update OK Clear Flag
            CMPOKCF: u1,
            ///  Autoreload register update OK Clear Flag
            ARROKCF: u1,
            ///  Direction change to UP Clear Flag
            UPCF: u1,
            ///  Direction change to down Clear Flag
            DOWNCF: u1,
            padding: u25 = 0,
        }),
        ///  Interrupt Enable Register
        IER: mmio.Mmio(32, packed struct {
            ///  Compare match Interrupt Enable
            CMPMIE: u1,
            ///  Autoreload match Interrupt Enable
            ARRMIE: u1,
            ///  External trigger valid edge Interrupt Enable
            EXTTRIGIE: u1,
            ///  Compare register update OK Interrupt Enable
            CMPOKIE: u1,
            ///  Autoreload register update OK Interrupt Enable
            ARROKIE: u1,
            ///  Direction change to UP Interrupt Enable
            UPIE: u1,
            ///  Direction change to down Interrupt Enable
            DOWNIE: u1,
            padding: u25 = 0,
        }),
        ///  Configuration Register
        CFGR: mmio.Mmio(32, packed struct {
            ///  Clock selector
            CKSEL: u1,
            ///  Clock Polarity
            CKPOL: u2,
            ///  Configurable digital filter for external clock
            CKFLT: u2,
            reserved6: u1 = 0,
            ///  Configurable digital filter for trigger
            TRGFLT: u2,
            reserved9: u1 = 0,
            ///  Clock prescaler
            PRESC: u3,
            reserved13: u1 = 0,
            ///  Trigger selector
            TRIGSEL: u3,
            reserved17: u1 = 0,
            ///  Trigger enable and polarity
            TRIGEN: u2,
            ///  Timeout enable
            TIMOUT: u1,
            ///  Waveform shape
            WAVE: u1,
            ///  Waveform shape polarity
            WAVPOL: u1,
            ///  Registers update mode
            PRELOAD: u1,
            ///  counter mode enabled
            COUNTMODE: u1,
            ///  Encoder mode enable
            ENC: u1,
            padding: u7 = 0,
        }),
        ///  Control Register
        CR: mmio.Mmio(32, packed struct {
            ///  LPTIM Enable
            ENABLE: u1,
            ///  LPTIM start in single mode
            SNGSTRT: u1,
            ///  Timer start in continuous mode
            CNTSTRT: u1,
            padding: u29 = 0,
        }),
        ///  Compare Register
        CMP: mmio.Mmio(32, packed struct {
            ///  Compare value.
            CMP: u16,
            padding: u16 = 0,
        }),
        ///  Autoreload Register
        ARR: mmio.Mmio(32, packed struct {
            ///  Auto reload value.
            ARR: u16,
            padding: u16 = 0,
        }),
        ///  Counter Register
        CNT: mmio.Mmio(32, packed struct {
            ///  Counter value.
            CNT: u16,
            padding: u16 = 0,
        }),
    };

    ///  Random number generator
    pub const RNG = extern struct {
        ///  control register
        CR: mmio.Mmio(32, packed struct {
            reserved2: u2 = 0,
            ///  Random number generator enable
            RNGEN: u1,
            ///  Interrupt enable
            IE: u1,
            padding: u28 = 0,
        }),
        ///  status register
        SR: mmio.Mmio(32, packed struct {
            ///  Data ready
            DRDY: u1,
            ///  Clock error current status
            CECS: u1,
            ///  Seed error current status
            SECS: u1,
            reserved5: u2 = 0,
            ///  Clock error interrupt status
            CEIS: u1,
            ///  Seed error interrupt status
            SEIS: u1,
            padding: u25 = 0,
        }),
        ///  data register
        DR: mmio.Mmio(32, packed struct {
            ///  Random data
            RNDATA: u32,
        }),
    };

    ///  Real-time clock
    pub const RTC = extern struct {
        ///  RTC time register
        TR: mmio.Mmio(32, packed struct {
            ///  Second units in BCD format
            SU: u4,
            ///  Second tens in BCD format
            ST: u3,
            reserved8: u1 = 0,
            ///  Minute units in BCD format
            MNU: u4,
            ///  Minute tens in BCD format
            MNT: u3,
            reserved16: u1 = 0,
            ///  Hour units in BCD format
            HU: u4,
            ///  Hour tens in BCD format
            HT: u2,
            ///  AM/PM notation
            PM: u1,
            padding: u9 = 0,
        }),
        ///  RTC date register
        DR: mmio.Mmio(32, packed struct {
            ///  Date units in BCD format
            DU: u4,
            ///  Date tens in BCD format
            DT: u2,
            reserved8: u2 = 0,
            ///  Month units in BCD format
            MU: u4,
            ///  Month tens in BCD format
            MT: u1,
            ///  Week day units
            WDU: u3,
            ///  Year units in BCD format
            YU: u4,
            ///  Year tens in BCD format
            YT: u4,
            padding: u8 = 0,
        }),
        ///  RTC control register
        CR: mmio.Mmio(32, packed struct {
            ///  Wakeup clock selection
            WUCKSEL: u3,
            ///  Time-stamp event active edge
            TSEDGE: u1,
            ///  RTC_REFIN reference clock detection enable (50 or 60 Hz)
            REFCKON: u1,
            ///  Bypass the shadow registers
            BYPSHAD: u1,
            ///  Hour format
            FMT: u1,
            reserved8: u1 = 0,
            ///  Alarm A enable
            ALRAE: u1,
            ///  Alarm B enable
            ALRBE: u1,
            ///  Wakeup timer enable
            WUTE: u1,
            ///  timestamp enable
            TSE: u1,
            ///  Alarm A interrupt enable
            ALRAIE: u1,
            ///  Alarm B interrupt enable
            ALRBIE: u1,
            ///  Wakeup timer interrupt enable
            WUTIE: u1,
            ///  Time-stamp interrupt enable
            TSIE: u1,
            ///  Add 1 hour (summer time change)
            ADD1H: u1,
            ///  Subtract 1 hour (winter time change)
            SUB1H: u1,
            ///  Backup
            BKP: u1,
            ///  Calibration output selection
            COSEL: u1,
            ///  Output polarity
            POL: u1,
            ///  Output selection
            OSEL: u2,
            ///  Calibration output enable
            COE: u1,
            padding: u8 = 0,
        }),
        ///  RTC initialization and status register
        ISR: mmio.Mmio(32, packed struct {
            ///  Alarm A write flag
            ALRAWF: u1,
            ///  Alarm B write flag
            ALRBWF: u1,
            ///  Wakeup timer write flag
            WUTWF: u1,
            ///  Shift operation pending
            SHPF: u1,
            ///  Initialization status flag
            INITS: u1,
            ///  Registers synchronization flag
            RSF: u1,
            ///  Initialization flag
            INITF: u1,
            ///  Initialization mode
            INIT: u1,
            ///  Alarm A flag
            ALRAF: u1,
            ///  Alarm B flag
            ALRBF: u1,
            ///  Wakeup timer flag
            WUTF: u1,
            ///  Time-stamp flag
            TSF: u1,
            ///  Time-stamp overflow flag
            TSOVF: u1,
            ///  RTC_TAMP1 detection flag
            TAMP1F: u1,
            ///  RTC_TAMP2 detection flag
            TAMP2F: u1,
            padding: u17 = 0,
        }),
        ///  RTC prescaler register
        PRER: mmio.Mmio(32, packed struct {
            ///  Synchronous prescaler factor
            PREDIV_S: u16,
            ///  Asynchronous prescaler factor
            PREDIV_A: u7,
            padding: u9 = 0,
        }),
        ///  RTC wakeup timer register
        WUTR: mmio.Mmio(32, packed struct {
            ///  Wakeup auto-reload value bits
            WUT: u16,
            padding: u16 = 0,
        }),
        reserved28: [4]u8,
        ///  RTC alarm A register
        ALRMAR: mmio.Mmio(32, packed struct {
            ///  Second units in BCD format.
            SU: u4,
            ///  Second tens in BCD format.
            ST: u3,
            ///  Alarm A seconds mask
            MSK1: u1,
            ///  Minute units in BCD format.
            MNU: u4,
            ///  Minute tens in BCD format.
            MNT: u3,
            ///  Alarm A minutes mask
            MSK2: u1,
            ///  Hour units in BCD format.
            HU: u4,
            ///  Hour tens in BCD format.
            HT: u2,
            ///  AM/PM notation
            PM: u1,
            ///  Alarm A hours mask
            MSK3: u1,
            ///  Date units or day in BCD format.
            DU: u4,
            ///  Date tens in BCD format.
            DT: u2,
            ///  Week day selection
            WDSEL: u1,
            ///  Alarm A date mask
            MSK4: u1,
        }),
        ///  RTC alarm B register
        ALRMBR: mmio.Mmio(32, packed struct {
            ///  Second units in BCD format
            SU: u4,
            ///  Second tens in BCD format
            ST: u3,
            ///  Alarm B seconds mask
            MSK1: u1,
            ///  Minute units in BCD format
            MNU: u4,
            ///  Minute tens in BCD format
            MNT: u3,
            ///  Alarm B minutes mask
            MSK2: u1,
            ///  Hour units in BCD format
            HU: u4,
            ///  Hour tens in BCD format
            HT: u2,
            ///  AM/PM notation
            PM: u1,
            ///  Alarm B hours mask
            MSK3: u1,
            ///  Date units or day in BCD format
            DU: u4,
            ///  Date tens in BCD format
            DT: u2,
            ///  Week day selection
            WDSEL: u1,
            ///  Alarm B date mask
            MSK4: u1,
        }),
        ///  write protection register
        WPR: mmio.Mmio(32, packed struct {
            ///  Write protection key
            KEY: u8,
            padding: u24 = 0,
        }),
        ///  RTC sub second register
        SSR: mmio.Mmio(32, packed struct {
            ///  Sub second value
            SS: u16,
            padding: u16 = 0,
        }),
        ///  RTC shift control register
        SHIFTR: mmio.Mmio(32, packed struct {
            ///  Subtract a fraction of a second
            SUBFS: u15,
            reserved31: u16 = 0,
            ///  Add one second
            ADD1S: u1,
        }),
        ///  RTC timestamp time register
        TSTR: mmio.Mmio(32, packed struct {
            ///  Second units in BCD format.
            SU: u4,
            ///  Second tens in BCD format.
            ST: u3,
            reserved8: u1 = 0,
            ///  Minute units in BCD format.
            MNU: u4,
            ///  Minute tens in BCD format.
            MNT: u3,
            reserved16: u1 = 0,
            ///  Hour units in BCD format.
            HU: u4,
            ///  Hour tens in BCD format.
            HT: u2,
            ///  AM/PM notation
            PM: u1,
            padding: u9 = 0,
        }),
        ///  RTC timestamp date register
        TSDR: mmio.Mmio(32, packed struct {
            ///  Date units in BCD format
            DU: u4,
            ///  Date tens in BCD format
            DT: u2,
            reserved8: u2 = 0,
            ///  Month units in BCD format
            MU: u4,
            ///  Month tens in BCD format
            MT: u1,
            ///  Week day units
            WDU: u3,
            padding: u16 = 0,
        }),
        ///  RTC time-stamp sub second register
        TSSSR: mmio.Mmio(32, packed struct {
            ///  Sub second value
            SS: u16,
            padding: u16 = 0,
        }),
        ///  RTC calibration register
        CALR: mmio.Mmio(32, packed struct {
            ///  Calibration minus
            CALM: u9,
            reserved13: u4 = 0,
            ///  Use a 16-second calibration cycle period
            CALW16: u1,
            ///  Use a 8-second calibration cycle period
            CALW8: u1,
            ///  Increase frequency of RTC by 488.5 ppm
            CALP: u1,
            padding: u16 = 0,
        }),
        ///  RTC tamper configuration register
        TAMPCR: mmio.Mmio(32, packed struct {
            ///  RTC_TAMP1 input detection enable
            TAMP1E: u1,
            ///  Active level for RTC_TAMP1 input
            TAMP1TRG: u1,
            ///  Tamper interrupt enable
            TAMPIE: u1,
            ///  RTC_TAMP2 input detection enable
            TAMP2E: u1,
            ///  Active level for RTC_TAMP2 input
            TAMP2_TRG: u1,
            reserved7: u2 = 0,
            ///  Activate timestamp on tamper detection event
            TAMPTS: u1,
            ///  Tamper sampling frequency
            TAMPFREQ: u3,
            ///  RTC_TAMPx filter count
            TAMPFLT: u2,
            ///  RTC_TAMPx precharge duration
            TAMPPRCH: u2,
            ///  RTC_TAMPx pull-up disable
            TAMPPUDIS: u1,
            ///  Tamper 1 interrupt enable
            TAMP1IE: u1,
            ///  Tamper 1 no erase
            TAMP1NOERASE: u1,
            ///  Tamper 1 mask flag
            TAMP1MF: u1,
            ///  Tamper 2 interrupt enable
            TAMP2IE: u1,
            ///  Tamper 2 no erase
            TAMP2NOERASE: u1,
            ///  Tamper 2 mask flag
            TAMP2MF: u1,
            padding: u10 = 0,
        }),
        ///  RTC alarm A sub second register
        ALRMASSR: mmio.Mmio(32, packed struct {
            ///  Sub seconds value
            SS: u15,
            reserved24: u9 = 0,
            ///  Mask the most-significant bits starting at this bit
            MASKSS: u4,
            padding: u4 = 0,
        }),
        ///  RTC alarm B sub second register
        ALRMBSSR: mmio.Mmio(32, packed struct {
            ///  Sub seconds value
            SS: u15,
            reserved24: u9 = 0,
            ///  Mask the most-significant bits starting at this bit
            MASKSS: u4,
            padding: u4 = 0,
        }),
        ///  option register
        OR: mmio.Mmio(32, packed struct {
            ///  RTC_ALARM on PC13 output type
            RTC_ALARM_TYPE: u1,
            ///  RTC_ALARM on PC13 output type
            RTC_OUT_RMP: u1,
            padding: u30 = 0,
        }),
        ///  RTC backup registers
        BKP0R: mmio.Mmio(32, packed struct {
            ///  BKP
            BKP: u32,
        }),
        ///  RTC backup registers
        BKP1R: mmio.Mmio(32, packed struct {
            ///  BKP
            BKP: u32,
        }),
        ///  RTC backup registers
        BKP2R: mmio.Mmio(32, packed struct {
            ///  BKP
            BKP: u32,
        }),
        ///  RTC backup registers
        BKP3R: mmio.Mmio(32, packed struct {
            ///  BKP
            BKP: u32,
        }),
        ///  RTC backup registers
        BKP4R: mmio.Mmio(32, packed struct {
            ///  BKP
            BKP: u32,
        }),
    };

    ///  Universal synchronous asynchronous receiver transmitter
    pub const USART1 = extern struct {
        ///  Control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  USART enable
            UE: u1,
            ///  USART enable in Stop mode
            UESM: u1,
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
            ///  interrupt enable
            TXEIE: u1,
            ///  PE interrupt enable
            PEIE: u1,
            ///  Parity selection
            PS: u1,
            ///  Parity control enable
            PCE: u1,
            ///  Receiver wakeup method
            WAKE: u1,
            ///  Word length
            M0: u1,
            ///  Mute mode enable
            MME: u1,
            ///  Character match interrupt enable
            CMIE: u1,
            ///  Oversampling mode
            OVER8: u1,
            ///  DEDT0
            DEDT0: u1,
            ///  DEDT1
            DEDT1: u1,
            ///  DEDT2
            DEDT2: u1,
            ///  DEDT3
            DEDT3: u1,
            ///  Driver Enable de-assertion time
            DEDT4: u1,
            ///  DEAT0
            DEAT0: u1,
            ///  DEAT1
            DEAT1: u1,
            ///  DEAT2
            DEAT2: u1,
            ///  DEAT3
            DEAT3: u1,
            ///  Driver Enable assertion time
            DEAT4: u1,
            ///  Receiver timeout interrupt enable
            RTOIE: u1,
            ///  End of Block interrupt enable
            EOBIE: u1,
            ///  Word length
            M1: u1,
            padding: u3 = 0,
        }),
        ///  Control register 2
        CR2: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  7-bit Address Detection/4-bit Address Detection
            ADDM7: u1,
            ///  LIN break detection length
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
            ///  Swap TX/RX pins
            SWAP: u1,
            ///  RX pin active level inversion
            RXINV: u1,
            ///  TX pin active level inversion
            TXINV: u1,
            ///  Binary data inversion
            TAINV: u1,
            ///  Most significant bit first
            MSBFIRST: u1,
            ///  Auto baud rate enable
            ABREN: u1,
            ///  ABRMOD0
            ABRMOD0: u1,
            ///  Auto baud rate mode
            ABRMOD1: u1,
            ///  Receiver timeout enable
            RTOEN: u1,
            ///  Address of the USART node
            ADD0_3: u4,
            ///  Address of the USART node
            ADD4_7: u4,
        }),
        ///  Control register 3
        CR3: mmio.Mmio(32, packed struct {
            ///  Error interrupt enable
            EIE: u1,
            ///  Ir mode enable
            IREN: u1,
            ///  Ir low-power
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
            ///  One sample bit method enable
            ONEBIT: u1,
            ///  Overrun Disable
            OVRDIS: u1,
            ///  DMA Disable on Reception Error
            DDRE: u1,
            ///  Driver enable mode
            DEM: u1,
            ///  Driver enable polarity selection
            DEP: u1,
            reserved17: u1 = 0,
            ///  Smartcard auto-retry count
            SCARCNT: u3,
            ///  Wakeup from Stop mode interrupt flag selection
            WUS: u2,
            ///  Wakeup from Stop mode interrupt enable
            WUFIE: u1,
            padding: u9 = 0,
        }),
        ///  Baud rate register
        BRR: mmio.Mmio(32, packed struct {
            ///  DIV_Fraction
            DIV_Fraction: u4,
            ///  DIV_Mantissa
            DIV_Mantissa: u12,
            padding: u16 = 0,
        }),
        ///  Guard time and prescaler register
        GTPR: mmio.Mmio(32, packed struct {
            ///  Prescaler value
            PSC: u8,
            ///  Guard time value
            GT: u8,
            padding: u16 = 0,
        }),
        ///  Receiver timeout register
        RTOR: mmio.Mmio(32, packed struct {
            ///  Receiver timeout value
            RTO: u24,
            ///  Block Length
            BLEN: u8,
        }),
        ///  Request register
        RQR: mmio.Mmio(32, packed struct {
            ///  Auto baud rate request
            ABRRQ: u1,
            ///  Send break request
            SBKRQ: u1,
            ///  Mute mode request
            MMRQ: u1,
            ///  Receive data flush request
            RXFRQ: u1,
            ///  Transmit data flush request
            TXFRQ: u1,
            padding: u27 = 0,
        }),
        ///  Interrupt & status register
        ISR: mmio.Mmio(32, packed struct {
            ///  PE
            PE: u1,
            ///  FE
            FE: u1,
            ///  NF
            NF: u1,
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
            ///  LBDF
            LBDF: u1,
            ///  CTSIF
            CTSIF: u1,
            ///  CTS
            CTS: u1,
            ///  RTOF
            RTOF: u1,
            ///  EOBF
            EOBF: u1,
            reserved14: u1 = 0,
            ///  ABRE
            ABRE: u1,
            ///  ABRF
            ABRF: u1,
            ///  BUSY
            BUSY: u1,
            ///  CMF
            CMF: u1,
            ///  SBKF
            SBKF: u1,
            ///  RWU
            RWU: u1,
            ///  WUF
            WUF: u1,
            ///  TEACK
            TEACK: u1,
            ///  REACK
            REACK: u1,
            padding: u9 = 0,
        }),
        ///  Interrupt flag clear register
        ICR: mmio.Mmio(32, packed struct {
            ///  Parity error clear flag
            PECF: u1,
            ///  Framing error clear flag
            FECF: u1,
            ///  Noise detected clear flag
            NCF: u1,
            ///  Overrun error clear flag
            ORECF: u1,
            ///  Idle line detected clear flag
            IDLECF: u1,
            reserved6: u1 = 0,
            ///  Transmission complete clear flag
            TCCF: u1,
            reserved8: u1 = 0,
            ///  LIN break detection clear flag
            LBDCF: u1,
            ///  CTS clear flag
            CTSCF: u1,
            reserved11: u1 = 0,
            ///  Receiver timeout clear flag
            RTOCF: u1,
            ///  End of block clear flag
            EOBCF: u1,
            reserved17: u4 = 0,
            ///  Character match clear flag
            CMCF: u1,
            reserved20: u2 = 0,
            ///  Wakeup from Stop mode clear flag
            WUCF: u1,
            padding: u11 = 0,
        }),
        ///  Receive data register
        RDR: mmio.Mmio(32, packed struct {
            ///  Receive data value
            RDR: u9,
            padding: u23 = 0,
        }),
        ///  Transmit data register
        TDR: mmio.Mmio(32, packed struct {
            ///  Transmit data value
            TDR: u9,
            padding: u23 = 0,
        }),
    };

    ///  Touch sensing controller
    pub const TSC = extern struct {
        ///  control register
        CR: mmio.Mmio(32, packed struct {
            ///  Touch sensing controller enable
            TSCE: u1,
            ///  Start a new acquisition
            START: u1,
            ///  Acquisition mode
            AM: u1,
            ///  Synchronization pin polarity
            SYNCPOL: u1,
            ///  I/O Default mode
            IODEF: u1,
            ///  Max count value
            MCV: u3,
            reserved12: u4 = 0,
            ///  pulse generator prescaler
            PGPSC: u3,
            ///  Spread spectrum prescaler
            SSPSC: u1,
            ///  Spread spectrum enable
            SSE: u1,
            ///  Spread spectrum deviation
            SSD: u7,
            ///  Charge transfer pulse low
            CTPL: u4,
            ///  Charge transfer pulse high
            CTPH: u4,
        }),
        ///  interrupt enable register
        IER: mmio.Mmio(32, packed struct {
            ///  End of acquisition interrupt enable
            EOAIE: u1,
            ///  Max count error interrupt enable
            MCEIE: u1,
            padding: u30 = 0,
        }),
        ///  interrupt clear register
        ICR: mmio.Mmio(32, packed struct {
            ///  End of acquisition interrupt clear
            EOAIC: u1,
            ///  Max count error interrupt clear
            MCEIC: u1,
            padding: u30 = 0,
        }),
        ///  interrupt status register
        ISR: mmio.Mmio(32, packed struct {
            ///  End of acquisition flag
            EOAF: u1,
            ///  Max count error flag
            MCEF: u1,
            padding: u30 = 0,
        }),
        ///  I/O hysteresis control register
        IOHCR: mmio.Mmio(32, packed struct {
            ///  G1_IO1
            G1_IO1: u1,
            ///  G1_IO2
            G1_IO2: u1,
            ///  G1_IO3
            G1_IO3: u1,
            ///  G1_IO4
            G1_IO4: u1,
            ///  G2_IO1
            G2_IO1: u1,
            ///  G2_IO2
            G2_IO2: u1,
            ///  G2_IO3
            G2_IO3: u1,
            ///  G2_IO4
            G2_IO4: u1,
            ///  G3_IO1
            G3_IO1: u1,
            ///  G3_IO2
            G3_IO2: u1,
            ///  G3_IO3
            G3_IO3: u1,
            ///  G3_IO4
            G3_IO4: u1,
            ///  G4_IO1
            G4_IO1: u1,
            ///  G4_IO2
            G4_IO2: u1,
            ///  G4_IO3
            G4_IO3: u1,
            ///  G4_IO4
            G4_IO4: u1,
            ///  G5_IO1
            G5_IO1: u1,
            ///  G5_IO2
            G5_IO2: u1,
            ///  G5_IO3
            G5_IO3: u1,
            ///  G5_IO4
            G5_IO4: u1,
            ///  G6_IO1
            G6_IO1: u1,
            ///  G6_IO2
            G6_IO2: u1,
            ///  G6_IO3
            G6_IO3: u1,
            ///  G6_IO4
            G6_IO4: u1,
            ///  G7_IO1
            G7_IO1: u1,
            ///  G7_IO2
            G7_IO2: u1,
            ///  G7_IO3
            G7_IO3: u1,
            ///  G7_IO4
            G7_IO4: u1,
            ///  G8_IO1
            G8_IO1: u1,
            ///  G8_IO2
            G8_IO2: u1,
            ///  G8_IO3
            G8_IO3: u1,
            ///  G8_IO4
            G8_IO4: u1,
        }),
        reserved24: [4]u8,
        ///  I/O analog switch control register
        IOASCR: mmio.Mmio(32, packed struct {
            ///  G1_IO1
            G1_IO1: u1,
            ///  G1_IO2
            G1_IO2: u1,
            ///  G1_IO3
            G1_IO3: u1,
            ///  G1_IO4
            G1_IO4: u1,
            ///  G2_IO1
            G2_IO1: u1,
            ///  G2_IO2
            G2_IO2: u1,
            ///  G2_IO3
            G2_IO3: u1,
            ///  G2_IO4
            G2_IO4: u1,
            ///  G3_IO1
            G3_IO1: u1,
            ///  G3_IO2
            G3_IO2: u1,
            ///  G3_IO3
            G3_IO3: u1,
            ///  G3_IO4
            G3_IO4: u1,
            ///  G4_IO1
            G4_IO1: u1,
            ///  G4_IO2
            G4_IO2: u1,
            ///  G4_IO3
            G4_IO3: u1,
            ///  G4_IO4
            G4_IO4: u1,
            ///  G5_IO1
            G5_IO1: u1,
            ///  G5_IO2
            G5_IO2: u1,
            ///  G5_IO3
            G5_IO3: u1,
            ///  G5_IO4
            G5_IO4: u1,
            ///  G6_IO1
            G6_IO1: u1,
            ///  G6_IO2
            G6_IO2: u1,
            ///  G6_IO3
            G6_IO3: u1,
            ///  G6_IO4
            G6_IO4: u1,
            ///  G7_IO1
            G7_IO1: u1,
            ///  G7_IO2
            G7_IO2: u1,
            ///  G7_IO3
            G7_IO3: u1,
            ///  G7_IO4
            G7_IO4: u1,
            ///  G8_IO1
            G8_IO1: u1,
            ///  G8_IO2
            G8_IO2: u1,
            ///  G8_IO3
            G8_IO3: u1,
            ///  G8_IO4
            G8_IO4: u1,
        }),
        reserved32: [4]u8,
        ///  I/O sampling control register
        IOSCR: mmio.Mmio(32, packed struct {
            ///  G1_IO1
            G1_IO1: u1,
            ///  G1_IO2
            G1_IO2: u1,
            ///  G1_IO3
            G1_IO3: u1,
            ///  G1_IO4
            G1_IO4: u1,
            ///  G2_IO1
            G2_IO1: u1,
            ///  G2_IO2
            G2_IO2: u1,
            ///  G2_IO3
            G2_IO3: u1,
            ///  G2_IO4
            G2_IO4: u1,
            ///  G3_IO1
            G3_IO1: u1,
            ///  G3_IO2
            G3_IO2: u1,
            ///  G3_IO3
            G3_IO3: u1,
            ///  G3_IO4
            G3_IO4: u1,
            ///  G4_IO1
            G4_IO1: u1,
            ///  G4_IO2
            G4_IO2: u1,
            ///  G4_IO3
            G4_IO3: u1,
            ///  G4_IO4
            G4_IO4: u1,
            ///  G5_IO1
            G5_IO1: u1,
            ///  G5_IO2
            G5_IO2: u1,
            ///  G5_IO3
            G5_IO3: u1,
            ///  G5_IO4
            G5_IO4: u1,
            ///  G6_IO1
            G6_IO1: u1,
            ///  G6_IO2
            G6_IO2: u1,
            ///  G6_IO3
            G6_IO3: u1,
            ///  G6_IO4
            G6_IO4: u1,
            ///  G7_IO1
            G7_IO1: u1,
            ///  G7_IO2
            G7_IO2: u1,
            ///  G7_IO3
            G7_IO3: u1,
            ///  G7_IO4
            G7_IO4: u1,
            ///  G8_IO1
            G8_IO1: u1,
            ///  G8_IO2
            G8_IO2: u1,
            ///  G8_IO3
            G8_IO3: u1,
            ///  G8_IO4
            G8_IO4: u1,
        }),
        reserved40: [4]u8,
        ///  I/O channel control register
        IOCCR: mmio.Mmio(32, packed struct {
            ///  G1_IO1
            G1_IO1: u1,
            ///  G1_IO2
            G1_IO2: u1,
            ///  G1_IO3
            G1_IO3: u1,
            ///  G1_IO4
            G1_IO4: u1,
            ///  G2_IO1
            G2_IO1: u1,
            ///  G2_IO2
            G2_IO2: u1,
            ///  G2_IO3
            G2_IO3: u1,
            ///  G2_IO4
            G2_IO4: u1,
            ///  G3_IO1
            G3_IO1: u1,
            ///  G3_IO2
            G3_IO2: u1,
            ///  G3_IO3
            G3_IO3: u1,
            ///  G3_IO4
            G3_IO4: u1,
            ///  G4_IO1
            G4_IO1: u1,
            ///  G4_IO2
            G4_IO2: u1,
            ///  G4_IO3
            G4_IO3: u1,
            ///  G4_IO4
            G4_IO4: u1,
            ///  G5_IO1
            G5_IO1: u1,
            ///  G5_IO2
            G5_IO2: u1,
            ///  G5_IO3
            G5_IO3: u1,
            ///  G5_IO4
            G5_IO4: u1,
            ///  G6_IO1
            G6_IO1: u1,
            ///  G6_IO2
            G6_IO2: u1,
            ///  G6_IO3
            G6_IO3: u1,
            ///  G6_IO4
            G6_IO4: u1,
            ///  G7_IO1
            G7_IO1: u1,
            ///  G7_IO2
            G7_IO2: u1,
            ///  G7_IO3
            G7_IO3: u1,
            ///  G7_IO4
            G7_IO4: u1,
            ///  G8_IO1
            G8_IO1: u1,
            ///  G8_IO2
            G8_IO2: u1,
            ///  G8_IO3
            G8_IO3: u1,
            ///  G8_IO4
            G8_IO4: u1,
        }),
        reserved48: [4]u8,
        ///  I/O group control status register
        IOGCSR: mmio.Mmio(32, packed struct {
            ///  Analog I/O group x enable
            G1E: u1,
            ///  Analog I/O group x enable
            G2E: u1,
            ///  Analog I/O group x enable
            G3E: u1,
            ///  Analog I/O group x enable
            G4E: u1,
            ///  Analog I/O group x enable
            G5E: u1,
            ///  Analog I/O group x enable
            G6E: u1,
            ///  Analog I/O group x enable
            G7E: u1,
            ///  Analog I/O group x enable
            G8E: u1,
            reserved16: u8 = 0,
            ///  Analog I/O group x status
            G1S: u1,
            ///  Analog I/O group x status
            G2S: u1,
            ///  Analog I/O group x status
            G3S: u1,
            ///  Analog I/O group x status
            G4S: u1,
            ///  Analog I/O group x status
            G5S: u1,
            ///  Analog I/O group x status
            G6S: u1,
            ///  Analog I/O group x status
            G7S: u1,
            ///  Analog I/O group x status
            G8S: u1,
            padding: u8 = 0,
        }),
        ///  I/O group x counter register
        IOG1CR: mmio.Mmio(32, packed struct {
            ///  Counter value
            CNT: u14,
            padding: u18 = 0,
        }),
        ///  I/O group x counter register
        IOG2CR: mmio.Mmio(32, packed struct {
            ///  Counter value
            CNT: u14,
            padding: u18 = 0,
        }),
        ///  I/O group x counter register
        IOG3CR: mmio.Mmio(32, packed struct {
            ///  Counter value
            CNT: u14,
            padding: u18 = 0,
        }),
        ///  I/O group x counter register
        IOG4CR: mmio.Mmio(32, packed struct {
            ///  Counter value
            CNT: u14,
            padding: u18 = 0,
        }),
        ///  I/O group x counter register
        IOG5CR: mmio.Mmio(32, packed struct {
            ///  Counter value
            CNT: u14,
            padding: u18 = 0,
        }),
        ///  I/O group x counter register
        IOG6CR: mmio.Mmio(32, packed struct {
            ///  Counter value
            CNT: u14,
            padding: u18 = 0,
        }),
        ///  I/O group x counter register
        IOG7CR: mmio.Mmio(32, packed struct {
            ///  Counter value
            CNT: u14,
            padding: u18 = 0,
        }),
        ///  I/O group x counter register
        IOG8CR: mmio.Mmio(32, packed struct {
            ///  Counter value
            CNT: u14,
            padding: u18 = 0,
        }),
    };

    ///  Independent watchdog
    pub const IWDG = extern struct {
        ///  Key register
        KR: mmio.Mmio(32, packed struct {
            ///  Key value (write only, read 0x0000)
            KEY: u16,
            padding: u16 = 0,
        }),
        ///  Prescaler register
        PR: mmio.Mmio(32, packed struct {
            ///  Prescaler divider
            PR: u3,
            padding: u29 = 0,
        }),
        ///  Reload register
        RLR: mmio.Mmio(32, packed struct {
            ///  Watchdog counter reload value
            RL: u12,
            padding: u20 = 0,
        }),
        ///  Status register
        SR: mmio.Mmio(32, packed struct {
            ///  Watchdog prescaler value update
            PVU: u1,
            ///  Watchdog counter reload value update
            RVU: u1,
            ///  Watchdog counter window value update
            WVU: u1,
            padding: u29 = 0,
        }),
        ///  Window register
        WINR: mmio.Mmio(32, packed struct {
            ///  Watchdog counter window value
            WIN: u12,
            padding: u20 = 0,
        }),
    };

    ///  System window watchdog
    pub const WWDG = extern struct {
        ///  Control register
        CR: mmio.Mmio(32, packed struct {
            ///  7-bit counter (MSB to LSB)
            T: u7,
            ///  Activation bit
            WDGA: u1,
            padding: u24 = 0,
        }),
        ///  Configuration register
        CFR: mmio.Mmio(32, packed struct {
            ///  7-bit window value
            W: u7,
            ///  WDGTB0
            WDGTB0: u1,
            ///  Timer base
            WDGTB1: u1,
            ///  Early wakeup interrupt
            EWI: u1,
            padding: u22 = 0,
        }),
        ///  Status register
        SR: mmio.Mmio(32, packed struct {
            ///  Early wakeup interrupt flag
            EWIF: u1,
            padding: u31 = 0,
        }),
    };

    ///  Universal serial bus full-speed device interface
    pub const USB_FS = extern struct {
        ///  endpoint register
        EP0R: mmio.Mmio(32, packed struct {
            ///  EA
            EA: u4,
            ///  STAT_TX
            STAT_TX: u2,
            ///  DTOG_TX
            DTOG_TX: u1,
            ///  CTR_TX
            CTR_TX: u1,
            ///  EP_KIND
            EP_KIND: u1,
            ///  EPTYPE
            EPTYPE: u2,
            ///  SETUP
            SETUP: u1,
            ///  STAT_RX
            STAT_RX: u2,
            ///  DTOG_RX
            DTOG_RX: u1,
            ///  CTR_RX
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint register
        EP1R: mmio.Mmio(32, packed struct {
            ///  EA
            EA: u4,
            ///  STAT_TX
            STAT_TX: u2,
            ///  DTOG_TX
            DTOG_TX: u1,
            ///  CTR_TX
            CTR_TX: u1,
            ///  EP_KIND
            EP_KIND: u1,
            ///  EPTYPE
            EPTYPE: u2,
            ///  SETUP
            SETUP: u1,
            ///  STAT_RX
            STAT_RX: u2,
            ///  DTOG_RX
            DTOG_RX: u1,
            ///  CTR_RX
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint register
        EP2R: mmio.Mmio(32, packed struct {
            ///  EA
            EA: u4,
            ///  STAT_TX
            STAT_TX: u2,
            ///  DTOG_TX
            DTOG_TX: u1,
            ///  CTR_TX
            CTR_TX: u1,
            ///  EP_KIND
            EP_KIND: u1,
            ///  EPTYPE
            EPTYPE: u2,
            ///  SETUP
            SETUP: u1,
            ///  STAT_RX
            STAT_RX: u2,
            ///  DTOG_RX
            DTOG_RX: u1,
            ///  CTR_RX
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint register
        EP3R: mmio.Mmio(32, packed struct {
            ///  EA
            EA: u4,
            ///  STAT_TX
            STAT_TX: u2,
            ///  DTOG_TX
            DTOG_TX: u1,
            ///  CTR_TX
            CTR_TX: u1,
            ///  EP_KIND
            EP_KIND: u1,
            ///  EPTYPE
            EPTYPE: u2,
            ///  SETUP
            SETUP: u1,
            ///  STAT_RX
            STAT_RX: u2,
            ///  DTOG_RX
            DTOG_RX: u1,
            ///  CTR_RX
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint register
        EP4R: mmio.Mmio(32, packed struct {
            ///  EA
            EA: u4,
            ///  STAT_TX
            STAT_TX: u2,
            ///  DTOG_TX
            DTOG_TX: u1,
            ///  CTR_TX
            CTR_TX: u1,
            ///  EP_KIND
            EP_KIND: u1,
            ///  EPTYPE
            EPTYPE: u2,
            ///  SETUP
            SETUP: u1,
            ///  STAT_RX
            STAT_RX: u2,
            ///  DTOG_RX
            DTOG_RX: u1,
            ///  CTR_RX
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint register
        EP5R: mmio.Mmio(32, packed struct {
            ///  EA
            EA: u4,
            ///  STAT_TX
            STAT_TX: u2,
            ///  DTOG_TX
            DTOG_TX: u1,
            ///  CTR_TX
            CTR_TX: u1,
            ///  EP_KIND
            EP_KIND: u1,
            ///  EPTYPE
            EPTYPE: u2,
            ///  SETUP
            SETUP: u1,
            ///  STAT_RX
            STAT_RX: u2,
            ///  DTOG_RX
            DTOG_RX: u1,
            ///  CTR_RX
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint register
        EP6R: mmio.Mmio(32, packed struct {
            ///  EA
            EA: u4,
            ///  STAT_TX
            STAT_TX: u2,
            ///  DTOG_TX
            DTOG_TX: u1,
            ///  CTR_TX
            CTR_TX: u1,
            ///  EP_KIND
            EP_KIND: u1,
            ///  EPTYPE
            EPTYPE: u2,
            ///  SETUP
            SETUP: u1,
            ///  STAT_RX
            STAT_RX: u2,
            ///  DTOG_RX
            DTOG_RX: u1,
            ///  CTR_RX
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        ///  endpoint register
        EP7R: mmio.Mmio(32, packed struct {
            ///  EA
            EA: u4,
            ///  STAT_TX
            STAT_TX: u2,
            ///  DTOG_TX
            DTOG_TX: u1,
            ///  CTR_TX
            CTR_TX: u1,
            ///  EP_KIND
            EP_KIND: u1,
            ///  EPTYPE
            EPTYPE: u2,
            ///  SETUP
            SETUP: u1,
            ///  STAT_RX
            STAT_RX: u2,
            ///  DTOG_RX
            DTOG_RX: u1,
            ///  CTR_RX
            CTR_RX: u1,
            padding: u16 = 0,
        }),
        reserved64: [32]u8,
        ///  control register
        CNTR: mmio.Mmio(32, packed struct {
            ///  FRES
            FRES: u1,
            ///  PDWN
            PDWN: u1,
            ///  LPMODE
            LPMODE: u1,
            ///  FSUSP
            FSUSP: u1,
            ///  RESUME
            RESUME: u1,
            ///  L1RESUME
            L1RESUME: u1,
            reserved7: u1 = 0,
            ///  L1REQM
            L1REQM: u1,
            ///  ESOFM
            ESOFM: u1,
            ///  SOFM
            SOFM: u1,
            ///  RESETM
            RESETM: u1,
            ///  SUSPM
            SUSPM: u1,
            ///  WKUPM
            WKUPM: u1,
            ///  ERRM
            ERRM: u1,
            ///  PMAOVRM
            PMAOVRM: u1,
            ///  CTRM
            CTRM: u1,
            padding: u16 = 0,
        }),
        ///  interrupt status register
        ISTR: mmio.Mmio(32, packed struct {
            ///  EP_ID
            EP_ID: u4,
            ///  DIR
            DIR: u1,
            reserved7: u2 = 0,
            ///  L1REQ
            L1REQ: u1,
            ///  ESOF
            ESOF: u1,
            ///  SOF
            SOF: u1,
            ///  RESET
            RESET: u1,
            ///  SUSP
            SUSP: u1,
            ///  WKUP
            WKUP: u1,
            ///  ERR
            ERR: u1,
            ///  PMAOVR
            PMAOVR: u1,
            ///  CTR
            CTR: u1,
            padding: u16 = 0,
        }),
        ///  frame number register
        FNR: mmio.Mmio(32, packed struct {
            ///  FN
            FN: u11,
            ///  LSOF
            LSOF: u2,
            ///  LCK
            LCK: u1,
            ///  RXDM
            RXDM: u1,
            ///  RXDP
            RXDP: u1,
            padding: u16 = 0,
        }),
        ///  device address
        DADDR: mmio.Mmio(32, packed struct {
            ///  ADD
            ADD: u7,
            ///  EF
            EF: u1,
            padding: u24 = 0,
        }),
        ///  Buffer table address
        BTABLE: mmio.Mmio(32, packed struct {
            reserved3: u3 = 0,
            ///  BTABLE
            BTABLE: u13,
            padding: u16 = 0,
        }),
        ///  LPM control and status register
        LPMCSR: mmio.Mmio(32, packed struct {
            ///  LPMEN
            LPMEN: u1,
            ///  LPMACK
            LPMACK: u1,
            reserved3: u1 = 0,
            ///  REMWAKE
            REMWAKE: u1,
            ///  BESL
            BESL: u4,
            padding: u24 = 0,
        }),
        ///  Battery charging detector
        BCDR: mmio.Mmio(32, packed struct {
            ///  BCDEN
            BCDEN: u1,
            ///  DCDEN
            DCDEN: u1,
            ///  PDEN
            PDEN: u1,
            ///  SDEN
            SDEN: u1,
            ///  DCDET
            DCDET: u1,
            ///  PDET
            PDET: u1,
            ///  SDET
            SDET: u1,
            ///  PS2DET
            PS2DET: u1,
            reserved15: u7 = 0,
            ///  DPPU
            DPPU: u1,
            padding: u16 = 0,
        }),
    };

    ///  Clock recovery system
    pub const CRS = extern struct {
        ///  control register
        CR: mmio.Mmio(32, packed struct {
            ///  SYNC event OK interrupt enable
            SYNCOKIE: u1,
            ///  SYNC warning interrupt enable
            SYNCWARNIE: u1,
            ///  Synchronization or trimming error interrupt enable
            ERRIE: u1,
            ///  Expected SYNC interrupt enable
            ESYNCIE: u1,
            reserved5: u1 = 0,
            ///  Frequency error counter enable
            CEN: u1,
            ///  Automatic trimming enable
            AUTOTRIMEN: u1,
            ///  Generate software SYNC event
            SWSYNC: u1,
            ///  HSI48 oscillator smooth trimming
            TRIM: u6,
            padding: u18 = 0,
        }),
        ///  configuration register
        CFGR: mmio.Mmio(32, packed struct {
            ///  Counter reload value
            RELOAD: u16,
            ///  Frequency error limit
            FELIM: u8,
            ///  SYNC divider
            SYNCDIV: u3,
            reserved28: u1 = 0,
            ///  SYNC signal source selection
            SYNCSRC: u2,
            reserved31: u1 = 0,
            ///  SYNC polarity selection
            SYNCPOL: u1,
        }),
        ///  interrupt and status register
        ISR: mmio.Mmio(32, packed struct {
            ///  SYNC event OK flag
            SYNCOKF: u1,
            ///  SYNC warning flag
            SYNCWARNF: u1,
            ///  Error flag
            ERRF: u1,
            ///  Expected SYNC flag
            ESYNCF: u1,
            reserved8: u4 = 0,
            ///  SYNC error
            SYNCERR: u1,
            ///  SYNC missed
            SYNCMISS: u1,
            ///  Trimming overflow or underflow
            TRIMOVF: u1,
            reserved15: u4 = 0,
            ///  Frequency error direction
            FEDIR: u1,
            ///  Frequency error capture
            FECAP: u16,
        }),
        ///  interrupt flag clear register
        ICR: mmio.Mmio(32, packed struct {
            ///  SYNC event OK clear flag
            SYNCOKC: u1,
            ///  SYNC warning clear flag
            SYNCWARNC: u1,
            ///  Error clear flag
            ERRC: u1,
            ///  Expected SYNC clear flag
            ESYNCC: u1,
            padding: u28 = 0,
        }),
    };

    ///  Firewall
    pub const Firewall = extern struct {
        ///  Code segment start address
        FIREWALL_CSSA: mmio.Mmio(32, packed struct {
            reserved8: u8 = 0,
            ///  code segment start address
            ADD: u16,
            padding: u8 = 0,
        }),
        ///  Code segment length
        FIREWALL_CSL: mmio.Mmio(32, packed struct {
            reserved8: u8 = 0,
            ///  code segment length
            LENG: u14,
            padding: u10 = 0,
        }),
        ///  Non-volatile data segment start address
        FIREWALL_NVDSSA: mmio.Mmio(32, packed struct {
            reserved8: u8 = 0,
            ///  Non-volatile data segment start address
            ADD: u16,
            padding: u8 = 0,
        }),
        ///  Non-volatile data segment length
        FIREWALL_NVDSL: mmio.Mmio(32, packed struct {
            reserved8: u8 = 0,
            ///  Non-volatile data segment length
            LENG: u14,
            padding: u10 = 0,
        }),
        ///  Volatile data segment start address
        FIREWALL_VDSSA: mmio.Mmio(32, packed struct {
            reserved6: u6 = 0,
            ///  Volatile data segment start address
            ADD: u10,
            padding: u16 = 0,
        }),
        ///  Volatile data segment length
        FIREWALL_VDSL: mmio.Mmio(32, packed struct {
            reserved6: u6 = 0,
            ///  Non-volatile data segment length
            LENG: u10,
            padding: u16 = 0,
        }),
        reserved32: [8]u8,
        ///  Configuration register
        FIREWALL_CR: mmio.Mmio(32, packed struct {
            ///  Firewall pre alarm
            FPA: u1,
            ///  Volatile data shared
            VDS: u1,
            ///  Volatile data execution
            VDE: u1,
            padding: u29 = 0,
        }),
    };

    ///  Reset and clock control
    pub const RCC = extern struct {
        ///  Clock control register
        CR: mmio.Mmio(32, packed struct {
            ///  16 MHz high-speed internal clock enable
            HSI16ON: u1,
            ///  High-speed internal clock enable bit for some IP kernels
            HSI16KERON: u1,
            ///  Internal high-speed clock ready flag
            HSI16RDYF: u1,
            ///  HSI16DIVEN
            HSI16DIVEN: u1,
            ///  HSI16DIVF
            HSI16DIVF: u1,
            ///  16 MHz high-speed internal clock output enable
            HSI16OUTEN: u1,
            reserved8: u2 = 0,
            ///  MSI clock enable bit
            MSION: u1,
            ///  MSI clock ready flag
            MSIRDY: u1,
            reserved16: u6 = 0,
            ///  HSE clock enable bit
            HSEON: u1,
            ///  HSE clock ready flag
            HSERDY: u1,
            ///  HSE clock bypass bit
            HSEBYP: u1,
            ///  Clock security system on HSE enable bit
            CSSLSEON: u1,
            ///  TC/LCD prescaler
            RTCPRE: u2,
            reserved24: u2 = 0,
            ///  PLL enable bit
            PLLON: u1,
            ///  PLL clock ready flag
            PLLRDY: u1,
            padding: u6 = 0,
        }),
        ///  Internal clock sources calibration register
        ICSCR: mmio.Mmio(32, packed struct {
            ///  nternal high speed clock calibration
            HSI16CAL: u8,
            ///  High speed internal clock trimming
            HSI16TRIM: u5,
            ///  MSI clock ranges
            MSIRANGE: u3,
            ///  MSI clock calibration
            MSICAL: u8,
            ///  MSI clock trimming
            MSITRIM: u8,
        }),
        ///  Clock recovery RC register
        CRRCR: mmio.Mmio(32, packed struct {
            ///  48MHz HSI clock enable bit
            HSI48ON: u1,
            ///  48MHz HSI clock ready flag
            HSI48RDY: u1,
            ///  48 MHz HSI clock divided by 6 output enable
            HSI48DIV6EN: u1,
            reserved8: u5 = 0,
            ///  48 MHz HSI clock calibration
            HSI48CAL: u8,
            padding: u16 = 0,
        }),
        ///  Clock configuration register
        CFGR: mmio.Mmio(32, packed struct {
            ///  System clock switch
            SW: u2,
            ///  System clock switch status
            SWS: u2,
            ///  AHB prescaler
            HPRE: u4,
            ///  APB low-speed prescaler (APB1)
            PPRE1: u3,
            ///  APB high-speed prescaler (APB2)
            PPRE2: u3,
            reserved15: u1 = 0,
            ///  Wake-up from stop clock selection
            STOPWUCK: u1,
            ///  PLL entry clock source
            PLLSRC: u1,
            reserved18: u1 = 0,
            ///  PLL multiplication factor
            PLLMUL: u4,
            ///  PLL output division
            PLLDIV: u2,
            ///  Microcontroller clock output selection
            MCOSEL: u4,
            ///  Microcontroller clock output prescaler
            MCOPRE: u3,
            padding: u1 = 0,
        }),
        ///  Clock interrupt enable register
        CIER: mmio.Mmio(32, packed struct {
            ///  LSI ready interrupt flag
            LSIRDYIE: u1,
            ///  LSE ready interrupt flag
            LSERDYIE: u1,
            ///  HSI16 ready interrupt flag
            HSI16RDYIE: u1,
            ///  HSE ready interrupt flag
            HSERDYIE: u1,
            ///  PLL ready interrupt flag
            PLLRDYIE: u1,
            ///  MSI ready interrupt flag
            MSIRDYIE: u1,
            ///  HSI48 ready interrupt flag
            HSI48RDYIE: u1,
            ///  LSE CSS interrupt flag
            CSSLSE: u1,
            padding: u24 = 0,
        }),
        ///  Clock interrupt flag register
        CIFR: mmio.Mmio(32, packed struct {
            ///  LSI ready interrupt flag
            LSIRDYF: u1,
            ///  LSE ready interrupt flag
            LSERDYF: u1,
            ///  HSI16 ready interrupt flag
            HSI16RDYF: u1,
            ///  HSE ready interrupt flag
            HSERDYF: u1,
            ///  PLL ready interrupt flag
            PLLRDYF: u1,
            ///  MSI ready interrupt flag
            MSIRDYF: u1,
            ///  HSI48 ready interrupt flag
            HSI48RDYF: u1,
            ///  LSE Clock Security System Interrupt flag
            CSSLSEF: u1,
            ///  Clock Security System Interrupt flag
            CSSHSEF: u1,
            padding: u23 = 0,
        }),
        ///  Clock interrupt clear register
        CICR: mmio.Mmio(32, packed struct {
            ///  LSI ready Interrupt clear
            LSIRDYC: u1,
            ///  LSE ready Interrupt clear
            LSERDYC: u1,
            ///  HSI16 ready Interrupt clear
            HSI16RDYC: u1,
            ///  HSE ready Interrupt clear
            HSERDYC: u1,
            ///  PLL ready Interrupt clear
            PLLRDYC: u1,
            ///  MSI ready Interrupt clear
            MSIRDYC: u1,
            ///  HSI48 ready Interrupt clear
            HSI48RDYC: u1,
            ///  LSE Clock Security System Interrupt clear
            CSSLSEC: u1,
            ///  Clock Security System Interrupt clear
            CSSHSEC: u1,
            padding: u23 = 0,
        }),
        ///  GPIO reset register
        IOPRSTR: mmio.Mmio(32, packed struct {
            ///  I/O port A reset
            IOPARST: u1,
            ///  I/O port B reset
            IOPBRST: u1,
            ///  I/O port A reset
            IOPCRST: u1,
            ///  I/O port D reset
            IOPDRST: u1,
            ///  I/O port E reset
            IOPERST: u1,
            reserved7: u2 = 0,
            ///  I/O port H reset
            IOPHRST: u1,
            padding: u24 = 0,
        }),
        ///  AHB peripheral reset register
        AHBRSTR: mmio.Mmio(32, packed struct {
            ///  DMA reset
            DMARST: u1,
            reserved8: u7 = 0,
            ///  Memory interface reset
            MIFRST: u1,
            reserved12: u3 = 0,
            ///  Test integration module reset
            CRCRST: u1,
            reserved16: u3 = 0,
            ///  Touch Sensing reset
            TOUCHRST: u1,
            reserved20: u3 = 0,
            ///  Random Number Generator module reset
            RNGRST: u1,
            reserved24: u3 = 0,
            ///  Crypto module reset
            CRYPRST: u1,
            padding: u7 = 0,
        }),
        ///  APB2 peripheral reset register
        APB2RSTR: mmio.Mmio(32, packed struct {
            ///  System configuration controller reset
            SYSCFGRST: u1,
            reserved2: u1 = 0,
            ///  TIM21 timer reset
            TIM21RST: u1,
            reserved5: u2 = 0,
            ///  TIM22 timer reset
            TM12RST: u1,
            reserved9: u3 = 0,
            ///  ADC interface reset
            ADCRST: u1,
            reserved12: u2 = 0,
            ///  SPI 1 reset
            SPI1RST: u1,
            reserved14: u1 = 0,
            ///  USART1 reset
            USART1RST: u1,
            reserved22: u7 = 0,
            ///  DBG reset
            DBGRST: u1,
            padding: u9 = 0,
        }),
        ///  APB1 peripheral reset register
        APB1RSTR: mmio.Mmio(32, packed struct {
            ///  Timer2 reset
            TIM2RST: u1,
            ///  Timer3 reset
            TIM3RST: u1,
            reserved4: u2 = 0,
            ///  Timer 6 reset
            TIM6RST: u1,
            ///  Timer 7 reset
            TIM7RST: u1,
            reserved11: u5 = 0,
            ///  Window watchdog reset
            WWDRST: u1,
            reserved14: u2 = 0,
            ///  SPI2 reset
            SPI2RST: u1,
            reserved17: u2 = 0,
            ///  UART2 reset
            LPUART12RST: u1,
            ///  LPUART1 reset
            LPUART1RST: u1,
            ///  USART4 reset
            USART4RST: u1,
            ///  USART5 reset
            USART5RST: u1,
            ///  I2C1 reset
            I2C1RST: u1,
            ///  I2C2 reset
            I2C2RST: u1,
            ///  USB reset
            USBRST: u1,
            reserved27: u3 = 0,
            ///  Clock recovery system reset
            CRSRST: u1,
            ///  Power interface reset
            PWRRST: u1,
            ///  DAC interface reset
            DACRST: u1,
            ///  I2C3 reset
            I2C3RST: u1,
            ///  Low power timer reset
            LPTIM1RST: u1,
        }),
        ///  GPIO clock enable register
        IOPENR: mmio.Mmio(32, packed struct {
            ///  IO port A clock enable bit
            IOPAEN: u1,
            ///  IO port B clock enable bit
            IOPBEN: u1,
            ///  IO port A clock enable bit
            IOPCEN: u1,
            ///  I/O port D clock enable bit
            IOPDEN: u1,
            ///  I/O port E clock enable bit
            IOPEEN: u1,
            reserved7: u2 = 0,
            ///  I/O port H clock enable bit
            IOPHEN: u1,
            padding: u24 = 0,
        }),
        ///  AHB peripheral clock enable register
        AHBENR: mmio.Mmio(32, packed struct {
            ///  DMA clock enable bit
            DMAEN: u1,
            reserved8: u7 = 0,
            ///  NVM interface clock enable bit
            MIFEN: u1,
            reserved12: u3 = 0,
            ///  CRC clock enable bit
            CRCEN: u1,
            reserved16: u3 = 0,
            ///  Touch Sensing clock enable bit
            TOUCHEN: u1,
            reserved20: u3 = 0,
            ///  Random Number Generator clock enable bit
            RNGEN: u1,
            reserved24: u3 = 0,
            ///  Crypto clock enable bit
            CRYPEN: u1,
            padding: u7 = 0,
        }),
        ///  APB2 peripheral clock enable register
        APB2ENR: mmio.Mmio(32, packed struct {
            ///  System configuration controller clock enable bit
            SYSCFGEN: u1,
            reserved2: u1 = 0,
            ///  TIM21 timer clock enable bit
            TIM21EN: u1,
            reserved5: u2 = 0,
            ///  TIM22 timer clock enable bit
            TIM22EN: u1,
            reserved7: u1 = 0,
            ///  MiFaRe Firewall clock enable bit
            MIFIEN: u1,
            reserved9: u1 = 0,
            ///  ADC clock enable bit
            ADCEN: u1,
            reserved12: u2 = 0,
            ///  SPI1 clock enable bit
            SPI1EN: u1,
            reserved14: u1 = 0,
            ///  USART1 clock enable bit
            USART1EN: u1,
            reserved22: u7 = 0,
            ///  DBG clock enable bit
            DBGEN: u1,
            padding: u9 = 0,
        }),
        ///  APB1 peripheral clock enable register
        APB1ENR: mmio.Mmio(32, packed struct {
            ///  Timer2 clock enable bit
            TIM2EN: u1,
            ///  Timer3 clock enable bit
            TIM3EN: u1,
            reserved4: u2 = 0,
            ///  Timer 6 clock enable bit
            TIM6EN: u1,
            ///  Timer 7 clock enable bit
            TIM7EN: u1,
            reserved11: u5 = 0,
            ///  Window watchdog clock enable bit
            WWDGEN: u1,
            reserved14: u2 = 0,
            ///  SPI2 clock enable bit
            SPI2EN: u1,
            reserved17: u2 = 0,
            ///  UART2 clock enable bit
            USART2EN: u1,
            ///  LPUART1 clock enable bit
            LPUART1EN: u1,
            ///  USART4 clock enable bit
            USART4EN: u1,
            ///  USART5 clock enable bit
            USART5EN: u1,
            ///  I2C1 clock enable bit
            I2C1EN: u1,
            ///  I2C2 clock enable bit
            I2C2EN: u1,
            ///  USB clock enable bit
            USBEN: u1,
            reserved27: u3 = 0,
            ///  Clock recovery system clock enable bit
            CRSEN: u1,
            ///  Power interface clock enable bit
            PWREN: u1,
            ///  DAC interface clock enable bit
            DACEN: u1,
            ///  I2C3 clock enable bit
            I2C3EN: u1,
            ///  Low power timer clock enable bit
            LPTIM1EN: u1,
        }),
        ///  GPIO clock enable in sleep mode register
        IOPSMEN: mmio.Mmio(32, packed struct {
            ///  IOPASMEN
            IOPASMEN: u1,
            ///  IOPBSMEN
            IOPBSMEN: u1,
            ///  IOPCSMEN
            IOPCSMEN: u1,
            ///  IOPDSMEN
            IOPDSMEN: u1,
            ///  Port E clock enable during Sleep mode bit
            IOPESMEN: u1,
            reserved7: u2 = 0,
            ///  IOPHSMEN
            IOPHSMEN: u1,
            padding: u24 = 0,
        }),
        ///  AHB peripheral clock enable in sleep mode register
        AHBSMENR: mmio.Mmio(32, packed struct {
            ///  DMA clock enable during sleep mode bit
            DMASMEN: u1,
            reserved8: u7 = 0,
            ///  NVM interface clock enable during sleep mode bit
            MIFSMEN: u1,
            ///  SRAM interface clock enable during sleep mode bit
            SRAMSMEN: u1,
            reserved12: u2 = 0,
            ///  CRC clock enable during sleep mode bit
            CRCSMEN: u1,
            reserved16: u3 = 0,
            ///  Touch Sensing clock enable during sleep mode bit
            TOUCHSMEN: u1,
            reserved20: u3 = 0,
            ///  Random Number Generator clock enable during sleep mode bit
            RNGSMEN: u1,
            reserved24: u3 = 0,
            ///  Crypto clock enable during sleep mode bit
            CRYPSMEN: u1,
            padding: u7 = 0,
        }),
        ///  APB2 peripheral clock enable in sleep mode register
        APB2SMENR: mmio.Mmio(32, packed struct {
            ///  System configuration controller clock enable during sleep mode bit
            SYSCFGSMEN: u1,
            reserved2: u1 = 0,
            ///  TIM21 timer clock enable during sleep mode bit
            TIM21SMEN: u1,
            reserved5: u2 = 0,
            ///  TIM22 timer clock enable during sleep mode bit
            TIM22SMEN: u1,
            reserved9: u3 = 0,
            ///  ADC clock enable during sleep mode bit
            ADCSMEN: u1,
            reserved12: u2 = 0,
            ///  SPI1 clock enable during sleep mode bit
            SPI1SMEN: u1,
            reserved14: u1 = 0,
            ///  USART1 clock enable during sleep mode bit
            USART1SMEN: u1,
            reserved22: u7 = 0,
            ///  DBG clock enable during sleep mode bit
            DBGSMEN: u1,
            padding: u9 = 0,
        }),
        ///  APB1 peripheral clock enable in sleep mode register
        APB1SMENR: mmio.Mmio(32, packed struct {
            ///  Timer2 clock enable during sleep mode bit
            TIM2SMEN: u1,
            ///  Timer3 clock enable during Sleep mode bit
            TIM3SMEN: u1,
            reserved4: u2 = 0,
            ///  Timer 6 clock enable during sleep mode bit
            TIM6SMEN: u1,
            ///  Timer 7 clock enable during Sleep mode bit
            TIM7SMEN: u1,
            reserved11: u5 = 0,
            ///  Window watchdog clock enable during sleep mode bit
            WWDGSMEN: u1,
            reserved14: u2 = 0,
            ///  SPI2 clock enable during sleep mode bit
            SPI2SMEN: u1,
            reserved17: u2 = 0,
            ///  UART2 clock enable during sleep mode bit
            USART2SMEN: u1,
            ///  LPUART1 clock enable during sleep mode bit
            LPUART1SMEN: u1,
            ///  USART4 clock enable during Sleep mode bit
            USART4SMEN: u1,
            ///  USART5 clock enable during Sleep mode bit
            USART5SMEN: u1,
            ///  I2C1 clock enable during sleep mode bit
            I2C1SMEN: u1,
            ///  I2C2 clock enable during sleep mode bit
            I2C2SMEN: u1,
            ///  USB clock enable during sleep mode bit
            USBSMEN: u1,
            reserved27: u3 = 0,
            ///  Clock recovery system clock enable during sleep mode bit
            CRSSMEN: u1,
            ///  Power interface clock enable during sleep mode bit
            PWRSMEN: u1,
            ///  DAC interface clock enable during sleep mode bit
            DACSMEN: u1,
            ///  2C3 clock enable during Sleep mode bit
            I2C3SMEN: u1,
            ///  Low power timer clock enable during sleep mode bit
            LPTIM1SMEN: u1,
        }),
        ///  Clock configuration register
        CCIPR: mmio.Mmio(32, packed struct {
            ///  USART1SEL0
            USART1SEL0: u1,
            ///  USART1 clock source selection bits
            USART1SEL1: u1,
            ///  USART2SEL0
            USART2SEL0: u1,
            ///  USART2 clock source selection bits
            USART2SEL1: u1,
            reserved10: u6 = 0,
            ///  LPUART1SEL0
            LPUART1SEL0: u1,
            ///  LPUART1 clock source selection bits
            LPUART1SEL1: u1,
            ///  I2C1SEL0
            I2C1SEL0: u1,
            ///  I2C1 clock source selection bits
            I2C1SEL1: u1,
            reserved16: u2 = 0,
            ///  I2C3 clock source selection bits
            I2C3SEL: u2,
            ///  LPTIM1SEL0
            LPTIM1SEL0: u1,
            ///  Low Power Timer clock source selection bits
            LPTIM1SEL1: u1,
            reserved26: u6 = 0,
            ///  48 MHz HSI48 clock source selection bit
            HSI48MSEL: u1,
            padding: u5 = 0,
        }),
        ///  Control and status register
        CSR: mmio.Mmio(32, packed struct {
            ///  Internal low-speed oscillator enable
            LSION: u1,
            ///  Internal low-speed oscillator ready bit
            LSIRDY: u1,
            reserved8: u6 = 0,
            ///  External low-speed oscillator enable bit
            LSEON: u1,
            ///  External low-speed oscillator ready bit
            LSERDY: u1,
            ///  External low-speed oscillator bypass bit
            LSEBYP: u1,
            ///  LSEDRV
            LSEDRV: u2,
            ///  CSSLSEON
            CSSLSEON: u1,
            ///  CSS on LSE failure detection flag
            CSSLSED: u1,
            reserved16: u1 = 0,
            ///  RTC and LCD clock source selection bits
            RTCSEL: u2,
            ///  RTC clock enable bit
            RTCEN: u1,
            ///  RTC software reset bit
            RTCRST: u1,
            reserved24: u4 = 0,
            ///  Remove reset flag
            RMVF: u1,
            ///  OBLRSTF
            OBLRSTF: u1,
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
            LPWRSTF: u1,
        }),
    };

    ///  System configuration controller and Comparator
    pub const SYSCFG_COMP = extern struct {
        ///  SYSCFG configuration register 1
        CFGR1: mmio.Mmio(32, packed struct {
            ///  Memory mapping selection bits
            MEM_MODE: u2,
            reserved8: u6 = 0,
            ///  Boot mode selected by the boot pins status bits
            BOOT_MODE: u2,
            padding: u22 = 0,
        }),
        ///  SYSCFG configuration register 2
        CFGR2: mmio.Mmio(32, packed struct {
            ///  Firewall disable bit
            FWDISEN: u1,
            reserved8: u7 = 0,
            ///  Fm+ drive capability on PB6 enable bit
            I2C_PB6_FMP: u1,
            ///  Fm+ drive capability on PB7 enable bit
            I2C_PB7_FMP: u1,
            ///  Fm+ drive capability on PB8 enable bit
            I2C_PB8_FMP: u1,
            ///  Fm+ drive capability on PB9 enable bit
            I2C_PB9_FMP: u1,
            ///  I2C1 Fm+ drive capability enable bit
            I2C1_FMP: u1,
            ///  I2C2 Fm+ drive capability enable bit
            I2C2_FMP: u1,
            padding: u18 = 0,
        }),
        ///  external interrupt configuration register 1
        EXTICR1: mmio.Mmio(32, packed struct {
            ///  EXTI x configuration (x = 0 to 3)
            EXTI0: u4,
            ///  EXTI x configuration (x = 0 to 3)
            EXTI1: u4,
            ///  EXTI x configuration (x = 0 to 3)
            EXTI2: u4,
            ///  EXTI x configuration (x = 0 to 3)
            EXTI3: u4,
            padding: u16 = 0,
        }),
        ///  external interrupt configuration register 2
        EXTICR2: mmio.Mmio(32, packed struct {
            ///  EXTI x configuration (x = 4 to 7)
            EXTI4: u4,
            ///  EXTI x configuration (x = 4 to 7)
            EXTI5: u4,
            ///  EXTI x configuration (x = 4 to 7)
            EXTI6: u4,
            ///  EXTI x configuration (x = 4 to 7)
            EXTI7: u4,
            padding: u16 = 0,
        }),
        ///  external interrupt configuration register 3
        EXTICR3: mmio.Mmio(32, packed struct {
            ///  EXTI x configuration (x = 8 to 11)
            EXTI8: u4,
            ///  EXTI x configuration (x = 8 to 11)
            EXTI9: u4,
            ///  EXTI10
            EXTI10: u4,
            ///  EXTI x configuration (x = 8 to 11)
            EXTI11: u4,
            padding: u16 = 0,
        }),
        ///  external interrupt configuration register 4
        EXTICR4: mmio.Mmio(32, packed struct {
            ///  EXTI12
            EXTI12: u4,
            ///  EXTI13
            EXTI13: u4,
            ///  EXTI14
            EXTI14: u4,
            ///  EXTI x configuration (x = 12 to 15)
            EXTI15: u4,
            padding: u16 = 0,
        }),
        ///  Comparator 1 control and status register
        COMP1_CSR: mmio.Mmio(32, packed struct {
            ///  Comparator 1 enable bit
            COMP1EN: u1,
            reserved4: u3 = 0,
            ///  Comparator 1 Input Minus connection configuration bit
            COMP1INNSEL: u2,
            reserved8: u2 = 0,
            ///  Comparator 1 window mode selection bit
            COMP1WM: u1,
            reserved12: u3 = 0,
            ///  Comparator 1 LPTIM input propagation bit
            COMP1LPTIMIN1: u1,
            reserved15: u2 = 0,
            ///  Comparator 1 polarity selection bit
            COMP1POLARITY: u1,
            reserved30: u14 = 0,
            ///  Comparator 1 output status bit
            COMP1VALUE: u1,
            ///  COMP1_CSR register lock bit
            COMP1LOCK: u1,
        }),
        ///  Comparator 2 control and status register
        COMP2_CSR: mmio.Mmio(32, packed struct {
            ///  Comparator 2 enable bit
            COMP2EN: u1,
            reserved3: u2 = 0,
            ///  Comparator 2 power mode selection bit
            COMP2SPEED: u1,
            ///  Comparator 2 Input Minus connection configuration bit
            COMP2INNSEL: u3,
            reserved8: u1 = 0,
            ///  Comparator 2 Input Plus connection configuration bit
            COMP2INPSEL: u3,
            reserved12: u1 = 0,
            ///  Comparator 2 LPTIM input 2 propagation bit
            COMP2LPTIMIN2: u1,
            ///  Comparator 2 LPTIM input 1 propagation bit
            COMP2LPTIMIN1: u1,
            reserved15: u1 = 0,
            ///  Comparator 2 polarity selection bit
            COMP2POLARITY: u1,
            reserved20: u4 = 0,
            ///  Comparator 2 output status bit
            COMP2VALUE: u1,
            reserved31: u10 = 0,
            ///  COMP2_CSR register lock bit
            COMP2LOCK: u1,
        }),
        ///  SYSCFG configuration register 3
        CFGR3: mmio.Mmio(32, packed struct {
            ///  Vref Enable bit
            EN_BGAP: u1,
            reserved4: u3 = 0,
            ///  BGAP_ADC connection bit
            SEL_VREF_OUT: u2,
            reserved8: u2 = 0,
            ///  VREFINT reference for ADC enable bit
            ENBUF_BGAP_ADC: u1,
            ///  Sensor reference for ADC enable bit
            ENBUF_SENSOR_ADC: u1,
            reserved12: u2 = 0,
            ///  VREFINT reference for comparator 2 enable bit
            ENBUF_VREFINT_COMP: u1,
            ///  VREFINT reference for 48 MHz RC oscillator enable bit
            ENREF_RC48MHz: u1,
            reserved26: u12 = 0,
            ///  VREFINT for 48 MHz RC oscillator ready flag
            REF_RC48MHz_RDYF: u1,
            ///  Sensor for ADC ready flag
            SENSOR_ADC_RDYF: u1,
            ///  VREFINT for ADC ready flag
            VREFINT_ADC_RDYF: u1,
            ///  VREFINT for comparator ready flag
            VREFINT_COMP_RDYF: u1,
            ///  VREFINT ready flag
            VREFINT_RDYF: u1,
            ///  REF_CTRL lock bit
            REF_LOCK: u1,
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
            reserved4: u1 = 0,
            ///  Frame format
            FRF: u1,
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
            ///  TI frame format error
            TIFRFE: u1,
            padding: u23 = 0,
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

    ///  Inter-integrated circuit
    pub const I2C1 = extern struct {
        ///  Control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  Peripheral enable
            PE: u1,
            ///  TX Interrupt enable
            TXIE: u1,
            ///  RX Interrupt enable
            RXIE: u1,
            ///  Address match interrupt enable (slave only)
            ADDRIE: u1,
            ///  Not acknowledge received interrupt enable
            NACKIE: u1,
            ///  STOP detection Interrupt enable
            STOPIE: u1,
            ///  Transfer Complete interrupt enable
            TCIE: u1,
            ///  Error interrupts enable
            ERRIE: u1,
            ///  Digital noise filter
            DNF: u4,
            ///  Analog noise filter OFF
            ANFOFF: u1,
            reserved14: u1 = 0,
            ///  DMA transmission requests enable
            TXDMAEN: u1,
            ///  DMA reception requests enable
            RXDMAEN: u1,
            ///  Slave byte control
            SBC: u1,
            ///  Clock stretching disable
            NOSTRETCH: u1,
            ///  Wakeup from STOP enable
            WUPEN: u1,
            ///  General call enable
            GCEN: u1,
            ///  SMBus Host address enable
            SMBHEN: u1,
            ///  SMBus Device Default address enable
            SMBDEN: u1,
            ///  SMBUS alert enable
            ALERTEN: u1,
            ///  PEC enable
            PECEN: u1,
            padding: u8 = 0,
        }),
        ///  Control register 2
        CR2: mmio.Mmio(32, packed struct {
            ///  Slave address bit (master mode)
            SADD: u10,
            ///  Transfer direction (master mode)
            RD_WRN: u1,
            ///  10-bit addressing mode (master mode)
            ADD10: u1,
            ///  10-bit address header only read direction (master receiver mode)
            HEAD10R: u1,
            ///  Start generation
            START: u1,
            ///  Stop generation (master mode)
            STOP: u1,
            ///  NACK generation (slave mode)
            NACK: u1,
            ///  Number of bytes
            NBYTES: u8,
            ///  NBYTES reload mode
            RELOAD: u1,
            ///  Automatic end mode (master mode)
            AUTOEND: u1,
            ///  Packet error checking byte
            PECBYTE: u1,
            padding: u5 = 0,
        }),
        ///  Own address register 1
        OAR1: mmio.Mmio(32, packed struct {
            ///  Interface address
            OA1: u10,
            ///  Own Address 1 10-bit mode
            OA1MODE: u1,
            reserved15: u4 = 0,
            ///  Own Address 1 enable
            OA1EN: u1,
            padding: u16 = 0,
        }),
        ///  Own address register 2
        OAR2: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  Interface address
            OA2: u7,
            ///  Own Address 2 masks
            OA2MSK: u3,
            reserved15: u4 = 0,
            ///  Own Address 2 enable
            OA2EN: u1,
            padding: u16 = 0,
        }),
        ///  Timing register
        TIMINGR: mmio.Mmio(32, packed struct {
            ///  SCL low period (master mode)
            SCLL: u8,
            ///  SCL high period (master mode)
            SCLH: u8,
            ///  Data hold time
            SDADEL: u4,
            ///  Data setup time
            SCLDEL: u4,
            reserved28: u4 = 0,
            ///  Timing prescaler
            PRESC: u4,
        }),
        ///  Status register 1
        TIMEOUTR: mmio.Mmio(32, packed struct {
            ///  Bus timeout A
            TIMEOUTA: u12,
            ///  Idle clock timeout detection
            TIDLE: u1,
            reserved15: u2 = 0,
            ///  Clock timeout enable
            TIMOUTEN: u1,
            ///  Bus timeout B
            TIMEOUTB: u12,
            reserved31: u3 = 0,
            ///  Extended clock timeout enable
            TEXTEN: u1,
        }),
        ///  Interrupt and Status register
        ISR: mmio.Mmio(32, packed struct {
            ///  Transmit data register empty (transmitters)
            TXE: u1,
            ///  Transmit interrupt status (transmitters)
            TXIS: u1,
            ///  Receive data register not empty (receivers)
            RXNE: u1,
            ///  Address matched (slave mode)
            ADDR: u1,
            ///  Not acknowledge received flag
            NACKF: u1,
            ///  Stop detection flag
            STOPF: u1,
            ///  Transfer Complete (master mode)
            TC: u1,
            ///  Transfer Complete Reload
            TCR: u1,
            ///  Bus error
            BERR: u1,
            ///  Arbitration lost
            ARLO: u1,
            ///  Overrun/Underrun (slave mode)
            OVR: u1,
            ///  PEC Error in reception
            PECERR: u1,
            ///  Timeout or t_low detection flag
            TIMEOUT: u1,
            ///  SMBus alert
            ALERT: u1,
            reserved15: u1 = 0,
            ///  Bus busy
            BUSY: u1,
            ///  Transfer direction (Slave mode)
            DIR: u1,
            ///  Address match code (Slave mode)
            ADDCODE: u7,
            padding: u8 = 0,
        }),
        ///  Interrupt clear register
        ICR: mmio.Mmio(32, packed struct {
            reserved3: u3 = 0,
            ///  Address Matched flag clear
            ADDRCF: u1,
            ///  Not Acknowledge flag clear
            NACKCF: u1,
            ///  Stop detection flag clear
            STOPCF: u1,
            reserved8: u2 = 0,
            ///  Bus error flag clear
            BERRCF: u1,
            ///  Arbitration lost flag clear
            ARLOCF: u1,
            ///  Overrun/Underrun flag clear
            OVRCF: u1,
            ///  PEC Error flag clear
            PECCF: u1,
            ///  Timeout detection flag clear
            TIMOUTCF: u1,
            ///  Alert flag clear
            ALERTCF: u1,
            padding: u18 = 0,
        }),
        ///  PEC register
        PECR: mmio.Mmio(32, packed struct {
            ///  Packet error checking register
            PEC: u8,
            padding: u24 = 0,
        }),
        ///  Receive data register
        RXDR: mmio.Mmio(32, packed struct {
            ///  8-bit receive data
            RXDATA: u8,
            padding: u24 = 0,
        }),
        ///  Transmit data register
        TXDR: mmio.Mmio(32, packed struct {
            ///  8-bit transmit data
            TXDATA: u8,
            padding: u24 = 0,
        }),
    };

    ///  Power control
    pub const PWR = extern struct {
        ///  power control register
        CR: mmio.Mmio(32, packed struct {
            ///  Low-power deep sleep
            LPDS: u1,
            ///  Power down deepsleep
            PDDS: u1,
            ///  Clear wakeup flag
            CWUF: u1,
            ///  Clear standby flag
            CSBF: u1,
            ///  Power voltage detector enable
            PVDE: u1,
            ///  PVD level selection
            PLS: u3,
            ///  Disable backup domain write protection
            DBP: u1,
            ///  Ultra-low-power mode
            ULP: u1,
            ///  Fast wakeup
            FWU: u1,
            ///  Voltage scaling range selection
            VOS: u2,
            ///  Deep sleep mode with Flash memory kept off
            DS_EE_KOFF: u1,
            ///  Low power run mode
            LPRUN: u1,
            padding: u17 = 0,
        }),
        ///  power control/status register
        CSR: mmio.Mmio(32, packed struct {
            ///  Wakeup flag
            WUF: u1,
            ///  Standby flag
            SBF: u1,
            ///  PVD output
            PVDO: u1,
            ///  Backup regulator ready
            BRR: u1,
            ///  Voltage Scaling select flag
            VOSF: u1,
            ///  Regulator LP flag
            REGLPF: u1,
            reserved8: u2 = 0,
            ///  Enable WKUP pin
            EWUP: u1,
            ///  Backup regulator enable
            BRE: u1,
            padding: u22 = 0,
        }),
    };

    ///  Flash
    pub const Flash = extern struct {
        ///  Access control register
        ACR: mmio.Mmio(32, packed struct {
            ///  Latency
            LATENCY: u1,
            ///  Prefetch enable
            PRFTEN: u1,
            reserved3: u1 = 0,
            ///  Flash mode during Sleep
            SLEEP_PD: u1,
            ///  Flash mode during Run
            RUN_PD: u1,
            ///  Disable Buffer
            DESAB_BUF: u1,
            ///  Pre-read data address
            PRE_READ: u1,
            padding: u25 = 0,
        }),
        ///  Program/erase control register
        PECR: mmio.Mmio(32, packed struct {
            ///  FLASH_PECR and data EEPROM lock
            PELOCK: u1,
            ///  Program memory lock
            PRGLOCK: u1,
            ///  Option bytes block lock
            OPTLOCK: u1,
            ///  Program memory selection
            PROG: u1,
            ///  Data EEPROM selection
            DATA: u1,
            reserved8: u3 = 0,
            ///  Fixed time data write for Byte, Half Word and Word programming
            FTDW: u1,
            ///  Page or Double Word erase mode
            ERASE: u1,
            ///  Half Page/Double Word programming mode
            FPRG: u1,
            reserved15: u4 = 0,
            ///  Parallel bank mode
            PARALLELBANK: u1,
            ///  End of programming interrupt enable
            EOPIE: u1,
            ///  Error interrupt enable
            ERRIE: u1,
            ///  Launch the option byte loading
            OBL_LAUNCH: u1,
            padding: u13 = 0,
        }),
        ///  Power down key register
        PDKEYR: mmio.Mmio(32, packed struct {
            ///  RUN_PD in FLASH_ACR key
            PDKEYR: u32,
        }),
        ///  Program/erase key register
        PEKEYR: mmio.Mmio(32, packed struct {
            ///  FLASH_PEC and data EEPROM key
            PEKEYR: u32,
        }),
        ///  Program memory key register
        PRGKEYR: mmio.Mmio(32, packed struct {
            ///  Program memory key
            PRGKEYR: u32,
        }),
        ///  Option byte key register
        OPTKEYR: mmio.Mmio(32, packed struct {
            ///  Option byte key
            OPTKEYR: u32,
        }),
        ///  Status register
        SR: mmio.Mmio(32, packed struct {
            ///  Write/erase operations in progress
            BSY: u1,
            ///  End of operation
            EOP: u1,
            ///  End of high voltage
            ENDHV: u1,
            ///  Flash memory module ready after low power mode
            READY: u1,
            reserved8: u4 = 0,
            ///  Write protected error
            WRPERR: u1,
            ///  Programming alignment error
            PGAERR: u1,
            ///  Size error
            SIZERR: u1,
            ///  Option validity error
            OPTVERR: u1,
            reserved14: u2 = 0,
            ///  RDERR
            RDERR: u1,
            reserved16: u1 = 0,
            ///  NOTZEROERR
            NOTZEROERR: u1,
            ///  FWWERR
            FWWERR: u1,
            padding: u14 = 0,
        }),
        ///  Option byte register
        OBR: mmio.Mmio(32, packed struct {
            ///  Read protection
            RDPRT: u8,
            ///  Selection of protection mode of WPR bits
            SPRMOD: u1,
            reserved16: u7 = 0,
            ///  BOR_LEV
            BOR_LEV: u4,
            padding: u12 = 0,
        }),
        ///  Write protection register
        WRPR: mmio.Mmio(32, packed struct {
            ///  Write protection
            WRP: u16,
            padding: u16 = 0,
        }),
    };

    ///  External interrupt/event controller
    pub const EXTI = extern struct {
        ///  Interrupt mask register (EXTI_IMR)
        IMR: mmio.Mmio(32, packed struct {
            ///  Interrupt Mask on line 0
            IM0: u1,
            ///  Interrupt Mask on line 1
            IM1: u1,
            ///  Interrupt Mask on line 2
            IM2: u1,
            ///  Interrupt Mask on line 3
            IM3: u1,
            ///  Interrupt Mask on line 4
            IM4: u1,
            ///  Interrupt Mask on line 5
            IM5: u1,
            ///  Interrupt Mask on line 6
            IM6: u1,
            ///  Interrupt Mask on line 7
            IM7: u1,
            ///  Interrupt Mask on line 8
            IM8: u1,
            ///  Interrupt Mask on line 9
            IM9: u1,
            ///  Interrupt Mask on line 10
            IM10: u1,
            ///  Interrupt Mask on line 11
            IM11: u1,
            ///  Interrupt Mask on line 12
            IM12: u1,
            ///  Interrupt Mask on line 13
            IM13: u1,
            ///  Interrupt Mask on line 14
            IM14: u1,
            ///  Interrupt Mask on line 15
            IM15: u1,
            ///  Interrupt Mask on line 16
            IM16: u1,
            ///  Interrupt Mask on line 17
            IM17: u1,
            ///  Interrupt Mask on line 18
            IM18: u1,
            ///  Interrupt Mask on line 19
            IM19: u1,
            ///  Interrupt Mask on line 20
            IM20: u1,
            ///  Interrupt Mask on line 21
            IM21: u1,
            ///  Interrupt Mask on line 22
            IM22: u1,
            ///  Interrupt Mask on line 23
            IM23: u1,
            ///  Interrupt Mask on line 24
            IM24: u1,
            ///  Interrupt Mask on line 25
            IM25: u1,
            ///  Interrupt Mask on line 27
            IM26: u1,
            reserved28: u1 = 0,
            ///  Interrupt Mask on line 27
            IM28: u1,
            ///  Interrupt Mask on line 27
            IM29: u1,
            padding: u2 = 0,
        }),
        ///  Event mask register (EXTI_EMR)
        EMR: mmio.Mmio(32, packed struct {
            ///  Event Mask on line 0
            EM0: u1,
            ///  Event Mask on line 1
            EM1: u1,
            ///  Event Mask on line 2
            EM2: u1,
            ///  Event Mask on line 3
            EM3: u1,
            ///  Event Mask on line 4
            EM4: u1,
            ///  Event Mask on line 5
            EM5: u1,
            ///  Event Mask on line 6
            EM6: u1,
            ///  Event Mask on line 7
            EM7: u1,
            ///  Event Mask on line 8
            EM8: u1,
            ///  Event Mask on line 9
            EM9: u1,
            ///  Event Mask on line 10
            EM10: u1,
            ///  Event Mask on line 11
            EM11: u1,
            ///  Event Mask on line 12
            EM12: u1,
            ///  Event Mask on line 13
            EM13: u1,
            ///  Event Mask on line 14
            EM14: u1,
            ///  Event Mask on line 15
            EM15: u1,
            ///  Event Mask on line 16
            EM16: u1,
            ///  Event Mask on line 17
            EM17: u1,
            ///  Event Mask on line 18
            EM18: u1,
            ///  Event Mask on line 19
            EM19: u1,
            ///  Event Mask on line 20
            EM20: u1,
            ///  Event Mask on line 21
            EM21: u1,
            ///  Event Mask on line 22
            EM22: u1,
            ///  Event Mask on line 23
            EM23: u1,
            ///  Event Mask on line 24
            EM24: u1,
            ///  Event Mask on line 25
            EM25: u1,
            ///  Event Mask on line 26
            EM26: u1,
            reserved28: u1 = 0,
            ///  Event Mask on line 28
            EM28: u1,
            ///  Event Mask on line 29
            EM29: u1,
            padding: u2 = 0,
        }),
        ///  Rising Trigger selection register (EXTI_RTSR)
        RTSR: mmio.Mmio(32, packed struct {
            ///  Rising trigger event configuration of line 0
            RT0: u1,
            ///  Rising trigger event configuration of line 1
            RT1: u1,
            ///  Rising trigger event configuration of line 2
            RT2: u1,
            ///  Rising trigger event configuration of line 3
            RT3: u1,
            ///  Rising trigger event configuration of line 4
            RT4: u1,
            ///  Rising trigger event configuration of line 5
            RT5: u1,
            ///  Rising trigger event configuration of line 6
            RT6: u1,
            ///  Rising trigger event configuration of line 7
            RT7: u1,
            ///  Rising trigger event configuration of line 8
            RT8: u1,
            ///  Rising trigger event configuration of line 9
            RT9: u1,
            ///  Rising trigger event configuration of line 10
            RT10: u1,
            ///  Rising trigger event configuration of line 11
            RT11: u1,
            ///  Rising trigger event configuration of line 12
            RT12: u1,
            ///  Rising trigger event configuration of line 13
            RT13: u1,
            ///  Rising trigger event configuration of line 14
            RT14: u1,
            ///  Rising trigger event configuration of line 15
            RT15: u1,
            ///  Rising trigger event configuration of line 16
            RT16: u1,
            ///  Rising trigger event configuration of line 17
            RT17: u1,
            reserved19: u1 = 0,
            ///  Rising trigger event configuration of line 19
            RT19: u1,
            ///  Rising trigger event configuration of line 20
            RT20: u1,
            ///  Rising trigger event configuration of line 21
            RT21: u1,
            ///  Rising trigger event configuration of line 22
            RT22: u1,
            padding: u9 = 0,
        }),
        ///  Falling Trigger selection register (EXTI_FTSR)
        FTSR: mmio.Mmio(32, packed struct {
            ///  Falling trigger event configuration of line 0
            FT0: u1,
            ///  Falling trigger event configuration of line 1
            FT1: u1,
            ///  Falling trigger event configuration of line 2
            FT2: u1,
            ///  Falling trigger event configuration of line 3
            FT3: u1,
            ///  Falling trigger event configuration of line 4
            FT4: u1,
            ///  Falling trigger event configuration of line 5
            FT5: u1,
            ///  Falling trigger event configuration of line 6
            FT6: u1,
            ///  Falling trigger event configuration of line 7
            FT7: u1,
            ///  Falling trigger event configuration of line 8
            FT8: u1,
            ///  Falling trigger event configuration of line 9
            FT9: u1,
            ///  Falling trigger event configuration of line 10
            FT10: u1,
            ///  Falling trigger event configuration of line 11
            FT11: u1,
            ///  Falling trigger event configuration of line 12
            FT12: u1,
            ///  Falling trigger event configuration of line 13
            FT13: u1,
            ///  Falling trigger event configuration of line 14
            FT14: u1,
            ///  Falling trigger event configuration of line 15
            FT15: u1,
            ///  Falling trigger event configuration of line 16
            FT16: u1,
            ///  Falling trigger event configuration of line 17
            FT17: u1,
            reserved19: u1 = 0,
            ///  Falling trigger event configuration of line 19
            FT19: u1,
            ///  Falling trigger event configuration of line 20
            FT20: u1,
            ///  Falling trigger event configuration of line 21
            FT21: u1,
            ///  Falling trigger event configuration of line 22
            FT22: u1,
            padding: u9 = 0,
        }),
        ///  Software interrupt event register (EXTI_SWIER)
        SWIER: mmio.Mmio(32, packed struct {
            ///  Software Interrupt on line 0
            SWI0: u1,
            ///  Software Interrupt on line 1
            SWI1: u1,
            ///  Software Interrupt on line 2
            SWI2: u1,
            ///  Software Interrupt on line 3
            SWI3: u1,
            ///  Software Interrupt on line 4
            SWI4: u1,
            ///  Software Interrupt on line 5
            SWI5: u1,
            ///  Software Interrupt on line 6
            SWI6: u1,
            ///  Software Interrupt on line 7
            SWI7: u1,
            ///  Software Interrupt on line 8
            SWI8: u1,
            ///  Software Interrupt on line 9
            SWI9: u1,
            ///  Software Interrupt on line 10
            SWI10: u1,
            ///  Software Interrupt on line 11
            SWI11: u1,
            ///  Software Interrupt on line 12
            SWI12: u1,
            ///  Software Interrupt on line 13
            SWI13: u1,
            ///  Software Interrupt on line 14
            SWI14: u1,
            ///  Software Interrupt on line 15
            SWI15: u1,
            ///  Software Interrupt on line 16
            SWI16: u1,
            ///  Software Interrupt on line 17
            SWI17: u1,
            reserved19: u1 = 0,
            ///  Software Interrupt on line 19
            SWI19: u1,
            ///  Software Interrupt on line 20
            SWI20: u1,
            ///  Software Interrupt on line 21
            SWI21: u1,
            ///  Software Interrupt on line 22
            SWI22: u1,
            padding: u9 = 0,
        }),
        ///  Pending register (EXTI_PR)
        PR: mmio.Mmio(32, packed struct {
            ///  Pending bit 0
            PIF0: u1,
            ///  Pending bit 1
            PIF1: u1,
            ///  Pending bit 2
            PIF2: u1,
            ///  Pending bit 3
            PIF3: u1,
            ///  Pending bit 4
            PIF4: u1,
            ///  Pending bit 5
            PIF5: u1,
            ///  Pending bit 6
            PIF6: u1,
            ///  Pending bit 7
            PIF7: u1,
            ///  Pending bit 8
            PIF8: u1,
            ///  Pending bit 9
            PIF9: u1,
            ///  Pending bit 10
            PIF10: u1,
            ///  Pending bit 11
            PIF11: u1,
            ///  Pending bit 12
            PIF12: u1,
            ///  Pending bit 13
            PIF13: u1,
            ///  Pending bit 14
            PIF14: u1,
            ///  Pending bit 15
            PIF15: u1,
            ///  Pending bit 16
            PIF16: u1,
            ///  Pending bit 17
            PIF17: u1,
            reserved19: u1 = 0,
            ///  Pending bit 19
            PIF19: u1,
            ///  Pending bit 20
            PIF20: u1,
            ///  Pending bit 21
            PIF21: u1,
            ///  Pending bit 22
            PIF22: u1,
            padding: u9 = 0,
        }),
    };

    ///  Analog-to-digital converter
    pub const ADC = extern struct {
        ///  interrupt and status register
        ISR: mmio.Mmio(32, packed struct {
            ///  ADC ready
            ADRDY: u1,
            ///  End of sampling flag
            EOSMP: u1,
            ///  End of conversion flag
            EOC: u1,
            ///  End of sequence flag
            EOS: u1,
            ///  ADC overrun
            OVR: u1,
            reserved7: u2 = 0,
            ///  Analog watchdog flag
            AWD: u1,
            reserved11: u3 = 0,
            ///  End Of Calibration flag
            EOCAL: u1,
            padding: u20 = 0,
        }),
        ///  interrupt enable register
        IER: mmio.Mmio(32, packed struct {
            ///  ADC ready interrupt enable
            ADRDYIE: u1,
            ///  End of sampling flag interrupt enable
            EOSMPIE: u1,
            ///  End of conversion interrupt enable
            EOCIE: u1,
            ///  End of conversion sequence interrupt enable
            EOSIE: u1,
            ///  Overrun interrupt enable
            OVRIE: u1,
            reserved7: u2 = 0,
            ///  Analog watchdog interrupt enable
            AWDIE: u1,
            reserved11: u3 = 0,
            ///  End of calibration interrupt enable
            EOCALIE: u1,
            padding: u20 = 0,
        }),
        ///  control register
        CR: mmio.Mmio(32, packed struct {
            ///  ADC enable command
            ADEN: u1,
            ///  ADC disable command
            ADDIS: u1,
            ///  ADC start conversion command
            ADSTART: u1,
            reserved4: u1 = 0,
            ///  ADC stop conversion command
            ADSTP: u1,
            reserved28: u23 = 0,
            ///  ADC Voltage Regulator Enable
            ADVREGEN: u1,
            reserved31: u2 = 0,
            ///  ADC calibration
            ADCAL: u1,
        }),
        ///  configuration register 1
        CFGR1: mmio.Mmio(32, packed struct {
            ///  Direct memory access enable
            DMAEN: u1,
            ///  Direct memery access configuration
            DMACFG: u1,
            ///  Scan sequence direction
            SCANDIR: u1,
            ///  Data resolution
            RES: u2,
            ///  Data alignment
            ALIGN: u1,
            ///  External trigger selection
            EXTSEL: u3,
            reserved10: u1 = 0,
            ///  External trigger enable and polarity selection
            EXTEN: u2,
            ///  Overrun management mode
            OVRMOD: u1,
            ///  Single / continuous conversion mode
            CONT: u1,
            ///  Auto-delayed conversion mode
            AUTDLY: u1,
            ///  Auto-off mode
            AUTOFF: u1,
            ///  Discontinuous mode
            DISCEN: u1,
            reserved22: u5 = 0,
            ///  Enable the watchdog on a single channel or on all channels
            AWDSGL: u1,
            ///  Analog watchdog enable
            AWDEN: u1,
            reserved26: u2 = 0,
            ///  Analog watchdog channel selection
            AWDCH: u5,
            padding: u1 = 0,
        }),
        ///  configuration register 2
        CFGR2: mmio.Mmio(32, packed struct {
            ///  Oversampler Enable
            OVSE: u1,
            reserved2: u1 = 0,
            ///  Oversampling ratio
            OVSR: u3,
            ///  Oversampling shift
            OVSS: u4,
            ///  Triggered Oversampling
            TOVS: u1,
            reserved30: u20 = 0,
            ///  ADC clock mode
            CKMODE: u2,
        }),
        ///  sampling time register
        SMPR: mmio.Mmio(32, packed struct {
            ///  Sampling time selection
            SMPR: u3,
            padding: u29 = 0,
        }),
        reserved32: [8]u8,
        ///  watchdog threshold register
        TR: mmio.Mmio(32, packed struct {
            ///  Analog watchdog lower threshold
            LT: u12,
            reserved16: u4 = 0,
            ///  Analog watchdog higher threshold
            HT: u12,
            padding: u4 = 0,
        }),
        reserved40: [4]u8,
        ///  channel selection register
        CHSELR: mmio.Mmio(32, packed struct {
            ///  Channel-x selection
            CHSEL0: u1,
            ///  Channel-x selection
            CHSEL1: u1,
            ///  Channel-x selection
            CHSEL2: u1,
            ///  Channel-x selection
            CHSEL3: u1,
            ///  Channel-x selection
            CHSEL4: u1,
            ///  Channel-x selection
            CHSEL5: u1,
            ///  Channel-x selection
            CHSEL6: u1,
            ///  Channel-x selection
            CHSEL7: u1,
            ///  Channel-x selection
            CHSEL8: u1,
            ///  Channel-x selection
            CHSEL9: u1,
            ///  Channel-x selection
            CHSEL10: u1,
            ///  Channel-x selection
            CHSEL11: u1,
            ///  Channel-x selection
            CHSEL12: u1,
            ///  Channel-x selection
            CHSEL13: u1,
            ///  Channel-x selection
            CHSEL14: u1,
            ///  Channel-x selection
            CHSEL15: u1,
            ///  Channel-x selection
            CHSEL16: u1,
            ///  Channel-x selection
            CHSEL17: u1,
            ///  Channel-x selection
            CHSEL18: u1,
            padding: u13 = 0,
        }),
        reserved64: [20]u8,
        ///  data register
        DR: mmio.Mmio(32, packed struct {
            ///  Converted data
            DATA: u16,
            padding: u16 = 0,
        }),
        reserved180: [112]u8,
        ///  ADC Calibration factor
        CALFACT: mmio.Mmio(32, packed struct {
            ///  Calibration factor
            CALFACT: u7,
            padding: u25 = 0,
        }),
        reserved776: [592]u8,
        ///  ADC common configuration register
        CCR: mmio.Mmio(32, packed struct {
            reserved18: u18 = 0,
            ///  ADC prescaler
            PRESC: u4,
            ///  VREFINT enable
            VREFEN: u1,
            ///  Temperature sensor enable
            TSEN: u1,
            reserved25: u1 = 0,
            ///  Low Frequency Mode enable
            LFMEN: u1,
            padding: u6 = 0,
        }),
    };

    ///  Debug support
    pub const DBGMCU = extern struct {
        ///  MCU Device ID Code Register
        IDCODE: mmio.Mmio(32, packed struct {
            ///  Device Identifier
            DEV_ID: u12,
            reserved16: u4 = 0,
            ///  Revision Identifier
            REV_ID: u16,
        }),
        ///  Debug MCU Configuration Register
        CR: mmio.Mmio(32, packed struct {
            ///  Debug Sleep Mode
            DBG_SLEEP: u1,
            ///  Debug Stop Mode
            DBG_STOP: u1,
            ///  Debug Standby Mode
            DBG_STANDBY: u1,
            padding: u29 = 0,
        }),
        ///  APB Low Freeze Register
        APB1_FZ: mmio.Mmio(32, packed struct {
            ///  Debug Timer 2 stopped when Core is halted
            DBG_TIMER2_STOP: u1,
            reserved4: u3 = 0,
            ///  Debug Timer 6 stopped when Core is halted
            DBG_TIMER6_STOP: u1,
            reserved10: u5 = 0,
            ///  Debug RTC stopped when Core is halted
            DBG_RTC_STOP: u1,
            ///  Debug Window Wachdog stopped when Core is halted
            DBG_WWDG_STOP: u1,
            ///  Debug Independent Wachdog stopped when Core is halted
            DBG_IWDG_STOP: u1,
            reserved21: u8 = 0,
            ///  I2C1 SMBUS timeout mode stopped when core is halted
            DBG_I2C1_STOP: u1,
            ///  I2C2 SMBUS timeout mode stopped when core is halted
            DBG_I2C2_STOP: u1,
            reserved31: u8 = 0,
            ///  LPTIM1 counter stopped when core is halted
            DBG_LPTIMER_STOP: u1,
        }),
        ///  APB High Freeze Register
        APB2_FZ: mmio.Mmio(32, packed struct {
            reserved2: u2 = 0,
            ///  Debug Timer 21 stopped when Core is halted
            DBG_TIMER21_STOP: u1,
            reserved6: u3 = 0,
            ///  Debug Timer 22 stopped when Core is halted
            DBG_TIMER22_STO: u1,
            padding: u25 = 0,
        }),
    };

    ///  General-purpose-timers
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
            OC4CE: u1,
            padding: u16 = 0,
        }),
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
            ///  Capture/Compare 3 output enable
            CC3E: u1,
            ///  Capture/Compare 3 output Polarity
            CC3P: u1,
            reserved11: u1 = 0,
            ///  Capture/Compare 3 output Polarity
            CC3NP: u1,
            ///  Capture/Compare 4 output enable
            CC4E: u1,
            ///  Capture/Compare 3 output Polarity
            CC4P: u1,
            reserved15: u1 = 0,
            ///  Capture/Compare 4 output Polarity
            CC4NP: u1,
            padding: u16 = 0,
        }),
        ///  counter
        CNT: mmio.Mmio(32, packed struct {
            ///  Low counter value
            CNT_L: u16,
            ///  High counter value (TIM2 only)
            CNT_H: u16,
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
            ARR_L: u16,
            ///  High Auto-reload value (TIM2 only)
            ARR_H: u16,
        }),
        reserved52: [4]u8,
        ///  capture/compare register 1
        CCR1: mmio.Mmio(32, packed struct {
            ///  Low Capture/Compare 1 value
            CCR1_L: u16,
            ///  High Capture/Compare 1 value (TIM2 only)
            CCR1_H: u16,
        }),
        ///  capture/compare register 2
        CCR2: mmio.Mmio(32, packed struct {
            ///  Low Capture/Compare 2 value
            CCR2_L: u16,
            ///  High Capture/Compare 2 value (TIM2 only)
            CCR2_H: u16,
        }),
        ///  capture/compare register 3
        CCR3: mmio.Mmio(32, packed struct {
            ///  Low Capture/Compare value
            CCR3_L: u16,
            ///  High Capture/Compare value (TIM2 only)
            CCR3_H: u16,
        }),
        ///  capture/compare register 4
        CCR4: mmio.Mmio(32, packed struct {
            ///  Low Capture/Compare value
            CCR4_L: u16,
            ///  High Capture/Compare value (TIM2 only)
            CCR4_H: u16,
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
        ///  TIM2 option register
        OR: mmio.Mmio(32, packed struct {
            ///  Timer2 ETR remap
            ETR_RMP: u3,
            ///  Internal trigger
            TI4_RMP: u2,
            padding: u27 = 0,
        }),
    };

    ///  Basic-timers
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

    ///  General-purpose-timers
    pub const TIM21 = extern struct {
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
        reserved80: [20]u8,
        ///  TIM21 option register
        OR: mmio.Mmio(32, packed struct {
            ///  Timer21 ETR remap
            ETR_RMP: u2,
            ///  Timer21 TI1
            TI1_RMP: u3,
            ///  Timer21 TI2
            TI2_RMP: u1,
            padding: u26 = 0,
        }),
    };

    ///  General-purpose-timers
    pub const TIM22 = extern struct {
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
        reserved80: [20]u8,
        ///  TIM22 option register
        OR: mmio.Mmio(32, packed struct {
            ///  Timer22 ETR remap
            ETR_RMP: u2,
            ///  Timer22 TI1
            TI1_RMP: u2,
            padding: u28 = 0,
        }),
    };

    ///  Universal synchronous asynchronous receiver transmitter
    pub const LPUSART1 = extern struct {
        ///  Control register 1
        CR1: mmio.Mmio(32, packed struct {
            ///  USART enable
            UE: u1,
            ///  USART enable in Stop mode
            UESM: u1,
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
            ///  interrupt enable
            TXEIE: u1,
            ///  PE interrupt enable
            PEIE: u1,
            ///  Parity selection
            PS: u1,
            ///  Parity control enable
            PCE: u1,
            ///  Receiver wakeup method
            WAKE: u1,
            ///  Word length
            M0: u1,
            ///  Mute mode enable
            MME: u1,
            ///  Character match interrupt enable
            CMIE: u1,
            reserved16: u1 = 0,
            ///  DEDT0
            DEDT0: u1,
            ///  DEDT1
            DEDT1: u1,
            ///  DEDT2
            DEDT2: u1,
            ///  DEDT3
            DEDT3: u1,
            ///  Driver Enable de-assertion time
            DEDT4: u1,
            ///  DEAT0
            DEAT0: u1,
            ///  DEAT1
            DEAT1: u1,
            ///  DEAT2
            DEAT2: u1,
            ///  DEAT3
            DEAT3: u1,
            ///  Driver Enable assertion time
            DEAT4: u1,
            reserved28: u2 = 0,
            ///  Word length
            M1: u1,
            padding: u3 = 0,
        }),
        ///  Control register 2
        CR2: mmio.Mmio(32, packed struct {
            reserved4: u4 = 0,
            ///  7-bit Address Detection/4-bit Address Detection
            ADDM7: u1,
            reserved11: u6 = 0,
            ///  Clock enable
            CLKEN: u1,
            ///  STOP bits
            STOP: u2,
            reserved15: u1 = 0,
            ///  Swap TX/RX pins
            SWAP: u1,
            ///  RX pin active level inversion
            RXINV: u1,
            ///  TX pin active level inversion
            TXINV: u1,
            ///  Binary data inversion
            TAINV: u1,
            ///  Most significant bit first
            MSBFIRST: u1,
            reserved24: u4 = 0,
            ///  Address of the USART node
            ADD0_3: u4,
            ///  Address of the USART node
            ADD4_7: u4,
        }),
        ///  Control register 3
        CR3: mmio.Mmio(32, packed struct {
            ///  Error interrupt enable
            EIE: u1,
            reserved3: u2 = 0,
            ///  Half-duplex selection
            HDSEL: u1,
            reserved6: u2 = 0,
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
            reserved12: u1 = 0,
            ///  Overrun Disable
            OVRDIS: u1,
            ///  DMA Disable on Reception Error
            DDRE: u1,
            ///  Driver enable mode
            DEM: u1,
            ///  Driver enable polarity selection
            DEP: u1,
            reserved20: u4 = 0,
            ///  Wakeup from Stop mode interrupt flag selection
            WUS: u2,
            ///  Wakeup from Stop mode interrupt enable
            WUFIE: u1,
            padding: u9 = 0,
        }),
        ///  Baud rate register
        BRR: mmio.Mmio(32, packed struct {
            ///  BRR
            BRR: u20,
            padding: u12 = 0,
        }),
        reserved24: [8]u8,
        ///  Request register
        RQR: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  Send break request
            SBKRQ: u1,
            ///  Mute mode request
            MMRQ: u1,
            ///  Receive data flush request
            RXFRQ: u1,
            padding: u28 = 0,
        }),
        ///  Interrupt & status register
        ISR: mmio.Mmio(32, packed struct {
            ///  PE
            PE: u1,
            ///  FE
            FE: u1,
            ///  NF
            NF: u1,
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
            reserved9: u1 = 0,
            ///  CTSIF
            CTSIF: u1,
            ///  CTS
            CTS: u1,
            reserved16: u5 = 0,
            ///  BUSY
            BUSY: u1,
            ///  CMF
            CMF: u1,
            ///  SBKF
            SBKF: u1,
            ///  RWU
            RWU: u1,
            ///  WUF
            WUF: u1,
            ///  TEACK
            TEACK: u1,
            ///  REACK
            REACK: u1,
            padding: u9 = 0,
        }),
        ///  Interrupt flag clear register
        ICR: mmio.Mmio(32, packed struct {
            ///  Parity error clear flag
            PECF: u1,
            ///  Framing error clear flag
            FECF: u1,
            ///  Noise detected clear flag
            NCF: u1,
            ///  Overrun error clear flag
            ORECF: u1,
            ///  Idle line detected clear flag
            IDLECF: u1,
            reserved6: u1 = 0,
            ///  Transmission complete clear flag
            TCCF: u1,
            reserved9: u2 = 0,
            ///  CTS clear flag
            CTSCF: u1,
            reserved17: u7 = 0,
            ///  Character match clear flag
            CMCF: u1,
            reserved20: u2 = 0,
            ///  Wakeup from Stop mode clear flag
            WUCF: u1,
            padding: u11 = 0,
        }),
        ///  Receive data register
        RDR: mmio.Mmio(32, packed struct {
            ///  Receive data value
            RDR: u9,
            padding: u23 = 0,
        }),
        ///  Transmit data register
        TDR: mmio.Mmio(32, packed struct {
            ///  Transmit data value
            TDR: u9,
            padding: u23 = 0,
        }),
    };

    ///  Nested Vectored Interrupt Controller
    pub const NVIC = extern struct {
        ///  Interrupt Set Enable Register
        ISER: mmio.Mmio(32, packed struct {
            ///  SETENA
            SETENA: u32,
        }),
        reserved128: [124]u8,
        ///  Interrupt Clear Enable Register
        ICER: mmio.Mmio(32, packed struct {
            ///  CLRENA
            CLRENA: u32,
        }),
        reserved256: [124]u8,
        ///  Interrupt Set-Pending Register
        ISPR: mmio.Mmio(32, packed struct {
            ///  SETPEND
            SETPEND: u32,
        }),
        reserved384: [124]u8,
        ///  Interrupt Clear-Pending Register
        ICPR: mmio.Mmio(32, packed struct {
            ///  CLRPEND
            CLRPEND: u32,
        }),
        reserved768: [380]u8,
        ///  Interrupt Priority Register 0
        IPR0: mmio.Mmio(32, packed struct {
            ///  priority for interrupt 0
            PRI_0: u8,
            ///  priority for interrupt 1
            PRI_1: u8,
            ///  priority for interrupt 2
            PRI_2: u8,
            ///  priority for interrupt 3
            PRI_3: u8,
        }),
        ///  Interrupt Priority Register 1
        IPR1: mmio.Mmio(32, packed struct {
            ///  priority for interrupt n
            PRI_4: u8,
            ///  priority for interrupt n
            PRI_5: u8,
            ///  priority for interrupt n
            PRI_6: u8,
            ///  priority for interrupt n
            PRI_7: u8,
        }),
        ///  Interrupt Priority Register 2
        IPR2: mmio.Mmio(32, packed struct {
            ///  priority for interrupt n
            PRI_8: u8,
            ///  priority for interrupt n
            PRI_9: u8,
            ///  priority for interrupt n
            PRI_10: u8,
            ///  priority for interrupt n
            PRI_11: u8,
        }),
        ///  Interrupt Priority Register 3
        IPR3: mmio.Mmio(32, packed struct {
            ///  priority for interrupt n
            PRI_12: u8,
            ///  priority for interrupt n
            PRI_13: u8,
            ///  priority for interrupt n
            PRI_14: u8,
            ///  priority for interrupt n
            PRI_15: u8,
        }),
        ///  Interrupt Priority Register 4
        IPR4: mmio.Mmio(32, packed struct {
            ///  priority for interrupt n
            PRI_16: u8,
            ///  priority for interrupt n
            PRI_17: u8,
            ///  priority for interrupt n
            PRI_18: u8,
            ///  priority for interrupt n
            PRI_19: u8,
        }),
        ///  Interrupt Priority Register 5
        IPR5: mmio.Mmio(32, packed struct {
            ///  priority for interrupt n
            PRI_20: u8,
            ///  priority for interrupt n
            PRI_21: u8,
            ///  priority for interrupt n
            PRI_22: u8,
            ///  priority for interrupt n
            PRI_23: u8,
        }),
        ///  Interrupt Priority Register 6
        IPR6: mmio.Mmio(32, packed struct {
            ///  priority for interrupt n
            PRI_24: u8,
            ///  priority for interrupt n
            PRI_25: u8,
            ///  priority for interrupt n
            PRI_26: u8,
            ///  priority for interrupt n
            PRI_27: u8,
        }),
        ///  Interrupt Priority Register 7
        IPR7: mmio.Mmio(32, packed struct {
            ///  priority for interrupt n
            PRI_28: u8,
            ///  priority for interrupt n
            PRI_29: u8,
            ///  priority for interrupt n
            PRI_30: u8,
            ///  priority for interrupt n
            PRI_31: u8,
        }),
    };

    ///  Universal serial bus full-speed device interface
    pub const USB_SRAM = extern struct {
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
            ///  LPM L1 Resume request
            L1RESUME: u1,
            reserved7: u1 = 0,
            ///  LPM L1 state request interrupt mask
            L1REQM: u1,
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
            reserved7: u2 = 0,
            ///  LPM L1 state request
            L1REQ: u1,
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
        ///  LPM control and status register
        LPMCSR: mmio.Mmio(32, packed struct {
            ///  LPM support enable
            LPMEN: u1,
            ///  LPM Token acknowledge enable
            LPMACK: u1,
            reserved3: u1 = 0,
            ///  bRemoteWake value
            REMWAKE: u1,
            ///  BESL value
            BESL: u4,
            padding: u24 = 0,
        }),
        ///  Battery charging detector
        BCDR: mmio.Mmio(32, packed struct {
            ///  Battery charging detector
            BCDEN: u1,
            ///  Data contact detection
            DCDEN: u1,
            ///  Primary detection
            PDEN: u1,
            ///  Secondary detection
            SDEN: u1,
            ///  Data contact detection
            DCDET: u1,
            ///  Primary detection
            PDET: u1,
            ///  Secondary detection
            SDET: u1,
            ///  DM pull-up detection status
            PS2DET: u1,
            reserved15: u7 = 0,
            ///  DP pull-up control
            DPPU: u1,
            padding: u16 = 0,
        }),
    };

    ///  Memory protection unit
    pub const MPU = extern struct {
        ///  MPU type register
        MPU_TYPER: mmio.Mmio(32, packed struct {
            ///  Separate flag
            SEPARATE: u1,
            reserved8: u7 = 0,
            ///  Number of MPU data regions
            DREGION: u8,
            ///  Number of MPU instruction regions
            IREGION: u8,
            padding: u8 = 0,
        }),
        ///  MPU control register
        MPU_CTRL: mmio.Mmio(32, packed struct {
            ///  Enables the MPU
            ENABLE: u1,
            ///  Enables the operation of MPU during hard fault
            HFNMIENA: u1,
            ///  Enable priviliged software access to default memory map
            PRIVDEFENA: u1,
            padding: u29 = 0,
        }),
        ///  MPU region number register
        MPU_RNR: mmio.Mmio(32, packed struct {
            ///  MPU region
            REGION: u8,
            padding: u24 = 0,
        }),
        ///  MPU region base address register
        MPU_RBAR: mmio.Mmio(32, packed struct {
            ///  MPU region field
            REGION: u4,
            ///  MPU region number valid
            VALID: u1,
            ///  Region base address field
            ADDR: u27,
        }),
        ///  MPU region attribute and size register
        MPU_RASR: mmio.Mmio(32, packed struct {
            ///  Region enable bit.
            ENABLE: u1,
            ///  Size of the MPU protection region
            SIZE: u5,
            reserved8: u2 = 0,
            ///  Subregion disable bits
            SRD: u8,
            ///  memory attribute
            B: u1,
            ///  memory attribute
            C: u1,
            ///  Shareable memory attribute
            S: u1,
            ///  memory attribute
            TEX: u3,
            reserved24: u2 = 0,
            ///  Access permission
            AP: u3,
            reserved28: u1 = 0,
            ///  Instruction access disable bit
            XN: u1,
            padding: u3 = 0,
        }),
    };

    ///  SysTick timer
    pub const STK = extern struct {
        ///  SysTick control and status register
        CSR: mmio.Mmio(32, packed struct {
            ///  Counter enable
            ENABLE: u1,
            ///  SysTick exception request enable
            TICKINT: u1,
            ///  Clock source selection
            CLKSOURCE: u1,
            reserved16: u13 = 0,
            ///  COUNTFLAG
            COUNTFLAG: u1,
            padding: u15 = 0,
        }),
        ///  SysTick reload value register
        RVR: mmio.Mmio(32, packed struct {
            ///  RELOAD value
            RELOAD: u24,
            padding: u8 = 0,
        }),
        ///  SysTick current value register
        CVR: mmio.Mmio(32, packed struct {
            ///  Current counter value
            CURRENT: u24,
            padding: u8 = 0,
        }),
        ///  SysTick calibration value register
        CALIB: mmio.Mmio(32, packed struct {
            ///  Calibration value
            TENMS: u24,
            reserved30: u6 = 0,
            ///  SKEW flag: Indicates whether the TENMS value is exact
            SKEW: u1,
            ///  NOREF flag. Reads as zero
            NOREF: u1,
        }),
    };

    ///  System control block
    pub const SCB = extern struct {
        ///  CPUID base register
        CPUID: mmio.Mmio(32, packed struct {
            ///  Revision number
            Revision: u4,
            ///  Part number of the processor
            PartNo: u12,
            ///  Reads as 0xF
            Architecture: u4,
            ///  Variant number
            Variant: u4,
            ///  Implementer code
            Implementer: u8,
        }),
        ///  Interrupt control and state register
        ICSR: mmio.Mmio(32, packed struct {
            ///  Active vector
            VECTACTIVE: u9,
            reserved11: u2 = 0,
            ///  Return to base level
            RETTOBASE: u1,
            ///  Pending vector
            VECTPENDING: u7,
            reserved22: u3 = 0,
            ///  Interrupt pending flag
            ISRPENDING: u1,
            reserved25: u2 = 0,
            ///  SysTick exception clear-pending bit
            PENDSTCLR: u1,
            ///  SysTick exception set-pending bit
            PENDSTSET: u1,
            ///  PendSV clear-pending bit
            PENDSVCLR: u1,
            ///  PendSV set-pending bit
            PENDSVSET: u1,
            reserved31: u2 = 0,
            ///  NMI set-pending bit.
            NMIPENDSET: u1,
        }),
        ///  Vector table offset register
        VTOR: mmio.Mmio(32, packed struct {
            reserved7: u7 = 0,
            ///  Vector table base offset field
            TBLOFF: u25,
        }),
        ///  Application interrupt and reset control register
        AIRCR: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  VECTCLRACTIVE
            VECTCLRACTIVE: u1,
            ///  SYSRESETREQ
            SYSRESETREQ: u1,
            reserved15: u12 = 0,
            ///  ENDIANESS
            ENDIANESS: u1,
            ///  Register key
            VECTKEYSTAT: u16,
        }),
        ///  System control register
        SCR: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  SLEEPONEXIT
            SLEEPONEXIT: u1,
            ///  SLEEPDEEP
            SLEEPDEEP: u1,
            reserved4: u1 = 0,
            ///  Send Event on Pending bit
            SEVEONPEND: u1,
            padding: u27 = 0,
        }),
        ///  Configuration and control register
        CCR: mmio.Mmio(32, packed struct {
            ///  Configures how the processor enters Thread mode
            NONBASETHRDENA: u1,
            ///  USERSETMPEND
            USERSETMPEND: u1,
            reserved3: u1 = 0,
            ///  UNALIGN_ TRP
            UNALIGN__TRP: u1,
            ///  DIV_0_TRP
            DIV_0_TRP: u1,
            reserved8: u3 = 0,
            ///  BFHFNMIGN
            BFHFNMIGN: u1,
            ///  STKALIGN
            STKALIGN: u1,
            padding: u22 = 0,
        }),
        reserved28: [4]u8,
        ///  System handler priority registers
        SHPR2: mmio.Mmio(32, packed struct {
            reserved24: u24 = 0,
            ///  Priority of system handler 11
            PRI_11: u8,
        }),
        ///  System handler priority registers
        SHPR3: mmio.Mmio(32, packed struct {
            reserved16: u16 = 0,
            ///  Priority of system handler 14
            PRI_14: u8,
            ///  Priority of system handler 15
            PRI_15: u8,
        }),
    };
};
