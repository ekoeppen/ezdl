pub const mcu = @import("ezdl/src/ezdl.zig").stm32.mcus.stm32f103x;
pub const svd = @import("ezdl/src/ezdl.zig").stm32.svd.stm32f103x;

pub const memory = .{
    .{ .name = "ram", .attrs = "rwx", .start = 0x20000000, .size = 0x4000 },
    .{ .name = "rom", .attrs = "rx", .start = 0x08000000, .size = 0x00020000 },
};

pub const led = mcu.Gpio(svd.GPIOA, 5, .{ .output = .{} });
pub const led2 = mcu.Gpio(svd.GPIOC, 8, .{ .output = .{} });
pub const led3 = mcu.Gpio(svd.GPIOC, 6, .{ .output = .{} });
pub const button = mcu.Gpio(svd.GPIOC, 13, .{ .input = .{} });

pub const csn = mcu.Gpio(svd.GPIOA, 4, .{ .output = .{} });
pub const sclk = mcu.Gpio(svd.GPIOA, 5, .{ .alternate = .{} });
pub const miso = mcu.Gpio(svd.GPIOA, 6, .{ .alternate = .{} });
pub const mosi = mcu.Gpio(svd.GPIOA, 7, .{ .alternate = .{} });

pub const tx = mcu.Gpio(svd.GPIOA, 2, .{ .alternate = .{ .pull_mode = .up } });
pub const rx = mcu.Gpio(svd.GPIOA, 3, .{ .alternate = .{ .pull_mode = .up } });

pub const scl = mcu.Gpio(svd.GPIOB, 8, .{ .alternate = .{ .pull_mode = .up } });
pub const sda = mcu.Gpio(svd.GPIOB, 9, .{ .alternate = .{ .pull_mode = .up } });

pub const spi = mcu.Spi(svd.SPI1);
pub const usart = mcu.Usart(svd.USART2, .{ .speed = 115200 });
pub const i2c = mcu.I2c(svd.I2C1);

pub fn init() void {
    svd.RCC.APB2ENR.write(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .SPI1EN = 1 });

    led.init();
}

pub fn pkgFile() []const u8 {
    return @src().file;
}
