extern const _data_loadaddr: u16 addrspace(.flash);
extern var _data: u16;
extern const _edata: u16;
extern var _bss: u16;
extern const _ebss: u16;
extern const _stack: u16;

export fn resetHandler() callconv(.Naked) void {
    const data_loadaddr = @ptrCast([*]addrspace(.flash) const u8, &_data_loadaddr);
    const data = @ptrCast([*]u8, &_data);
    const data_size = @ptrToInt(&_edata) - @ptrToInt(&_data);
    for (data_loadaddr[0..data_size], data[0..data_size]) |from, *to| to.* = from;

    const bss = @ptrCast([*]u8, &_bss);
    const bss_size = @ptrToInt(&_ebss) - @ptrToInt(&_bss);
    for (bss[0..bss_size]) |*b| b.* = 0;

    asm volatile (
        \\ldi r28, lo8(_stack)
        \\ldi r29, hi8(_stack)
        \\out 0x3d, r28
        \\out 0x3e, r29
        \\jmp main
    );
}
