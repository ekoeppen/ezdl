const std = @import("std");
const ezdl = @import("../ezdl.zig");

pub const mcus = @import("mcus/mcus.zig");
pub const svd = @import("svd/svd.zig");

pub const nucleo_f072rb = @import("nucleo_f072rb.zig");
pub const nucleo_f103rb = @import("nucleo_f103rb.zig");
pub const nucleo_l010rb = @import("nucleo_l010rb.zig");
pub const rfm69_modem = @import("rfm69_modem.zig");

pub fn addExecutable(
    b: *std.build.Builder,
    elf_name: []const u8,
    main_file: []const u8,
    comptime board: type,
) anyerror!*std.build.LibExeObjStep {
    const exe = try ezdl.addExecutable(b, elf_name, main_file, board);
    const startup = b.addObject("startup", ezdl.mkPath(@src(), "startup.zig"));
    startup.setTarget(board.mcu.target);
    startup.setBuildMode(b.standardReleaseOptions());
    exe.addLibPath(ezdl.mkPath(@src(), ""));
    exe.addObject(startup);
    return exe;
}
