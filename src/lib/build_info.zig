const std = @import("std");
const DateTime = @import("DateTime.zig");

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    const file = try std.fs.cwd().createFile("zig-cache/build_info.zig", .{
        .truncate = true,
    });
    const git = try std.ChildProcess.exec(.{
        .argv = &.{ "git", "rev-parse", "--short", "HEAD" },
        .allocator = allocator,
    });
    var now = DateTime{};
    now.set(@intCast(u64, std.time.timestamp()));
    _ = try file.writer().print(
        \\pub const build_time = "{s}Z";
        \\pub const commit = "{s}";
        \\
    , .{ now, git.stdout[0..7] });
    defer file.close();
}
