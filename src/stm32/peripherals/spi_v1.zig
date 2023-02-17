pub fn Spi(comptime spi: anytype, comptime clock: u32, comptime speed: u32) type {
    return struct {
        const brr: u3 =
            if (speed >= clock / 2) 0 else if (speed >= clock / 4) 1 else if (speed >= clock / 8) 2 else if (speed >= clock / 16) 3 else if (speed >= clock / 32) 4 else if (speed >= clock / 64) 5 else if (speed >= clock / 128) 6 else 7;

        pub fn init() void {
            spi.CR1.modify(.{ .MSTR = 1, .SSI = 1, .SSM = 1, .BR = brr, .DFF = 0 });
            if (spi.SR.read().MODF == 1) {
                spi.CR1.modify(.{ .MSTR = 1 });
            }
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
            while (spi.SR.read().BSY == 1) {}
            while (spi.SR.read().TXE == 0) {}
            DR.* = data;
            while (spi.SR.read().RXNE == 0) {}
            return @truncate(u8, spi.DR.readRaw());
        }
    };
}
