const mcu = @import("ezdl").stm32.mcus.stm32f0x2;
const periph = @import("ezdl").stm32.svd.stm32f0x2.peripherals;

extern const _data_loadaddr: u32;
extern var _data: u32;
extern const _edata: u32;
extern var _bss: u32;
extern const _ebss: u32;

export fn resetHandler() void {
    const data_loadaddr = @ptrCast([*]const u8, &_data_loadaddr);
    const data = @ptrCast([*]u8, &_data);
    const data_size = @ptrToInt(&_edata) - @ptrToInt(&_data);
    for (data_loadaddr[0..data_size], data[0..data_size]) |from, *to| to.* = from;

    const bss = @ptrCast([*]u8, &_bss);
    const bss_size = @ptrToInt(&_ebss) - @ptrToInt(&_bss);
    for (bss[0..bss_size]) |*b| b.* = 0;

    main();
    while (true) {
        asm volatile ("wfi");
    }
}

fn main() void {
    const led = mcu.Gpio(periph.GPIOA, 5, .{ .output = .{} });
    periph.RCC.AHBENR.modify(.{ .IOPAEN = 1 });
    led.init();
    led.set();
}
