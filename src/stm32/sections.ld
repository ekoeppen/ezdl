ENTRY(main)
PROVIDE(_stack = ORIGIN(ram) + LENGTH(ram));

SECTIONS
{
    .text : {
        LONG(_stack);
        LONG(resetHandler);
        KEEP(*(.vectors));
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
