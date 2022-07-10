const std = @import("std");
const ezdl = @import("../ezdl.zig");

pub const boards = @import("boards/boards.zig");
pub const mcus = @import("mcus/mcus.zig");
pub const svd = @import("svd/svd.zig");

pub fn pkg_file() []const u8 {
    return @src().file;
}

pub fn pkg_path() []const u8 {
    return (@import("std").fs.path.dirname(pkg_file()) orelse "") ++ "/";
}

pub fn addExecutable(
    b: *std.build.Builder,
    elf_name: []const u8,
    main_file: []const u8,
    comptime board: type,
) anyerror!*std.build.LibExeObjStep {
    const exe = try ezdl.addExecutable(b, elf_name, main_file, board);
    const startup = b.addObject("startup", pkg_path() ++ "startup.zig");
    startup.setTarget(board.mcu.target);
    startup.setBuildMode(b.standardReleaseOptions());
    exe.addLibPath(pkg_path());
    exe.addObject(startup);
    return exe;
}
