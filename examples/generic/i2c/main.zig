const std = @import("std");
const ezdl = @import("ezdl");
const board = @import("board");
const accept = @import("accept");
const build_info = @import("build_info");

const writer = board.console.writer();
const reader = board.console.reader();

var line: [16]u8 = undefined;

fn writeByte(byte: u8) void {
    board.console.send(byte);
}

fn readByte() u8 {
    return board.console.receive();
}

fn readLine() []u8 {
    while (true) {
        switch (accept.handleMinimal(writeByte, readByte())) {
            .accepted => |accepted| return accepted,
            else => {},
        }
    }
}

fn handleInput(buffer: []const u8) anyerror!void {
    var args = std.mem.split(u8, buffer, " ");
    const cmd = args.first();
    for (commands) |command| {
        if (std.ascii.eqlIgnoreCase(command.name, cmd)) {
            command.command() catch |err| {
                _ = try writer.print("Error: {}\n", .{err});
            };
            break;
        }
    }
}

const Command = struct {
    name: []const u8,
    description: []const u8,
    command: *const fn () anyerror!void,
};

const commands: []const Command = &.{
    .{ .name = "help", .description = "Print commands", .command = help },
    .{ .name = "scan", .description = "Scan I2C bus", .command = scan },
    .{ .name = "reset", .description = "Reset board", .command = reset },
    .{ .name = "bus-reset", .description = "Reset bus", .command = busReset },
};

fn help() !void {
    _ = try writer.writeAll("Commands: \n");
    for (commands) |command| {
        _ = try writer.print("{s}: {s}\n", .{ command.name, command.description });
    }
}

fn scan() !void {
    _ = try writer.writeAll("Scanning...\n");
    var addr: u7 = 0;
    while (addr < 127) : (addr += 1) {
        if (board.i2c.checkTarget(addr)) {
            _ = try writer.print("{x:02} \n", .{addr});
        }
    }
    _ = try writer.writeAll("Done.\n");
}

fn reset() !void {
    board.mcu.reset();
}

fn busReset() !void {
    board.sda_pp.init();
    var n: u32 = 9;
    while (n > 0) : (n -= 1) {
        board.sda_pp.clear();
        delay(7000);
        board.sda_pp.set();
        delay(7000);
    }

    board.sda.init();
}

pub fn run() !void {
    try busReset();
    board.scl.init();
    board.sda.init();
    board.i2c.init();

    while (!board.console.dtr()) {
        board.mcu.sleep();
    }
    _ = try writer.writeAll("\n---- I2C Tests -----------------------------------\n");
    _ = try writer.print("---- Built: {s} from {s}\n", .{
        build_info.build_time,
        build_info.commit,
    });
    while (true) {
        _ = try writer.writeAll("> ");
        accept.init(&line);
        const cmd = readLine();
        _ = try writer.writeAll("\n");
        _ = try handleInput(cmd);
    }
}

fn delay(count: u32) void {
    var n: u32 = count;
    while (n > 0) : (n -= 1) asm volatile ("");
}

pub export fn main() void {
    board.init();
    board.led.init();
    board.tx.init();
    board.rx.init();

    board.console.init();
    board.led.set();

    if (run()) {} else |_| {
        board.mcu.reset();
    }
}
