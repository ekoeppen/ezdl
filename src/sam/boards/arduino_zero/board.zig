pub const ezdl = @import("ezdl");
pub const mcu = ezdl.sam.mcus.atsamd21g;
pub const svd = ezdl.sam.svd.atsamd21g;

pub const periph = svd.peripherals;

pub const nvic = mcu.Nvic(periph.NVIC);
pub const led = mcu.Pin(&periph.PORT_GROUP[1], 3, .{ .direction = .output });
pub const tx = mcu.Pin(&periph.PORT_GROUP[0], 10, .{
    .direction = .input,
    .mux_enable = true,
    .mux = .C,
});
pub const rx = mcu.Pin(&periph.PORT_GROUP[0], 11, .{
    .direction = .input,
    .mux_enable = true,
    .mux = .C,
});
pub const sercom_usart = mcu.SercomUsart(&periph.SERCOM0.USART_INT, .{
    .speed = 115200,
    .clock_speed = 8_000_000,
    .tx_pad = 1,
    .rx_pad = 3,
});

pub const d0 = mcu.Pin(&periph.PORT_GROUP[0], 11, .{});
pub const d1 = mcu.Pin(&periph.PORT_GROUP[0], 10, .{});
pub const d2 = mcu.Pin(&periph.PORT_GROUP[0], 8, .{});
pub const d3 = mcu.Pin(&periph.PORT_GROUP[0], 9, .{});
pub const d4 = mcu.Pin(&periph.PORT_GROUP[0], 14, .{});
pub const d5 = mcu.Pin(&periph.PORT_GROUP[0], 15, .{});
pub const d6 = mcu.Pin(&periph.PORT_GROUP[0], 20, .{});
pub const d7 = mcu.Pin(&periph.PORT_GROUP[0], 21, .{});
pub const d8 = mcu.Pin(&periph.PORT_GROUP[0], 6, .{});
pub const d9 = mcu.Pin(&periph.PORT_GROUP[0], 7, .{});
pub const d10 = mcu.Pin(&periph.PORT_GROUP[0], 18, .{});
pub const d11 = mcu.Pin(&periph.PORT_GROUP[0], 16, .{});
pub const d12 = mcu.Pin(&periph.PORT_GROUP[0], 19, .{});
pub const d13 = mcu.Pin(&periph.PORT_GROUP[0], 17, .{});

pub const a0 = mcu.Pin(&periph.PORT_GROUP[0], 2, .{});
pub const a1 = mcu.Pin(&periph.PORT_GROUP[1], 8, .{});
pub const a2 = mcu.Pin(&periph.PORT_GROUP[1], 9, .{});
pub const a3 = mcu.Pin(&periph.PORT_GROUP[0], 4, .{});
pub const a4 = mcu.Pin(&periph.PORT_GROUP[0], 5, .{});

pub const console = sercom_usart;
pub const rx_led = led;
pub const tx_led = mcu.Pin(&periph.PORT_GROUP[0], 27, .{ .direction = .output });

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

pub fn init() void {
    periph.SYSCTRL.OSC8M.modify(.{ .PRESC = .{ .raw = 0 } });

    periph.GCLK.GENDIV.modify(.{ .ID = 1 });
    periph.GCLK.GENDIV.modify(.{ .DIV = 0 });
    periph.GCLK.GENCTRL.modify(.{ .ID = 1 });
    periph.GCLK.GENCTRL.modify(.{ .SRC = .{ .value = .OSC8M }, .GENEN = 1 });

    periph.GCLK.CLKCTRL.modify(.{ .ID = .{ .value = .SERCOM0_CORE } });
    periph.GCLK.CLKCTRL.modify(.{ .GEN = .{ .value = .GCLK1 } });
    periph.GCLK.CLKCTRL.modify(.{ .CLKEN = 1 });

    periph.PM.APBCMASK.modify(.{ .SERCOM0_ = 1 });
}
