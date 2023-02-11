pub const ezdl = @import("ezdl");
pub const mcu = ezdl.stm32.mcus.stm32f103;
pub const svd = ezdl.stm32.svd.stm32f103;

pub const periph = svd.peripherals;

pub const exti = mcu.Exti(periph.EXTI, periph.SYSCFG);
pub const nvic = mcu.Nvic(periph.NVIC);
pub const rtc = mcu.Rtc(periph.RTC, exti);

pub const led = mcu.Gpio(periph.GPIOA, 5, .{ .output = .{} });
pub const led2 = mcu.Gpio(periph.GPIOA, 1, .{ .output = .{} });
pub const button = mcu.Gpio(periph.GPIOC, 9, .{ .input = .{
    .exti = exti,
    .trigger = .falling,
} });

pub const cs = mcu.Gpio(periph.GPIOB, 5, .{ .output = .{} });
pub const sck = mcu.Gpio(periph.GPIOA, 5, .{ .alternate = .{} });
pub const sdi = mcu.Gpio(periph.GPIOA, 6, .{ .input = .{} });
pub const sdo = mcu.Gpio(periph.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(periph.GPIOA, 9, .{ .alternate = .{} });
pub const rx = mcu.Gpio(periph.GPIOA, 10, .{ .alternate = .{} });

pub const scl = mcu.Gpio(periph.GPIOB, 10, .{ .alternate = .{} });
pub const sda = mcu.Gpio(periph.GPIOB, 11, .{ .alternate = .{} });

pub const spi = mcu.Spi(periph.SPI1);
pub const usart = mcu.Usart(periph.USART1, .{ .speed = 115200 });
pub const i2c = mcu.I2c(periph.I2C2);

pub const usb_disc = mcu.Gpio(periph.GPIOC, 12, .{ .output = .{} });

const ep0 = mcu.usb.Endpoint(periph.USB, 0, .control, 64, 64, .stall, .valid);
const ep1 = mcu.usb.Endpoint(periph.USB, 1, .bulk, 256, 256, .valid, .nak);
pub const usb_device = mcu.usb.Usb(periph.USB, .{ ep0, ep1 }, null, usb_disc);

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

const cp2102 = ezdl.drivers.cp2102;

pub var console: cp2102.Cp2102(
    mcu.usb,
    usb_device,
    ezdl.lib.RingBuffer(u8, 256),
    cp2102StateHandler,
) = .{};

fn cp2102StateHandler(state: *const cp2102.State) void {
    if (state.baud_rate == 1200) mcu.reset();
}

fn cp2102IrqHandler() void {
    console.irqHandler();
}

const irqs: []const svd.VectorIndex = &.{
    .SPI1,
    .USART1,
    .I2C2_EV,
    .RTC,
    .EXTI9_5,
    .USB_HP_CAN_TX,
    .USB_LP_CAN_RX0,
};

export const vectors: VectorTable linksection(".vectors") = .{
    .USB_HP_CAN_TX = cp2102IrqHandler,
    .USB_LP_CAN_RX0 = cp2102IrqHandler,
};

pub fn init() void {
    periph.RCC.APB1ENR.modify(.{ .I2C2EN = 1, .USBEN = 1 });
    periph.RCC.APB2ENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .USART1EN = 1 });

    periph.FLASH.ACR.modify(.{ .LATENCY = 2 });
    periph.RCC.CR.modify(.{ .HSEON = 1 });
    while (periph.RCC.CR.read().HSERDY == 0) {}
    periph.RCC.CFGR.modify(.{ .PLLSRC = 0, .PLLXTPRE = 0, .PLLMUL = 0 });
    periph.RCC.CFGR.modify(.{ .PLLSRC = 1, .PLLMUL = 7, .PPRE1 = 4 });
    periph.RCC.CR.modify(.{ .PLLON = 1 });
    while (periph.RCC.CR.read().PLLRDY == 0) {}
    periph.RCC.CFGR.modify(.{ .SW = 2 });
    while (periph.RCC.CFGR.read().SWS != 2) {}
    nvic.enableInterrupts(ezdl.irqIndicesToInts(irqs));
}
