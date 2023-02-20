const default_timeout: u32 = 10000;
var timeout: u32 = undefined;

fn start() void {
    timeout = default_timeout;
}
fn timedOut() bool {
    return timeout == 0;
}
fn pause() void {
    if (!timedOut()) timeout -= 1;
}

pub fn I2c(comptime i2c: anytype, comptime pclk: u32, comptime frequency: u32) type {
    return struct {
        pub fn init() void {
            _ = pclk;
            i2c.CR1.modify(.{ .PE = 0 });
            if (frequency <= 100_000) {
                i2c.TIMINGR.write(.{ .SCLH = 15, .SCLL = 19, .SDADEL = 2, .SCLDEL = 4, .PRESC = 1 });
            } else {
                i2c.TIMINGR.write(.{ .SCLH = 9, .SCLL = 3, .SDADEL = 1, .SCLDEL = 3, .PRESC = 0 });
            }
            i2c.CR1.modify(.{ .PE = 1 });
        }

        pub fn checkTarget(address: u7) bool {
            i2c.CR2.modify(.{ .NBYTES = 0, .START = 1, .SADD0 = 0, .SADD1 = address, .AUTOEND = 0 });
            defer {
                i2c.ICR.modify(.{ .NACKCF = 1 });
                i2c.CR2.modify(.{ .STOP = 1 });
            }
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.ISR.read().NACKF == 1) return false;
            }
            return true;
        }

        pub fn generateStart() !void {
            i2c.CR2.modify(.{ .START = 1 });
        }

        pub fn generateStop() void {
            i2c.CR2.modify(.{ .STOP = 1 });
        }

        fn waitForTxDrEmpty() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.ISR.read().TXIS == 1) return;
            }
            return error.Timeout;
        }

        fn waitForTxComplete() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.ISR.read().TC == 1) return;
            }
            return error.Timeout;
        }

        fn waitForRxne() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.ISR.read().RXNE == 1) return;
            }
            return error.Timeout;
        }

        fn waitForStop() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.SR1.read().STOPF == 1) return;
            }
            return error.Timeout;
        }

        fn waitForBtf() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.SR1.read().BTF == 1) return;
            }
            return error.Timeout;
        }

        pub fn controllerSend(address: u7, data: []const u8, restart: bool) !void {
            _ = address;
            _ = data;
            _ = restart;
        }

        pub fn controllerReceive(address: u7, data: []u8) !void {
            _ = address;
            _ = data;
        }

        pub fn writeRegister(address: u7, register: u8, data: []const u8) !void {
            _ = address;
            _ = register;
            _ = data;
        }

        pub fn readRegister(address: u7, register: u8, data: []u8) !void {
            i2c.CR2.modify(.{ .NBYTES = 1, .START = 1, .SADD0 = 0, .SADD1 = address });
            try waitForTxDrEmpty();
            i2c.TXDR.write(.{ .TXDATA = register });
            try waitForTxComplete();
            i2c.CR2.modify(.{
                .NBYTES = @truncate(u8, data.len),
                .AUTOEND = 1,
                .RD_WRN = 1,
                .START = 1,
            });
            for (data) |*d| {
                try waitForRxne();
                d.* = i2c.RXDR.read().RXDATA;
            }
            i2c.CR2.modify(.{ .STOP = 1 });
        }
    };
}
