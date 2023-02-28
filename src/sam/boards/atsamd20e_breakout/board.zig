pub const ezdl = @import("ezdl");
pub const mcu = ezdl.sam.mcus.atsamd20e;
pub const svd = ezdl.sam.svd.atsamd20e;

pub const periph = svd.peripherals;

pub const nvic = mcu.Nvic(periph.NVIC);
pub const led = mcu.Pin(&periph.PORT_GROUP[0], 15, .{ .direction = .output });

pub const VectorTable = ezdl.stm32.VectorTable(svd.VectorTable);

fn rtcHandler() void {
    periph.RTC.MODE0.INTFLAG.modify(.{ .OVF = 1, .CMP0 = 1 });
    nvic.clearPending(3);
}

export const vectors: VectorTable linksection(".vectors") = .{
    .RTC = rtcHandler,
};

pub fn init() void {
    nvic.enableInterrupts(&.{3});
    periph.GCLK.CLKCTRL.modify(.{ .ID = .{ .value = .RTC } });
    periph.GCLK.CLKCTRL.modify(.{ .GEN = .{ .value = .GCLK2 } });
    periph.GCLK.CLKCTRL.modify(.{ .CLKEN = 1 });
    periph.PM.APBAMASK.modify(.{ .RTC_ = 1 });
    periph.PM.APBCMASK.modify(.{ .ADC_ = 0 });
    periph.PM.SLEEP.modify(.{ .IDLE = .{ .value = .APB } });
    periph.SystemControl.SCR.modify(.{ .SLEEPDEEP = .{ .value = .VALUE_1 } });
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
