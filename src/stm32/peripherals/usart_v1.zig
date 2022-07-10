pub fn Usart(comptime Periph: type) type {
    return struct {
        pub fn init() void {
            Periph.CR1.modify(.{ .UE = 1 });
        }

        pub fn receive() u8 {
            return 0;
        }

        pub fn send(_: u8) void {}
    };
}
