export fn resetHandler() void {
    asm volatile (
        \\		mov #_stack, r1
        \\		mov #_data, r4
        \\		mov #_data_loadaddr, r5
        \\		mov #_bss, r6
        \\init_data:
        \\		cmp #_edata, r4
        \\		jz init_bss
        \\		mov 0(r4), 0(r5)
        \\		inc r4
        \\		inc r5
        \\		jmp init_data
        \\
        \\init_bss:
        \\		cmp #_ebss, r6
        \\		jz start
        \\		mov #0, 0(r6)
        \\		inc r6
        \\		jmp init_bss
        \\
        \\start:
        \\		jmp main
    );
}
