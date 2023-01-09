const std = @import("std");
const ezdl = @import("ezdl.zig");

pub const ObjCopyFormat = enum { bin, hex };

const ObjCopyStep = struct {
    builder: *std.build.Builder,
    exe: *std.build.LibExeObjStep,
    step: std.build.Step,
    out_name: []const u8,
    out_path: []const u8,
    format: ObjCopyFormat,

    pub fn create(
        builder: *std.build.Builder,
        step_name: []const u8,
        exe: *std.build.LibExeObjStep,
        format: ObjCopyFormat,
    ) !*ObjCopyStep {
        const base_name = std.fs.path.stem(exe.name);
        const self = builder.allocator.create(ObjCopyStep) catch unreachable;
        const name = builder.fmt("{s}.{s}", .{ base_name, if (format == .bin) "bin" else "hex" });
        const path = builder.pathJoin(&.{ builder.cache_root, name });
        self.* = ObjCopyStep{
            .builder = builder,
            .exe = exe,
            .step = std.build.Step.init(.run, step_name, builder.allocator, make),
            .format = format,
            .out_name = name,
            .out_path = path,
        };
        return self;
    }

    pub fn make(step: *std.build.Step) !void {
        const self = @fieldParentPtr(ObjCopyStep, "step", step);
        const in_path = self.exe.installed_path orelse //
            self.exe.getOutputSource().getPath(self.builder);
        try std.build.RunStep.runCommand(&[_][]const u8{
            "objcopy",
            "-O",
            if (self.format == .bin) "binary" else "ihex",
            in_path,
            self.out_path,
        }, self.builder, null, .ignore, .ignore, .Close, null, null, false);
    }
};

pub fn addObjCopyStep(
    b: *std.build.Builder,
    exe: *std.build.LibExeObjStep,
    format: ObjCopyFormat,
) !*ObjCopyStep {
    const objcopy_cmd = try ObjCopyStep.create(b, "objcopy", exe, format);
    objcopy_cmd.step.dependOn(b.getInstallStep());
    return objcopy_cmd;
}

const FlashTool = enum { jlink, stlink, stm32flash, dfu_util, mspdebug, avrdude };

const FlashStep = struct {
    builder: *std.build.Builder,
    hex: *ObjCopyStep,
    step: std.build.Step,
    tool: FlashTool,
    name: []const u8,
    description: []const u8,
    port: ?[]const u8,
    programmer: ?[]const u8,
    board: *const ezdl.Board,

    pub fn create(
        builder: *std.build.Builder,
        name: []const u8,
        tool: FlashTool,
        hex: *ObjCopyStep,
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
            .board = board,
            .hex = hex,
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
            else => {},
        }
    }

    fn makeJLink(self: *FlashStep) !void {
        const path = self.builder.pathJoin(&.{ self.builder.cache_root, "flash.jlink" });
        try self.createCommandFile(path);
        try std.build.RunStep.runCommand(&[_][]const u8{
            "JLinkExe",
            path,
        }, self.builder, null, .ignore, .ignore, .Close, null, null, false);
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
            self.board.device,
            self.hex.out_path,
        });
    }

    fn makeStm32Flash(self: *FlashStep) !void {
        try std.build.RunStep.runCommand(
            &[_][]const u8{ "stm32flash", "-w", self.hex.out_path, self.port.? },
            self.builder,
            0,
            .ignore,
            .ignore,
            .Close,
            null,
            null,
            true,
        );
    }

    fn makeDfuUtilFlash(self: *FlashStep) !void {
        const altSep = std.mem.indexOfScalar(u8, self.port.?, ',');
        const dev = if (altSep) |pos| self.port.?[0..pos] else self.port.?;
        const altId = if (altSep) |pos| self.port.?[pos + 1 ..] else "1";
        try std.build.RunStep.runCommand(
            &[_][]const u8{ "dfu-util", "-D", self.hex.out_path, "-d", dev, "-a", altId },
            self.builder,
            0,
            .ignore,
            .ignore,
            .Close,
            null,
            null,
            true,
        );
    }

    fn makeMspDebugFlash(self: *FlashStep) !void {
        const command = try std.mem.join(self.builder.allocator, " ", &.{
            "prog",
            self.hex.out_path,
        });
        try std.build.RunStep.runCommand(
            &[_][]const u8{ "mspdebug", self.programmer orelse unreachable, command },
            self.builder,
            0,
            .ignore,
            .ignore,
            .Close,
            null,
            null,
            true,
        );
    }

    fn makeAvrdudeFlash(self: *FlashStep) !void {
        const operation = try std.fmt.allocPrint(
            self.builder.allocator,
            "-Uflash:w:{s}",
            .{self.hex.out_path},
        );
        try std.build.RunStep.runCommand(
            &[_][]const u8{
                "avrdude",
                "-v",
                "-c",
                self.programmer orelse unreachable,
                "-C",
                "avrdude.conf",
                "-p",
                self.board.device,
                "-P",
                self.port orelse unreachable,
                operation,
            },
            self.builder,
            0,
            .ignore,
            .ignore,
            .Close,
            null,
            null,
            true,
        );
    }
};

pub fn addFlashStep(
    b: *std.build.Builder,
    hex: *ObjCopyStep,
    tool: FlashTool,
    board: *const ezdl.Board,
) *FlashStep {
    const flash_cmd = FlashStep.create(b, "flash", tool, hex, board);
    flash_cmd.step.dependOn(&hex.step);
    b.step(flash_cmd.name, flash_cmd.description).dependOn(&flash_cmd.step);
    return flash_cmd;
}
