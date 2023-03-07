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
                i2c.TIMINGR.modify(.{ .SCLH = 7, .SCLL = 8, .SDADEL = 0, .SCLDEL = 0, .PRESC = 0 });
            } else {
                i2c.TIMINGR.modify(.{ .SCLH = 0, .SCLL = 0, .SDADEL = 0, .SCLDEL = 0, .PRESC = 0 });
            }
            i2c.CR2.modify(.{ .AUTOEND = 1, .NACK = 1 });
            i2c.CR1.modify(.{ .PE = 1 });
        }

        pub fn checkTarget(address: u7) bool {
            i2c.CR2.modify(.{
                .SADD = @as(u10, address) << 1,
                .NBYTES = 0,
                .START = 1,
                .AUTOEND = 1,
            });
            defer {
                i2c.ISR.modify(.{ .TXE = 1 });
                i2c.ICR.modify(.{ .NACKCF = 1, .STOPCF = 1 });
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

        fn waitForTxIs() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.ISR.read().TXIS == 1) return;
            }
            return error.TimeoutTxIs;
        }

        fn waitForTxEmpty() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.ISR.read().TXE == 1) return;
            }
            return error.TimeoutTxE;
        }

        fn waitForTxComplete() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.ISR.read().TC == 1) return;
            }
            return error.TimeoutTc;
        }

        fn waitForRxNotEmpty() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.ISR.read().RXNE == 1) return;
            }
            return error.TimeoutRxne;
        }

        fn waitForStop() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.ISR.read().STOPF == 1) return;
            }
            return error.TimeoutStopF;
        }

        fn waitForBtf() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.SR1.read().BTF == 1) return;
            }
            return error.Timeout;
        }

        pub fn controllerSend(address: u7, data: []const u8, restart: bool) !void {
            const autoend: u1 = if (restart) 0 else 1;
            i2c.CR2.modify(.{
                .SADD = @as(u10, address) << 1,
                .NBYTES = @truncate(u8, data.len),
                .START = 1,
                .AUTOEND = autoend,
                .RD_WRN = 0,
            });
            for (data) |d| {
                try waitForTxIs();
                i2c.TXDR.write(.{ .TXDATA = d, .padding = 0 });
            }
            if (restart) try waitForTxComplete() else try waitForStop();
        }

        pub fn controllerReceive(address: u7, data: []u8) !void {
            i2c.CR2.modify(.{
                .SADD = @as(u10, address) << 1,
                .NBYTES = @truncate(u8, data.len),
                .START = 1,
                .AUTOEND = 1,
                .RD_WRN = 1,
            });
            for (data) |*d| {
                try waitForRxNotEmpty();
                d.* = i2c.RXDR.read().RXDATA;
            }
            try waitForStop();
        }

        pub fn writeRegister(address: u7, register: u8, data: []const u8) !void {
            try controllerSend(address, &.{register}, true);
            try controllerSend(address, data);
        }

        pub fn readRegister(address: u7, register: u8, data: []u8) !void {
            try controllerSend(address, &.{register}, true);
            try controllerReceive(address, data);
        }
    };
}
