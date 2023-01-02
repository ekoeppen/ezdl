const mmio = @import("mmio");

pub const devices = struct {
    ///  STM32F030
    pub const STM32F030 = struct {
        pub const peripherals = struct {
            ///  General-purpose-timers
            pub const TIM3 = @intToPtr(*volatile types.TIM3, 0x40000400);
            ///  Basic-timers
            pub const TIM6 = @intToPtr(*volatile types.TIM6, 0x40001000);
            ///  General-purpose-timers
            pub const TIM14 = @intToPtr(*volatile types.TIM14, 0x40002000);
            ///  Real-time clock
            pub const RTC = @intToPtr(*volatile types.RTC, 0x40002800);
            ///  Window watchdog
            pub const WWDG = @intToPtr(*volatile types.WWDG, 0x40002c00);
            ///  Independent watchdog
            pub const IWDG = @intToPtr(*volatile types.IWDG, 0x40003000);
            ///  Serial peripheral interface
            pub const SPI2 = @intToPtr(*volatile types.SPI1, 0x40003800);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART2 = @intToPtr(*volatile types.USART1, 0x40004400);
            ///  Inter-integrated circuit
            pub const I2C1 = @intToPtr(*volatile types.I2C1, 0x40005400);
            ///  Inter-integrated circuit
            pub const I2C2 = @intToPtr(*volatile types.I2C1, 0x40005800);
            ///  Power control
            pub const PWR = @intToPtr(*volatile types.PWR, 0x40007000);
            ///  System configuration controller
            pub const SYSCFG = @intToPtr(*volatile types.SYSCFG, 0x40010000);
            ///  External interrupt/event controller
            pub const EXTI = @intToPtr(*volatile types.EXTI, 0x40010400);
            ///  Analog-to-digital converter
            pub const ADC = @intToPtr(*volatile types.ADC, 0x40012400);
            ///  Advanced-timers
            pub const TIM1 = @intToPtr(*volatile types.TIM1, 0x40012c00);
            ///  Serial peripheral interface
            pub const SPI1 = @intToPtr(*volatile types.SPI1, 0x40013000);
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART1 = @intToPtr(*volatile types.USART1, 0x40013800);
            ///  General-purpose-timers
            pub const TIM15 = @intToPtr(*volatile types.TIM15, 0x40014000);
            ///  General-purpose-timers
            pub const TIM16 = @intToPtr(*volatile types.TIM16, 0x40014400);
            ///  General-purpose-timers
            pub const TIM17 = @intToPtr(*volatile types.TIM16, 0x40014800);
            ///  Debug support
            pub const DBGMCU = @intToPtr(*volatile types.DBGMCU, 0x40015800);
            ///  DMA controller
            pub const DMA = @intToPtr(*volatile types.DMA, 0x40020000);
            ///  Reset and clock control
            pub const RCC = @intToPtr(*volatile types.RCC, 0x40021000);
            ///  Flash
            pub const Flash = @intToPtr(*volatile types.Flash, 0x40022000);
            ///  cyclic redundancy check calculation unit
            pub const CRC = @intToPtr(*volatile types.CRC, 0x40023000);
            ///  General-purpose I/Os
            pub const GPIOA = @intToPtr(*volatile types.GPIOA, 0x48000000);
            ///  General-purpose I/Os
            pub const GPIOB = @intToPtr(*volatile types.GPIOF, 0x48000400);
            ///  General-purpose I/Os
            pub const GPIOC = @intToPtr(*volatile types.GPIOF, 0x48000800);
            ///  General-purpose I/Os
            pub const GPIOD = @intToPtr(*volatile types.GPIOF, 0x48000c00);
            ///  General-purpose I/Os
            pub const GPIOF = @intToPtr(*volatile types.GPIOF, 0x48001400);
            ///  Nested Vectored Interrupt Controller
            pub const NVIC = @intToPtr(*volatile types.NVIC, 0xe000e100);
        };
    };
};

