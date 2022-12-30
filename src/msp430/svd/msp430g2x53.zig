pub const target = .{
    .cpu_arch = .msp430,
    .cpu_model = .{ .explicit = &(@import("std").Target.msp430.cpu.msp430) },
    .os_tag = .freestanding,
};

pub fn Register(comptime R: type, comptime Backing: type) type {
    return RegisterRW(R, R, Backing);
}

pub fn RegisterRW(comptime Read: type, comptime Write: type, comptime Backing: type) type {
    return struct {
        raw_ptr: *volatile Backing,

        const Self = @This();

        pub fn init(address: usize) Self {
            return Self{ .raw_ptr = @intToPtr(*volatile Backing, address) };
        }

        pub fn initRange(address: usize, comptime dim_increment: usize, comptime num_registers: usize) [num_registers]Self {
            var registers: [num_registers]Self = undefined;
            var i: usize = 0;
            while (i < num_registers) : (i += 1) {
                registers[i] = Self.init(address + (i * dim_increment));
            }
            return registers;
        }

        pub fn read(self: Self) Read {
            return @bitCast(Read, self.raw_ptr.*);
        }

        pub fn write(self: Self, value: Write) void {
            const aligned: Write align(@alignOf(Backing)) = value;
            self.raw_ptr.* = @ptrCast(*const Backing, &aligned).*;
        }

        pub fn modify(self: Self, new_value: anytype) void {
            if (Read != Write) {
                @compileError("Can't modify because read and write types for this register aren't the same.");
            }
            var old_value = self.read();
            const info = @typeInfo(@TypeOf(new_value));
            inline for (info.Struct.fields) |field| {
                @field(old_value, field.name) = @field(new_value, field.name);
            }
            self.write(old_value);
        }

        pub fn read_raw(self: Self) Backing {
            return self.raw_ptr.*;
        }

        pub fn write_raw(self: Self, value: Backing) void {
            self.raw_ptr.* = value;
        }

        pub fn default_read_value(_: Self) Read {
            return Read{};
        }

        pub fn default_write_value(_: Self) Write {
            return Write{};
        }
    };
}

pub const device_name = "MSP430G2553";
pub const device_revision = "0.2.0";
pub const device_description = "unknown";

pub const WDT = struct {
    const base_address = 0x0120;
    const WDTCTL_val = packed struct {
        WDTISx: u2 = 0,
        WDTSSEL: u1 = 0,
        WDTCNTCL: u1 = 0,
        WDTTMSEL: u1 = 0,
        WDTNMI: u1 = 0,
        WDTNMIES: u1 = 0,
        WDTHOLD: u1 = 0,
        WDTPW: u8 = 0x69,
    };
    pub const WDTCTL = Register(WDTCTL_val, u16).init(base_address + 0x0);
};

pub const P1 = struct {
    const base_address = 0x0020;
    const IN_val = packed struct {
        PIN0: u1 = 0,
        PIN1: u1 = 0,
        PIN2: u1 = 0,
        PIN3: u1 = 0,
        PIN4: u1 = 0,
        PIN5: u1 = 0,
        PIN6: u1 = 0,
        PIN7: u1 = 0,
    };
    pub const IN = Register(IN_val, u8).init(base_address + 0x0);
    const OUT_val = packed struct {
        PIN0: u1 = 0,
        PIN1: u1 = 0,
        PIN2: u1 = 0,
        PIN3: u1 = 0,
        PIN4: u1 = 0,
        PIN5: u1 = 0,
        PIN6: u1 = 0,
        PIN7: u1 = 0,
    };
    pub const OUT = Register(OUT_val, u8).init(base_address + 0x1);
    const DIR_val = packed struct {
        PIN0: u1 = 0,
        PIN1: u1 = 0,
        PIN2: u1 = 0,
        PIN3: u1 = 0,
        PIN4: u1 = 0,
        PIN5: u1 = 0,
        PIN6: u1 = 0,
        PIN7: u1 = 0,
    };
    pub const DIR = Register(DIR_val, u8).init(base_address + 0x2);
};
