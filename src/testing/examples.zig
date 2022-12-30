const std = @import("std");

const Example = struct {
    name: []const u8,
    path: []const u8,
    boards: []const []const u8,
};

const mode_arg = "-Drelease-small";

var allocator: std.mem.Allocator = undefined;
const stdout = std.io.getStdOut().writer();
const stderr = std.io.getStdErr().writer();

fn compile(example: *const Example, board: []const u8) !bool {
    var success = true;
    const start = std.time.milliTimestamp();
    const case_name = if (board.len > 0) try std.mem.join(allocator, " - ", &.{
        example.name,
        std.fs.path.basename(board),
    }) else example.name;
    const result = try std.ChildProcess.exec(.{
        .argv = if (board.len == 0) &.{
            "zig",
            "build",
            mode_arg,
        } else &.{
            "zig",
            "build",
            mode_arg,
            try std.mem.join(allocator, "", &.{ "-Dboard=", board }),
        },
        .allocator = allocator,
        .cwd = example.path,
    });
    _ = try stdout.print("<testcase name=\"{s}\" file=\"{s}/main.zig\" time=\"{d:.3}\">\n", .{
        case_name,
        example.path,
        @intToFloat(f64, std.time.milliTimestamp() - start) / 1000,
    });
    if (result.term.Exited != 0) {
        _ = try stdout.print("<failure>{s}</failure>\n", .{result.stderr});
        success = false;
    }
    _ = try stdout.write("</testcase>\n");
    return success;
}

fn compileExample(example: *const Example) !bool {
    if (example.boards.len == 0) {
        return try compile(example, "");
    }
    var success = true;
    for (example.boards) |board| {
        success = try compile(example, board) and success;
    }
    return success;
}

pub fn compileExamples() !bool {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    allocator = arena.allocator();
    defer arena.deinit();
    var success = true;
    if (std.os.argv.len < 2) return error.ArgumentMissing;
    const path_arg = std.os.argv[1];
    const file = try std.fs.cwd().createFile(path_arg[0..std.mem.len(path_arg)], .{
        .read = true,
        .truncate = false,
    });
    defer file.close();
    const json_string = try file.reader().readAllAlloc(allocator, 128 * 1024);
    var tokens = std.json.TokenStream.init(json_string);
    const examples = try std.json.parse([]Example, &tokens, .{ .allocator = allocator });
    _ = try stdout.write("<testsuites name=\"Compilation\"><testsuite name=\"Example compilation\">\n");
    for (examples) |example| {
        success = try compileExample(&example) and success;
    }
    _ = try stdout.write("</testsuite></testsuites>\n");
    return success;
}

pub fn main() !void {
    const success = compileExamples() catch |e| {
        _ = try stderr.print("Error {}\n", .{e});
        std.os.exit(1);
    };
    if (!success) {
        std.os.exit(2);
    }
}
