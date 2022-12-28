extern const _data_loadaddr: u16;
extern var _data: u16;
extern const _edata: u16;
extern var _bss: u16;
extern const _ebss: u16;

extern fn main() void;

export fn abort() void {}

export fn resetHandler() void {
    const data_loadaddr = @ptrCast([*]const u8, &_data_loadaddr);
    const data = @ptrCast([*]u8, &_data);
    const data_size = @ptrToInt(&_edata) - @ptrToInt(&_data);
    for (data_loadaddr[0..data_size]) |d, i| data[i] = d;

    const bss = @ptrCast([*]u8, &_bss);
    const bss_size = @ptrToInt(&_ebss) - @ptrToInt(&_bss);
    for (bss[0..bss_size]) |*b| b.* = 0;

    main();
    while (true) {}
}
