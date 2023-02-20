const Command = enum(u8) {
    measure_rh_hold = 0xE5,
    measure_rf_no_hold = 0xF5,
    measure_temp_hold = 0xE3,
    measure_temp_no_hold = 0xF3,
    read_temp = 0xE0,
    reset = 0xFE,
    write_user_reg = 0xE6,
    read_user_reg = 0xE7,
    write_heater_ctrl = 0x51,
    read_heater_ctrl = 0x11,
};

pub fn Si7006(comptime i2c: type) type {
    const address: u7 = 0x40;

    return struct {
        fn convertToTemp(m: []const u8) u16 {
            const msb: u32 = m[0];
            const lsb: u32 = m[1];
            return @truncate(u16, 17572 * (msb * 256 + lsb) / 65536 - 4685);
        }

        pub fn measureHumidity() !u8 {
            var m: [2]u8 = undefined;
            try i2c.readRegister(address, @enumToInt(Command.measure_rh_hold), &m);
            const msb: u32 = m[0];
            const lsb: u32 = m[1];
            return @truncate(u8, 125 * (msb * 256 + lsb) / 65536 - 6);
        }

        pub fn measureTemperature() !u16 {
            var m: [2]u8 = undefined;
            try i2c.readRegister(address, @enumToInt(Command.measure_temp_hold), &m);
            return convertToTemp(&m);
        }

        pub fn readTemperature() !u16 {
            var m: [2]u8 = undefined;
            try i2c.readRegister(address, @enumToInt(Command.read_temp), &m);
            return convertToTemp(&m);
        }

        pub fn reset() !void {
            try i2c.controllerSend(address, &.{@enumToInt(Command.reset)}, false);
        }
    };
}
