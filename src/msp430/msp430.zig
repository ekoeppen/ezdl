const std = @import("std");
const ezdl = @import("../ezdl.zig");
const build_tools = @import("../build_tools.zig");

pub const mcus = @import("mcus/mcus.zig");
pub const svd = @import("svd/svd.zig");

pub fn addExecutable(
    b: *std.build.Builder,
    elf_name: []const u8,
    main_file: []const u8,
    board_path: []const u8,
) anyerror!*std.build.LibExeObjStep {
    const board = try ezdl.readBoardSettings(b, b.pathJoin(&.{ board_path, "board.json" }));
    const board_file = b.pathJoin(&.{ board_path, "board.zig" });
    const exe = try ezdl.addExecutable(
        b,
        elf_name,
        main_file,
        &board,
        board_file,
        ezdl.mkPath(@src(), ""),
    );

    const hex_cmd = try build_tools.addObjCopyStep(b, exe, .hex);
    _ = build_tools.addFlashStep(b, hex_cmd, .mspdebug, &board);
    return exe;
}
