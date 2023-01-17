extern const _data_loadaddr: anyopaque;
extern var _data: anyopaque;
extern const _edata: anyopaque;
extern var _bss: anyopaque;
extern const _ebss: anyopaque;

extern fn main() void;

export fn resetHandler() void {
    const data_loadaddr = @ptrCast([*]const u8, &_data_loadaddr);
    const data = @ptrCast([*]u8, &_data);
    const data_end = @ptrCast([*]u8, &_edata);
    const data_size = @ptrToInt(data_end) - @ptrToInt(data);
    for (data_loadaddr[0..data_size]) |d, i| data[i] = d;

    const bss = @ptrCast([*]u8, &_bss);
    const bss_end = @ptrCast([*]u8, &_ebss);
    const bss_size = @ptrToInt(bss_end) - @ptrToInt(bss);
    for (bss[0..bss_size]) |*b| b.* = 0;

    asm volatile ("sev");
    asm volatile ("wfe");
    main();
    while (true) {
        asm volatile ("wfi");
    }
}
