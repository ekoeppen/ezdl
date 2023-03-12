const std = @import("std");

pub const RecordType = enum(u8) {
    data = 0x00,
    eof = 0x01,
    extended_segment_addr = 0x02,
    start_segment_addr = 0x03,
    extended_linear_addr = 0x04,
    start_linear_addr = 0x05,
};

pub const Record = union(RecordType) {
    data: struct { address: u16, data: []u8 },
    eof,
    extended_segment_addr: u16,
    start_segment_addr: u32,
    extended_linear_addr: u16,
    start_linear_addr: u32,
};

fn u16FromBigEndian(d: []const u8) u16 {
    return (@as(u16, d[0]) << 8) + @as(u16, d[1]);
}

fn u32FromBigEndian(d: []const u8) u32 {
    return (@as(u32, d[0]) << 24) + (@as(u32, d[1]) << 16) + (@as(u32, d[2]) << 8) + @as(u32, d[3]);
}

pub fn decode(data: []const u8, buffer: []u8) !Record {
    if (data[0] != ':') return error.InvalidStartCode;
    if (data.len < 11) return error.InsufficientData;
    const record_type = (try std.fmt.hexToBytes(buffer, data[7..9]))[0];
    const len = (try std.fmt.hexToBytes(buffer, data[1..3]))[0];
    const checksum = (try std.fmt.hexToBytes(buffer, data[9 + len * 2 .. 9 + len * 2 + 2]))[0];
    var calculated_checksum: u8 = 0;
    for (try std.fmt.hexToBytes(buffer, data[1 .. 9 + len * 2])) |d| calculated_checksum +%= d;
    calculated_checksum = (calculated_checksum ^ 255) + 1;
    if (calculated_checksum != checksum) return error.ChecksumError;
    const address = u16FromBigEndian(try std.fmt.hexToBytes(buffer, data[3..7]));
    const d = try std.fmt.hexToBytes(buffer, data[9 .. 9 + len * 2]);
    return switch (record_type) {
        0 => .{ .data = .{ .address = address, .data = d } },
        1 => .eof,
        2 => .{ .extended_segment_addr = u16FromBigEndian(d) },
        3 => .{ .start_segment_addr = u32FromBigEndian(d) },
        4 => .{ .extended_linear_addr = u16FromBigEndian(d) },
        5 => .{ .start_linear_addr = u32FromBigEndian(d) },
        else => return error.InvalidRecordType,
    };
}

test "Decode data" {
    var buffer: [256]u8 = undefined;
    var record: Record = undefined;
    record = try decode(":00000001FF", &buffer);
    try std.testing.expect(record.eof == {});
    record = try decode(":0B0010006164647265737320676170A7", &buffer);
    try std.testing.expect(record.data.address == 0x0010);
    record = try decode(":020000021200EA", &buffer);
    try std.testing.expect(record.extended_segment_addr == 0x1200);
    record = try decode(":0400000300003800C1", &buffer);
    try std.testing.expect(record.start_segment_addr == 0x00003800);
    record = try decode(":020000040800F2", &buffer);
    try std.testing.expect(record.extended_linear_addr == 0x0800);
    record = try decode(":04000005000000CD2A", &buffer);
    try std.testing.expect(record.start_linear_addr == 0x000000cd);
    var line: [256]u8 = undefined;
    const d = ":1020000000100020A5200000312200003122000035";
    std.mem.copy(u8, &line, d);
    record = try decode(&line, &buffer);
    try std.testing.expect(record.data.address == 0x2000);
}
