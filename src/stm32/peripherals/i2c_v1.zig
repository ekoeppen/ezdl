const default_timeout: u32 = 100000;
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
            i2c.CR1.modify(.{ .PE = 0 });
            i2c.CR2.modify(.{ .FREQ = pclk / 1_000_0000 });
            if (frequency <= 100_000) {
                i2c.CCR.modify(.{ .F_S = 0, .DUTY = 0, .CCR = pclk / (frequency * 2) });
                i2c.TRISE.modify(.{ .TRISE = pclk / 1_000_000 + 1 });
            } else {
                i2c.CCR.modify(.{ .F_S = 1, .DUTY = 0, .CCR = pclk / (frequency * 3) });
                i2c.TRISE.modify(.{ .TRISE = (pclk / 1_000_000) * 3 / 10 + 1 });
            }
            i2c.CR1.modify(.{ .PE = 1, .ACK = 1 });
        }

        pub fn checkTarget(address: u7) bool {
            generateStart() catch return false;
            sendTargetAddress(@as(u8, address) << 1) catch return false;
            return true;
        }

        pub fn generateStart() !void {
            i2c.CR1.modify(.{ .START = 1, .ACK = 1 });
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.SR1.read().SB == 1) return;
            }
            return error.Timeout;
        }

        pub fn generateStop() void {
            i2c.CR1.modify(.{ .STOP = 1 });
        }

        pub fn sendTargetAddress(address: u8) !void {
            i2c.DR.write(.{ .DR = address, .padding = 0 });
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.SR1.read().ADDR == 1) break;
            }
            if (i2c.SR1.read().AF == 1) {
                _ = i2c.SR2.read();
                generateStop();
                i2c.SR1.modify(.{ .AF = 0 });
                return error.Timeout;
            }
            _ = i2c.SR1.read();
            _ = i2c.SR2.read();
        }

        fn waitForTxe() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.SR1.read().TxE == 1) return;
            }
            return error.Timeout;
        }

        fn waitForRxne() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.SR1.read().RxNE == 1) return;
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

        fn waitForIdle() !void {
            start();
            while (!timedOut()) : (pause()) {
                if (i2c.SR2.read().BUSY == 0) return;
            }
            return error.Timeout;
        }

        pub fn controllerSend(address: u7, data: []const u8, restart: bool) !void {
            try generateStart();
            try sendTargetAddress(@as(u8, address) << 1);
            for (data) |d| {
                try waitForTxe();
                i2c.DR.write(.{ .DR = d, .padding = 0 });
            }
            if (!restart) generateStop();
        }

        pub fn controllerReceive(address: u7, data: []u8) !void {
            try generateStart();
            switch (data.len) {
                0 => {
                    try sendTargetAddress(@as(u8, address) << 1 | 1);
                    generateStop();
                },
                1 => {
                    try sendTargetAddress(@as(u8, address) << 1 | 1);
                    i2c.CR1.modify(.{ .ACK = 0 });
                    generateStop();
                    try waitForRxne();
                    data[1] = i2c.DR.read().DR;
                },
                2 => {
                    i2c.CR1.modify(.{ .POS = 1 });
                    try sendTargetAddress(@as(u8, address) << 1 | 1);
                    i2c.CR1.modify(.{ .ACK = 0 });
                    try waitForBtf();
                    generateStop();
                    data[0] = i2c.DR.read().DR;
                    data[1] = i2c.DR.read().DR;
                    i2c.CR1.modify(.{ .POS = 0 });
                },
                else => {
                    try sendTargetAddress(@as(u8, address) << 1 | 1);
                    var i: usize = 0;
                    while (i < data.len - 3) {
                        try waitForRxne();
                        data[i] = i2c.DR.read().DR;
                    }
                    try waitForBtf();
                    i2c.CR1.modify(.{ .ACK = 0 });
                    data[i] = i2c.DR.read().DR;
                    generateStop();
                    data[i + 1] = i2c.DR.read().DR;
                    try waitForRxne();
                    data[i + 2] = i2c.DR.read().DR;
                },
            }
        }

        pub fn writeRegister(address: u7, register: u8, data: []const u8) !void {
            try controllerSend(address, &.{register}, true);
            try controllerSend(address, data, false);
        }

        pub fn readRegister(address: u7, register: u8, data: []u8) !void {
            try controllerSend(address, &.{register}, true);
            try controllerReceive(address, data);
        }
    };
}
