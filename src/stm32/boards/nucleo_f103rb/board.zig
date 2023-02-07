pub const ezdl = @import("ezdl");
pub const mcu = ezdl.stm32.mcus.stm32f103;
pub const svd = ezdl.stm32.svd.stm32f103;

pub const led = mcu.Gpio(svd.peripherals.GPIOA, 5, .{ .output = .{} });

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

pub fn init() void {
    svd.peripherals.RCC.APB2ENR.modify(.{ .IOPAEN = 1, .IOPBEN = 1, .IOPCEN = 1, .SPI1EN = 1 });
}
