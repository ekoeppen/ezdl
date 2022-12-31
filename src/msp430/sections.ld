ENTRY(resetHandler)
PROVIDE(_stack = ORIGIN(ram) + LENGTH(ram));

SECTIONS
{
    .text : {
        *(.text*)
        . = ALIGN(2);

        *(.rodata*)
        . = ALIGN(2);

    } >rom

    .vectors : {
        . = 0xfffe;
        SHORT(resetHandler)
    } >vectors

    . = ALIGN(2);
    _etext = .;

    .data : {
        _data = .;
        *(.data*)
        . = ALIGN(2);
        _edata = .;
    } >ram AT >rom
    _data_loadaddr = LOADADDR(.data);

    .bss : {
        _bss = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(2);
        _ebss = .;
    } >ram

    end = .;
}
