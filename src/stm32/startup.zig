const board = @import("board");
const stm32 = @import("stm32.zig");

extern const _data_loadaddr: u32;
extern var _data: u32;
extern const _edata: u32;
extern var _bss: u32;
extern const _ebss: u32;

extern fn main() void;

export const vectors linksection(".vectors,_") = stm32.mkVectors(
    board.svd.interrupts,
    board.handlers,
);

export fn resetHandler() void {
    const data_loadaddr = @ptrCast([*]const u8, &_data_loadaddr);
    const data = @ptrCast([*]u8, &_data);
    const data_size = @ptrToInt(&_edata) - @ptrToInt(&_data);
    for (data_loadaddr[0..data_size]) |d, i| data[i] = d;

    const bss = @ptrCast([*]u8, &_bss);
    const bss_size = @ptrToInt(&_ebss) - @ptrToInt(&_bss);
    for (bss[0..bss_size]) |*b| b.* = 0;

    asm volatile ("sev");
    asm volatile ("wfe");
    main();
    while (true) {
        asm volatile ("wfi");
    }
}
