const std = @import("std");

pub fn RingBuffer(comptime T: type, comptime size: usize) type {
    if (!std.math.isPowerOfTwo(size)) @compileError("size must be power of two");

    return struct {
        const Self = @This();
        const Index = std.meta.Int(.unsigned, std.math.log2_int_ceil(usize, size));
        const Ptr = std.meta.Int(.unsigned, std.math.log2_int_ceil(usize, size) + 1);

        buffer: [size]T = undefined,
        head: Ptr = 0,
        tail: Ptr = 0,

        pub fn empty(self: *const Self) bool {
            return self.head == self.tail;
        }

        pub fn full(self: *const Self) bool {
            return self.used() == size;
        }

        pub fn used(self: *const Self) usize {
            return self.head -% self.tail;
        }

        pub fn free(self: *const Self) usize {
            return size - self.used();
        }

        pub fn put(self: *Self, data: T) bool {
            if (self.full()) return false;
            self.buffer[@truncate(Index, self.head)] = data;
            self.head +%= 1;
            return true;
        }

        pub fn get(self: *Self) ?T {
            if (self.empty()) return null;
            defer self.tail +%= 1;
            return self.buffer[@truncate(Index, self.tail)];
        }
    };
}

const expect = std.testing.expect;

test "Simple access" {
    var buffer = RingBuffer(u8, 8){};
    try expect(buffer.empty() == true);
    try expect(buffer.full() == false);
    try expect(buffer.put(1));
    try expect(buffer.empty() == false);
    try expect(buffer.full() == false);
    try expect(buffer.put(2));
    try expect(buffer.put(3));
    try expect(buffer.used() == 3);
    try expect(buffer.free() == 5);
    try std.testing.expect(buffer.get().? == 1);
    try std.testing.expect(buffer.get().? == 2);
    try std.testing.expect(buffer.get().? == 3);
}

test "Buffer full when putting data" {
    var buffer = RingBuffer(u8, 2){};
    try expect(buffer.put(1));
    try expect(buffer.put(2));
    try expect(buffer.full() == true);
    try expect(buffer.put(3) == false);
    try std.testing.expect(buffer.get().? == 1);
    try std.testing.expect(buffer.get().? == 2);
}

test "Buffer empty when getting data" {
    var buffer = RingBuffer(u8, 2){};
    try expect(buffer.put(1));
    try expect(buffer.put(2));
    try std.testing.expect(buffer.get().? == 1);
    try std.testing.expect(buffer.get().? == 2);
    try expect(buffer.empty() == true);
    try std.testing.expect(buffer.get() == null);
}

test "Struct in buffer" {
    const Item = struct {
        key: u32,
        value: u32,
    };
    var item: ?Item = undefined;
    var buffer = RingBuffer(Item, 2){};
    try expect(buffer.put(.{ .key = 1, .value = 100 }));
    item = buffer.get();
    try std.testing.expect(item != null);
    try std.testing.expect(item.?.key == 1);
    try std.testing.expect(item.?.value == 100);
}
