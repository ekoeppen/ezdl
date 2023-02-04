const mcu = @import("ezdl").stm32.mcus.stm32f103;
const svd = @import("ezdl").stm32.svd.stm32f103;

const periph = svd.peripherals;

const led = mcu.Gpio(periph.GPIOA, 5, .{ .output = .{} });
const led2 = mcu.Gpio(periph.GPIOC, 8, .{ .output = .{} });
const led3 = mcu.Gpio(periph.GPIOC, 6, .{ .output = .{} });
const button = mcu.Gpio(periph.GPIOC, 13, .{ .input = .{} });

const cs = mcu.Gpio(periph.GPIOA, 4, .{ .output = .{} });
const sck = mcu.Gpio(periph.GPIOA, 5, .{ .alternate = .{} });
const sdi = mcu.Gpio(periph.GPIOA, 6, .{ .alternate = .{} });
const sdo = mcu.Gpio(periph.GPIOA, 7, .{ .alternate = .{} });

const tx = mcu.Gpio(periph.GPIOA, 2, .{ .alternate = .{ .pull_mode = .up } });
const rx = mcu.Gpio(periph.GPIOA, 3, .{ .alternate = .{ .pull_mode = .up } });

const scl = mcu.Gpio(periph.GPIOB, 8, .{ .alternate = .{ .pull_mode = .up } });
const sda = mcu.Gpio(periph.GPIOB, 9, .{ .alternate = .{ .pull_mode = .up } });

const spi = mcu.Spi(periph.SPI1);
const usart = mcu.Usart(periph.USART2, .{ .speed = 115200 });
const i2c = mcu.I2c(periph.I2C1);

export fn main() void {
    periph.RCC.APB2ENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .SPI1EN = 1 });

    led.init();
    led.set();

    while (true) {
        asm volatile ("wfi");
    }
}
