const std = @import("std");

const board = @import("board");
const accept = @import("accept");
const build_info = @import("build_info");
const writer = board.usart.writer();

const Nrf24 = @import("ezdl").drivers.nrf24.Nrf24;

const nrf24 = Nrf24(board.spi, board.cs, board.nrf24.ce, board.nrf24.irq);

var line: [16]u8 = undefined;

fn acceptMinimal() []u8 {
    while (true) {
        switch (accept.handleMinimal(board.usart.send, board.usart.receive())) {
            .accepted => |accepted| return accepted,
            else => {},
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
    .{ .name = "regs", .description = "Print NRF24 registers", .command = regs },
    .{ .name = "init", .description = "Re-initialize NRF24", .command = init },
};

fn help() !void {
    _ = try writer.write("Commands: \n");
    for (commands) |command| {
        _ = try writer.print("{s}: {s}\n", .{ command.name, command.description });
    }
}

fn regs() !void {
    _ = try nrf24.printRegisters(writer);
}

fn init() !void {
    nrf24.init();
    nrf24.setChannel(70);
}

fn handleInput(buffer: []const u8) anyerror!void {
    var args = std.mem.split(u8, buffer, " ");
    const cmd = args.first();
    for (commands) |command| {
        if (std.ascii.eqlIgnoreCase(command.name, cmd)) {
            try command.command();
            break;
        }
    }
}

pub fn run() !void {
    _ = try writer.write("\n---- NRF24 Example -----------------------------------\n");
    _ = try writer.print("---- Built: {s} from {s}\n\n", .{
        build_info.build_time,
        build_info.commit,
    });
    try help();
    _ = try writer.write("\n");
    while (true) {
        _ = try writer.write("> ");
        accept.init(&line);
        const cmd = acceptMinimal();
        _ = try writer.write("\n");
        _ = try handleInput(cmd);
    }
}

pub export fn main() void {
    board.init();
    board.led.init();

    board.tx.init();
    board.rx.init();
    board.usart.init();

    board.sck.init();
    board.sdo.init();
    board.sdi.init();
    board.cs.init();
    board.spi.init();

    board.nrf24.ce.init();
    board.nrf24.irq.init();

    board.cs.set();
    nrf24.init();
    nrf24.setChannel(70);
    if (run()) {} else |_| {}
}
