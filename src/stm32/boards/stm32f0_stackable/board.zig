pub const ezdl = @import("ezdl");
pub const mcu = ezdl.stm32.mcus.stm32f0x2;
pub const svd = ezdl.stm32.svd.stm32f0x2;

pub const periph = svd.peripherals;

const cp2102 = ezdl.drivers.cp2102;

pub const nvic = mcu.Nvic(periph.NVIC);
pub const exti = mcu.Exti(periph.EXTI, periph.SYSCFG_COMP);
pub const rtc = mcu.Rtc(periph.RTC, exti);

pub const led = mcu.Gpio(periph.GPIOB, 8, .{ .output = .{} });
pub const led2 = mcu.Gpio(periph.GPIOB, 9, .{ .output = .{} });
pub const button = mcu.Gpio(periph.GPIOB, 7, .{ .input = .{
    .exti = exti,
    .trigger = .falling,
} });

pub const cs = mcu.Gpio(periph.GPIOA, 4, .{ .output = .{} });
pub const sck = mcu.Gpio(periph.GPIOA, 5, .{ .alternate = .{} });
pub const sdi = mcu.Gpio(periph.GPIOA, 6, .{ .alternate = .{} });
pub const sdo = mcu.Gpio(periph.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(periph.GPIOA, 9, .{ .alternate = .{ .pull = .up, .function = 1 } });
pub const rx = mcu.Gpio(periph.GPIOA, 10, .{ .alternate = .{ .pull = .up, .function = 1 } });

pub const scl = mcu.Gpio(periph.GPIOB, 10, .{ .alternate = .{ .pull = .up } });
pub const sda = mcu.Gpio(periph.GPIOB, 11, .{ .alternate = .{ .pull = .up } });

pub const spi = mcu.Spi(periph.SPI1);
pub const usart = mcu.Usart(periph.USART1, .{ .speed = 115200 });
pub const i2c = mcu.I2c(periph.I2C2);

pub const p1 = mcu.Gpio(periph.GPIOA, 8, .{ .input = .{} });
pub const p2 = mcu.Gpio(periph.GPIOB, 1, .{ .input = .{} });
pub const p3 = mcu.Gpio(periph.GPIOB, 0, .{ .input = .{} });
pub const p4 = mcu.Gpio(periph.GPIOA, 3, .{ .input = .{} });
pub const p5 = mcu.Gpio(periph.GPIOA, 2, .{ .input = .{} });
pub const p6 = mcu.Gpio(periph.GPIOA, 1, .{ .input = .{} });
pub const p7 = mcu.Gpio(periph.GPIOA, 0, .{ .input = .{} });
pub const p8 = mcu.Gpio(periph.GPIOB, 4, .{ .input = .{} });
pub const p9 = mcu.Gpio(periph.GPIOB, 5, .{ .input = .{} });
pub const p10 = mcu.Gpio(periph.GPIOB, 6, .{ .input = .{} });

const ep0 = mcu.usb.Endpoint(periph.USB, 0, .control, 64, 64, .stall, .valid);
const ep1 = mcu.usb.Endpoint(periph.USB, 1, .bulk, 256, 256, .valid, .nak);
pub const usb_device = mcu.usb.Usb(periph.USB, .{ ep0, ep1 }, null, null);

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

pub var serial: cp2102.Cp2102(mcu.usb, usb_device, ezdl.lib.RingBuffer(u8, 256)) = .{};

fn serialIrqHandler() void {
    serial.irqHandler();
}

const irqs: []const svd.VectorIndex = &.{ .SPI1, .USART1, .I2C2, .RTC, .EXTI4_15, .USB };

export const vectors: VectorTable linksection(".vectors") = .{
    .USB = serialIrqHandler,
};

pub fn init() void {
    periph.RCC.AHBENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1 });
    periph.RCC.APB2ENR.modify(.{ .SPI1EN = 1, .SYSCFGEN = 1, .USART1EN = 1 });
    periph.RCC.APB1ENR.modify(.{ .I2C2EN = 1, .USBRST = 1 });

    periph.Flash.ACR.modify(.{ .LATENCY = 1 });
    periph.RCC.CR2.modify(.{ .HSI48ON = 1 });
    while (periph.RCC.CR2.read().HSI48RDY == 0) {}
    periph.RCC.CFGR.modify(.{ .SW = 3 });
    while (periph.RCC.CFGR.read().SWS != 3) {}
    nvic.enableInterrupts(ezdl.irqIndicesToInts(irqs));
}
