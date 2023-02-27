pub const Config = struct {
    clock: u32 = 4_000_000,
    speed: u32 = 100_000,
    default_timeout: u16 = 10000,
};

var timeout: u16 = undefined;

pub fn I2c(comptime i2c: anytype, comptime config: Config) type {
    return struct {
        pub fn init() void {
            i2c.MBAUD.write(.{ .BAUD = config.clock / config.speed / 2 });
            i2c.MCTRLA.modify(.{ .ENABLE = 1 });
            busIdle();
        }

        pub fn checkTarget(address: u7) bool {
            i2c.MADDR.write(.{ .ADDR = @as(u8, address) << 1 });
            waitForWriteInterrupt() catch return false;
            if (i2c.MSTATUS.read().RXACK == 1) {
                generateStop();
                return false;
            }
            return true;
        }

        fn generateStop() void {
            i2c.MCTRLB.modify(.{ .MCMD = .{ .value = .STOP } });
            busIdle();
        }

        fn busIdle() void {
            i2c.MSTATUS.modify(.{ .BUSSTATE = .{ .value = .IDLE } });
        }

        fn waitForWriteInterrupt() !void {
            start();
            while (!timedOut()) : (pause()) if (i2c.MSTATUS.read().WIF == 1) return;
            if (i2c.MSTATUS.read().ARBLOST == 1) return error.ArbLost;
            generateStop();
            return error.WaitForWriteInterrupt;
        }

        fn waitForReadInterrupt() !void {
            start();
            while (!timedOut()) : (pause()) if (i2c.MSTATUS.read().RIF == 1) return;
            if (i2c.MSTATUS.read().ARBLOST == 1) return error.ArbLost;
            generateStop();
            return error.WaitForReadInterrupt;
        }

        pub fn controllerSend(address: u7, data: []const u8, restart: bool) !void {
            i2c.MADDR.write(.{ .ADDR = @as(u8, address) << 1 });
            try waitForWriteInterrupt();
            for (data) |d| {
                i2c.MDATA.write(.{ .DATA = d });
                try waitForWriteInterrupt();
                if (i2c.MSTATUS.read().RXACK == 1) break;
            }
            if (!restart) generateStop();
        }

        pub fn controllerReceive(address: u7, data: []u8) !void {
            i2c.MADDR.write(.{ .ADDR = @as(u8, address) << 1 | 1 });
            try waitForReadInterrupt();
            for (data, 0..) |*d, i| {
                d.* = i2c.MDATA.read().DATA;
                if (i < data.len - 1) {
                    i2c.MCTRLB.modify(.{
                        .ACKACT = .{ .value = .ACK },
                        .MCMD = .{ .value = .RECVTRANS },
                    });
                    try waitForReadInterrupt();
                } else {
                    i2c.MCTRLB.modify(.{
                        .ACKACT = .{ .value = .NACK },
                        .MCMD = .{ .value = .STOP },
                    });
                }
            }
        }

        pub fn writeRegister(address: u7, register: u8, data: []const u8) !void {
            try controllerSend(address, &.{register}, true);
            try controllerSend(address, data);
        }

        pub fn readRegister(address: u7, register: u8, data: []u8) !void {
            try controllerSend(address, &.{register}, true);
            try controllerReceive(address, data);
        }

        fn start() void {
            timeout = config.default_timeout;
        }

        fn timedOut() bool {
            return timeout == 0;
        }

        fn pause() void {
            if (!timedOut()) timeout -= 1;
        }
    };
}
