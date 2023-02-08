pub fn Spi(comptime spi: anytype) type {
    return struct {
        pub fn init() void {
            spi.CR1.modify(.{ .MSTR = 1, .SSI = 1, .SSM = 1, .BR = 0 });
            spi.CR2.modify(.{ .DS = 7, .FRXTH = 1 });
            spi.CR1.modify(.{ .SPE = 1 });
        }

        pub fn receive() u8 {
            return transmit(0x00);
        }

        pub fn send(data: u8) void {
            _ = transmit(data);
        }

        pub fn transmit(data: u8) u8 {
            const DR = @ptrCast(*volatile u8, &spi.DR.raw);
            while (spi.SR.read().TXE == 0) {}
            DR.* = data;
            while (spi.SR.read().RXNE == 0) {}
            while (spi.SR.read().BSY == 1) {}
            return DR.*;
        }
    };
}
