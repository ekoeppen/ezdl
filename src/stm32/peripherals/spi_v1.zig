pub fn Spi(comptime Periph: type) type {
    return struct {
        pub fn init() void {
            Periph.CR1.write(.{ .MSTR = 1, .SSI = 1, .SSM = 1, .BR = 0 });
            Periph.CR1.modify(.{ .SPE = 1 });
        }

        pub fn receive() u8 {
            return Periph.DR.read().DR;
        }

        pub fn send(data: u8) void {
            Periph.DR.write(.{ .DR = data });
        }
    };
}
