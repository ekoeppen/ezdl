pub fn Spi(comptime Periph: anytype) type {
    return struct {
        const DR = @ptrCast(*volatile u8, Periph.DR.raw_ptr);

        pub fn init() void {
            Periph.CR1.modify(.{ .MSTR = 1, .SSI = 1, .SSM = 1, .BR = 0 });
            Periph.CR1.modify(.{ .SPE = 1 });
        }

        pub fn receive() u8 {
            while (Periph.SR.read().TXE == 0) {}
            DR.* = 0x0;
            while (Periph.SR.read().RXNE == 0) {}
            while (Periph.SR.read().BSY == 1) {}
            return DR.*;
        }

        pub fn send(data: u8) void {
            while (Periph.SR.read().TXE == 0) {}
            DR.* = data;
            while (Periph.SR.read().RXNE == 0) {}
            while (Periph.SR.read().BSY == 1) {}
            const r = DR.*;
            _ = r;
        }
    };
}
