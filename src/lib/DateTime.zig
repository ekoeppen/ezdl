const std = @import("std");
const epoch = std.time.epoch;

const DateTime = @This();

year: epoch.Year = 2000,
month: epoch.Month = .jan,
day: u5 = 1,
hour: u5 = 0,
minute: u6 = 0,
second: u6 = 0,

pub fn timeAddSeconds(self: *DateTime, seconds: u32) void {
    var s: u32 = @as(u32, self.second) + seconds;
    var m: u32 = @as(u32, self.minute);
    var h: u32 = @as(u32, self.hour);
    if (s >= 60) {
        m += s / 60;
        s = s % 60;
        if (m >= 60) {
            h += m / 60;
            m = m % 60;
            if (h >= 24) {
                h = h % 24;
            }
        }
    }
    self.second = @truncate(u6, s);
    self.minute = @truncate(u6, m);
    self.hour = @truncate(u5, h);
}

pub fn dateEquals(self: *const DateTime, other: *const DateTime) bool {
    return self.year == other.year and self.month == other.month and self.day == other.day;
}

pub fn timeEquals(self: *const DateTime, other: *const DateTime) bool {
    return self.hour == other.hour and self.minute == other.minute and self.second == other.second;
}

pub fn equals(self: *const DateTime, other: *const DateTime) bool {
    return dateEquals(self, other) and timeEquals(self, other);
}

fn addPadding(
    where: std.fmt.Alignment,
    width: usize,
    options: std.fmt.FormatOptions,
    writer: anytype,
) !void {
    if (options.alignment != where) {
        return;
    }
    if (options.width) |w| {
        if (w < width) {
            return;
        }
        var padding = w - width;
        while (padding > 0) {
            try writer.writeByte(options.fill);
            padding -= 1;
        }
    }
}

pub fn format(
    value: DateTime,
    comptime fmt: []const u8,
    options: std.fmt.FormatOptions,
    writer: anytype,
) !void {
    _ = options;
    switch (fmt[0]) {
        's' => {
            try addPadding(.Left, 19, options, writer);
            _ = try writer.print("{d:0>4}-{d:0>2}-{d:0>2}T{d:0>2}:{d:0>2}:{d:0>2}", .{
                value.year,
                value.month.numeric(),
                value.day,
                value.hour,
                value.minute,
                value.second,
            });
            try addPadding(.Right, 19, options, writer);
        },
        't' => {
            try addPadding(.Left, 8, options, writer);
            _ = try writer.print("{d:0>2}:{d:0>2}:{d:0>2}", .{
                value.hour,
                value.minute,
                value.second,
            });
            try addPadding(.Right, 8, options, writer);
        },
        'd' => {
            try addPadding(.Left, 10, options, writer);
            _ = try writer.print("{d:0>4}-{d:0>2}-{d:0>2}", .{
                value.year,
                value.month.numeric(),
                value.day,
            });
            try addPadding(.Right, 10, options, writer);
        },
        else => @compileError("Invalid format for DateTime"),
    }
}

test "Formatting" {
    const d: DateTime = .{};
    var b: [80]u8 = undefined;
    const full = try std.fmt.bufPrint(&b, "{s}", .{d});
    try std.testing.expect(std.mem.eql(u8, full, "2000-01-01T00:00:00"));
    const time = try std.fmt.bufPrint(&b, "{t}", .{d});
    try std.testing.expect(std.mem.eql(u8, time, "00:00:00"));
    const date = try std.fmt.bufPrint(&b, "{d}", .{d});
    try std.testing.expect(std.mem.eql(u8, date, "2000-01-01"));
    const fullRight30 = try std.fmt.bufPrint(&b, "{s:.<30}", .{d});
    try std.testing.expect(std.mem.eql(u8, fullRight30, "...........2000-01-01T00:00:00"));
    const timeRight30 = try std.fmt.bufPrint(&b, "{t: <30}", .{d});
    try std.testing.expect(std.mem.eql(u8, timeRight30, "                      00:00:00"));
    const dateRight30 = try std.fmt.bufPrint(&b, "{d: <30}", .{d});
    try std.testing.expect(std.mem.eql(u8, dateRight30, "                    2000-01-01"));
    const dateLeft30 = try std.fmt.bufPrint(&b, "{d: >30}", .{d});
    try std.testing.expect(std.mem.eql(u8, dateLeft30, "2000-01-01                    "));
    const fullRight10 = try std.fmt.bufPrint(&b, "{s: >10}", .{d});
    try std.testing.expect(std.mem.eql(u8, fullRight10, "2000-01-01T00:00:00"));
}

test "Comparison" {
    try std.testing.expect(equals(&DateTime{}, &DateTime{}));
    try std.testing.expect(timeEquals(&DateTime{ .day = 1 }, &DateTime{ .day = 2 }));
    try std.testing.expect(dateEquals(&DateTime{ .hour = 1 }, &DateTime{ .hour = 2 }));
}

test "Adding seconds" {
    var d: DateTime = .{};
    d.timeAddSeconds(10);
    try std.testing.expect(d.equals(&DateTime{ .second = 10 }));
    d.timeAddSeconds(30);
    try std.testing.expect(d.equals(&DateTime{ .second = 40 }));
    d.timeAddSeconds(40);
    try std.testing.expect(d.equals(&DateTime{ .minute = 1, .second = 20 }));
    d.timeAddSeconds(3600);
    try std.testing.expect(d.equals(&DateTime{ .hour = 1, .minute = 1, .second = 20 }));
    d.timeAddSeconds(86400);
    try std.testing.expect(d.equals(&DateTime{ .hour = 1, .minute = 1, .second = 20 }));
}
