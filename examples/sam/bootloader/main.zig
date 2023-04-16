const ezdl = @import("ezdl");
const mcu = ezdl.sam.mcus.atsamd20e;
const svd = ezdl.sam.svd.atsamd20e;
const Bootloader = ezdl.lib.bootloader.Xmodem;

const periph = svd.peripherals;

const nvic = mcu.Nvic(periph.NVIC);
const led = mcu.Pin(&periph.PORT_GROUP[0], 15, .{ .direction = .output });
const button = mcu.Pin(&periph.PORT_GROUP[0], 14, .{ .direction = .input });
const tx = mcu.Pin(&periph.PORT_GROUP[0], 0, .{
    .direction = .input,
    .mux_enable = true,
    .mux = .D,
});
const rx = mcu.Pin(&periph.PORT_GROUP[0], 1, .{
    .direction = .input,
    .mux_enable = true,
    .mux = .D,
});
const sercom_usart = mcu.SercomUsart(&periph.SERCOM1.USART_INT, .{
    .speed = 9600,
    .clock_speed = 8_000_000,
    .tx_pad = 0,
    .rx_pad = 1,
});
const flash = mcu.Nvm(periph.NVMCTRL, mcu.flash_config);

const console = sercom_usart;

fn init() void {
    periph.SYSCTRL.OSC8M.modify(.{ .PRESC = .{ .raw = 0 } });

    periph.GCLK.CLKCTRL.modify(.{ .ID = .{ .value = .SERCOM1_CORE } });
    periph.GCLK.CLKCTRL.modify(.{ .GEN = .{ .value = .GCLK0 } });
    periph.GCLK.CLKCTRL.modify(.{ .CLKEN = 1 });

    periph.PM.APBCMASK.modify(.{ .SERCOM1_ = 1 });
    periph.PM.APBBMASK.modify(.{ .NVMCTRL_ = 1 });
    periph.PM.AHBMASK.modify(.{ .NVMCTRL_ = 1 });
}

fn deinit() void {}

export fn main() void {
    var bootloader: Bootloader(console, flash, 0x0400, 0) = .{};
    init();
    led.init();
    tx.init();
    rx.init();
    console.init();
    led.set();
    _ = bootloader.run();
    led.clear();
    deinit();
    mcu.reset(0x400);
}
