const std = @import("std");

pub fn Ihex(comptime console: anytype, comptime flash: anytype, comptime button: anytype) type {
    return struct {
        const Self = @This();
        const ihex = @import("ihex.zig");
        line_buffer: [128]u8 = undefined,
        record_buffer: [128]u8 = undefined,
        record: ihex.Record = undefined,
        address: usize = 0,
        offset: usize = 0,

        fn readLine(self: *Self) void {
            var n: usize = 0;
            while (n < self.line_buffer.len) : (n += 1) {
                const c = console.receive();
                if (c == std.ascii.control_code.lf) break;
                self.line_buffer[n] = c;
            }
        }

        fn xon() void {
            console.send(std.ascii.control_code.dc1);
        }

        fn xoff() void {
            console.send(std.ascii.control_code.dc3);
        }

        pub fn run(self: *Self) !bool {
            defer xon();
            errdefer xon();

            xon();
            var delay: u32 = 100000;
            while (!console.rxAvailable() and !button.isSet() and delay > 0) : (delay -= 1) {}
            if (delay == 0 and !button.isSet()) return false;
            while (true) {
                xon();
                self.readLine();
                xoff();
                self.record = try ihex.decode(&self.line_buffer, &self.record_buffer);
                switch (self.record) {
                    .extended_segment_addr => |n| self.offset = n * @as(usize, 16),
                    .extended_linear_addr => |n| self.offset = @as(usize, n) << @as(usize, 16),
                    .data => |d| flash.write(d.address + self.offset, d.data),
                    .eof => return true,
                    else => {},
                }
            }
        }
    };
}

pub fn Xmodem(
    comptime console: anytype,
    comptime flash: anytype,
    comptime start_address: usize,
    comptime timeout: usize,
) type {
    const BlockStatus = enum { ok, repeat, final, missing_soh, incorrect_number, invalid_number, invalid_checksum };

    return struct {
        const Self = @This();
        block_buffer: [128]u8 = undefined,
        last_block: u8 = undefined,
        address: usize = undefined,

        fn readBlock(self: *Self) BlockStatus {
            const start = console.receive();
            if (start == std.ascii.control_code.eot) return .final;
            if (start != std.ascii.control_code.soh) return .missing_soh;

            const block_number = console.receive();
            const next_block = if (self.last_block < 255) self.last_block + 1 else 1;

            if (block_number == self.last_block) return .repeat;
            if (block_number != next_block) return .incorrect_number;
            if (console.receive() != 255 - block_number) return .invalid_number;

            var checksum: u8 = 0;
            for (&self.block_buffer) |*b| {
                b.* = console.receive();
                checksum +%= b.*;
            }
            if (console.receive() != checksum) return .invalid_checksum;
            self.last_block = block_number;
            return .ok;
        }

        pub fn run(self: *Self) bool {
            console.send(std.ascii.control_code.nak);
            if (timeout > 0) {
                var delay: usize = timeout;
                while (!console.rxAvailable() and delay > 0) : (delay -= 1) {}
                if (delay == 0) return false;
            }

            self.address = start_address;
            self.last_block = 0;
            while (true) {
                switch (self.readBlock()) {
                    .ok => {
                        flash.write(self.address, &self.block_buffer);
                        self.address += self.block_buffer.len;
                        console.send(std.ascii.control_code.ack);
                    },
                    .repeat => console.send(std.ascii.control_code.ack),
                    .final => {
                        console.send(std.ascii.control_code.ack);
                        return true;
                    },
                    else => console.send(std.ascii.control_code.nak),
                }
            }
        }
    };
}
