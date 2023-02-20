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

pub fn I2c(comptime scl: anytype, comptime sda: anytype, comptime cycle: u32) type {
    return struct {
        fn delay() void {
            var n: u16 = cycle;
            while (n > 0) : (n -= 1) {
                asm volatile ("");
            }
        }

        pub fn init() void {}

        pub fn checkTarget(address: u7) bool {
            generateStart();
            defer generateStop();
            send(@as(u8, address) << 1) catch {
                return false;
            };
            return true;
        }

        pub fn generateStart() void {
            sda.set();
            delay();
            scl.set();
            delay();
            sda.clear();
            delay();
            scl.clear();
            delay();
        }

        pub fn generateStop() void {
            sda.clear();
            delay();
            scl.set();
            delay();
            sda.set();
            delay();
        }

        pub fn send(data: u8) !void {
            var i: u8 = 8;
            var d: u8 = data;
            while (i > 0) : (i -= 1) {
                if (d & 0x80 != 0) sda.set() else sda.clear();
                d <<= 1;
                delay();
                scl.set();
                delay();
                scl.clear();
                delay();
            }
            sda.set();
            scl.set();
            delay();
            const ack = !sda.isSet();
            scl.clear();
            delay();
            if (!ack) return error.Nack;
        }

        pub fn receive(ack: bool) !u8 {
            var data: u8 = 0;
            sda.set();
            var i: u8 = 8;
            while (i > 0) : (i -= 1) {
                data <<= 1;
                scl.set();
                timeout = 1_000_000;
                while (!timedOut() and !scl.isSet()) : (pause()) {}
                if (timedOut()) return error.Timeout;
                delay();
                if (sda.isSet()) data |= 1;
                delay();
                scl.clear();
                delay();
            }
            if (ack) sda.clear() else sda.set();
            scl.set();
            delay();
            scl.clear();
            sda.set();
            delay();
            return data;
        }

        pub fn controllerSend(address: u7, data: []const u8, restart: bool) !void {
            generateStart();
            errdefer generateStop();
            try send(@as(u8, address) << 1);
            for (data) |d| {
                try send(d);
            }
            if (!restart) generateStop();
        }

        pub fn controllerReceive(address: u7, data: []u8) !void {
            generateStart();
            errdefer generateStop();
            try send(@as(u8, address) << 1 | 1);
            for (data, 0..) |*d, i| {
                d.* = try receive(i < data.len - 1);
            }
            generateStop();
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
