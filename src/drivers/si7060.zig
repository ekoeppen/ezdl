pub fn Si7060(comptime i2c: type, comptime address: u7) type {
    return struct {
        fn readRegister(reg: u8) !u8 {
            var buffer: [1]u8 = undefined;
            try i2c.controllerSend(address, &.{reg}, true);
            try i2c.controllerReceive(address, &buffer);
            return buffer[0];
        }

        pub fn measureTemperature() !i16 {
            i2c.controllerSend(address, &.{ 0xc4, 0b0000_0100 }, false) catch
                return error.StartMeasureFailed;
            const high = try readRegister(0xc1) & 0b0111_1111;
            const low = try readRegister(0xc2);
            return @divTrunc(((@as(i16, high) << 8) + @as(i16, low) - 16384) * 5, 8) + 5500;
        }

        pub fn sleep() !void {
            i2c.controllerSend(address, &.{ 0xc4, 0b0000_0001 }, false) catch
                return error.SleepFailed;
        }

        pub fn wakeup() !void {
            if (!i2c.checkTarget(address)) return error.WakeupFailed;
        }
    };
}
