const std = @import("std");
const ezdl = @import("ezdl.zig");

pub const ObjCopyFormat = enum { bin, hex };

pub fn addObjCopyStep(
    b: *std.build.Builder,
    exe: *std.build.LibExeObjStep,
    format: ObjCopyFormat,
) !*std.build.InstallRawStep {
    const name = if (format == .bin) "bin" else "hex";
    const file_name = b.fmt("{s}.{s}", .{ std.fs.path.stem(exe.name), name });
    const cmd = b.addInstallRaw(exe, file_name, .{});
    const objcopy_step = b.step(name, "Generate file to be flashed");
    objcopy_step.dependOn(&cmd.step);
    return cmd;
}

const FlashTool = enum { jlink, stlink, stm32flash, dfu_util, mspdebug, avrdude };

const FlashStep = struct {
    builder: *std.build.Builder,
    step: std.build.Step,
    tool: FlashTool,
    name: []const u8,
    description: []const u8,
    dest_path: []const u8,
    port: ?[]const u8,
    programmer: ?[]const u8,
    device: []const u8,

    pub fn create(
        builder: *std.build.Builder,
        name: []const u8,
        tool: FlashTool,
        hex: *std.build.InstallRawStep,
        board: *const ezdl.Board,
    ) *FlashStep {
        const self = builder.allocator.create(FlashStep) catch unreachable;
        const port = switch (tool) {
            .stm32flash => builder.option([]const u8, "port", "Serial port for flashing via stm32flash") orelse board.port,
            .dfu_util => builder.option([]const u8, "dfu-id", "Device signature for flashing via dfu-util (vid:pid,alt-id)") orelse board.port,
            .avrdude => builder.option([]const u8, "port", "Serial port for flashing via avrdude") orelse board.port,
            else => null,
        };
        const programmer = switch (tool) {
            .mspdebug => builder.option([]const u8, "programmer", "Driver for flashing via mspdebug") orelse board.programmer,
            .avrdude => builder.option([]const u8, "programmer", "Driver for flashing via avrdude") orelse board.programmer,
            else => null,
        };
        self.* = FlashStep{
            .builder = builder,
            .step = std.build.Step.init(.run, name, builder.allocator, make),
            .tool = tool,
            .device = board.device,
            .dest_path = builder.getInstallPath(hex.dest_dir, hex.dest_filename),
            .port = port,
            .programmer = programmer,
            .name = switch (tool) {
                .jlink => "flash-jlink",
                .stlink => "flash-stlink",
                .stm32flash => "stm32flash",
                .dfu_util => "dfu-util",
                .mspdebug => "flash-mspdebug",
                .avrdude => "flash-avrdude",
            },
            .description = switch (tool) {
                .jlink => "Flash using JLink",
                .stlink => "Flash using stlink",
                .stm32flash => "Flash using stm32flash",
                .dfu_util => "Flash using dfu-util",
                .mspdebug => "Flash using mspdebug",
                .avrdude => "Flash using avrdude",
            },
        };
        return self;
    }

    fn make(step: *std.build.Step) !void {
        const self = @fieldParentPtr(FlashStep, "step", step);
        switch (self.tool) {
            .jlink => try self.makeJLink(),
            .stm32flash => try self.makeStm32Flash(),
            .dfu_util => try self.makeDfuUtilFlash(),
            .mspdebug => try self.makeMspDebugFlash(),
            .avrdude => try self.makeAvrdudeFlash(),
            .stlink => try self.makeStLinkFlash(),
        }
    }

    fn makeJLink(self: *FlashStep) !void {
        const path = self.builder.pathJoin(&.{ self.builder.cache_root, "flash.jlink" });
        try self.createCommandFile(path);
        _ = try self.builder.execFromStep(&.{ "JLinkExe", path }, &self.step);
    }

    fn createCommandFile(self: *FlashStep, path: []const u8) !void {
        const file = try std.fs.cwd().createFile(path, .{ .truncate = true });
        defer file.close();
        _ = try file.writer().print(
            \\si 1
            \\device {s}
            \\speed 4000
            \\con
            \\loadfile {s}
            \\r
            \\g
            \\quit
            \\
        , .{
            self.device,
            self.dest_path,
        });
    }

    fn makeStm32Flash(self: *FlashStep) !void {
        _ = try self.builder.execFromStep(
            &.{ "stm32flash", "-w", self.dest_path, self.port.? },
            &self.step,
        );
    }

    fn makeDfuUtilFlash(self: *FlashStep) !void {
        const altSep = std.mem.indexOfScalar(u8, self.port.?, ',');
        const dev = if (altSep) |pos| self.port.?[0..pos] else self.port.?;
        const altId = if (altSep) |pos| self.port.?[pos + 1 ..] else "1";
        _ = try self.builder.execFromStep(
            &.{ "dfu-util", "-D", self.dest_path, "-d", dev, "-a", altId },
            &self.step,
        );
    }

    fn makeMspDebugFlash(self: *FlashStep) !void {
        const command = try std.mem.join(self.builder.allocator, " ", &.{ "prog", self.dest_path });
        _ = try self.builder.execFromStep(
            &.{ "mspdebug", self.programmer orelse unreachable, command },
            &self.step,
        );
    }

    fn makeAvrdudeFlash(self: *FlashStep) !void {
        const operation = try std.fmt.allocPrint(
            self.builder.allocator,
            "-Uflash:w:{s}",
            .{self.dest_path},
        );
        _ = try self.builder.execFromStep(&[_][]const u8{
            "avrdude",
            "-v",
            "-c",
            self.programmer orelse unreachable,
            "-C",
            "avrdude.conf",
            "-p",
            self.device,
            "-P",
            self.port orelse unreachable,
            operation,
        }, &self.step);
    }

    fn makeStLinkFlash(self: *FlashStep) !void {
        _ = try self.builder.execFromStep(
            &.{ "st-flash", "--reset", "--format", "ihex", "write", self.dest_path },
            &self.step,
        );
    }
};

pub fn addFlashStep(
    b: *std.build.Builder,
    hex: *std.build.InstallRawStep,
    tool: FlashTool,
    board: *const ezdl.Board,
) *FlashStep {
    const flash_cmd = FlashStep.create(b, "flash", tool, hex, board);
    flash_cmd.step.dependOn(&hex.step);
    b.step(flash_cmd.name, flash_cmd.description).dependOn(&flash_cmd.step);
    return flash_cmd;
}
