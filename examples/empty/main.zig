pub export fn main() void {
    while (true) {
        asm volatile ("wfi");
    }
}
