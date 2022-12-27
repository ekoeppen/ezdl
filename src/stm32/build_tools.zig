const std = @import("std");

pub fn baseName(path: []const u8) []const u8 {
    const ext_len = std.fs.path.extension(path).len;
    return if (ext_len == 0) path else path[0 .. path.len - ext_len];
}

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
        const base_name = baseName(exe.name);
        const self = builder.allocator.create(ObjCopyStep) catch unreachable;
        const name = try std.fmt.allocPrint(builder.allocator, "{s}.{s}", .{
            base_name,
            if (format == .bin) "bin" else "hex",
        });
        const path = try std.fmt.allocPrint(builder.allocator, "{s}/{s}", .{
            builder.cache_root,
            name,
        });
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
        const in_path = self.exe.installed_path orelse self.exe.getOutputSource().getPath(self.builder);
        try std.build.RunStep.runCommand(&[_][]const u8{
            "arm-none-eabi-objcopy",
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

const JLinkFlashStep = struct {
    builder: *std.build.Builder,
    hex: *ObjCopyStep,
    step: std.build.Step,
    device: []const u8 = undefined,

    pub fn create(
        builder: *std.build.Builder,
        name: []const u8,
        hex: *ObjCopyStep,
        comptime board: type,
    ) *JLinkFlashStep {
        const self = builder.allocator.create(JLinkFlashStep) catch unreachable;
        self.* = JLinkFlashStep{
            .builder = builder,
            .step = std.build.Step.init(.run, name, builder.allocator, make),
            .device = board.device,
            .hex = hex,
        };
        return self;
    }

    pub fn make(step: *std.build.Step) !void {
        const self = @fieldParentPtr(JLinkFlashStep, "step", step);
        var path_buf: [std.os.PATH_MAX]u8 = undefined;
        const path = try std.fmt.bufPrint(&path_buf, "{s}/flash.jlink", .{self.builder.cache_root});
        try self.createCommandFile(path);
        std.debug.print("Flashing {s} to {s} via {s}...\n", .{
            self.hex.out_path,
            self.device,
            path,
        });
        try std.build.RunStep.runCommand(&[_][]const u8{
            "JLinkExe",
            path,
        }, self.builder, null, .ignore, .ignore, .Close, null, null, false);
    }

    fn createCommandFile(self: *JLinkFlashStep, path: []const u8) !void {
        const file = try std.fs.cwd().createFile(path, .{ .truncate = true });
        defer file.close();
        _ = try file.writer().print("si 1\ndevice {s}\nspeed 4000\ncont\nloadfile {s}\nr\ng\nquit\n", .{
            self.device,
            self.hex.out_path,
        });
    }
};

pub fn addJlinkFlashStep(
    b: *std.build.Builder,
    hex: *ObjCopyStep,
    comptime board: type,
) *JLinkFlashStep {
    const flash_cmd = JLinkFlashStep.create(b, "flash-jlink", hex, board);
    flash_cmd.step.dependOn(&hex.step);
    b.step("flash-jlink", "Flash using JLink").dependOn(&flash_cmd.step);
    return flash_cmd;
}
