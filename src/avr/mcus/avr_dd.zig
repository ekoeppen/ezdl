pub const Gpio = @import("../peripherals/peripherals.zig").gpio_dx.Gpio;
pub const Usart = @import("../peripherals/peripherals.zig").usart_dx.Usart;
pub const Spi = @import("../peripherals/peripherals.zig").spi_dx.Spi;
pub const I2c = @import("../peripherals/peripherals.zig").i2c_dx.I2c;

pub inline fn reset() void {
    asm volatile ("jmp 0");
}

pub inline fn sleep() void {
    asm volatile ("sleep");
}

pub inline fn waitForInterrupt() void {}

pub inline fn waitForEvent() void {
    waitForInterrupt();
}

export fn __udivmodhi4(_: u16, _: u16) callconv(.Naked) void {
    asm volatile (
        \\	sub     r26, r26
        \\	sub     r27, r27           ; Initialize the remainder to zero.
        \\	ldi     r21, 17            ; Only loop 16 rounds for uint16.
        \\
        \\__udivmodhi4_loop:
        \\	adc     r24, r24
        \\	adc     r25, r25
        \\	dec     r21
        \\	breq    __udivmodhi4_end
        \\	adc     r26, r26
        \\	adc     r27, r27
        \\	cp      r26, r22
        \\	cpc     r27, r23           ; Compare with the divisor.
        \\	brcs    __udivmodhi4_loop
        \\	sub     r26, r22
        \\	sbc     r27, r23           ; Subtract the divisor.
        \\	rjmp    __udivmodhi4_loop
        \\
        \\__udivmodhi4_end:
        \\	com     r24
        \\	com     r25
        \\	mov     r22, r24
        \\	mov     r23, r25           ; The quotient is returned in R23:R22.
        \\	mov     r24, r26
        \\	mov     r25, r27           ; The remainder is returned in in R25:R24.
        \\	ret
    );
}

export fn __udivmodqi4(_: u8, _: u8) callconv(.Naked) void {
    asm volatile (
        \\	sub     r25, r25           ; Initialize the remainder to zero.
        \\	ldi     r23, 9             ; Only loop 8 rounds for uint8.
        \\
        \\__udivmodqi4_loop:
        \\	adc     r24, r24
        \\	dec     r23
        \\	breq    __udivmodqi4_end
        \\	adc     r25, r25
        \\	cp      r25, r22           ; Compare with the divisor.
        \\	brcs    __udivmodqi4_loop
        \\	sub     r25, r22           ; Subtract the divisor.
        \\	rjmp    __udivmodqi4_loop
        \\
        \\__udivmodqi4_end:
        \\	com     r24                ; The uint8 quotient is returned via R24.
        \\	ret                        ; The uint8 remainder is returned via R25.
    );
}
