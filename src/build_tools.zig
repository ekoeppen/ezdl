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

const FlashTool = enum { jlink, stlink, stm32flash, mspdebug };

const FlashStep = struct {
    builder: *std.build.Builder,
    hex: *ObjCopyStep,
    step: std.build.Step,
    tool: FlashTool,
    name: []const u8,
    description: []const u8,
    device: []const u8,
    port: ?[]const u8,

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
            .mspdebug => builder.option([]const u8, "port", "Driver for flashing via mspdebug") orelse board.port,
            else => null,
        };
        self.* = FlashStep{
            .builder = builder,
            .step = std.build.Step.init(.run, name, builder.allocator, make),
            .tool = tool,
            .device = board.device,
            .hex = hex,
            .port = port,
            .name = switch (tool) {
                .jlink => "flash-jlink",
                .stlink => "flash-stlink",
                .stm32flash => "stm32flash",
                .mspdebug => "flash-mspdebug",
            },
            .description = switch (tool) {
                .jlink => "Flash using JLink",
                .stlink => "Flash using stlink",
                .stm32flash => "Flash using stm32flash",
                .mspdebug => "Flash using mspdebug",
            },
        };
        return self;
    }

    fn make(step: *std.build.Step) !void {
        const self = @fieldParentPtr(FlashStep, "step", step);
        switch (self.tool) {
            .jlink => try self.makeJLink(),
            .stm32flash => try self.makeStm32Flash(),
            .mspdebug => try self.makeMspDebugFlash(),
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
            self.device,
            self.hex.out_path,
        });
    }

    fn makeStm32Flash(self: *FlashStep) !void {
        try std.build.RunStep.runCommand(
            &[_][]const u8{ "stm32flash", "-w", self.hex.out_path, self.port.? },
            self.builder,
            null,
            .ignore,
            .ignore,
            .Close,
            null,
            null,
            false,
        );
    }
    fn makeMspDebugFlash(self: *FlashStep) !void {
        const command = try std.mem.join(self.builder.allocator, " ", &.{
            "load",
            self.hex.out_path,
        });
        try std.build.RunStep.runCommand(
            &[_][]const u8{ "mspdebug", self.port.?, command },
            self.builder,
            null,
            .ignore,
            .ignore,
            .Close,
            null,
            null,
            false,
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
