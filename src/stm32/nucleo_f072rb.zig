pub const mcu = @import("mcus/stm32f072x.zig");
pub const svd = @import("svd/stm32f072x.zig");

pub const memory = .{
    .{ .name = "ram", .attrs = "rwx", .start = 0x20000000, .size = 0x4000 },
    .{ .name = "rom", .attrs = "rx", .start = 0x08000000, .size = 0x00020000 },
};

pub const led = mcu.Gpio(svd.GPIOA, 5, .{ .output = .{} });
pub const led2 = mcu.Gpio(svd.GPIOC, 8, .{ .output = .{} });
pub const led3 = mcu.Gpio(svd.GPIOC, 6, .{ .output = .{} });
pub const button = mcu.Gpio(svd.GPIOC, 13, .{ .input = .{} });

pub const csn = mcu.Gpio(svd.GPIOB, 6, .{ .output = .{} });
pub const sclk = mcu.Gpio(svd.GPIOA, 5, .{ .alternate = .{} });
pub const miso = mcu.Gpio(svd.GPIOA, 6, .{ .alternate = .{} });
pub const mosi = mcu.Gpio(svd.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(svd.GPIOA, 2, .{ .alternate = .{ .pull = .up, .function = 1 } });
pub const rx = mcu.Gpio(svd.GPIOA, 3, .{ .alternate = .{ .pull = .up, .function = 1 } });

pub const scl = mcu.Gpio(svd.GPIOB, 8, .{ .alternate = .{ .pull = .up } });
pub const sda = mcu.Gpio(svd.GPIOB, 9, .{ .alternate = .{ .pull = .up } });

pub const spi = mcu.Spi(svd.SPI1);
pub const usart = mcu.Usart(svd.USART2, .{ .speed = 115200 });
pub const i2c = mcu.I2c(svd.I2C1);

pub const exti = mcu.Exti(svd.EXTI, svd.SYSCFG);
pub const rtc = mcu.Rtc(svd.RTC);

pub fn defaultHandler() void {}

pub const vectors = init: {
    var v: [3]fn () void = undefined;
    for (v) |_, i| {
        v[i] = defaultHandler;
    }
    break :init v;
};

//export const vectors linksection(".vectors") = init: {
//var v: [@typeInfo(svd.interrupts).Struct.fields.len]fn () void = undefined;
//    var v: [10]fn () void = undefined;
//v[svd.interrupts.EXTI0_1_IRQ] = defaultHandler;
//    v[0] = defaultHandler;
//    break :init v;
//};

pub fn init() void {
    svd.RCC.AHBENR.write(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1 });
    svd.RCC.APB2ENR.write(.{ .SPI1EN = 1, .SYSCFGEN = 1 });
    svd.RCC.APB1ENR.write(.{ .I2C2EN = 1, .USART2EN = 1, .PWREN = 1 });
    svd.PWR.CR.write(.{ .DBP = 1 });
    svd.RCC.BDCR.write(.{ .BDRST = 0, .RTSEL = 0b10, .RTCEN = 1 });

    led.init();
    led2.init();
    led3.init();
    button.init();

    csn.init();
    csn.set();
    sclk.init();
    miso.init();
    mosi.init();

    tx.init();
    rx.init();

    usart.init();
    spi.init();
}

pub fn pkgFile() []const u8 {
    return @src().file;
}
