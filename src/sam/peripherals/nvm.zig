pub const Config = struct {
    clock_speed: u32,
};

pub fn Nvm(comptime nvm: anytype, comptime flash_config: anytype) type {
    return struct {
        pub fn init(config: Config) void {
            const rws = if (config.clock_speed <= 8_000_000) 0 else 1;
            nvm.CTRLB.modify(.{ .RWS = rws });
        }

        pub fn lock(address: u32) void {
            nvm.ADDR.write(.{ .ADDR = @truncate(u21, address >> 1), .padding = 0 });
            while (nvm.INTFLAG.read().READY == 0) {}
            nvm.CTRLA.write(.{
                .CMD = .{ .value = .LR },
                .CMDEX = .{ .value = .KEY },
                .reserved8 = 0,
            });
            while (nvm.INTFLAG.read().READY == 0) {}
        }

        pub fn unlock(address: u32) void {
            nvm.ADDR.write(.{ .ADDR = @truncate(u21, address >> 1), .padding = 0 });
            while (nvm.INTFLAG.read().READY == 0) {}
            nvm.CTRLA.write(.{
                .CMD = .{ .value = .UR },
                .CMDEX = .{ .value = .KEY },
                .reserved8 = 0,
            });
        }

        pub fn erase(address: u32) void {
            while (nvm.INTFLAG.read().READY == 0) {}
            nvm.ADDR.write(.{ .ADDR = @truncate(u21, address >> 1), .padding = 0 });
            nvm.CTRLA.write(.{
                .CMD = .{ .value = .ER },
                .CMDEX = .{ .value = .KEY },
                .reserved8 = 0,
            });
        }

        pub fn write(address: u32, data: []const u8) void {
            if (address % flash_config.erase_granularity[0] == 0) {
                erase(address);
            }
            const dst = @intToPtr([*]u16, address);
            nvm.CTRLB.modify(.{ .MANW = 1 });
            nvm.ADDR.write(.{ .ADDR = @truncate(u21, address >> 1), .padding = 0 });
            for (0..data.len / 2) |i| {
                dst[i] = data[i * 2] + data[i * 2 + 1] * @as(u16, 256);
                if ((i + 1) % (flash_config.write_granularity[0] / 2) == 0 or (i + 1) == data.len / 2) {
                    while (nvm.INTFLAG.read().READY == 0) {}
                    nvm.CTRLA.write(.{
                        .CMD = .{ .value = .WP },
                        .CMDEX = .{ .value = .KEY },
                        .reserved8 = 0,
                    });
                }
            }
        }
    };
}
