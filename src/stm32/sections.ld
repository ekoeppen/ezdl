ENTRY(resetHandler)
PROVIDE(_stack = ORIGIN(ram) + LENGTH(ram));

SECTIONS
{
    .text : {
        LONG(_stack)
        LONG(resetHandler)
        LONG(DEFINED(nmiHandler) ? nmiHandler : 0xffffffff))
        LONG(DEFINED(hardFaultHandler) ? hardFaultHandler : 0xffffffff))
        LONG(0xffffffff)
        LONG(0xffffffff)
        LONG(0xffffffff)
        LONG(0xffffffff)
        LONG(0xffffffff)
        LONG(0xffffffff)
        LONG(0xffffffff)
        LONG(DEFINED(svcHandler) ? svcHandler : 0xffffffff))
        LONG(0xffffffff)
        LONG(0xffffffff)
        LONG(DEFINED(pendSvHandler) ? pendSvHandler : 0xffffffff))
        LONG(DEFINED(sysTickHandler) ? sysTickHandler : 0xffffffff))
        *(.vectors)

        *(.text*)
        . = ALIGN(4);

        *(.rodata*)
        . = ALIGN(4);

    } >rom

    .ARM.exidx : {
        __exidx_start = .;
        *(.ARM.exidx*)
        __exidx_end = .;
    } >rom

    . = ALIGN(4);
    _etext = .;

    .data : {
        _data = .;
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } >ram AT >rom
    _data_loadaddr = LOADADDR(.data);

    .bss : {
        _bss = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } >ram

    end = .;
}
