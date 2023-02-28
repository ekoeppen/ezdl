ENTRY(resetHandler)
PROVIDE(_stack = ORIGIN(ram) + LENGTH(ram) - 1);

SECTIONS
{
    .vectors : {
        KEEP(*(.vectors));
    } >flash = 0xffffffff

    .text : {
        . = ALIGN(0x100);
        *(.text*)
        _etext = .;
    } >flash

    .rodata : {
        *(.rodata*)
    } >flash

    .data : {
        _data = .;
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
