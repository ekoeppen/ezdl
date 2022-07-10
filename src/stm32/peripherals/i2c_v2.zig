pub fn I2c(comptime Periph: type) type {
    return struct {
        pub fn init() void {
            Periph.CR1.modify(.{ .PE = 1 });
        }

        pub fn master_receive() u8 {
            return 0;
        }

        pub fn master_send(_: u8) void {}
    };
}
