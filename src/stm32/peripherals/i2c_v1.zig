pub fn I2c(comptime i2c: anytype) type {
    return struct {
        pub fn init() void {
            i2c.CR1.modify(.{ .PE = 1 });
        }

        pub fn masterSend(address: u10, data: u8, restart: bool) !void {
            _ = address;
            _ = data;
            _ = restart;
        }

        pub fn masterReceive(address: u10, data: []u8) !void {
            _ = address;
            _ = data;
        }

        pub fn writeRegister(address: u10, register: u8, data: []const u8) !void {
            _ = address;
            _ = register;
            _ = data;
        }

        pub fn readRegister(address: u10, register: []const u8) !u8 {
            _ = address;
            _ = register;
            return 0;
        }
    };
}
