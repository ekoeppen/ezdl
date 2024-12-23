pub const ezdl = @import("ezdl");
pub const mcu = ezdl.stm32.mcus.stm32f103;
pub const svd = ezdl.stm32.svd.stm32f103;
const cp2102 = ezdl.drivers.cp2102;

pub const periph = svd.peripherals;

pub const pa0 = mcu.Gpio(periph.GPIOA, 0, .{ .output = .{} });
pub const pa1 = mcu.Gpio(periph.GPIOA, 1, .{ .output = .{} });

pub const nvic = mcu.Nvic(periph.NVIC);

pub const led = mcu.Gpio(periph.GPIOB, 8, .{ .output = .{} });
pub const led2 = mcu.Gpio(periph.GPIOB, 9, .{ .output = .{} });
pub const button = mcu.Gpio(periph.GPIOB, 7, .{ .input = .{} });

pub const cs = mcu.Gpio(periph.GPIOA, 4, .{ .output = .{} });
pub const sck = mcu.Gpio(periph.GPIOA, 5, .{ .alternate = .{} });
pub const sdi = mcu.Gpio(periph.GPIOA, 6, .{ .alternate = .{} });
pub const sdo = mcu.Gpio(periph.GPIOA, 7, .{ .alternate = .{} });

pub const scl_hw = mcu.Gpio(periph.GPIOB, 10, .{ .alternate = .{ .mode = .open_drain } });
pub const sda_hw = mcu.Gpio(periph.GPIOB, 11, .{ .alternate = .{ .mode = .open_drain } });

pub const scl_pp = mcu.Gpio(periph.GPIOB, 10, .{ .output = .{} });
pub const sda_pp = mcu.Gpio(periph.GPIOB, 11, .{ .output = .{} });

pub const scl_od = mcu.Gpio(periph.GPIOB, 10, .{ .output = .{ .mode = .open_drain } });
pub const sda_od = mcu.Gpio(periph.GPIOB, 11, .{ .output = .{ .mode = .open_drain } });

pub const tx = mcu.Gpio(periph.GPIOA, 9, .{ .alternate = .{} });
pub const rx = mcu.Gpio(periph.GPIOA, 10, .{ .alternate = .{} });

pub const i2c_hw = mcu.I2c(periph.I2C2, 36_000_000, 100_000);
pub const i2c_soft = ezdl.drivers.soft_i2c.I2c(scl_od, sda_od, 10);

pub const spi = mcu.Spi(periph.SPI1, 36_000_000, 6_000_000);
pub const usb_dp = mcu.Gpio(periph.GPIOA, 12, .{ .output = .{} });

const ep0 = mcu.usb.Endpoint(periph.USB, 0, .control, 64, 64, .stall, .valid);
const ep1 = mcu.usb.Endpoint(periph.USB, 1, .bulk, 256, 256, .valid, .nak);
pub const usb_device = mcu.usb.Usb(periph.USB, .{ ep0, ep1 }, usb_dp, null);

pub const nrf24 = struct {
    pub const ce = mcu.Gpio(periph.GPIOA, 2, .{ .output = .{} });
    pub const irq = mcu.Gpio(periph.GPIOA, 3, .{ .output = .{} });
};

pub const scl = scl_hw;
pub const sda = sda_hw;
pub const i2c = i2c_hw;

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

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
    periph.RCC.APB2ENR.modify(.{
        .IOPAEN = 1,
        .IOPBEN = 1,
        .USART1EN = 1,
        .SPI1EN = 1,
    });

    periph.FLASH.ACR.modify(.{ .LATENCY = 2 });
    periph.RCC.CR.modify(.{ .HSEON = 1 });
    while (periph.RCC.CR.read().HSERDY == 0) {}
    periph.RCC.CFGR.modify(.{
        .PLLXTPRE = 0,
        .PPRE1 = 4,
        .PPRE2 = 4,
        .HPRE = 0,
        .PLLSRC = 1,
        .PLLMUL = 7,
    });
    periph.RCC.CR.modify(.{ .PLLON = 1 });
    while (periph.RCC.CR.read().PLLRDY == 0) {}
    periph.RCC.CFGR.modify(.{ .SW = 2 });
    while (periph.RCC.CFGR.read().SWS != 2) {}
    nvic.enableInterrupts(ezdl.irqIndicesToInts(irqs));
}