pub const types = struct {
    ///  cyclic redundancy check calculation unit
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
            ///  reset bit
            RESET: u1,
            reserved5: u4 = 0,
            ///  Reverse input data
            REV_IN: u2,
            ///  Reverse output data
            REV_OUT: u1,
            padding: u24 = 0,
        }),
        ///  Initial CRC value
        INIT: mmio.Mmio(32, packed struct {
            ///  Programmable initial CRC value
            INIT: u32,
        }),
    };

    ///  General-purpose I/Os
    pub const GPIOF = extern struct {
        ///  GPIO port mode register
        MODER: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            MODER0: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER1: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER2: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER3: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER4: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER5: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER6: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER7: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER8: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER9: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER10: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER11: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER12: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER13: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER14: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER15: u2,
        }),
        ///  GPIO port output type register
        OTYPER: mmio.Mmio(32, packed struct {
            ///  Port x configuration bit 0
            OT0: u1,
            ///  Port x configuration bit 1
            OT1: u1,
            ///  Port x configuration bit 2
            OT2: u1,
            ///  Port x configuration bit 3
            OT3: u1,
            ///  Port x configuration bit 4
            OT4: u1,
            ///  Port x configuration bit 5
            OT5: u1,
            ///  Port x configuration bit 6
            OT6: u1,
            ///  Port x configuration bit 7
            OT7: u1,
            ///  Port x configuration bit 8
            OT8: u1,
            ///  Port x configuration bit 9
            OT9: u1,
            ///  Port x configuration bit 10
            OT10: u1,
            ///  Port x configuration bit 11
            OT11: u1,
            ///  Port x configuration bit 12
            OT12: u1,
            ///  Port x configuration bit 13
            OT13: u1,
            ///  Port x configuration bit 14
            OT14: u1,
            ///  Port x configuration bit 15
            OT15: u1,
            padding: u16 = 0,
        }),
        ///  GPIO port output speed register
        OSPEEDR: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR0: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR1: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR2: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR3: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR4: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR5: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR6: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR7: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR8: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR9: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR10: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR11: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR12: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR13: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR14: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR15: u2,
        }),
        ///  GPIO port pull-up/pull-down register
        PUPDR: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            PUPDR0: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR1: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR2: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR3: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR4: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR5: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR6: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR7: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR8: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR9: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR10: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR11: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR12: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR13: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR14: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR15: u2,
        }),
        ///  GPIO port input data register
        IDR: mmio.Mmio(32, packed struct {
            ///  Port input data (y = 0..15)
            IDR0: u1,
            ///  Port input data (y = 0..15)
            IDR1: u1,
            ///  Port input data (y = 0..15)
            IDR2: u1,
            ///  Port input data (y = 0..15)
            IDR3: u1,
            ///  Port input data (y = 0..15)
            IDR4: u1,
            ///  Port input data (y = 0..15)
            IDR5: u1,
            ///  Port input data (y = 0..15)
            IDR6: u1,
            ///  Port input data (y = 0..15)
            IDR7: u1,
            ///  Port input data (y = 0..15)
            IDR8: u1,
            ///  Port input data (y = 0..15)
            IDR9: u1,
            ///  Port input data (y = 0..15)
            IDR10: u1,
            ///  Port input data (y = 0..15)
            IDR11: u1,
            ///  Port input data (y = 0..15)
            IDR12: u1,
            ///  Port input data (y = 0..15)
            IDR13: u1,
            ///  Port input data (y = 0..15)
            IDR14: u1,
            ///  Port input data (y = 0..15)
            IDR15: u1,
            padding: u16 = 0,
        }),
        ///  GPIO port output data register
        ODR: mmio.Mmio(32, packed struct {
            ///  Port output data (y = 0..15)
            ODR0: u1,
            ///  Port output data (y = 0..15)
            ODR1: u1,
            ///  Port output data (y = 0..15)
            ODR2: u1,
            ///  Port output data (y = 0..15)
            ODR3: u1,
            ///  Port output data (y = 0..15)
            ODR4: u1,
            ///  Port output data (y = 0..15)
            ODR5: u1,
            ///  Port output data (y = 0..15)
            ODR6: u1,
            ///  Port output data (y = 0..15)
            ODR7: u1,
            ///  Port output data (y = 0..15)
            ODR8: u1,
            ///  Port output data (y = 0..15)
            ODR9: u1,
            ///  Port output data (y = 0..15)
            ODR10: u1,
            ///  Port output data (y = 0..15)
            ODR11: u1,
            ///  Port output data (y = 0..15)
            ODR12: u1,
            ///  Port output data (y = 0..15)
            ODR13: u1,
            ///  Port output data (y = 0..15)
            ODR14: u1,
            ///  Port output data (y = 0..15)
            ODR15: u1,
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
            ///  Port x set bit y (y= 0..15)
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
            ///  Port x lock bit y
            LCKK: u1,
            padding: u15 = 0,
        }),
        ///  GPIO alternate function low register
        AFRL: mmio.Mmio(32, packed struct {
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL0: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL1: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL2: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL3: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL4: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL5: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL6: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL7: u4,
        }),
        ///  GPIO alternate function high register
        AFRH: mmio.Mmio(32, packed struct {
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH8: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH9: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH10: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH11: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH12: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH13: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH14: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH15: u4,
        }),
        ///  Port bit reset register
        BRR: mmio.Mmio(32, packed struct {
            ///  Port x Reset bit y
            BR0: u1,
            ///  Port x Reset bit y
            BR1: u1,
            ///  Port x Reset bit y
            BR2: u1,
            ///  Port x Reset bit y
            BR3: u1,
            ///  Port x Reset bit y
            BR4: u1,
            ///  Port x Reset bit y
            BR5: u1,
            ///  Port x Reset bit y
            BR6: u1,
            ///  Port x Reset bit y
            BR7: u1,
            ///  Port x Reset bit y
            BR8: u1,
            ///  Port x Reset bit y
            BR9: u1,
            ///  Port x Reset bit y
            BR10: u1,
            ///  Port x Reset bit y
            BR11: u1,
            ///  Port x Reset bit y
            BR12: u1,
            ///  Port x Reset bit y
            BR13: u1,
            ///  Port x Reset bit y
            BR14: u1,
            ///  Port x Reset bit y
            BR15: u1,
            padding: u16 = 0,
        }),
    };

    ///  General-purpose I/Os
    pub const GPIOA = extern struct {
        ///  GPIO port mode register
        MODER: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            MODER0: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER1: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER2: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER3: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER4: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER5: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER6: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER7: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER8: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER9: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER10: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER11: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER12: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER13: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER14: u2,
            ///  Port x configuration bits (y = 0..15)
            MODER15: u2,
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
            OSPEEDR0: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR1: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR2: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR3: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR4: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR5: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR6: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR7: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR8: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR9: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR10: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR11: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR12: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR13: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR14: u2,
            ///  Port x configuration bits (y = 0..15)
            OSPEEDR15: u2,
        }),
        ///  GPIO port pull-up/pull-down register
        PUPDR: mmio.Mmio(32, packed struct {
            ///  Port x configuration bits (y = 0..15)
            PUPDR0: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR1: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR2: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR3: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR4: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR5: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR6: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR7: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR8: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR9: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR10: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR11: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR12: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR13: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR14: u2,
            ///  Port x configuration bits (y = 0..15)
            PUPDR15: u2,
        }),
        ///  GPIO port input data register
        IDR: mmio.Mmio(32, packed struct {
            ///  Port input data (y = 0..15)
            IDR0: u1,
            ///  Port input data (y = 0..15)
            IDR1: u1,
            ///  Port input data (y = 0..15)
            IDR2: u1,
            ///  Port input data (y = 0..15)
            IDR3: u1,
            ///  Port input data (y = 0..15)
            IDR4: u1,
            ///  Port input data (y = 0..15)
            IDR5: u1,
            ///  Port input data (y = 0..15)
            IDR6: u1,
            ///  Port input data (y = 0..15)
            IDR7: u1,
            ///  Port input data (y = 0..15)
            IDR8: u1,
            ///  Port input data (y = 0..15)
            IDR9: u1,
            ///  Port input data (y = 0..15)
            IDR10: u1,
            ///  Port input data (y = 0..15)
            IDR11: u1,
            ///  Port input data (y = 0..15)
            IDR12: u1,
            ///  Port input data (y = 0..15)
            IDR13: u1,
            ///  Port input data (y = 0..15)
            IDR14: u1,
            ///  Port input data (y = 0..15)
            IDR15: u1,
            padding: u16 = 0,
        }),
        ///  GPIO port output data register
        ODR: mmio.Mmio(32, packed struct {
            ///  Port output data (y = 0..15)
            ODR0: u1,
            ///  Port output data (y = 0..15)
            ODR1: u1,
            ///  Port output data (y = 0..15)
            ODR2: u1,
            ///  Port output data (y = 0..15)
            ODR3: u1,
            ///  Port output data (y = 0..15)
            ODR4: u1,
            ///  Port output data (y = 0..15)
            ODR5: u1,
            ///  Port output data (y = 0..15)
            ODR6: u1,
            ///  Port output data (y = 0..15)
            ODR7: u1,
            ///  Port output data (y = 0..15)
            ODR8: u1,
            ///  Port output data (y = 0..15)
            ODR9: u1,
            ///  Port output data (y = 0..15)
            ODR10: u1,
            ///  Port output data (y = 0..15)
            ODR11: u1,
            ///  Port output data (y = 0..15)
            ODR12: u1,
            ///  Port output data (y = 0..15)
            ODR13: u1,
            ///  Port output data (y = 0..15)
            ODR14: u1,
            ///  Port output data (y = 0..15)
            ODR15: u1,
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
            ///  Port x set bit y (y= 0..15)
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
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL0: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL1: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL2: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL3: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL4: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL5: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL6: u4,
            ///  Alternate function selection for port x bit y (y = 0..7)
            AFRL7: u4,
        }),
        ///  GPIO alternate function high register
        AFRH: mmio.Mmio(32, packed struct {
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH8: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH9: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH10: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH11: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH12: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH13: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH14: u4,
            ///  Alternate function selection for port x bit y (y = 8..15)
            AFRH15: u4,
        }),
        ///  Port bit reset register
        BRR: mmio.Mmio(32, packed struct {
            ///  Port x Reset bit y
            BR0: u1,
            ///  Port x Reset bit y
            BR1: u1,
            ///  Port x Reset bit y
            BR2: u1,
            ///  Port x Reset bit y
            BR3: u1,
            ///  Port x Reset bit y
            BR4: u1,
            ///  Port x Reset bit y
            BR5: u1,
            ///  Port x Reset bit y
            BR6: u1,
            ///  Port x Reset bit y
            BR7: u1,
            ///  Port x Reset bit y
            BR8: u1,
            ///  Port x Reset bit y
            BR9: u1,
            ///  Port x Reset bit y
            BR10: u1,
            ///  Port x Reset bit y
            BR11: u1,
            ///  Port x Reset bit y
            BR12: u1,
            ///  Port x Reset bit y
            BR13: u1,
            ///  Port x Reset bit y
            BR14: u1,
            ///  Port x Reset bit y
            BR15: u1,
            padding: u16 = 0,
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
            ///  NSS pulse management
            NSSP: u1,
            ///  Frame format
            FRF: u1,
            ///  Error interrupt enable
            ERRIE: u1,
            ///  RX buffer not empty interrupt enable
            RXNEIE: u1,
            ///  Tx buffer empty interrupt enable
            TXEIE: u1,
            ///  Data size
            DS: u4,
            ///  FIFO reception threshold
            FRXTH: u1,
            ///  Last DMA transfer for reception
            LDMA_RX: u1,
            ///  Last DMA transfer for transmission
            LDMA_TX: u1,
            padding: u17 = 0,
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
            ///  FIFO reception level
            FRLVL: u2,
            ///  FIFO transmission level
            FTLVL: u2,
            padding: u19 = 0,
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
            ///  Flash power down in Stop mode
            FPDS: u1,
            padding: u22 = 0,
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
            reserved8: u4 = 0,
            ///  Enable WKUP pin
            EWUP: u1,
            ///  Backup regulator enable
            BRE: u1,
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
            ///  Software reset
            SWRST: u1,
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
            ///  Slave address bit 0 (master mode)
            SADD0: u1,
            ///  Slave address bit 7:1 (master mode)
            SADD1: u7,
            ///  Slave address bit 9:8 (master mode)
            SADD8: u2,
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
            OA1_0: u1,
            ///  Interface address
            OA1_1: u7,
            ///  Interface address
            OA1_8: u2,
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

    ///  Independent watchdog
    pub const IWDG = extern struct {
        ///  Key register
        KR: mmio.Mmio(32, packed struct {
            ///  Key value
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

    ///  Window watchdog
    pub const WWDG = extern struct {
        ///  Control register
        CR: mmio.Mmio(32, packed struct {
            ///  7-bit counter
            T: u7,
            ///  Activation bit
            WDGA: u1,
            padding: u24 = 0,
        }),
        ///  Configuration register
        CFR: mmio.Mmio(32, packed struct {
            ///  7-bit window value
            W: u7,
            ///  Timer base
            WDGTB: u2,
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

    ///  Advanced-timers
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
            ///  Reserved
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
            ///  Capture/Compare 3 value
            CCR3: u16,
            padding: u16 = 0,
        }),
        ///  capture/compare register 4
        CCR4: mmio.Mmio(32, packed struct {
            ///  Capture/Compare 3 value
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

    ///  General-purpose-timers
    pub const TIM3 = extern struct {
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
            ///  Reserved
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
            DMAR: u16,
            padding: u16 = 0,
        }),
    };

    ///  General-purpose-timers
    pub const TIM14 = extern struct {
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
        reserved12: [8]u8,
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
            ///  Output compare 1 fast enable
            OC1FE: u1,
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
        reserved80: [24]u8,
        ///  option register
        OR: mmio.Mmio(32, packed struct {
            ///  Timer input 1 remap
            RMP: u2,
            padding: u30 = 0,
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

    ///  External interrupt/event controller
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
            ///  Interrupt Mask on line 19
            MR19: u1,
            ///  Interrupt Mask on line 20
            MR20: u1,
            ///  Interrupt Mask on line 21
            MR21: u1,
            ///  Interrupt Mask on line 22
            MR22: u1,
            ///  Interrupt Mask on line 23
            MR23: u1,
            ///  Interrupt Mask on line 24
            MR24: u1,
            ///  Interrupt Mask on line 25
            MR25: u1,
            ///  Interrupt Mask on line 26
            MR26: u1,
            ///  Interrupt Mask on line 27
            MR27: u1,
            padding: u4 = 0,
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
            ///  Event Mask on line 19
            MR19: u1,
            ///  Event Mask on line 20
            MR20: u1,
            ///  Event Mask on line 21
            MR21: u1,
            ///  Event Mask on line 22
            MR22: u1,
            ///  Event Mask on line 23
            MR23: u1,
            ///  Event Mask on line 24
            MR24: u1,
            ///  Event Mask on line 25
            MR25: u1,
            ///  Event Mask on line 26
            MR26: u1,
            ///  Event Mask on line 27
            MR27: u1,
            padding: u4 = 0,
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
            reserved19: u1 = 0,
            ///  Rising trigger event configuration of line 19
            TR19: u1,
            padding: u12 = 0,
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
            reserved19: u1 = 0,
            ///  Falling trigger event configuration of line 19
            TR19: u1,
            padding: u12 = 0,
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
            reserved19: u1 = 0,
            ///  Software Interrupt on line 19
            SWIER19: u1,
            padding: u12 = 0,
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
            reserved19: u1 = 0,
            ///  Pending bit 19
            PR19: u1,
            padding: u12 = 0,
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
            reserved6: u6 = 0,
            ///  PRI_00
            PRI_00: u2,
            reserved14: u6 = 0,
            ///  PRI_01
            PRI_01: u2,
            reserved22: u6 = 0,
            ///  PRI_02
            PRI_02: u2,
            reserved30: u6 = 0,
            ///  PRI_03
            PRI_03: u2,
        }),
        ///  Interrupt Priority Register 1
        IPR1: mmio.Mmio(32, packed struct {
            reserved6: u6 = 0,
            ///  PRI_40
            PRI_40: u2,
            reserved14: u6 = 0,
            ///  PRI_41
            PRI_41: u2,
            reserved22: u6 = 0,
            ///  PRI_42
            PRI_42: u2,
            reserved30: u6 = 0,
            ///  PRI_43
            PRI_43: u2,
        }),
        ///  Interrupt Priority Register 2
        IPR2: mmio.Mmio(32, packed struct {
            reserved6: u6 = 0,
            ///  PRI_80
            PRI_80: u2,
            reserved14: u6 = 0,
            ///  PRI_81
            PRI_81: u2,
            reserved22: u6 = 0,
            ///  PRI_82
            PRI_82: u2,
            reserved30: u6 = 0,
            ///  PRI_83
            PRI_83: u2,
        }),
        ///  Interrupt Priority Register 3
        IPR3: mmio.Mmio(32, packed struct {
            reserved6: u6 = 0,
            ///  PRI_120
            PRI_120: u2,
            reserved14: u6 = 0,
            ///  PRI_121
            PRI_121: u2,
            reserved22: u6 = 0,
            ///  PRI_122
            PRI_122: u2,
            reserved30: u6 = 0,
            ///  PRI_123
            PRI_123: u2,
        }),
        ///  Interrupt Priority Register 4
        IPR4: mmio.Mmio(32, packed struct {
            reserved6: u6 = 0,
            ///  PRI_160
            PRI_160: u2,
            reserved14: u6 = 0,
            ///  PRI_161
            PRI_161: u2,
            reserved22: u6 = 0,
            ///  PRI_162
            PRI_162: u2,
            reserved30: u6 = 0,
            ///  PRI_163
            PRI_163: u2,
        }),
        ///  Interrupt Priority Register 5
        IPR5: mmio.Mmio(32, packed struct {
            reserved6: u6 = 0,
            ///  PRI_200
            PRI_200: u2,
            reserved14: u6 = 0,
            ///  PRI_201
            PRI_201: u2,
            reserved22: u6 = 0,
            ///  PRI_202
            PRI_202: u2,
            reserved30: u6 = 0,
            ///  PRI_203
            PRI_203: u2,
        }),
        ///  Interrupt Priority Register 6
        IPR6: mmio.Mmio(32, packed struct {
            reserved6: u6 = 0,
            ///  PRI_240
            PRI_240: u2,
            reserved14: u6 = 0,
            ///  PRI_241
            PRI_241: u2,
            reserved22: u6 = 0,
            ///  PRI_242
            PRI_242: u2,
            reserved30: u6 = 0,
            ///  PRI_243
            PRI_243: u2,
        }),
        ///  Interrupt Priority Register 7
        IPR7: mmio.Mmio(32, packed struct {
            reserved6: u6 = 0,
            ///  PRI_280
            PRI_280: u2,
            reserved14: u6 = 0,
            ///  PRI_281
            PRI_281: u2,
            reserved22: u6 = 0,
            ///  PRI_282
            PRI_282: u2,
            reserved30: u6 = 0,
            ///  PRI_283
            PRI_283: u2,
        }),
    };

    ///  DMA controller
    pub const DMA = extern struct {
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
            PPRE: u3,
            reserved14: u3 = 0,
            ///  ADC prescaler
            ADCPRE: u1,
            ///  PLL input clock source
            PLLSRC: u2,
            ///  HSE divider for PLL entry
            PLLXTPRE: u1,
            ///  PLL Multiplication Factor
            PLLMUL: u4,
            reserved24: u2 = 0,
            ///  Microcontroller clock output
            MCO: u3,
            reserved28: u1 = 0,
            ///  Microcontroller Clock Output Prescaler
            MCOPRE: u3,
            ///  PLL clock not divided for MCO
            PLLNODIV: u1,
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
            ///  HSI14 ready interrupt flag
            HSI14RDYF: u1,
            ///  HSI48 ready interrupt flag
            HSI48RDYF: u1,
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
            ///  HSI14 ready interrupt enable
            HSI14RDYE: u1,
            ///  HSI48 ready interrupt enable
            HSI48RDYIE: u1,
            reserved16: u1 = 0,
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
            ///  HSI 14 MHz Ready Interrupt Clear
            HSI14RDYC: u1,
            ///  HSI48 Ready Interrupt Clear
            HSI48RDYC: u1,
            ///  Clock security system interrupt clear
            CSSC: u1,
            padding: u8 = 0,
        }),
        ///  APB2 peripheral reset register (RCC_APB2RSTR)
        APB2RSTR: mmio.Mmio(32, packed struct {
            ///  SYSCFG and COMP reset
            SYSCFGRST: u1,
            reserved9: u8 = 0,
            ///  ADC interface reset
            ADCRST: u1,
            reserved11: u1 = 0,
            ///  TIM1 timer reset
            TIM1RST: u1,
            ///  SPI 1 reset
            SPI1RST: u1,
            reserved14: u1 = 0,
            ///  USART1 reset
            USART1RST: u1,
            reserved16: u1 = 0,
            ///  TIM15 timer reset
            TIM15RST: u1,
            ///  TIM16 timer reset
            TIM16RST: u1,
            ///  TIM17 timer reset
            TIM17RST: u1,
            reserved22: u3 = 0,
            ///  Debug MCU reset
            DBGMCURST: u1,
            padding: u9 = 0,
        }),
        ///  APB1 peripheral reset register (RCC_APB1RSTR)
        APB1RSTR: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  Timer 3 reset
            TIM3RST: u1,
            reserved4: u2 = 0,
            ///  Timer 6 reset
            TIM6RST: u1,
            reserved8: u3 = 0,
            ///  Timer 14 reset
            TIM14RST: u1,
            reserved11: u2 = 0,
            ///  Window watchdog reset
            WWDGRST: u1,
            reserved14: u2 = 0,
            ///  SPI2 reset
            SPI2RST: u1,
            reserved17: u2 = 0,
            ///  USART 2 reset
            USART2RST: u1,
            reserved21: u3 = 0,
            ///  I2C1 reset
            I2C1RST: u1,
            ///  I2C2 reset
            I2C2RST: u1,
            reserved28: u5 = 0,
            ///  Power interface reset
            PWRRST: u1,
            padding: u3 = 0,
        }),
        ///  AHB Peripheral Clock enable register (RCC_AHBENR)
        AHBENR: mmio.Mmio(32, packed struct {
            ///  DMA1 clock enable
            DMAEN: u1,
            reserved2: u1 = 0,
            ///  SRAM interface clock enable
            SRAMEN: u1,
            reserved4: u1 = 0,
            ///  FLITF clock enable
            FLITFEN: u1,
            reserved6: u1 = 0,
            ///  CRC clock enable
            CRCEN: u1,
            reserved17: u10 = 0,
            ///  I/O port A clock enable
            IOPAEN: u1,
            ///  I/O port B clock enable
            IOPBEN: u1,
            ///  I/O port C clock enable
            IOPCEN: u1,
            ///  I/O port D clock enable
            IOPDEN: u1,
            reserved22: u1 = 0,
            ///  I/O port F clock enable
            IOPFEN: u1,
            padding: u9 = 0,
        }),
        ///  APB2 peripheral clock enable register (RCC_APB2ENR)
        APB2ENR: mmio.Mmio(32, packed struct {
            ///  SYSCFG clock enable
            SYSCFGEN: u1,
            reserved9: u8 = 0,
            ///  ADC 1 interface clock enable
            ADCEN: u1,
            reserved11: u1 = 0,
            ///  TIM1 Timer clock enable
            TIM1EN: u1,
            ///  SPI 1 clock enable
            SPI1EN: u1,
            reserved14: u1 = 0,
            ///  USART1 clock enable
            USART1EN: u1,
            reserved16: u1 = 0,
            ///  TIM15 timer clock enable
            TIM15EN: u1,
            ///  TIM16 timer clock enable
            TIM16EN: u1,
            ///  TIM17 timer clock enable
            TIM17EN: u1,
            reserved22: u3 = 0,
            ///  MCU debug module clock enable
            DBGMCUEN: u1,
            padding: u9 = 0,
        }),
        ///  APB1 peripheral clock enable register (RCC_APB1ENR)
        APB1ENR: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  Timer 3 clock enable
            TIM3EN: u1,
            reserved4: u2 = 0,
            ///  Timer 6 clock enable
            TIM6EN: u1,
            reserved8: u3 = 0,
            ///  Timer 14 clock enable
            TIM14EN: u1,
            reserved11: u2 = 0,
            ///  Window watchdog clock enable
            WWDGEN: u1,
            reserved14: u2 = 0,
            ///  SPI 2 clock enable
            SPI2EN: u1,
            reserved17: u2 = 0,
            ///  USART 2 clock enable
            USART2EN: u1,
            reserved21: u3 = 0,
            ///  I2C 1 clock enable
            I2C1EN: u1,
            ///  I2C 2 clock enable
            I2C2EN: u1,
            reserved28: u5 = 0,
            ///  Power interface clock enable
            PWREN: u1,
            padding: u3 = 0,
        }),
        ///  Backup domain control register (RCC_BDCR)
        BDCR: mmio.Mmio(32, packed struct {
            ///  External Low Speed oscillator enable
            LSEON: u1,
            ///  External Low Speed oscillator ready
            LSERDY: u1,
            ///  External Low Speed oscillator bypass
            LSEBYP: u1,
            ///  LSE oscillator drive capability
            LSEDRV: u2,
            reserved8: u3 = 0,
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
            ///  Option byte loader reset flag
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
            LPWRRSTF: u1,
        }),
        ///  AHB peripheral reset register
        AHBRSTR: mmio.Mmio(32, packed struct {
            reserved17: u17 = 0,
            ///  I/O port A reset
            IOPARST: u1,
            ///  I/O port B reset
            IOPBRST: u1,
            ///  I/O port C reset
            IOPCRST: u1,
            ///  I/O port D reset
            IOPDRST: u1,
            reserved22: u1 = 0,
            ///  I/O port F reset
            IOPFRST: u1,
            padding: u9 = 0,
        }),
        ///  Clock configuration register 2
        CFGR2: mmio.Mmio(32, packed struct {
            ///  PREDIV division factor
            PREDIV: u4,
            padding: u28 = 0,
        }),
        ///  Clock configuration register 3
        CFGR3: mmio.Mmio(32, packed struct {
            ///  USART1 clock source selection
            USART1SW: u2,
            reserved4: u2 = 0,
            ///  I2C1 clock source selection
            I2C1SW: u1,
            reserved8: u3 = 0,
            ///  ADC clock source selection
            ADCSW: u1,
            reserved16: u7 = 0,
            ///  USART2 clock source selection
            USART2SW: u2,
            padding: u14 = 0,
        }),
        ///  Clock control register 2
        CR2: mmio.Mmio(32, packed struct {
            ///  HSI14 clock enable
            HSI14ON: u1,
            ///  HR14 clock ready flag
            HSI14RDY: u1,
            ///  HSI14 clock request from ADC disable
            HSI14DIS: u1,
            ///  HSI14 clock trimming
            HSI14TRIM: u5,
            ///  HSI14 clock calibration
            HSI14CAL: u8,
            ///  HSI48 clock enable
            HSI48ON: u1,
            ///  HSI48 clock ready flag
            HSI48RDY: u1,
            reserved24: u6 = 0,
            ///  HSI48 factory clock calibration
            HSI48CAL: u1,
            padding: u7 = 0,
        }),
    };

    ///  System configuration controller
    pub const SYSCFG = extern struct {
        ///  configuration register 1
        CFGR1: mmio.Mmio(32, packed struct {
            ///  Memory mapping selection bits
            MEM_MODE: u2,
            reserved8: u6 = 0,
            ///  ADC DMA remapping bit
            ADC_DMA_RMP: u1,
            ///  USART1_TX DMA remapping bit
            USART1_TX_DMA_RMP: u1,
            ///  USART1_RX DMA request remapping bit
            USART1_RX_DMA_RMP: u1,
            ///  TIM16 DMA request remapping bit
            TIM16_DMA_RMP: u1,
            ///  TIM17 DMA request remapping bit
            TIM17_DMA_RMP: u1,
            reserved16: u3 = 0,
            ///  Fast Mode Plus (FM plus) driving capability activation bits.
            I2C_PB6_FM: u1,
            ///  Fast Mode Plus (FM+) driving capability activation bits.
            I2C_PB7_FM: u1,
            ///  Fast Mode Plus (FM+) driving capability activation bits.
            I2C_PB8_FM: u1,
            ///  Fast Mode Plus (FM+) driving capability activation bits.
            I2C_PB9_FM: u1,
            ///  FM+ driving capability activation for I2C1
            I2C1_FM_plus: u1,
            ///  FM+ driving capability activation for I2C2
            I2C2_FM_plus: u1,
            reserved24: u2 = 0,
            ///  SPI2 DMA request remapping bit
            SPI2_DMA_RMP: u1,
            ///  USART2 DMA request remapping bit
            USART2_DMA_RMP: u1,
            ///  USART3 DMA request remapping bit
            USART3_DMA_RMP: u1,
            ///  I2C1 DMA request remapping bit
            I2C1_DMA_RMP: u1,
            ///  TIM1 DMA request remapping bit
            TIM1_DMA_RMP: u1,
            ///  TIM2 DMA request remapping bit
            TIM2_DMA_RMP: u1,
            ///  TIM3 DMA request remapping bit
            TIM3_DMA_RMP: u1,
            padding: u1 = 0,
        }),
        reserved8: [4]u8,
        ///  external interrupt configuration register 1
        EXTICR1: mmio.Mmio(32, packed struct {
            ///  EXTI 0 configuration bits
            EXTI0: u4,
            ///  EXTI 1 configuration bits
            EXTI1: u4,
            ///  EXTI 2 configuration bits
            EXTI2: u4,
            ///  EXTI 3 configuration bits
            EXTI3: u4,
            padding: u16 = 0,
        }),
        ///  external interrupt configuration register 2
        EXTICR2: mmio.Mmio(32, packed struct {
            ///  EXTI 4 configuration bits
            EXTI4: u4,
            ///  EXTI 5 configuration bits
            EXTI5: u4,
            ///  EXTI 6 configuration bits
            EXTI6: u4,
            ///  EXTI 7 configuration bits
            EXTI7: u4,
            padding: u16 = 0,
        }),
        ///  external interrupt configuration register 3
        EXTICR3: mmio.Mmio(32, packed struct {
            ///  EXTI 8 configuration bits
            EXTI8: u4,
            ///  EXTI 9 configuration bits
            EXTI9: u4,
            ///  EXTI 10 configuration bits
            EXTI10: u4,
            ///  EXTI 11 configuration bits
            EXTI11: u4,
            padding: u16 = 0,
        }),
        ///  external interrupt configuration register 4
        EXTICR4: mmio.Mmio(32, packed struct {
            ///  EXTI 12 configuration bits
            EXTI12: u4,
            ///  EXTI 13 configuration bits
            EXTI13: u4,
            ///  EXTI 14 configuration bits
            EXTI14: u4,
            ///  EXTI 15 configuration bits
            EXTI15: u4,
            padding: u16 = 0,
        }),
        ///  configuration register 2
        CFGR2: mmio.Mmio(32, packed struct {
            ///  Cortex-M0 LOCKUP bit enable bit
            LOCUP_LOCK: u1,
            ///  SRAM parity lock bit
            SRAM_PARITY_LOCK: u1,
            ///  PVD lock enable bit
            PVD_LOCK: u1,
            reserved8: u5 = 0,
            ///  SRAM parity flag
            SRAM_PEF: u1,
            padding: u23 = 0,
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
            padding: u24 = 0,
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
            padding: u24 = 0,
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
            reserved31: u26 = 0,
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
            reserved30: u30 = 0,
            ///  JITOFF_D2
            JITOFF_D2: u1,
            ///  JITOFF_D4
            JITOFF_D4: u1,
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
        reserved776: [708]u8,
        ///  common configuration register
        CCR: mmio.Mmio(32, packed struct {
            reserved22: u22 = 0,
            ///  Temperature sensor and VREFINT enable
            VREFEN: u1,
            ///  Temperature sensor enable
            TSEN: u1,
            ///  VBAT enable
            VBATEN: u1,
            padding: u7 = 0,
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
            M: u1,
            ///  Mute mode enable
            MME: u1,
            ///  Character match interrupt enable
            CMIE: u1,
            ///  Oversampling mode
            OVER8: u1,
            ///  Driver Enable deassertion time
            DEDT: u5,
            ///  Driver Enable assertion time
            DEAT: u5,
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
            DATAINV: u1,
            ///  Most significant bit first
            MSBFIRST: u1,
            ///  Auto baud rate enable
            ABREN: u1,
            ///  Auto baud rate mode
            ABRMOD: u2,
            ///  Receiver timeout enable
            RTOEN: u1,
            ///  Address of the USART node
            ADD0: u4,
            ///  Address of the USART node
            ADD4: u4,
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
            ///  fraction of USARTDIV
            DIV_Fraction: u4,
            ///  mantissa of USARTDIV
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
            ///  Parity error
            PE: u1,
            ///  Framing error
            FE: u1,
            ///  Noise detected flag
            NF: u1,
            ///  Overrun error
            ORE: u1,
            ///  Idle line detected
            IDLE: u1,
            ///  Read data register not empty
            RXNE: u1,
            ///  Transmission complete
            TC: u1,
            ///  Transmit data register empty
            TXE: u1,
            ///  LIN break detection flag
            LBDF: u1,
            ///  CTS interrupt flag
            CTSIF: u1,
            ///  CTS flag
            CTS: u1,
            ///  Receiver timeout
            RTOF: u1,
            ///  End of block flag
            EOBF: u1,
            reserved14: u1 = 0,
            ///  Auto baud rate error
            ABRE: u1,
            ///  Auto baud rate flag
            ABRF: u1,
            ///  Busy flag
            BUSY: u1,
            ///  character match flag
            CMF: u1,
            ///  Send break flag
            SBKF: u1,
            ///  Receiver wakeup from Mute mode
            RWU: u1,
            ///  Wakeup from Stop mode flag
            WUF: u1,
            ///  Transmit enable acknowledge flag
            TEACK: u1,
            ///  Receive enable acknowledge flag
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
            ///  End of timeout clear flag
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

    ///  Real-time clock
    pub const RTC = extern struct {
        ///  time register
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
        ///  date register
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
        ///  control register
        CR: mmio.Mmio(32, packed struct {
            reserved3: u3 = 0,
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
            reserved11: u2 = 0,
            ///  timestamp enable
            TSE: u1,
            ///  Alarm A interrupt enable
            ALRAIE: u1,
            reserved15: u2 = 0,
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
        ///  initialization and status register
        ISR: mmio.Mmio(32, packed struct {
            ///  Alarm A write flag
            ALRAWF: u1,
            reserved3: u2 = 0,
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
            reserved11: u2 = 0,
            ///  Time-stamp flag
            TSF: u1,
            ///  Time-stamp overflow flag
            TSOVF: u1,
            ///  RTC_TAMP1 detection flag
            TAMP1F: u1,
            ///  RTC_TAMP2 detection flag
            TAMP2F: u1,
            reserved16: u1 = 0,
            ///  Recalibration pending Flag
            RECALPF: u1,
            padding: u15 = 0,
        }),
        ///  prescaler register
        PRER: mmio.Mmio(32, packed struct {
            ///  Synchronous prescaler factor
            PREDIV_S: u15,
            reserved16: u1 = 0,
            ///  Asynchronous prescaler factor
            PREDIV_A: u7,
            padding: u9 = 0,
        }),
        reserved28: [8]u8,
        ///  alarm A register
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
        reserved36: [4]u8,
        ///  write protection register
        WPR: mmio.Mmio(32, packed struct {
            ///  Write protection key
            KEY: u8,
            padding: u24 = 0,
        }),
        ///  sub second register
        SSR: mmio.Mmio(32, packed struct {
            ///  Sub second value
            SS: u16,
            padding: u16 = 0,
        }),
        ///  shift control register
        SHIFTR: mmio.Mmio(32, packed struct {
            ///  Subtract a fraction of a second
            SUBFS: u15,
            reserved31: u16 = 0,
            ///  Reserved
            ADD1S: u1,
        }),
        ///  timestamp time register
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
        ///  timestamp date register
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
        ///  time-stamp sub second register
        TSSSR: mmio.Mmio(32, packed struct {
            ///  Sub second value
            SS: u16,
            padding: u16 = 0,
        }),
        ///  calibration register
        CALR: mmio.Mmio(32, packed struct {
            ///  Calibration minus
            CALM: u9,
            reserved13: u4 = 0,
            ///  Reserved
            CALW16: u1,
            ///  Use a 16-second calibration cycle period
            CALW8: u1,
            ///  Use an 8-second calibration cycle period
            CALP: u1,
            padding: u16 = 0,
        }),
        ///  tamper and alternate function configuration register
        TAFCR: mmio.Mmio(32, packed struct {
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
            TAMP_PRCH: u2,
            ///  RTC_TAMPx pull-up disable
            TAMP_PUDIS: u1,
            reserved18: u2 = 0,
            ///  RTC_ALARM output type/PC13 value
            PC13VALUE: u1,
            ///  PC13 mode
            PC13MODE: u1,
            ///  PC14 value
            PC14VALUE: u1,
            ///  PC14 mode
            PC14MODE: u1,
            ///  PC15 value
            PC15VALUE: u1,
            ///  PC15 mode
            PC15MODE: u1,
            padding: u8 = 0,
        }),
        ///  alarm A sub second register
        ALRMASSR: mmio.Mmio(32, packed struct {
            ///  Sub seconds value
            SS: u15,
            reserved24: u9 = 0,
            ///  Mask the most-significant bits starting at this bit
            MASKSS: u4,
            padding: u4 = 0,
        }),
        reserved80: [8]u8,
        ///  backup register
        BKP0R: mmio.Mmio(32, packed struct {
            ///  BKP
            BKP: u32,
        }),
        ///  backup register
        BKP1R: mmio.Mmio(32, packed struct {
            ///  BKP
            BKP: u32,
        }),
        ///  backup register
        BKP2R: mmio.Mmio(32, packed struct {
            ///  BKP
            BKP: u32,
        }),
        ///  backup register
        BKP3R: mmio.Mmio(32, packed struct {
            ///  BKP
            BKP: u32,
        }),
        ///  backup register
        BKP4R: mmio.Mmio(32, packed struct {
            ///  BKP
            BKP: u32,
        }),
    };

    ///  General-purpose-timers
    pub const TIM15 = extern struct {
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
            ///  Capture/compare preloaded control
            CCPC: u1,
            reserved2: u1 = 0,
            ///  Capture/compare control update selection
            CCUS: u1,
            ///  Capture/compare DMA selection
            CCDS: u1,
            ///  Master mode selection
            MMS: u3,
            reserved8: u1 = 0,
            ///  Output Idle state 1
            OIS1: u1,
            ///  Output Idle state 1
            OIS1N: u1,
            ///  Output Idle state 2
            OIS2: u1,
            padding: u21 = 0,
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
            reserved5: u2 = 0,
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
            reserved14: u3 = 0,
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
            reserved5: u2 = 0,
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
            reserved5: u2 = 0,
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
            ///  Capture/Compare 1 complementary output enable
            CC1NE: u1,
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
        reserved68: [8]u8,
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

    ///  General-purpose-timers
    pub const TIM16 = extern struct {
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
            ///  Capture/compare preloaded control
            CCPC: u1,
            reserved2: u1 = 0,
            ///  Capture/compare control update selection
            CCUS: u1,
            ///  Capture/compare DMA selection
            CCDS: u1,
            reserved8: u4 = 0,
            ///  Output Idle state 1
            OIS1: u1,
            ///  Output Idle state 1
            OIS1N: u1,
            padding: u22 = 0,
        }),
        reserved12: [4]u8,
        ///  DMA/Interrupt enable register
        DIER: mmio.Mmio(32, packed struct {
            ///  Update interrupt enable
            UIE: u1,
            ///  Capture/Compare 1 interrupt enable
            CC1IE: u1,
            reserved5: u3 = 0,
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
            reserved14: u4 = 0,
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
            reserved5: u3 = 0,
            ///  COM interrupt flag
            COMIF: u1,
            ///  Trigger interrupt flag
            TIF: u1,
            ///  Break interrupt flag
            BIF: u1,
            reserved9: u1 = 0,
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
            reserved5: u3 = 0,
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
            padding: u25 = 0,
        }),
        reserved32: [4]u8,
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
        reserved68: [12]u8,
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

    ///  Flash
    pub const Flash = extern struct {
        ///  Flash access control register
        ACR: mmio.Mmio(32, packed struct {
            ///  LATENCY
            LATENCY: u3,
            reserved4: u1 = 0,
            ///  PRFTBE
            PRFTBE: u1,
            ///  PRFTBS
            PRFTBS: u1,
            padding: u26 = 0,
        }),
        ///  Flash key register
        KEYR: mmio.Mmio(32, packed struct {
            ///  Flash Key
            FKEYR: u32,
        }),
        ///  Flash option key register
        OPTKEYR: mmio.Mmio(32, packed struct {
            ///  Option byte key
            OPTKEYR: u32,
        }),
        ///  Flash status register
        SR: mmio.Mmio(32, packed struct {
            ///  Busy
            BSY: u1,
            reserved2: u1 = 0,
            ///  Programming error
            PGERR: u1,
            reserved4: u1 = 0,
            ///  Write protection error
            WRPRT: u1,
            ///  End of operation
            EOP: u1,
            padding: u26 = 0,
        }),
        ///  Flash control register
        CR: mmio.Mmio(32, packed struct {
            ///  Programming
            PG: u1,
            ///  Page erase
            PER: u1,
            ///  Mass erase
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
            ///  Force option byte loading
            FORCE_OPTLOAD: u1,
            padding: u18 = 0,
        }),
        ///  Flash address register
        AR: mmio.Mmio(32, packed struct {
            ///  Flash address
            FAR: u32,
        }),
        reserved28: [4]u8,
        ///  Option byte register
        OBR: mmio.Mmio(32, packed struct {
            ///  Option byte error
            OPTERR: u1,
            ///  Level 1 protection status
            LEVEL1_PROT: u1,
            ///  Level 2 protection status
            LEVEL2_PROT: u1,
            reserved8: u5 = 0,
            ///  WDG_SW
            WDG_SW: u1,
            ///  nRST_STOP
            nRST_STOP: u1,
            ///  nRST_STDBY
            nRST_STDBY: u1,
            reserved12: u1 = 0,
            ///  BOOT1
            BOOT1: u1,
            ///  VDDA_MONITOR
            VDDA_MONITOR: u1,
            reserved16: u2 = 0,
            ///  Data0
            Data0: u8,
            ///  Data1
            Data1: u8,
        }),
        ///  Write protection register
        WRPR: mmio.Mmio(32, packed struct {
            ///  Write protect
            WRP: u32,
        }),
    };

    ///  Debug support
    pub const DBGMCU = extern struct {
        ///  MCU Device ID Code Register
        IDCODE: mmio.Mmio(32, packed struct {
            ///  Device Identifier
            DEV_ID: u12,
            ///  Division Identifier
            DIV_ID: u4,
            ///  Revision Identifier
            REV_ID: u16,
        }),
        ///  Debug MCU Configuration Register
        CR: mmio.Mmio(32, packed struct {
            reserved1: u1 = 0,
            ///  Debug Stop Mode
            DBG_STOP: u1,
            ///  Debug Standby Mode
            DBG_STANDBY: u1,
            padding: u29 = 0,
        }),
        ///  APB Low Freeze Register
        APBLFZ: mmio.Mmio(32, packed struct {
            ///  Debug Timer 2 stopped when Core is halted
            DBG_TIMER2_STOP: u1,
            ///  Debug Timer 3 stopped when Core is halted
            DBG_TIMER3_STOP: u1,
            reserved4: u2 = 0,
            ///  Debug Timer 6 stopped when Core is halted
            DBG_TIMER6_STOP: u1,
            reserved8: u3 = 0,
            ///  Debug Timer 14 stopped when Core is halted
            DBG_TIMER14_STOP: u1,
            reserved10: u1 = 0,
            ///  Debug RTC stopped when Core is halted
            DBG_RTC_STOP: u1,
            ///  Debug Window Wachdog stopped when Core is halted
            DBG_WWDG_STOP: u1,
            ///  Debug Independent Wachdog stopped when Core is halted
            DBG_IWDG_STOP: u1,
            reserved21: u8 = 0,
            ///  SMBUS timeout mode stopped when Core is halted
            I2C1_SMBUS_TIMEOUT: u1,
            padding: u10 = 0,
        }),
        ///  APB High Freeze Register
        APBHFZ: mmio.Mmio(32, packed struct {
            reserved11: u11 = 0,
            ///  Debug Timer 1 stopped when Core is halted
            DBG_TIMER1_STOP: u1,
            reserved16: u4 = 0,
            ///  Debug Timer 15 stopped when Core is halted
            DBG_TIMER15_STO: u1,
            ///  Debug Timer 16 stopped when Core is halted
            DBG_TIMER16_STO: u1,
            ///  Debug Timer 17 stopped when Core is halted
            DBG_TIMER17_STO: u1,
            padding: u13 = 0,
        }),
    };
};
