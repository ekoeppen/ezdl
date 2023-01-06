ENTRY(resetHandler)
PROVIDE(_stack = ORIGIN(ram) + LENGTH(ram) - 1);

SECTIONS
{
    .vectors : {
        KEEP(*(.vectors));
        . = 0x40;
    } > rom = 0xffffffff

    .text : {
        *(.text*)
        _etext = .;
    } >rom

    .data : {
        _data = .;
        *(.rodata*)
        *(.data*)
        _edata = .;
    } >ram AT >rom
    _data_loadaddr = LOADADDR(.data);

    .bss : {
        _bss = .;
        *(.bss*)
        *(COMMON)
        _ebss = .;
    } >ram

    end = .;
}
