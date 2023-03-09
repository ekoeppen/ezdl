pub const ezdl = @import("ezdl");
pub const mcu = ezdl.sam.mcus.atsamd20e;
pub const svd = ezdl.sam.svd.atsamd20e;

pub const periph = svd.peripherals;

pub const nvic = mcu.Nvic(periph.NVIC);
pub const led = mcu.Pin(&periph.PORT_GROUP[0], 15, .{ .direction = .output });
pub const tx = mcu.Pin(&periph.PORT_GROUP[0], 0, .{
    .direction = .input,
    .mux_enable = true,
    .mux = .D,
});
pub const rx = mcu.Pin(&periph.PORT_GROUP[0], 1, .{
    .direction = .input,
    .mux_enable = true,
    .mux = .D,
});
pub const sercom_usart = mcu.SercomUsart(&periph.SERCOM1.USART_INT, .{
    .speed = 115200,
    .clock_speed = 8_000_000,
    .tx_pad = 0,
    .rx_pad = 1,
});

pub const console = sercom_usart;

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

fn rtcHandler() void {
    periph.RTC.MODE0.INTFLAG.modify(.{ .OVF = 1, .CMP0 = 1 });
    nvic.clearPending(3);
}

export const vectors: VectorTable linksection(".vectors") = .{
    .RTC = rtcHandler,
};

const standby = false;

pub fn init() void {
    periph.SYSCTRL.OSC8M.modify(.{ .PRESC = .{ .raw = 0 } });

    periph.GCLK.CLKCTRL.modify(.{ .ID = .{ .value = .RTC } });
    periph.GCLK.CLKCTRL.modify(.{ .GEN = .{ .value = .GCLK2 } });
    periph.GCLK.CLKCTRL.modify(.{ .CLKEN = 1 });

    periph.GCLK.GENDIV.modify(.{ .ID = .{ .value = .GCLK1 } });
    periph.GCLK.GENDIV.modify(.{ .DIV = 0 });
    periph.GCLK.GENCTRL.modify(.{ .ID = .{ .value = .GCLK1 } });
    periph.GCLK.GENCTRL.modify(.{ .SRC = .{ .value = .OSC8M }, .GENEN = 1 });

    periph.GCLK.CLKCTRL.modify(.{ .ID = .{ .value = .SERCOM1_CORE } });
    periph.GCLK.CLKCTRL.modify(.{ .GEN = .{ .value = .GCLK1 } });
    periph.GCLK.CLKCTRL.modify(.{ .CLKEN = 1 });

    periph.PM.APBAMASK.modify(.{ .RTC_ = 1 });
    periph.PM.APBCMASK.modify(.{ .SERCOM1_ = 1 });
    if (standby) {
        periph.PM.SLEEP.modify(.{ .IDLE = .{ .value = .APB } });
        periph.PM.APBCMASK.modify(.{ .ADC_ = 0 });
        periph.SystemControl.SCR.modify(.{ .SLEEPDEEP = .{ .value = .VALUE_1 } });
    }

    nvic.enableInterrupts(&.{3});
    periph.RTC.MODE0.CTRL.modify(.{ .ENABLE = 0 });
    periph.RTC.MODE0.CTRL.modify(.{
        .MODE = .{ .value = .COUNT32 },
        .PRESCALER = .{ .value = .DIV1024 },
        .MATCHCLR = 1,
    });
    periph.RTC.MODE0.INTENSET.modify(.{ .OVF = 1 });
    periph.RTC.MODE0.COMP.write(.{ .COMP = 5 * 32 });
    periph.RTC.MODE0.CTRL.modify(.{ .ENABLE = 1 });
}
