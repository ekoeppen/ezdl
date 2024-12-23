const std = @import("std");
const build = @import("../build.zig");

pub const ObjCopyFormat = enum { bin, hex };

pub fn addObjCopyStep(
    b: *std.build.Builder,
    exe: *std.build.LibExeObjStep,
    format: std.build.ObjCopyStep.RawFormat,
) !*std.build.ObjCopyStep {
    const cmd = exe.addObjCopy(.{ .format = format });
    const objcopy_step = b.step(@tagName(format), "Generate file to be flashed");
    objcopy_step.dependOn(&cmd.step);
    return cmd;
}

const FlashTool = enum { jlink, stlink, stm32flash, dfu_util, mspdebug, avrdude };

const FlashStep = struct {
    builder: *std.build.Builder,
    hex: *std.build.ObjCopyStep,
    step: std.build.Step,
    tool: FlashTool,
    name: []const u8,
    description: []const u8,
    port: ?[]const u8,
    programmer: ?[]const u8,
    device: []const u8,
    reset_cmd: ?[]const u8,
    reset_wait: ?u32,

    pub fn create(
        builder: *std.build.Builder,
        name: []const u8,
        tool: FlashTool,
        hex: *std.build.ObjCopyStep,
        board: *const build.Board,
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
        const reset_cmd = switch (tool) {
            .dfu_util => builder.option([]const u8, "reset", "Extra commands to run to reset to DFU mode") orelse null,
            else => null,
        };
        const reset_wait = switch (tool) {
            .dfu_util => builder.option(u32, "reset-wait", "Milliseconds to wait after reset before programming") orelse 1_000,
            else => null,
        };
        self.* = FlashStep{
            .builder = builder,
            .step = std.build.Step.init(.{
                .id = .run,
                .name = name,
                .owner = builder,
                .makeFn = make,
            }),
            .hex = hex,
            .tool = tool,
            .device = board.cpu_name,
            .port = port,
            .programmer = programmer,
            .reset_cmd = reset_cmd,
            .reset_wait = reset_wait,
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

    fn make(step: *std.build.Step, prog_node: *std.Progress.Node) !void {
        _ = prog_node;
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
        const path = try self.builder.cache_root.join(self.builder.allocator, &.{"flash.jlink"});
        try self.createCommandFile(path);
        _ = self.builder.exec(&.{ "JLinkExe", path });
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
            self.hex.output_file.getPath(),
        });
    }

    fn makeStm32Flash(self: *FlashStep) !void {
        _ = self.builder.exec(
            &.{ "stm32flash", "-w", self.hex.output_file.getPath(), self.port.? },
        );
    }

    fn makeDfuUtilFlash(self: *FlashStep) !void {
        if (self.reset_cmd) |reset_cmd| {
            const reset_args = args: {
                var n: usize = 0;
                var pieces: [256][]const u8 = undefined;
                var it = std.mem.split(u8, reset_cmd, " ");
                while (it.next()) |arg| : (n += 1) {
                    pieces[n] = arg;
                }
                break :args pieces[0..n];
            };
            var code: u8 = 0;
            _ = self.builder.execAllowFail(reset_args, &code, .Inherit) catch {};
            if (self.reset_wait) |reset_wait| {
                std.time.sleep(reset_wait * 1_000_000);
            }
        }
        const altSep = std.mem.indexOfScalar(u8, self.port.?, ',');
        const dev = if (altSep) |pos| self.port.?[0..pos] else self.port.?;
        const altId = if (altSep) |pos| self.port.?[pos + 1 ..] else "1";
        _ = self.builder.exec(
            &.{
                "dfu-util",
                "-D",
                self.hex.output_file.getPath(),
                "-d",
                dev,
                "-a",
                altId,
                "-R",
            },
        );
    }

    fn makeMspDebugFlash(self: *FlashStep) !void {
        const command = try std.mem.join(
            self.builder.allocator,
            " ",
            &.{ "prog", self.hex.output_file.getPath() },
        );
        _ = self.builder.exec(
            &.{ "mspdebug", self.programmer orelse unreachable, command },
        );
    }

    fn makeAvrdudeFlash(self: *FlashStep) !void {
        const operation = try std.fmt.allocPrint(
            self.builder.allocator,
            "-Uflash:w:{s}",
            .{self.hex.output_file.getPath()},
        );
        _ = self.builder.exec(&[_][]const u8{
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
        });
    }

    fn makeStLinkFlash(self: *FlashStep) !void {
        _ = self.builder.exec(
            &.{
                "st-flash",
                "--reset",
                "--format",
                "ihex",
                "write",
                self.hex.output_file.getPath(),
            },
        );
    }
};

pub fn addFlashStep(
    b: *std.build.Builder,
    hex: *std.build.ObjCopyStep,
    tool: FlashTool,
    board: *const build.Board,
) *FlashStep {
    const flash_cmd = FlashStep.create(b, "flash", tool, hex, board);
    flash_cmd.step.dependOn(&hex.step);
    b.step(flash_cmd.name, flash_cmd.description).dependOn(&flash_cmd.step);
    return flash_cmd;
}

const StatsStep = struct {
    builder: *std.build.Builder,
    file_source: std.Build.FileSource,
    step: std.build.Step,
    const sections: []const []const u8 = &.{
        ".vectors",
        ".text",
        ".data",
        ".bss",
    };

    fn create(
        b: *std.build.Builder,
        file_source: std.Build.FileSource,
    ) *StatsStep {
        const self = b.allocator.create(StatsStep) catch unreachable;
        self.* = .{
            .builder = b,
            .file_source = file_source,
            .step = std.build.Step.init(.{
                .id = .run,
                .name = "stats",
                .owner = b,
                .makeFn = make,
            }),
        };
        return self;
    }

    fn make(step: *std.build.Step, prog_node: *std.Progress.Node) !void {
        _ = prog_node;
        const self = @fieldParentPtr(StatsStep, "step", step);
        const path = self.file_source.getPath(self.builder);
        var file = try std.fs.cwd().openFile(path, .{});
        defer file.close();
        const elf_hdr = try std.elf.Header.read(file);
        const stringtab = blk: {
            var section_headers = elf_hdr.section_header_iterator(&file);
            var section_counter: usize = 0;
            while (section_counter < elf_hdr.shstrndx) : (section_counter += 1) {
                _ = (try section_headers.next()).?;
            }
            const header = (try section_headers.next()).?;
            const buffer = try self.builder.allocator.alloc(u8, @intCast(usize, header.sh_size));
            const num_read = try file.preadAll(buffer, header.sh_offset);
            if (num_read != buffer.len) return error.EndOfStream;
            break :blk buffer;
        };

        var section_headers = elf_hdr.section_header_iterator(&file);
        std.log.info("Section sizes for {s}:", .{std.fs.path.basename(path)});
        while (try section_headers.next()) |section| {
            const name = std.mem.span(@ptrCast([*:0]const u8, &stringtab[section.sh_name]));
            for (sections) |s| {
                if (std.ascii.eqlIgnoreCase(s, name)) {
                    std.log.info("{s: <10}: {d}", .{ name, section.sh_size });
                    break;
                }
            }
        }
    }
};

pub fn addStatsStep(b: *std.build.Builder, exe: *std.build.CompileStep) *StatsStep {
    const stats_cmd = StatsStep.create(b, exe.getOutputSource());
    stats_cmd.step.dependOn(&exe.step);
    b.step("stats", "Print file statistics").dependOn(&stats_cmd.step);
    return stats_cmd;
}
