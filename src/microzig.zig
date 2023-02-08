const std = @import("std");

pub const mmio = struct {
    pub fn Mmio(comptime PackedT: type) type {
        const size = @bitSizeOf(PackedT);
        if ((size % 8) != 0)
            @compileError("size must be divisible by 8!");

        if (!std.math.isPowerOfTwo(size / 8))
            @compileError("size must encode a power of two number of bytes!");

        const IntT = std.meta.Int(.unsigned, size);

        if (@sizeOf(PackedT) != (size / 8))
            @compileError(std.fmt.comptimePrint("IntT and PackedT must have the same size!, they are {} and {} bytes respectively", .{ size / 8, @sizeOf(PackedT) }));

        return extern struct {
            const Self = @This();

            raw: IntT,

            pub const underlying_type = PackedT;

            pub inline fn read(addr: *volatile Self) PackedT {
                return @bitCast(PackedT, addr.raw);
            }

            pub inline fn readRaw(addr: *volatile Self) IntT {
                return @bitCast(IntT, addr.raw);
            }

            pub inline fn writeRaw(addr: *volatile Self, val: IntT) void {
                addr.raw = @bitCast(IntT, val);
            }

            pub fn modifyRaw(
                comptime addr: *volatile Self,
                comptime offset: std.meta.Int(.unsigned, size),
                comptime width: std.meta.Int(.unsigned, size),
                value: IntT,
            ) void {
                const mask: IntT = ~((@as(IntT, (1 << width) - 1)) << offset);
                const bits: IntT = value << offset;
                addr.writeRaw(addr.readRaw() & mask | bits);
            }

            pub fn setRaw(
                comptime addr: *volatile Self,
                comptime offset: std.meta.Int(.unsigned, size),
                comptime width: std.meta.Int(.unsigned, size),
            ) void {
                const bits: IntT = (@as(IntT, (1 << width) - 1)) << offset;
                addr.raw |= bits;
            }

            pub fn clearRaw(
                comptime addr: *volatile Self,
                comptime offset: std.meta.Int(.unsigned, size),
                comptime width: std.meta.Int(.unsigned, size),
            ) void {
                const mask: IntT = ~((@as(IntT, (1 << width) - 1)) << offset);
                addr.raw &= mask;
            }

            pub fn toggleRaw(
                comptime addr: *volatile Self,
                comptime offset: std.meta.Int(.unsigned, size),
                comptime width: std.meta.Int(.unsigned, size),
            ) void {
                const bits: IntT = (@as(IntT, (1 << width) - 1)) << offset;
                addr.raw ^= bits;
            }

            pub inline fn write(addr: *volatile Self, val: PackedT) void {
                addr.raw = @bitCast(IntT, val);
            }

            pub inline fn modify(addr: *volatile Self, fields: anytype) void {
                var val = read(addr);
                inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
                    @field(val, field.name) = @field(fields, field.name);
                }
                write(addr, val);
            }

            pub inline fn toggle(addr: *volatile Self, fields: anytype) void {
                var val = read(addr);
                inline for (@typeInfo(@TypeOf(fields)).Struct.fields) |field| {
                    @field(val, @tagName(field.default_value.?)) = !@field(val, @tagName(field.default_value.?));
                }
                write(addr, val);
            }
        };
    }
};

pub const interrupt = struct {
    pub const Handler = *const fn () void;

    pub fn unhandled() void {}
};
