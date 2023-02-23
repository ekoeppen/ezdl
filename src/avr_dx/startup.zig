extern const _data_loadaddr: u16 addrspace(.flash);
extern var _data: u16;
extern const _edata: u16;
extern var _bss: u16;
extern const _ebss: u16;
extern const _stack: u16;

export fn resetHandler() callconv(.Naked) void {
    asm volatile (
        \\ldi r28, lo8(_stack)
        \\ldi r29, hi8(_stack)
        \\out 0x3d, r28
        \\out 0x3e, r29
        \\jmp main
    );
}
