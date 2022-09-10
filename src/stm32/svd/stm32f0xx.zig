pub fn Register(comptime R: type) type {
    return RegisterRW(R, R);
}

pub fn RegisterRW(comptime Read: type, comptime Write: type) type {
    return struct {
        raw_ptr: *volatile u32,

        const Self = @This();

        pub fn init(address: usize) Self {
            return Self{ .raw_ptr = @intToPtr(*volatile u32, address) };
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
            // Forcing the alignment is a workaround for stores through
            // volatile pointers generating multiple loads and stores.
            // This is necessary for LLVM to generate code that can successfully
            // modify MMIO registers that only allow word-sized stores.
            // https://github.com/ziglang/zig/issues/8981#issuecomment-854911077
            const aligned: Write align(4) = value;
            self.raw_ptr.* = @ptrCast(*const u32, &aligned).*;
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

        pub fn read_raw(self: Self) u32 {
            return self.raw_ptr.*;
        }

        pub fn write_raw(self: Self, value: u32) void {
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

pub const device_name = "STM32F0xx";
pub const device_revision = "1.0";
pub const device_description = "STM32F0xx";

/// cyclic redundancy check calculation
pub const CRC = struct {

const base_address = 0x40023000;
/// DR
const DR_val = packed struct {
/// DR [0:31]
/// Data register bits
DR: u32 = 4294967295,
};
/// Data register
pub const DR = Register(DR_val).init(base_address + 0x0);

/// IDR
const IDR_val = packed struct {
/// IDR [0:7]
/// General-purpose 8-bit data register
IDR: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Independent data register
pub const IDR = Register(IDR_val).init(base_address + 0x4);

/// CR
const CR_val = packed struct {
/// RESET [0:0]
/// reset bit
RESET: u1 = 0,
/// unused [1:4]
_unused1: u4 = 0,
/// REV_IN [5:6]
/// Reverse input data
REV_IN: u2 = 0,
/// REV_OUT [7:7]
/// Reverse output data
REV_OUT: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Control register
pub const CR = Register(CR_val).init(base_address + 0x8);

/// INIT
const INIT_val = packed struct {
/// INIT [0:31]
/// Programmable initial CRC
INIT: u32 = 4294967295,
};
/// Initial CRC value
pub const INIT = Register(INIT_val).init(base_address + 0xc);
};

/// General-purpose I/Os
pub const GPIOF = struct {

const base_address = 0x48001400;
/// MODER
const MODER_val = packed struct {
/// MODER0 [0:1]
/// Port x configuration bits (y =
MODER0: u2 = 0,
/// MODER1 [2:3]
/// Port x configuration bits (y =
MODER1: u2 = 0,
/// MODER2 [4:5]
/// Port x configuration bits (y =
MODER2: u2 = 0,
/// MODER3 [6:7]
/// Port x configuration bits (y =
MODER3: u2 = 0,
/// MODER4 [8:9]
/// Port x configuration bits (y =
MODER4: u2 = 0,
/// MODER5 [10:11]
/// Port x configuration bits (y =
MODER5: u2 = 0,
/// MODER6 [12:13]
/// Port x configuration bits (y =
MODER6: u2 = 0,
/// MODER7 [14:15]
/// Port x configuration bits (y =
MODER7: u2 = 0,
/// MODER8 [16:17]
/// Port x configuration bits (y =
MODER8: u2 = 0,
/// MODER9 [18:19]
/// Port x configuration bits (y =
MODER9: u2 = 0,
/// MODER10 [20:21]
/// Port x configuration bits (y =
MODER10: u2 = 0,
/// MODER11 [22:23]
/// Port x configuration bits (y =
MODER11: u2 = 0,
/// MODER12 [24:25]
/// Port x configuration bits (y =
MODER12: u2 = 0,
/// MODER13 [26:27]
/// Port x configuration bits (y =
MODER13: u2 = 0,
/// MODER14 [28:29]
/// Port x configuration bits (y =
MODER14: u2 = 0,
/// MODER15 [30:31]
/// Port x configuration bits (y =
MODER15: u2 = 0,
};
/// GPIO port mode register
pub const MODER = Register(MODER_val).init(base_address + 0x0);

/// OTYPER
const OTYPER_val = packed struct {
/// OT0 [0:0]
/// Port x configuration bit 0
OT0: u1 = 0,
/// OT1 [1:1]
/// Port x configuration bit 1
OT1: u1 = 0,
/// OT2 [2:2]
/// Port x configuration bit 2
OT2: u1 = 0,
/// OT3 [3:3]
/// Port x configuration bit 3
OT3: u1 = 0,
/// OT4 [4:4]
/// Port x configuration bit 4
OT4: u1 = 0,
/// OT5 [5:5]
/// Port x configuration bit 5
OT5: u1 = 0,
/// OT6 [6:6]
/// Port x configuration bit 6
OT6: u1 = 0,
/// OT7 [7:7]
/// Port x configuration bit 7
OT7: u1 = 0,
/// OT8 [8:8]
/// Port x configuration bit 8
OT8: u1 = 0,
/// OT9 [9:9]
/// Port x configuration bit 9
OT9: u1 = 0,
/// OT10 [10:10]
/// Port x configuration bit
OT10: u1 = 0,
/// OT11 [11:11]
/// Port x configuration bit
OT11: u1 = 0,
/// OT12 [12:12]
/// Port x configuration bit
OT12: u1 = 0,
/// OT13 [13:13]
/// Port x configuration bit
OT13: u1 = 0,
/// OT14 [14:14]
/// Port x configuration bit
OT14: u1 = 0,
/// OT15 [15:15]
/// Port x configuration bit
OT15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output type register
pub const OTYPER = Register(OTYPER_val).init(base_address + 0x4);

/// OSPEEDR
const OSPEEDR_val = packed struct {
/// OSPEEDR0 [0:1]
/// Port x configuration bits (y =
OSPEEDR0: u2 = 0,
/// OSPEEDR1 [2:3]
/// Port x configuration bits (y =
OSPEEDR1: u2 = 0,
/// OSPEEDR2 [4:5]
/// Port x configuration bits (y =
OSPEEDR2: u2 = 0,
/// OSPEEDR3 [6:7]
/// Port x configuration bits (y =
OSPEEDR3: u2 = 0,
/// OSPEEDR4 [8:9]
/// Port x configuration bits (y =
OSPEEDR4: u2 = 0,
/// OSPEEDR5 [10:11]
/// Port x configuration bits (y =
OSPEEDR5: u2 = 0,
/// OSPEEDR6 [12:13]
/// Port x configuration bits (y =
OSPEEDR6: u2 = 0,
/// OSPEEDR7 [14:15]
/// Port x configuration bits (y =
OSPEEDR7: u2 = 0,
/// OSPEEDR8 [16:17]
/// Port x configuration bits (y =
OSPEEDR8: u2 = 0,
/// OSPEEDR9 [18:19]
/// Port x configuration bits (y =
OSPEEDR9: u2 = 0,
/// OSPEEDR10 [20:21]
/// Port x configuration bits (y =
OSPEEDR10: u2 = 0,
/// OSPEEDR11 [22:23]
/// Port x configuration bits (y =
OSPEEDR11: u2 = 0,
/// OSPEEDR12 [24:25]
/// Port x configuration bits (y =
OSPEEDR12: u2 = 0,
/// OSPEEDR13 [26:27]
/// Port x configuration bits (y =
OSPEEDR13: u2 = 0,
/// OSPEEDR14 [28:29]
/// Port x configuration bits (y =
OSPEEDR14: u2 = 0,
/// OSPEEDR15 [30:31]
/// Port x configuration bits (y =
OSPEEDR15: u2 = 0,
};
/// GPIO port output speed
pub const OSPEEDR = Register(OSPEEDR_val).init(base_address + 0x8);

/// PUPDR
const PUPDR_val = packed struct {
/// PUPDR0 [0:1]
/// Port x configuration bits (y =
PUPDR0: u2 = 0,
/// PUPDR1 [2:3]
/// Port x configuration bits (y =
PUPDR1: u2 = 0,
/// PUPDR2 [4:5]
/// Port x configuration bits (y =
PUPDR2: u2 = 0,
/// PUPDR3 [6:7]
/// Port x configuration bits (y =
PUPDR3: u2 = 0,
/// PUPDR4 [8:9]
/// Port x configuration bits (y =
PUPDR4: u2 = 0,
/// PUPDR5 [10:11]
/// Port x configuration bits (y =
PUPDR5: u2 = 0,
/// PUPDR6 [12:13]
/// Port x configuration bits (y =
PUPDR6: u2 = 0,
/// PUPDR7 [14:15]
/// Port x configuration bits (y =
PUPDR7: u2 = 0,
/// PUPDR8 [16:17]
/// Port x configuration bits (y =
PUPDR8: u2 = 0,
/// PUPDR9 [18:19]
/// Port x configuration bits (y =
PUPDR9: u2 = 0,
/// PUPDR10 [20:21]
/// Port x configuration bits (y =
PUPDR10: u2 = 0,
/// PUPDR11 [22:23]
/// Port x configuration bits (y =
PUPDR11: u2 = 0,
/// PUPDR12 [24:25]
/// Port x configuration bits (y =
PUPDR12: u2 = 0,
/// PUPDR13 [26:27]
/// Port x configuration bits (y =
PUPDR13: u2 = 0,
/// PUPDR14 [28:29]
/// Port x configuration bits (y =
PUPDR14: u2 = 0,
/// PUPDR15 [30:31]
/// Port x configuration bits (y =
PUPDR15: u2 = 0,
};
/// GPIO port pull-up/pull-down
pub const PUPDR = Register(PUPDR_val).init(base_address + 0xc);

/// IDR
const IDR_val = packed struct {
/// IDR0 [0:0]
/// Port input data (y =
IDR0: u1 = 0,
/// IDR1 [1:1]
/// Port input data (y =
IDR1: u1 = 0,
/// IDR2 [2:2]
/// Port input data (y =
IDR2: u1 = 0,
/// IDR3 [3:3]
/// Port input data (y =
IDR3: u1 = 0,
/// IDR4 [4:4]
/// Port input data (y =
IDR4: u1 = 0,
/// IDR5 [5:5]
/// Port input data (y =
IDR5: u1 = 0,
/// IDR6 [6:6]
/// Port input data (y =
IDR6: u1 = 0,
/// IDR7 [7:7]
/// Port input data (y =
IDR7: u1 = 0,
/// IDR8 [8:8]
/// Port input data (y =
IDR8: u1 = 0,
/// IDR9 [9:9]
/// Port input data (y =
IDR9: u1 = 0,
/// IDR10 [10:10]
/// Port input data (y =
IDR10: u1 = 0,
/// IDR11 [11:11]
/// Port input data (y =
IDR11: u1 = 0,
/// IDR12 [12:12]
/// Port input data (y =
IDR12: u1 = 0,
/// IDR13 [13:13]
/// Port input data (y =
IDR13: u1 = 0,
/// IDR14 [14:14]
/// Port input data (y =
IDR14: u1 = 0,
/// IDR15 [15:15]
/// Port input data (y =
IDR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port input data register
pub const IDR = Register(IDR_val).init(base_address + 0x10);

/// ODR
const ODR_val = packed struct {
/// ODR0 [0:0]
/// Port output data (y =
ODR0: u1 = 0,
/// ODR1 [1:1]
/// Port output data (y =
ODR1: u1 = 0,
/// ODR2 [2:2]
/// Port output data (y =
ODR2: u1 = 0,
/// ODR3 [3:3]
/// Port output data (y =
ODR3: u1 = 0,
/// ODR4 [4:4]
/// Port output data (y =
ODR4: u1 = 0,
/// ODR5 [5:5]
/// Port output data (y =
ODR5: u1 = 0,
/// ODR6 [6:6]
/// Port output data (y =
ODR6: u1 = 0,
/// ODR7 [7:7]
/// Port output data (y =
ODR7: u1 = 0,
/// ODR8 [8:8]
/// Port output data (y =
ODR8: u1 = 0,
/// ODR9 [9:9]
/// Port output data (y =
ODR9: u1 = 0,
/// ODR10 [10:10]
/// Port output data (y =
ODR10: u1 = 0,
/// ODR11 [11:11]
/// Port output data (y =
ODR11: u1 = 0,
/// ODR12 [12:12]
/// Port output data (y =
ODR12: u1 = 0,
/// ODR13 [13:13]
/// Port output data (y =
ODR13: u1 = 0,
/// ODR14 [14:14]
/// Port output data (y =
ODR14: u1 = 0,
/// ODR15 [15:15]
/// Port output data (y =
ODR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output data register
pub const ODR = Register(ODR_val).init(base_address + 0x14);

/// BSRR
const BSRR_val = packed struct {
/// BS0 [0:0]
/// Port x set bit y (y=
BS0: u1 = 0,
/// BS1 [1:1]
/// Port x set bit y (y=
BS1: u1 = 0,
/// BS2 [2:2]
/// Port x set bit y (y=
BS2: u1 = 0,
/// BS3 [3:3]
/// Port x set bit y (y=
BS3: u1 = 0,
/// BS4 [4:4]
/// Port x set bit y (y=
BS4: u1 = 0,
/// BS5 [5:5]
/// Port x set bit y (y=
BS5: u1 = 0,
/// BS6 [6:6]
/// Port x set bit y (y=
BS6: u1 = 0,
/// BS7 [7:7]
/// Port x set bit y (y=
BS7: u1 = 0,
/// BS8 [8:8]
/// Port x set bit y (y=
BS8: u1 = 0,
/// BS9 [9:9]
/// Port x set bit y (y=
BS9: u1 = 0,
/// BS10 [10:10]
/// Port x set bit y (y=
BS10: u1 = 0,
/// BS11 [11:11]
/// Port x set bit y (y=
BS11: u1 = 0,
/// BS12 [12:12]
/// Port x set bit y (y=
BS12: u1 = 0,
/// BS13 [13:13]
/// Port x set bit y (y=
BS13: u1 = 0,
/// BS14 [14:14]
/// Port x set bit y (y=
BS14: u1 = 0,
/// BS15 [15:15]
/// Port x set bit y (y=
BS15: u1 = 0,
/// BR0 [16:16]
/// Port x set bit y (y=
BR0: u1 = 0,
/// BR1 [17:17]
/// Port x reset bit y (y =
BR1: u1 = 0,
/// BR2 [18:18]
/// Port x reset bit y (y =
BR2: u1 = 0,
/// BR3 [19:19]
/// Port x reset bit y (y =
BR3: u1 = 0,
/// BR4 [20:20]
/// Port x reset bit y (y =
BR4: u1 = 0,
/// BR5 [21:21]
/// Port x reset bit y (y =
BR5: u1 = 0,
/// BR6 [22:22]
/// Port x reset bit y (y =
BR6: u1 = 0,
/// BR7 [23:23]
/// Port x reset bit y (y =
BR7: u1 = 0,
/// BR8 [24:24]
/// Port x reset bit y (y =
BR8: u1 = 0,
/// BR9 [25:25]
/// Port x reset bit y (y =
BR9: u1 = 0,
/// BR10 [26:26]
/// Port x reset bit y (y =
BR10: u1 = 0,
/// BR11 [27:27]
/// Port x reset bit y (y =
BR11: u1 = 0,
/// BR12 [28:28]
/// Port x reset bit y (y =
BR12: u1 = 0,
/// BR13 [29:29]
/// Port x reset bit y (y =
BR13: u1 = 0,
/// BR14 [30:30]
/// Port x reset bit y (y =
BR14: u1 = 0,
/// BR15 [31:31]
/// Port x reset bit y (y =
BR15: u1 = 0,
};
/// GPIO port bit set/reset
pub const BSRR = Register(BSRR_val).init(base_address + 0x18);

/// LCKR
const LCKR_val = packed struct {
/// LCK0 [0:0]
/// Port x lock bit y (y=
LCK0: u1 = 0,
/// LCK1 [1:1]
/// Port x lock bit y (y=
LCK1: u1 = 0,
/// LCK2 [2:2]
/// Port x lock bit y (y=
LCK2: u1 = 0,
/// LCK3 [3:3]
/// Port x lock bit y (y=
LCK3: u1 = 0,
/// LCK4 [4:4]
/// Port x lock bit y (y=
LCK4: u1 = 0,
/// LCK5 [5:5]
/// Port x lock bit y (y=
LCK5: u1 = 0,
/// LCK6 [6:6]
/// Port x lock bit y (y=
LCK6: u1 = 0,
/// LCK7 [7:7]
/// Port x lock bit y (y=
LCK7: u1 = 0,
/// LCK8 [8:8]
/// Port x lock bit y (y=
LCK8: u1 = 0,
/// LCK9 [9:9]
/// Port x lock bit y (y=
LCK9: u1 = 0,
/// LCK10 [10:10]
/// Port x lock bit y (y=
LCK10: u1 = 0,
/// LCK11 [11:11]
/// Port x lock bit y (y=
LCK11: u1 = 0,
/// LCK12 [12:12]
/// Port x lock bit y (y=
LCK12: u1 = 0,
/// LCK13 [13:13]
/// Port x lock bit y (y=
LCK13: u1 = 0,
/// LCK14 [14:14]
/// Port x lock bit y (y=
LCK14: u1 = 0,
/// LCK15 [15:15]
/// Port x lock bit y (y=
LCK15: u1 = 0,
/// LCKK [16:16]
/// Port x lock bit y
LCKK: u1 = 0,
/// unused [17:31]
_unused17: u7 = 0,
_unused24: u8 = 0,
};
/// GPIO port configuration lock
pub const LCKR = Register(LCKR_val).init(base_address + 0x1c);

/// AFRL
const AFRL_val = packed struct {
/// AFRL0 [0:3]
/// Alternate function selection for port x
AFRL0: u4 = 0,
/// AFRL1 [4:7]
/// Alternate function selection for port x
AFRL1: u4 = 0,
/// AFRL2 [8:11]
/// Alternate function selection for port x
AFRL2: u4 = 0,
/// AFRL3 [12:15]
/// Alternate function selection for port x
AFRL3: u4 = 0,
/// AFRL4 [16:19]
/// Alternate function selection for port x
AFRL4: u4 = 0,
/// AFRL5 [20:23]
/// Alternate function selection for port x
AFRL5: u4 = 0,
/// AFRL6 [24:27]
/// Alternate function selection for port x
AFRL6: u4 = 0,
/// AFRL7 [28:31]
/// Alternate function selection for port x
AFRL7: u4 = 0,
};
/// GPIO alternate function low
pub const AFRL = Register(AFRL_val).init(base_address + 0x20);

/// AFRH
const AFRH_val = packed struct {
/// AFRH8 [0:3]
/// Alternate function selection for port x
AFRH8: u4 = 0,
/// AFRH9 [4:7]
/// Alternate function selection for port x
AFRH9: u4 = 0,
/// AFRH10 [8:11]
/// Alternate function selection for port x
AFRH10: u4 = 0,
/// AFRH11 [12:15]
/// Alternate function selection for port x
AFRH11: u4 = 0,
/// AFRH12 [16:19]
/// Alternate function selection for port x
AFRH12: u4 = 0,
/// AFRH13 [20:23]
/// Alternate function selection for port x
AFRH13: u4 = 0,
/// AFRH14 [24:27]
/// Alternate function selection for port x
AFRH14: u4 = 0,
/// AFRH15 [28:31]
/// Alternate function selection for port x
AFRH15: u4 = 0,
};
/// GPIO alternate function high
pub const AFRH = Register(AFRH_val).init(base_address + 0x24);

/// BRR
const BRR_val = packed struct {
/// BR0 [0:0]
/// Port x Reset bit y
BR0: u1 = 0,
/// BR1 [1:1]
/// Port x Reset bit y
BR1: u1 = 0,
/// BR2 [2:2]
/// Port x Reset bit y
BR2: u1 = 0,
/// BR3 [3:3]
/// Port x Reset bit y
BR3: u1 = 0,
/// BR4 [4:4]
/// Port x Reset bit y
BR4: u1 = 0,
/// BR5 [5:5]
/// Port x Reset bit y
BR5: u1 = 0,
/// BR6 [6:6]
/// Port x Reset bit y
BR6: u1 = 0,
/// BR7 [7:7]
/// Port x Reset bit y
BR7: u1 = 0,
/// BR8 [8:8]
/// Port x Reset bit y
BR8: u1 = 0,
/// BR9 [9:9]
/// Port x Reset bit y
BR9: u1 = 0,
/// BR10 [10:10]
/// Port x Reset bit y
BR10: u1 = 0,
/// BR11 [11:11]
/// Port x Reset bit y
BR11: u1 = 0,
/// BR12 [12:12]
/// Port x Reset bit y
BR12: u1 = 0,
/// BR13 [13:13]
/// Port x Reset bit y
BR13: u1 = 0,
/// BR14 [14:14]
/// Port x Reset bit y
BR14: u1 = 0,
/// BR15 [15:15]
/// Port x Reset bit y
BR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Port bit reset register
pub const BRR = Register(BRR_val).init(base_address + 0x28);
};

/// General-purpose I/Os
pub const GPIOD = struct {

const base_address = 0x48000c00;
/// MODER
const MODER_val = packed struct {
/// MODER0 [0:1]
/// Port x configuration bits (y =
MODER0: u2 = 0,
/// MODER1 [2:3]
/// Port x configuration bits (y =
MODER1: u2 = 0,
/// MODER2 [4:5]
/// Port x configuration bits (y =
MODER2: u2 = 0,
/// MODER3 [6:7]
/// Port x configuration bits (y =
MODER3: u2 = 0,
/// MODER4 [8:9]
/// Port x configuration bits (y =
MODER4: u2 = 0,
/// MODER5 [10:11]
/// Port x configuration bits (y =
MODER5: u2 = 0,
/// MODER6 [12:13]
/// Port x configuration bits (y =
MODER6: u2 = 0,
/// MODER7 [14:15]
/// Port x configuration bits (y =
MODER7: u2 = 0,
/// MODER8 [16:17]
/// Port x configuration bits (y =
MODER8: u2 = 0,
/// MODER9 [18:19]
/// Port x configuration bits (y =
MODER9: u2 = 0,
/// MODER10 [20:21]
/// Port x configuration bits (y =
MODER10: u2 = 0,
/// MODER11 [22:23]
/// Port x configuration bits (y =
MODER11: u2 = 0,
/// MODER12 [24:25]
/// Port x configuration bits (y =
MODER12: u2 = 0,
/// MODER13 [26:27]
/// Port x configuration bits (y =
MODER13: u2 = 0,
/// MODER14 [28:29]
/// Port x configuration bits (y =
MODER14: u2 = 0,
/// MODER15 [30:31]
/// Port x configuration bits (y =
MODER15: u2 = 0,
};
/// GPIO port mode register
pub const MODER = Register(MODER_val).init(base_address + 0x0);

/// OTYPER
const OTYPER_val = packed struct {
/// OT0 [0:0]
/// Port x configuration bit 0
OT0: u1 = 0,
/// OT1 [1:1]
/// Port x configuration bit 1
OT1: u1 = 0,
/// OT2 [2:2]
/// Port x configuration bit 2
OT2: u1 = 0,
/// OT3 [3:3]
/// Port x configuration bit 3
OT3: u1 = 0,
/// OT4 [4:4]
/// Port x configuration bit 4
OT4: u1 = 0,
/// OT5 [5:5]
/// Port x configuration bit 5
OT5: u1 = 0,
/// OT6 [6:6]
/// Port x configuration bit 6
OT6: u1 = 0,
/// OT7 [7:7]
/// Port x configuration bit 7
OT7: u1 = 0,
/// OT8 [8:8]
/// Port x configuration bit 8
OT8: u1 = 0,
/// OT9 [9:9]
/// Port x configuration bit 9
OT9: u1 = 0,
/// OT10 [10:10]
/// Port x configuration bit
OT10: u1 = 0,
/// OT11 [11:11]
/// Port x configuration bit
OT11: u1 = 0,
/// OT12 [12:12]
/// Port x configuration bit
OT12: u1 = 0,
/// OT13 [13:13]
/// Port x configuration bit
OT13: u1 = 0,
/// OT14 [14:14]
/// Port x configuration bit
OT14: u1 = 0,
/// OT15 [15:15]
/// Port x configuration bit
OT15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output type register
pub const OTYPER = Register(OTYPER_val).init(base_address + 0x4);

/// OSPEEDR
const OSPEEDR_val = packed struct {
/// OSPEEDR0 [0:1]
/// Port x configuration bits (y =
OSPEEDR0: u2 = 0,
/// OSPEEDR1 [2:3]
/// Port x configuration bits (y =
OSPEEDR1: u2 = 0,
/// OSPEEDR2 [4:5]
/// Port x configuration bits (y =
OSPEEDR2: u2 = 0,
/// OSPEEDR3 [6:7]
/// Port x configuration bits (y =
OSPEEDR3: u2 = 0,
/// OSPEEDR4 [8:9]
/// Port x configuration bits (y =
OSPEEDR4: u2 = 0,
/// OSPEEDR5 [10:11]
/// Port x configuration bits (y =
OSPEEDR5: u2 = 0,
/// OSPEEDR6 [12:13]
/// Port x configuration bits (y =
OSPEEDR6: u2 = 0,
/// OSPEEDR7 [14:15]
/// Port x configuration bits (y =
OSPEEDR7: u2 = 0,
/// OSPEEDR8 [16:17]
/// Port x configuration bits (y =
OSPEEDR8: u2 = 0,
/// OSPEEDR9 [18:19]
/// Port x configuration bits (y =
OSPEEDR9: u2 = 0,
/// OSPEEDR10 [20:21]
/// Port x configuration bits (y =
OSPEEDR10: u2 = 0,
/// OSPEEDR11 [22:23]
/// Port x configuration bits (y =
OSPEEDR11: u2 = 0,
/// OSPEEDR12 [24:25]
/// Port x configuration bits (y =
OSPEEDR12: u2 = 0,
/// OSPEEDR13 [26:27]
/// Port x configuration bits (y =
OSPEEDR13: u2 = 0,
/// OSPEEDR14 [28:29]
/// Port x configuration bits (y =
OSPEEDR14: u2 = 0,
/// OSPEEDR15 [30:31]
/// Port x configuration bits (y =
OSPEEDR15: u2 = 0,
};
/// GPIO port output speed
pub const OSPEEDR = Register(OSPEEDR_val).init(base_address + 0x8);

/// PUPDR
const PUPDR_val = packed struct {
/// PUPDR0 [0:1]
/// Port x configuration bits (y =
PUPDR0: u2 = 0,
/// PUPDR1 [2:3]
/// Port x configuration bits (y =
PUPDR1: u2 = 0,
/// PUPDR2 [4:5]
/// Port x configuration bits (y =
PUPDR2: u2 = 0,
/// PUPDR3 [6:7]
/// Port x configuration bits (y =
PUPDR3: u2 = 0,
/// PUPDR4 [8:9]
/// Port x configuration bits (y =
PUPDR4: u2 = 0,
/// PUPDR5 [10:11]
/// Port x configuration bits (y =
PUPDR5: u2 = 0,
/// PUPDR6 [12:13]
/// Port x configuration bits (y =
PUPDR6: u2 = 0,
/// PUPDR7 [14:15]
/// Port x configuration bits (y =
PUPDR7: u2 = 0,
/// PUPDR8 [16:17]
/// Port x configuration bits (y =
PUPDR8: u2 = 0,
/// PUPDR9 [18:19]
/// Port x configuration bits (y =
PUPDR9: u2 = 0,
/// PUPDR10 [20:21]
/// Port x configuration bits (y =
PUPDR10: u2 = 0,
/// PUPDR11 [22:23]
/// Port x configuration bits (y =
PUPDR11: u2 = 0,
/// PUPDR12 [24:25]
/// Port x configuration bits (y =
PUPDR12: u2 = 0,
/// PUPDR13 [26:27]
/// Port x configuration bits (y =
PUPDR13: u2 = 0,
/// PUPDR14 [28:29]
/// Port x configuration bits (y =
PUPDR14: u2 = 0,
/// PUPDR15 [30:31]
/// Port x configuration bits (y =
PUPDR15: u2 = 0,
};
/// GPIO port pull-up/pull-down
pub const PUPDR = Register(PUPDR_val).init(base_address + 0xc);

/// IDR
const IDR_val = packed struct {
/// IDR0 [0:0]
/// Port input data (y =
IDR0: u1 = 0,
/// IDR1 [1:1]
/// Port input data (y =
IDR1: u1 = 0,
/// IDR2 [2:2]
/// Port input data (y =
IDR2: u1 = 0,
/// IDR3 [3:3]
/// Port input data (y =
IDR3: u1 = 0,
/// IDR4 [4:4]
/// Port input data (y =
IDR4: u1 = 0,
/// IDR5 [5:5]
/// Port input data (y =
IDR5: u1 = 0,
/// IDR6 [6:6]
/// Port input data (y =
IDR6: u1 = 0,
/// IDR7 [7:7]
/// Port input data (y =
IDR7: u1 = 0,
/// IDR8 [8:8]
/// Port input data (y =
IDR8: u1 = 0,
/// IDR9 [9:9]
/// Port input data (y =
IDR9: u1 = 0,
/// IDR10 [10:10]
/// Port input data (y =
IDR10: u1 = 0,
/// IDR11 [11:11]
/// Port input data (y =
IDR11: u1 = 0,
/// IDR12 [12:12]
/// Port input data (y =
IDR12: u1 = 0,
/// IDR13 [13:13]
/// Port input data (y =
IDR13: u1 = 0,
/// IDR14 [14:14]
/// Port input data (y =
IDR14: u1 = 0,
/// IDR15 [15:15]
/// Port input data (y =
IDR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port input data register
pub const IDR = Register(IDR_val).init(base_address + 0x10);

/// ODR
const ODR_val = packed struct {
/// ODR0 [0:0]
/// Port output data (y =
ODR0: u1 = 0,
/// ODR1 [1:1]
/// Port output data (y =
ODR1: u1 = 0,
/// ODR2 [2:2]
/// Port output data (y =
ODR2: u1 = 0,
/// ODR3 [3:3]
/// Port output data (y =
ODR3: u1 = 0,
/// ODR4 [4:4]
/// Port output data (y =
ODR4: u1 = 0,
/// ODR5 [5:5]
/// Port output data (y =
ODR5: u1 = 0,
/// ODR6 [6:6]
/// Port output data (y =
ODR6: u1 = 0,
/// ODR7 [7:7]
/// Port output data (y =
ODR7: u1 = 0,
/// ODR8 [8:8]
/// Port output data (y =
ODR8: u1 = 0,
/// ODR9 [9:9]
/// Port output data (y =
ODR9: u1 = 0,
/// ODR10 [10:10]
/// Port output data (y =
ODR10: u1 = 0,
/// ODR11 [11:11]
/// Port output data (y =
ODR11: u1 = 0,
/// ODR12 [12:12]
/// Port output data (y =
ODR12: u1 = 0,
/// ODR13 [13:13]
/// Port output data (y =
ODR13: u1 = 0,
/// ODR14 [14:14]
/// Port output data (y =
ODR14: u1 = 0,
/// ODR15 [15:15]
/// Port output data (y =
ODR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output data register
pub const ODR = Register(ODR_val).init(base_address + 0x14);

/// BSRR
const BSRR_val = packed struct {
/// BS0 [0:0]
/// Port x set bit y (y=
BS0: u1 = 0,
/// BS1 [1:1]
/// Port x set bit y (y=
BS1: u1 = 0,
/// BS2 [2:2]
/// Port x set bit y (y=
BS2: u1 = 0,
/// BS3 [3:3]
/// Port x set bit y (y=
BS3: u1 = 0,
/// BS4 [4:4]
/// Port x set bit y (y=
BS4: u1 = 0,
/// BS5 [5:5]
/// Port x set bit y (y=
BS5: u1 = 0,
/// BS6 [6:6]
/// Port x set bit y (y=
BS6: u1 = 0,
/// BS7 [7:7]
/// Port x set bit y (y=
BS7: u1 = 0,
/// BS8 [8:8]
/// Port x set bit y (y=
BS8: u1 = 0,
/// BS9 [9:9]
/// Port x set bit y (y=
BS9: u1 = 0,
/// BS10 [10:10]
/// Port x set bit y (y=
BS10: u1 = 0,
/// BS11 [11:11]
/// Port x set bit y (y=
BS11: u1 = 0,
/// BS12 [12:12]
/// Port x set bit y (y=
BS12: u1 = 0,
/// BS13 [13:13]
/// Port x set bit y (y=
BS13: u1 = 0,
/// BS14 [14:14]
/// Port x set bit y (y=
BS14: u1 = 0,
/// BS15 [15:15]
/// Port x set bit y (y=
BS15: u1 = 0,
/// BR0 [16:16]
/// Port x set bit y (y=
BR0: u1 = 0,
/// BR1 [17:17]
/// Port x reset bit y (y =
BR1: u1 = 0,
/// BR2 [18:18]
/// Port x reset bit y (y =
BR2: u1 = 0,
/// BR3 [19:19]
/// Port x reset bit y (y =
BR3: u1 = 0,
/// BR4 [20:20]
/// Port x reset bit y (y =
BR4: u1 = 0,
/// BR5 [21:21]
/// Port x reset bit y (y =
BR5: u1 = 0,
/// BR6 [22:22]
/// Port x reset bit y (y =
BR6: u1 = 0,
/// BR7 [23:23]
/// Port x reset bit y (y =
BR7: u1 = 0,
/// BR8 [24:24]
/// Port x reset bit y (y =
BR8: u1 = 0,
/// BR9 [25:25]
/// Port x reset bit y (y =
BR9: u1 = 0,
/// BR10 [26:26]
/// Port x reset bit y (y =
BR10: u1 = 0,
/// BR11 [27:27]
/// Port x reset bit y (y =
BR11: u1 = 0,
/// BR12 [28:28]
/// Port x reset bit y (y =
BR12: u1 = 0,
/// BR13 [29:29]
/// Port x reset bit y (y =
BR13: u1 = 0,
/// BR14 [30:30]
/// Port x reset bit y (y =
BR14: u1 = 0,
/// BR15 [31:31]
/// Port x reset bit y (y =
BR15: u1 = 0,
};
/// GPIO port bit set/reset
pub const BSRR = Register(BSRR_val).init(base_address + 0x18);

/// LCKR
const LCKR_val = packed struct {
/// LCK0 [0:0]
/// Port x lock bit y (y=
LCK0: u1 = 0,
/// LCK1 [1:1]
/// Port x lock bit y (y=
LCK1: u1 = 0,
/// LCK2 [2:2]
/// Port x lock bit y (y=
LCK2: u1 = 0,
/// LCK3 [3:3]
/// Port x lock bit y (y=
LCK3: u1 = 0,
/// LCK4 [4:4]
/// Port x lock bit y (y=
LCK4: u1 = 0,
/// LCK5 [5:5]
/// Port x lock bit y (y=
LCK5: u1 = 0,
/// LCK6 [6:6]
/// Port x lock bit y (y=
LCK6: u1 = 0,
/// LCK7 [7:7]
/// Port x lock bit y (y=
LCK7: u1 = 0,
/// LCK8 [8:8]
/// Port x lock bit y (y=
LCK8: u1 = 0,
/// LCK9 [9:9]
/// Port x lock bit y (y=
LCK9: u1 = 0,
/// LCK10 [10:10]
/// Port x lock bit y (y=
LCK10: u1 = 0,
/// LCK11 [11:11]
/// Port x lock bit y (y=
LCK11: u1 = 0,
/// LCK12 [12:12]
/// Port x lock bit y (y=
LCK12: u1 = 0,
/// LCK13 [13:13]
/// Port x lock bit y (y=
LCK13: u1 = 0,
/// LCK14 [14:14]
/// Port x lock bit y (y=
LCK14: u1 = 0,
/// LCK15 [15:15]
/// Port x lock bit y (y=
LCK15: u1 = 0,
/// LCKK [16:16]
/// Port x lock bit y
LCKK: u1 = 0,
/// unused [17:31]
_unused17: u7 = 0,
_unused24: u8 = 0,
};
/// GPIO port configuration lock
pub const LCKR = Register(LCKR_val).init(base_address + 0x1c);

/// AFRL
const AFRL_val = packed struct {
/// AFRL0 [0:3]
/// Alternate function selection for port x
AFRL0: u4 = 0,
/// AFRL1 [4:7]
/// Alternate function selection for port x
AFRL1: u4 = 0,
/// AFRL2 [8:11]
/// Alternate function selection for port x
AFRL2: u4 = 0,
/// AFRL3 [12:15]
/// Alternate function selection for port x
AFRL3: u4 = 0,
/// AFRL4 [16:19]
/// Alternate function selection for port x
AFRL4: u4 = 0,
/// AFRL5 [20:23]
/// Alternate function selection for port x
AFRL5: u4 = 0,
/// AFRL6 [24:27]
/// Alternate function selection for port x
AFRL6: u4 = 0,
/// AFRL7 [28:31]
/// Alternate function selection for port x
AFRL7: u4 = 0,
};
/// GPIO alternate function low
pub const AFRL = Register(AFRL_val).init(base_address + 0x20);

/// AFRH
const AFRH_val = packed struct {
/// AFRH8 [0:3]
/// Alternate function selection for port x
AFRH8: u4 = 0,
/// AFRH9 [4:7]
/// Alternate function selection for port x
AFRH9: u4 = 0,
/// AFRH10 [8:11]
/// Alternate function selection for port x
AFRH10: u4 = 0,
/// AFRH11 [12:15]
/// Alternate function selection for port x
AFRH11: u4 = 0,
/// AFRH12 [16:19]
/// Alternate function selection for port x
AFRH12: u4 = 0,
/// AFRH13 [20:23]
/// Alternate function selection for port x
AFRH13: u4 = 0,
/// AFRH14 [24:27]
/// Alternate function selection for port x
AFRH14: u4 = 0,
/// AFRH15 [28:31]
/// Alternate function selection for port x
AFRH15: u4 = 0,
};
/// GPIO alternate function high
pub const AFRH = Register(AFRH_val).init(base_address + 0x24);

/// BRR
const BRR_val = packed struct {
/// BR0 [0:0]
/// Port x Reset bit y
BR0: u1 = 0,
/// BR1 [1:1]
/// Port x Reset bit y
BR1: u1 = 0,
/// BR2 [2:2]
/// Port x Reset bit y
BR2: u1 = 0,
/// BR3 [3:3]
/// Port x Reset bit y
BR3: u1 = 0,
/// BR4 [4:4]
/// Port x Reset bit y
BR4: u1 = 0,
/// BR5 [5:5]
/// Port x Reset bit y
BR5: u1 = 0,
/// BR6 [6:6]
/// Port x Reset bit y
BR6: u1 = 0,
/// BR7 [7:7]
/// Port x Reset bit y
BR7: u1 = 0,
/// BR8 [8:8]
/// Port x Reset bit y
BR8: u1 = 0,
/// BR9 [9:9]
/// Port x Reset bit y
BR9: u1 = 0,
/// BR10 [10:10]
/// Port x Reset bit y
BR10: u1 = 0,
/// BR11 [11:11]
/// Port x Reset bit y
BR11: u1 = 0,
/// BR12 [12:12]
/// Port x Reset bit y
BR12: u1 = 0,
/// BR13 [13:13]
/// Port x Reset bit y
BR13: u1 = 0,
/// BR14 [14:14]
/// Port x Reset bit y
BR14: u1 = 0,
/// BR15 [15:15]
/// Port x Reset bit y
BR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Port bit reset register
pub const BRR = Register(BRR_val).init(base_address + 0x28);
};

/// General-purpose I/Os
pub const GPIOC = struct {

const base_address = 0x48000800;
/// MODER
const MODER_val = packed struct {
/// MODER0 [0:1]
/// Port x configuration bits (y =
MODER0: u2 = 0,
/// MODER1 [2:3]
/// Port x configuration bits (y =
MODER1: u2 = 0,
/// MODER2 [4:5]
/// Port x configuration bits (y =
MODER2: u2 = 0,
/// MODER3 [6:7]
/// Port x configuration bits (y =
MODER3: u2 = 0,
/// MODER4 [8:9]
/// Port x configuration bits (y =
MODER4: u2 = 0,
/// MODER5 [10:11]
/// Port x configuration bits (y =
MODER5: u2 = 0,
/// MODER6 [12:13]
/// Port x configuration bits (y =
MODER6: u2 = 0,
/// MODER7 [14:15]
/// Port x configuration bits (y =
MODER7: u2 = 0,
/// MODER8 [16:17]
/// Port x configuration bits (y =
MODER8: u2 = 0,
/// MODER9 [18:19]
/// Port x configuration bits (y =
MODER9: u2 = 0,
/// MODER10 [20:21]
/// Port x configuration bits (y =
MODER10: u2 = 0,
/// MODER11 [22:23]
/// Port x configuration bits (y =
MODER11: u2 = 0,
/// MODER12 [24:25]
/// Port x configuration bits (y =
MODER12: u2 = 0,
/// MODER13 [26:27]
/// Port x configuration bits (y =
MODER13: u2 = 0,
/// MODER14 [28:29]
/// Port x configuration bits (y =
MODER14: u2 = 0,
/// MODER15 [30:31]
/// Port x configuration bits (y =
MODER15: u2 = 0,
};
/// GPIO port mode register
pub const MODER = Register(MODER_val).init(base_address + 0x0);

/// OTYPER
const OTYPER_val = packed struct {
/// OT0 [0:0]
/// Port x configuration bit 0
OT0: u1 = 0,
/// OT1 [1:1]
/// Port x configuration bit 1
OT1: u1 = 0,
/// OT2 [2:2]
/// Port x configuration bit 2
OT2: u1 = 0,
/// OT3 [3:3]
/// Port x configuration bit 3
OT3: u1 = 0,
/// OT4 [4:4]
/// Port x configuration bit 4
OT4: u1 = 0,
/// OT5 [5:5]
/// Port x configuration bit 5
OT5: u1 = 0,
/// OT6 [6:6]
/// Port x configuration bit 6
OT6: u1 = 0,
/// OT7 [7:7]
/// Port x configuration bit 7
OT7: u1 = 0,
/// OT8 [8:8]
/// Port x configuration bit 8
OT8: u1 = 0,
/// OT9 [9:9]
/// Port x configuration bit 9
OT9: u1 = 0,
/// OT10 [10:10]
/// Port x configuration bit
OT10: u1 = 0,
/// OT11 [11:11]
/// Port x configuration bit
OT11: u1 = 0,
/// OT12 [12:12]
/// Port x configuration bit
OT12: u1 = 0,
/// OT13 [13:13]
/// Port x configuration bit
OT13: u1 = 0,
/// OT14 [14:14]
/// Port x configuration bit
OT14: u1 = 0,
/// OT15 [15:15]
/// Port x configuration bit
OT15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output type register
pub const OTYPER = Register(OTYPER_val).init(base_address + 0x4);

/// OSPEEDR
const OSPEEDR_val = packed struct {
/// OSPEEDR0 [0:1]
/// Port x configuration bits (y =
OSPEEDR0: u2 = 0,
/// OSPEEDR1 [2:3]
/// Port x configuration bits (y =
OSPEEDR1: u2 = 0,
/// OSPEEDR2 [4:5]
/// Port x configuration bits (y =
OSPEEDR2: u2 = 0,
/// OSPEEDR3 [6:7]
/// Port x configuration bits (y =
OSPEEDR3: u2 = 0,
/// OSPEEDR4 [8:9]
/// Port x configuration bits (y =
OSPEEDR4: u2 = 0,
/// OSPEEDR5 [10:11]
/// Port x configuration bits (y =
OSPEEDR5: u2 = 0,
/// OSPEEDR6 [12:13]
/// Port x configuration bits (y =
OSPEEDR6: u2 = 0,
/// OSPEEDR7 [14:15]
/// Port x configuration bits (y =
OSPEEDR7: u2 = 0,
/// OSPEEDR8 [16:17]
/// Port x configuration bits (y =
OSPEEDR8: u2 = 0,
/// OSPEEDR9 [18:19]
/// Port x configuration bits (y =
OSPEEDR9: u2 = 0,
/// OSPEEDR10 [20:21]
/// Port x configuration bits (y =
OSPEEDR10: u2 = 0,
/// OSPEEDR11 [22:23]
/// Port x configuration bits (y =
OSPEEDR11: u2 = 0,
/// OSPEEDR12 [24:25]
/// Port x configuration bits (y =
OSPEEDR12: u2 = 0,
/// OSPEEDR13 [26:27]
/// Port x configuration bits (y =
OSPEEDR13: u2 = 0,
/// OSPEEDR14 [28:29]
/// Port x configuration bits (y =
OSPEEDR14: u2 = 0,
/// OSPEEDR15 [30:31]
/// Port x configuration bits (y =
OSPEEDR15: u2 = 0,
};
/// GPIO port output speed
pub const OSPEEDR = Register(OSPEEDR_val).init(base_address + 0x8);

/// PUPDR
const PUPDR_val = packed struct {
/// PUPDR0 [0:1]
/// Port x configuration bits (y =
PUPDR0: u2 = 0,
/// PUPDR1 [2:3]
/// Port x configuration bits (y =
PUPDR1: u2 = 0,
/// PUPDR2 [4:5]
/// Port x configuration bits (y =
PUPDR2: u2 = 0,
/// PUPDR3 [6:7]
/// Port x configuration bits (y =
PUPDR3: u2 = 0,
/// PUPDR4 [8:9]
/// Port x configuration bits (y =
PUPDR4: u2 = 0,
/// PUPDR5 [10:11]
/// Port x configuration bits (y =
PUPDR5: u2 = 0,
/// PUPDR6 [12:13]
/// Port x configuration bits (y =
PUPDR6: u2 = 0,
/// PUPDR7 [14:15]
/// Port x configuration bits (y =
PUPDR7: u2 = 0,
/// PUPDR8 [16:17]
/// Port x configuration bits (y =
PUPDR8: u2 = 0,
/// PUPDR9 [18:19]
/// Port x configuration bits (y =
PUPDR9: u2 = 0,
/// PUPDR10 [20:21]
/// Port x configuration bits (y =
PUPDR10: u2 = 0,
/// PUPDR11 [22:23]
/// Port x configuration bits (y =
PUPDR11: u2 = 0,
/// PUPDR12 [24:25]
/// Port x configuration bits (y =
PUPDR12: u2 = 0,
/// PUPDR13 [26:27]
/// Port x configuration bits (y =
PUPDR13: u2 = 0,
/// PUPDR14 [28:29]
/// Port x configuration bits (y =
PUPDR14: u2 = 0,
/// PUPDR15 [30:31]
/// Port x configuration bits (y =
PUPDR15: u2 = 0,
};
/// GPIO port pull-up/pull-down
pub const PUPDR = Register(PUPDR_val).init(base_address + 0xc);

/// IDR
const IDR_val = packed struct {
/// IDR0 [0:0]
/// Port input data (y =
IDR0: u1 = 0,
/// IDR1 [1:1]
/// Port input data (y =
IDR1: u1 = 0,
/// IDR2 [2:2]
/// Port input data (y =
IDR2: u1 = 0,
/// IDR3 [3:3]
/// Port input data (y =
IDR3: u1 = 0,
/// IDR4 [4:4]
/// Port input data (y =
IDR4: u1 = 0,
/// IDR5 [5:5]
/// Port input data (y =
IDR5: u1 = 0,
/// IDR6 [6:6]
/// Port input data (y =
IDR6: u1 = 0,
/// IDR7 [7:7]
/// Port input data (y =
IDR7: u1 = 0,
/// IDR8 [8:8]
/// Port input data (y =
IDR8: u1 = 0,
/// IDR9 [9:9]
/// Port input data (y =
IDR9: u1 = 0,
/// IDR10 [10:10]
/// Port input data (y =
IDR10: u1 = 0,
/// IDR11 [11:11]
/// Port input data (y =
IDR11: u1 = 0,
/// IDR12 [12:12]
/// Port input data (y =
IDR12: u1 = 0,
/// IDR13 [13:13]
/// Port input data (y =
IDR13: u1 = 0,
/// IDR14 [14:14]
/// Port input data (y =
IDR14: u1 = 0,
/// IDR15 [15:15]
/// Port input data (y =
IDR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port input data register
pub const IDR = Register(IDR_val).init(base_address + 0x10);

/// ODR
const ODR_val = packed struct {
/// ODR0 [0:0]
/// Port output data (y =
ODR0: u1 = 0,
/// ODR1 [1:1]
/// Port output data (y =
ODR1: u1 = 0,
/// ODR2 [2:2]
/// Port output data (y =
ODR2: u1 = 0,
/// ODR3 [3:3]
/// Port output data (y =
ODR3: u1 = 0,
/// ODR4 [4:4]
/// Port output data (y =
ODR4: u1 = 0,
/// ODR5 [5:5]
/// Port output data (y =
ODR5: u1 = 0,
/// ODR6 [6:6]
/// Port output data (y =
ODR6: u1 = 0,
/// ODR7 [7:7]
/// Port output data (y =
ODR7: u1 = 0,
/// ODR8 [8:8]
/// Port output data (y =
ODR8: u1 = 0,
/// ODR9 [9:9]
/// Port output data (y =
ODR9: u1 = 0,
/// ODR10 [10:10]
/// Port output data (y =
ODR10: u1 = 0,
/// ODR11 [11:11]
/// Port output data (y =
ODR11: u1 = 0,
/// ODR12 [12:12]
/// Port output data (y =
ODR12: u1 = 0,
/// ODR13 [13:13]
/// Port output data (y =
ODR13: u1 = 0,
/// ODR14 [14:14]
/// Port output data (y =
ODR14: u1 = 0,
/// ODR15 [15:15]
/// Port output data (y =
ODR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output data register
pub const ODR = Register(ODR_val).init(base_address + 0x14);

/// BSRR
const BSRR_val = packed struct {
/// BS0 [0:0]
/// Port x set bit y (y=
BS0: u1 = 0,
/// BS1 [1:1]
/// Port x set bit y (y=
BS1: u1 = 0,
/// BS2 [2:2]
/// Port x set bit y (y=
BS2: u1 = 0,
/// BS3 [3:3]
/// Port x set bit y (y=
BS3: u1 = 0,
/// BS4 [4:4]
/// Port x set bit y (y=
BS4: u1 = 0,
/// BS5 [5:5]
/// Port x set bit y (y=
BS5: u1 = 0,
/// BS6 [6:6]
/// Port x set bit y (y=
BS6: u1 = 0,
/// BS7 [7:7]
/// Port x set bit y (y=
BS7: u1 = 0,
/// BS8 [8:8]
/// Port x set bit y (y=
BS8: u1 = 0,
/// BS9 [9:9]
/// Port x set bit y (y=
BS9: u1 = 0,
/// BS10 [10:10]
/// Port x set bit y (y=
BS10: u1 = 0,
/// BS11 [11:11]
/// Port x set bit y (y=
BS11: u1 = 0,
/// BS12 [12:12]
/// Port x set bit y (y=
BS12: u1 = 0,
/// BS13 [13:13]
/// Port x set bit y (y=
BS13: u1 = 0,
/// BS14 [14:14]
/// Port x set bit y (y=
BS14: u1 = 0,
/// BS15 [15:15]
/// Port x set bit y (y=
BS15: u1 = 0,
/// BR0 [16:16]
/// Port x set bit y (y=
BR0: u1 = 0,
/// BR1 [17:17]
/// Port x reset bit y (y =
BR1: u1 = 0,
/// BR2 [18:18]
/// Port x reset bit y (y =
BR2: u1 = 0,
/// BR3 [19:19]
/// Port x reset bit y (y =
BR3: u1 = 0,
/// BR4 [20:20]
/// Port x reset bit y (y =
BR4: u1 = 0,
/// BR5 [21:21]
/// Port x reset bit y (y =
BR5: u1 = 0,
/// BR6 [22:22]
/// Port x reset bit y (y =
BR6: u1 = 0,
/// BR7 [23:23]
/// Port x reset bit y (y =
BR7: u1 = 0,
/// BR8 [24:24]
/// Port x reset bit y (y =
BR8: u1 = 0,
/// BR9 [25:25]
/// Port x reset bit y (y =
BR9: u1 = 0,
/// BR10 [26:26]
/// Port x reset bit y (y =
BR10: u1 = 0,
/// BR11 [27:27]
/// Port x reset bit y (y =
BR11: u1 = 0,
/// BR12 [28:28]
/// Port x reset bit y (y =
BR12: u1 = 0,
/// BR13 [29:29]
/// Port x reset bit y (y =
BR13: u1 = 0,
/// BR14 [30:30]
/// Port x reset bit y (y =
BR14: u1 = 0,
/// BR15 [31:31]
/// Port x reset bit y (y =
BR15: u1 = 0,
};
/// GPIO port bit set/reset
pub const BSRR = Register(BSRR_val).init(base_address + 0x18);

/// LCKR
const LCKR_val = packed struct {
/// LCK0 [0:0]
/// Port x lock bit y (y=
LCK0: u1 = 0,
/// LCK1 [1:1]
/// Port x lock bit y (y=
LCK1: u1 = 0,
/// LCK2 [2:2]
/// Port x lock bit y (y=
LCK2: u1 = 0,
/// LCK3 [3:3]
/// Port x lock bit y (y=
LCK3: u1 = 0,
/// LCK4 [4:4]
/// Port x lock bit y (y=
LCK4: u1 = 0,
/// LCK5 [5:5]
/// Port x lock bit y (y=
LCK5: u1 = 0,
/// LCK6 [6:6]
/// Port x lock bit y (y=
LCK6: u1 = 0,
/// LCK7 [7:7]
/// Port x lock bit y (y=
LCK7: u1 = 0,
/// LCK8 [8:8]
/// Port x lock bit y (y=
LCK8: u1 = 0,
/// LCK9 [9:9]
/// Port x lock bit y (y=
LCK9: u1 = 0,
/// LCK10 [10:10]
/// Port x lock bit y (y=
LCK10: u1 = 0,
/// LCK11 [11:11]
/// Port x lock bit y (y=
LCK11: u1 = 0,
/// LCK12 [12:12]
/// Port x lock bit y (y=
LCK12: u1 = 0,
/// LCK13 [13:13]
/// Port x lock bit y (y=
LCK13: u1 = 0,
/// LCK14 [14:14]
/// Port x lock bit y (y=
LCK14: u1 = 0,
/// LCK15 [15:15]
/// Port x lock bit y (y=
LCK15: u1 = 0,
/// LCKK [16:16]
/// Port x lock bit y
LCKK: u1 = 0,
/// unused [17:31]
_unused17: u7 = 0,
_unused24: u8 = 0,
};
/// GPIO port configuration lock
pub const LCKR = Register(LCKR_val).init(base_address + 0x1c);

/// AFRL
const AFRL_val = packed struct {
/// AFRL0 [0:3]
/// Alternate function selection for port x
AFRL0: u4 = 0,
/// AFRL1 [4:7]
/// Alternate function selection for port x
AFRL1: u4 = 0,
/// AFRL2 [8:11]
/// Alternate function selection for port x
AFRL2: u4 = 0,
/// AFRL3 [12:15]
/// Alternate function selection for port x
AFRL3: u4 = 0,
/// AFRL4 [16:19]
/// Alternate function selection for port x
AFRL4: u4 = 0,
/// AFRL5 [20:23]
/// Alternate function selection for port x
AFRL5: u4 = 0,
/// AFRL6 [24:27]
/// Alternate function selection for port x
AFRL6: u4 = 0,
/// AFRL7 [28:31]
/// Alternate function selection for port x
AFRL7: u4 = 0,
};
/// GPIO alternate function low
pub const AFRL = Register(AFRL_val).init(base_address + 0x20);

/// AFRH
const AFRH_val = packed struct {
/// AFRH8 [0:3]
/// Alternate function selection for port x
AFRH8: u4 = 0,
/// AFRH9 [4:7]
/// Alternate function selection for port x
AFRH9: u4 = 0,
/// AFRH10 [8:11]
/// Alternate function selection for port x
AFRH10: u4 = 0,
/// AFRH11 [12:15]
/// Alternate function selection for port x
AFRH11: u4 = 0,
/// AFRH12 [16:19]
/// Alternate function selection for port x
AFRH12: u4 = 0,
/// AFRH13 [20:23]
/// Alternate function selection for port x
AFRH13: u4 = 0,
/// AFRH14 [24:27]
/// Alternate function selection for port x
AFRH14: u4 = 0,
/// AFRH15 [28:31]
/// Alternate function selection for port x
AFRH15: u4 = 0,
};
/// GPIO alternate function high
pub const AFRH = Register(AFRH_val).init(base_address + 0x24);

/// BRR
const BRR_val = packed struct {
/// BR0 [0:0]
/// Port x Reset bit y
BR0: u1 = 0,
/// BR1 [1:1]
/// Port x Reset bit y
BR1: u1 = 0,
/// BR2 [2:2]
/// Port x Reset bit y
BR2: u1 = 0,
/// BR3 [3:3]
/// Port x Reset bit y
BR3: u1 = 0,
/// BR4 [4:4]
/// Port x Reset bit y
BR4: u1 = 0,
/// BR5 [5:5]
/// Port x Reset bit y
BR5: u1 = 0,
/// BR6 [6:6]
/// Port x Reset bit y
BR6: u1 = 0,
/// BR7 [7:7]
/// Port x Reset bit y
BR7: u1 = 0,
/// BR8 [8:8]
/// Port x Reset bit y
BR8: u1 = 0,
/// BR9 [9:9]
/// Port x Reset bit y
BR9: u1 = 0,
/// BR10 [10:10]
/// Port x Reset bit y
BR10: u1 = 0,
/// BR11 [11:11]
/// Port x Reset bit y
BR11: u1 = 0,
/// BR12 [12:12]
/// Port x Reset bit y
BR12: u1 = 0,
/// BR13 [13:13]
/// Port x Reset bit y
BR13: u1 = 0,
/// BR14 [14:14]
/// Port x Reset bit y
BR14: u1 = 0,
/// BR15 [15:15]
/// Port x Reset bit y
BR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Port bit reset register
pub const BRR = Register(BRR_val).init(base_address + 0x28);
};

/// General-purpose I/Os
pub const GPIOB = struct {

const base_address = 0x48000400;
/// MODER
const MODER_val = packed struct {
/// MODER0 [0:1]
/// Port x configuration bits (y =
MODER0: u2 = 0,
/// MODER1 [2:3]
/// Port x configuration bits (y =
MODER1: u2 = 0,
/// MODER2 [4:5]
/// Port x configuration bits (y =
MODER2: u2 = 0,
/// MODER3 [6:7]
/// Port x configuration bits (y =
MODER3: u2 = 0,
/// MODER4 [8:9]
/// Port x configuration bits (y =
MODER4: u2 = 0,
/// MODER5 [10:11]
/// Port x configuration bits (y =
MODER5: u2 = 0,
/// MODER6 [12:13]
/// Port x configuration bits (y =
MODER6: u2 = 0,
/// MODER7 [14:15]
/// Port x configuration bits (y =
MODER7: u2 = 0,
/// MODER8 [16:17]
/// Port x configuration bits (y =
MODER8: u2 = 0,
/// MODER9 [18:19]
/// Port x configuration bits (y =
MODER9: u2 = 0,
/// MODER10 [20:21]
/// Port x configuration bits (y =
MODER10: u2 = 0,
/// MODER11 [22:23]
/// Port x configuration bits (y =
MODER11: u2 = 0,
/// MODER12 [24:25]
/// Port x configuration bits (y =
MODER12: u2 = 0,
/// MODER13 [26:27]
/// Port x configuration bits (y =
MODER13: u2 = 0,
/// MODER14 [28:29]
/// Port x configuration bits (y =
MODER14: u2 = 0,
/// MODER15 [30:31]
/// Port x configuration bits (y =
MODER15: u2 = 0,
};
/// GPIO port mode register
pub const MODER = Register(MODER_val).init(base_address + 0x0);

/// OTYPER
const OTYPER_val = packed struct {
/// OT0 [0:0]
/// Port x configuration bit 0
OT0: u1 = 0,
/// OT1 [1:1]
/// Port x configuration bit 1
OT1: u1 = 0,
/// OT2 [2:2]
/// Port x configuration bit 2
OT2: u1 = 0,
/// OT3 [3:3]
/// Port x configuration bit 3
OT3: u1 = 0,
/// OT4 [4:4]
/// Port x configuration bit 4
OT4: u1 = 0,
/// OT5 [5:5]
/// Port x configuration bit 5
OT5: u1 = 0,
/// OT6 [6:6]
/// Port x configuration bit 6
OT6: u1 = 0,
/// OT7 [7:7]
/// Port x configuration bit 7
OT7: u1 = 0,
/// OT8 [8:8]
/// Port x configuration bit 8
OT8: u1 = 0,
/// OT9 [9:9]
/// Port x configuration bit 9
OT9: u1 = 0,
/// OT10 [10:10]
/// Port x configuration bit
OT10: u1 = 0,
/// OT11 [11:11]
/// Port x configuration bit
OT11: u1 = 0,
/// OT12 [12:12]
/// Port x configuration bit
OT12: u1 = 0,
/// OT13 [13:13]
/// Port x configuration bit
OT13: u1 = 0,
/// OT14 [14:14]
/// Port x configuration bit
OT14: u1 = 0,
/// OT15 [15:15]
/// Port x configuration bit
OT15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output type register
pub const OTYPER = Register(OTYPER_val).init(base_address + 0x4);

/// OSPEEDR
const OSPEEDR_val = packed struct {
/// OSPEEDR0 [0:1]
/// Port x configuration bits (y =
OSPEEDR0: u2 = 0,
/// OSPEEDR1 [2:3]
/// Port x configuration bits (y =
OSPEEDR1: u2 = 0,
/// OSPEEDR2 [4:5]
/// Port x configuration bits (y =
OSPEEDR2: u2 = 0,
/// OSPEEDR3 [6:7]
/// Port x configuration bits (y =
OSPEEDR3: u2 = 0,
/// OSPEEDR4 [8:9]
/// Port x configuration bits (y =
OSPEEDR4: u2 = 0,
/// OSPEEDR5 [10:11]
/// Port x configuration bits (y =
OSPEEDR5: u2 = 0,
/// OSPEEDR6 [12:13]
/// Port x configuration bits (y =
OSPEEDR6: u2 = 0,
/// OSPEEDR7 [14:15]
/// Port x configuration bits (y =
OSPEEDR7: u2 = 0,
/// OSPEEDR8 [16:17]
/// Port x configuration bits (y =
OSPEEDR8: u2 = 0,
/// OSPEEDR9 [18:19]
/// Port x configuration bits (y =
OSPEEDR9: u2 = 0,
/// OSPEEDR10 [20:21]
/// Port x configuration bits (y =
OSPEEDR10: u2 = 0,
/// OSPEEDR11 [22:23]
/// Port x configuration bits (y =
OSPEEDR11: u2 = 0,
/// OSPEEDR12 [24:25]
/// Port x configuration bits (y =
OSPEEDR12: u2 = 0,
/// OSPEEDR13 [26:27]
/// Port x configuration bits (y =
OSPEEDR13: u2 = 0,
/// OSPEEDR14 [28:29]
/// Port x configuration bits (y =
OSPEEDR14: u2 = 0,
/// OSPEEDR15 [30:31]
/// Port x configuration bits (y =
OSPEEDR15: u2 = 0,
};
/// GPIO port output speed
pub const OSPEEDR = Register(OSPEEDR_val).init(base_address + 0x8);

/// PUPDR
const PUPDR_val = packed struct {
/// PUPDR0 [0:1]
/// Port x configuration bits (y =
PUPDR0: u2 = 0,
/// PUPDR1 [2:3]
/// Port x configuration bits (y =
PUPDR1: u2 = 0,
/// PUPDR2 [4:5]
/// Port x configuration bits (y =
PUPDR2: u2 = 0,
/// PUPDR3 [6:7]
/// Port x configuration bits (y =
PUPDR3: u2 = 0,
/// PUPDR4 [8:9]
/// Port x configuration bits (y =
PUPDR4: u2 = 0,
/// PUPDR5 [10:11]
/// Port x configuration bits (y =
PUPDR5: u2 = 0,
/// PUPDR6 [12:13]
/// Port x configuration bits (y =
PUPDR6: u2 = 0,
/// PUPDR7 [14:15]
/// Port x configuration bits (y =
PUPDR7: u2 = 0,
/// PUPDR8 [16:17]
/// Port x configuration bits (y =
PUPDR8: u2 = 0,
/// PUPDR9 [18:19]
/// Port x configuration bits (y =
PUPDR9: u2 = 0,
/// PUPDR10 [20:21]
/// Port x configuration bits (y =
PUPDR10: u2 = 0,
/// PUPDR11 [22:23]
/// Port x configuration bits (y =
PUPDR11: u2 = 0,
/// PUPDR12 [24:25]
/// Port x configuration bits (y =
PUPDR12: u2 = 0,
/// PUPDR13 [26:27]
/// Port x configuration bits (y =
PUPDR13: u2 = 0,
/// PUPDR14 [28:29]
/// Port x configuration bits (y =
PUPDR14: u2 = 0,
/// PUPDR15 [30:31]
/// Port x configuration bits (y =
PUPDR15: u2 = 0,
};
/// GPIO port pull-up/pull-down
pub const PUPDR = Register(PUPDR_val).init(base_address + 0xc);

/// IDR
const IDR_val = packed struct {
/// IDR0 [0:0]
/// Port input data (y =
IDR0: u1 = 0,
/// IDR1 [1:1]
/// Port input data (y =
IDR1: u1 = 0,
/// IDR2 [2:2]
/// Port input data (y =
IDR2: u1 = 0,
/// IDR3 [3:3]
/// Port input data (y =
IDR3: u1 = 0,
/// IDR4 [4:4]
/// Port input data (y =
IDR4: u1 = 0,
/// IDR5 [5:5]
/// Port input data (y =
IDR5: u1 = 0,
/// IDR6 [6:6]
/// Port input data (y =
IDR6: u1 = 0,
/// IDR7 [7:7]
/// Port input data (y =
IDR7: u1 = 0,
/// IDR8 [8:8]
/// Port input data (y =
IDR8: u1 = 0,
/// IDR9 [9:9]
/// Port input data (y =
IDR9: u1 = 0,
/// IDR10 [10:10]
/// Port input data (y =
IDR10: u1 = 0,
/// IDR11 [11:11]
/// Port input data (y =
IDR11: u1 = 0,
/// IDR12 [12:12]
/// Port input data (y =
IDR12: u1 = 0,
/// IDR13 [13:13]
/// Port input data (y =
IDR13: u1 = 0,
/// IDR14 [14:14]
/// Port input data (y =
IDR14: u1 = 0,
/// IDR15 [15:15]
/// Port input data (y =
IDR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port input data register
pub const IDR = Register(IDR_val).init(base_address + 0x10);

/// ODR
const ODR_val = packed struct {
/// ODR0 [0:0]
/// Port output data (y =
ODR0: u1 = 0,
/// ODR1 [1:1]
/// Port output data (y =
ODR1: u1 = 0,
/// ODR2 [2:2]
/// Port output data (y =
ODR2: u1 = 0,
/// ODR3 [3:3]
/// Port output data (y =
ODR3: u1 = 0,
/// ODR4 [4:4]
/// Port output data (y =
ODR4: u1 = 0,
/// ODR5 [5:5]
/// Port output data (y =
ODR5: u1 = 0,
/// ODR6 [6:6]
/// Port output data (y =
ODR6: u1 = 0,
/// ODR7 [7:7]
/// Port output data (y =
ODR7: u1 = 0,
/// ODR8 [8:8]
/// Port output data (y =
ODR8: u1 = 0,
/// ODR9 [9:9]
/// Port output data (y =
ODR9: u1 = 0,
/// ODR10 [10:10]
/// Port output data (y =
ODR10: u1 = 0,
/// ODR11 [11:11]
/// Port output data (y =
ODR11: u1 = 0,
/// ODR12 [12:12]
/// Port output data (y =
ODR12: u1 = 0,
/// ODR13 [13:13]
/// Port output data (y =
ODR13: u1 = 0,
/// ODR14 [14:14]
/// Port output data (y =
ODR14: u1 = 0,
/// ODR15 [15:15]
/// Port output data (y =
ODR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output data register
pub const ODR = Register(ODR_val).init(base_address + 0x14);

/// BSRR
const BSRR_val = packed struct {
/// BS0 [0:0]
/// Port x set bit y (y=
BS0: u1 = 0,
/// BS1 [1:1]
/// Port x set bit y (y=
BS1: u1 = 0,
/// BS2 [2:2]
/// Port x set bit y (y=
BS2: u1 = 0,
/// BS3 [3:3]
/// Port x set bit y (y=
BS3: u1 = 0,
/// BS4 [4:4]
/// Port x set bit y (y=
BS4: u1 = 0,
/// BS5 [5:5]
/// Port x set bit y (y=
BS5: u1 = 0,
/// BS6 [6:6]
/// Port x set bit y (y=
BS6: u1 = 0,
/// BS7 [7:7]
/// Port x set bit y (y=
BS7: u1 = 0,
/// BS8 [8:8]
/// Port x set bit y (y=
BS8: u1 = 0,
/// BS9 [9:9]
/// Port x set bit y (y=
BS9: u1 = 0,
/// BS10 [10:10]
/// Port x set bit y (y=
BS10: u1 = 0,
/// BS11 [11:11]
/// Port x set bit y (y=
BS11: u1 = 0,
/// BS12 [12:12]
/// Port x set bit y (y=
BS12: u1 = 0,
/// BS13 [13:13]
/// Port x set bit y (y=
BS13: u1 = 0,
/// BS14 [14:14]
/// Port x set bit y (y=
BS14: u1 = 0,
/// BS15 [15:15]
/// Port x set bit y (y=
BS15: u1 = 0,
/// BR0 [16:16]
/// Port x set bit y (y=
BR0: u1 = 0,
/// BR1 [17:17]
/// Port x reset bit y (y =
BR1: u1 = 0,
/// BR2 [18:18]
/// Port x reset bit y (y =
BR2: u1 = 0,
/// BR3 [19:19]
/// Port x reset bit y (y =
BR3: u1 = 0,
/// BR4 [20:20]
/// Port x reset bit y (y =
BR4: u1 = 0,
/// BR5 [21:21]
/// Port x reset bit y (y =
BR5: u1 = 0,
/// BR6 [22:22]
/// Port x reset bit y (y =
BR6: u1 = 0,
/// BR7 [23:23]
/// Port x reset bit y (y =
BR7: u1 = 0,
/// BR8 [24:24]
/// Port x reset bit y (y =
BR8: u1 = 0,
/// BR9 [25:25]
/// Port x reset bit y (y =
BR9: u1 = 0,
/// BR10 [26:26]
/// Port x reset bit y (y =
BR10: u1 = 0,
/// BR11 [27:27]
/// Port x reset bit y (y =
BR11: u1 = 0,
/// BR12 [28:28]
/// Port x reset bit y (y =
BR12: u1 = 0,
/// BR13 [29:29]
/// Port x reset bit y (y =
BR13: u1 = 0,
/// BR14 [30:30]
/// Port x reset bit y (y =
BR14: u1 = 0,
/// BR15 [31:31]
/// Port x reset bit y (y =
BR15: u1 = 0,
};
/// GPIO port bit set/reset
pub const BSRR = Register(BSRR_val).init(base_address + 0x18);

/// LCKR
const LCKR_val = packed struct {
/// LCK0 [0:0]
/// Port x lock bit y (y=
LCK0: u1 = 0,
/// LCK1 [1:1]
/// Port x lock bit y (y=
LCK1: u1 = 0,
/// LCK2 [2:2]
/// Port x lock bit y (y=
LCK2: u1 = 0,
/// LCK3 [3:3]
/// Port x lock bit y (y=
LCK3: u1 = 0,
/// LCK4 [4:4]
/// Port x lock bit y (y=
LCK4: u1 = 0,
/// LCK5 [5:5]
/// Port x lock bit y (y=
LCK5: u1 = 0,
/// LCK6 [6:6]
/// Port x lock bit y (y=
LCK6: u1 = 0,
/// LCK7 [7:7]
/// Port x lock bit y (y=
LCK7: u1 = 0,
/// LCK8 [8:8]
/// Port x lock bit y (y=
LCK8: u1 = 0,
/// LCK9 [9:9]
/// Port x lock bit y (y=
LCK9: u1 = 0,
/// LCK10 [10:10]
/// Port x lock bit y (y=
LCK10: u1 = 0,
/// LCK11 [11:11]
/// Port x lock bit y (y=
LCK11: u1 = 0,
/// LCK12 [12:12]
/// Port x lock bit y (y=
LCK12: u1 = 0,
/// LCK13 [13:13]
/// Port x lock bit y (y=
LCK13: u1 = 0,
/// LCK14 [14:14]
/// Port x lock bit y (y=
LCK14: u1 = 0,
/// LCK15 [15:15]
/// Port x lock bit y (y=
LCK15: u1 = 0,
/// LCKK [16:16]
/// Port x lock bit y
LCKK: u1 = 0,
/// unused [17:31]
_unused17: u7 = 0,
_unused24: u8 = 0,
};
/// GPIO port configuration lock
pub const LCKR = Register(LCKR_val).init(base_address + 0x1c);

/// AFRL
const AFRL_val = packed struct {
/// AFRL0 [0:3]
/// Alternate function selection for port x
AFRL0: u4 = 0,
/// AFRL1 [4:7]
/// Alternate function selection for port x
AFRL1: u4 = 0,
/// AFRL2 [8:11]
/// Alternate function selection for port x
AFRL2: u4 = 0,
/// AFRL3 [12:15]
/// Alternate function selection for port x
AFRL3: u4 = 0,
/// AFRL4 [16:19]
/// Alternate function selection for port x
AFRL4: u4 = 0,
/// AFRL5 [20:23]
/// Alternate function selection for port x
AFRL5: u4 = 0,
/// AFRL6 [24:27]
/// Alternate function selection for port x
AFRL6: u4 = 0,
/// AFRL7 [28:31]
/// Alternate function selection for port x
AFRL7: u4 = 0,
};
/// GPIO alternate function low
pub const AFRL = Register(AFRL_val).init(base_address + 0x20);

/// AFRH
const AFRH_val = packed struct {
/// AFRH8 [0:3]
/// Alternate function selection for port x
AFRH8: u4 = 0,
/// AFRH9 [4:7]
/// Alternate function selection for port x
AFRH9: u4 = 0,
/// AFRH10 [8:11]
/// Alternate function selection for port x
AFRH10: u4 = 0,
/// AFRH11 [12:15]
/// Alternate function selection for port x
AFRH11: u4 = 0,
/// AFRH12 [16:19]
/// Alternate function selection for port x
AFRH12: u4 = 0,
/// AFRH13 [20:23]
/// Alternate function selection for port x
AFRH13: u4 = 0,
/// AFRH14 [24:27]
/// Alternate function selection for port x
AFRH14: u4 = 0,
/// AFRH15 [28:31]
/// Alternate function selection for port x
AFRH15: u4 = 0,
};
/// GPIO alternate function high
pub const AFRH = Register(AFRH_val).init(base_address + 0x24);

/// BRR
const BRR_val = packed struct {
/// BR0 [0:0]
/// Port x Reset bit y
BR0: u1 = 0,
/// BR1 [1:1]
/// Port x Reset bit y
BR1: u1 = 0,
/// BR2 [2:2]
/// Port x Reset bit y
BR2: u1 = 0,
/// BR3 [3:3]
/// Port x Reset bit y
BR3: u1 = 0,
/// BR4 [4:4]
/// Port x Reset bit y
BR4: u1 = 0,
/// BR5 [5:5]
/// Port x Reset bit y
BR5: u1 = 0,
/// BR6 [6:6]
/// Port x Reset bit y
BR6: u1 = 0,
/// BR7 [7:7]
/// Port x Reset bit y
BR7: u1 = 0,
/// BR8 [8:8]
/// Port x Reset bit y
BR8: u1 = 0,
/// BR9 [9:9]
/// Port x Reset bit y
BR9: u1 = 0,
/// BR10 [10:10]
/// Port x Reset bit y
BR10: u1 = 0,
/// BR11 [11:11]
/// Port x Reset bit y
BR11: u1 = 0,
/// BR12 [12:12]
/// Port x Reset bit y
BR12: u1 = 0,
/// BR13 [13:13]
/// Port x Reset bit y
BR13: u1 = 0,
/// BR14 [14:14]
/// Port x Reset bit y
BR14: u1 = 0,
/// BR15 [15:15]
/// Port x Reset bit y
BR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Port bit reset register
pub const BRR = Register(BRR_val).init(base_address + 0x28);
};

/// General-purpose I/Os
pub const GPIOE = struct {

const base_address = 0x48001000;
/// MODER
const MODER_val = packed struct {
/// MODER0 [0:1]
/// Port x configuration bits (y =
MODER0: u2 = 0,
/// MODER1 [2:3]
/// Port x configuration bits (y =
MODER1: u2 = 0,
/// MODER2 [4:5]
/// Port x configuration bits (y =
MODER2: u2 = 0,
/// MODER3 [6:7]
/// Port x configuration bits (y =
MODER3: u2 = 0,
/// MODER4 [8:9]
/// Port x configuration bits (y =
MODER4: u2 = 0,
/// MODER5 [10:11]
/// Port x configuration bits (y =
MODER5: u2 = 0,
/// MODER6 [12:13]
/// Port x configuration bits (y =
MODER6: u2 = 0,
/// MODER7 [14:15]
/// Port x configuration bits (y =
MODER7: u2 = 0,
/// MODER8 [16:17]
/// Port x configuration bits (y =
MODER8: u2 = 0,
/// MODER9 [18:19]
/// Port x configuration bits (y =
MODER9: u2 = 0,
/// MODER10 [20:21]
/// Port x configuration bits (y =
MODER10: u2 = 0,
/// MODER11 [22:23]
/// Port x configuration bits (y =
MODER11: u2 = 0,
/// MODER12 [24:25]
/// Port x configuration bits (y =
MODER12: u2 = 0,
/// MODER13 [26:27]
/// Port x configuration bits (y =
MODER13: u2 = 0,
/// MODER14 [28:29]
/// Port x configuration bits (y =
MODER14: u2 = 0,
/// MODER15 [30:31]
/// Port x configuration bits (y =
MODER15: u2 = 0,
};
/// GPIO port mode register
pub const MODER = Register(MODER_val).init(base_address + 0x0);

/// OTYPER
const OTYPER_val = packed struct {
/// OT0 [0:0]
/// Port x configuration bit 0
OT0: u1 = 0,
/// OT1 [1:1]
/// Port x configuration bit 1
OT1: u1 = 0,
/// OT2 [2:2]
/// Port x configuration bit 2
OT2: u1 = 0,
/// OT3 [3:3]
/// Port x configuration bit 3
OT3: u1 = 0,
/// OT4 [4:4]
/// Port x configuration bit 4
OT4: u1 = 0,
/// OT5 [5:5]
/// Port x configuration bit 5
OT5: u1 = 0,
/// OT6 [6:6]
/// Port x configuration bit 6
OT6: u1 = 0,
/// OT7 [7:7]
/// Port x configuration bit 7
OT7: u1 = 0,
/// OT8 [8:8]
/// Port x configuration bit 8
OT8: u1 = 0,
/// OT9 [9:9]
/// Port x configuration bit 9
OT9: u1 = 0,
/// OT10 [10:10]
/// Port x configuration bit
OT10: u1 = 0,
/// OT11 [11:11]
/// Port x configuration bit
OT11: u1 = 0,
/// OT12 [12:12]
/// Port x configuration bit
OT12: u1 = 0,
/// OT13 [13:13]
/// Port x configuration bit
OT13: u1 = 0,
/// OT14 [14:14]
/// Port x configuration bit
OT14: u1 = 0,
/// OT15 [15:15]
/// Port x configuration bit
OT15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output type register
pub const OTYPER = Register(OTYPER_val).init(base_address + 0x4);

/// OSPEEDR
const OSPEEDR_val = packed struct {
/// OSPEEDR0 [0:1]
/// Port x configuration bits (y =
OSPEEDR0: u2 = 0,
/// OSPEEDR1 [2:3]
/// Port x configuration bits (y =
OSPEEDR1: u2 = 0,
/// OSPEEDR2 [4:5]
/// Port x configuration bits (y =
OSPEEDR2: u2 = 0,
/// OSPEEDR3 [6:7]
/// Port x configuration bits (y =
OSPEEDR3: u2 = 0,
/// OSPEEDR4 [8:9]
/// Port x configuration bits (y =
OSPEEDR4: u2 = 0,
/// OSPEEDR5 [10:11]
/// Port x configuration bits (y =
OSPEEDR5: u2 = 0,
/// OSPEEDR6 [12:13]
/// Port x configuration bits (y =
OSPEEDR6: u2 = 0,
/// OSPEEDR7 [14:15]
/// Port x configuration bits (y =
OSPEEDR7: u2 = 0,
/// OSPEEDR8 [16:17]
/// Port x configuration bits (y =
OSPEEDR8: u2 = 0,
/// OSPEEDR9 [18:19]
/// Port x configuration bits (y =
OSPEEDR9: u2 = 0,
/// OSPEEDR10 [20:21]
/// Port x configuration bits (y =
OSPEEDR10: u2 = 0,
/// OSPEEDR11 [22:23]
/// Port x configuration bits (y =
OSPEEDR11: u2 = 0,
/// OSPEEDR12 [24:25]
/// Port x configuration bits (y =
OSPEEDR12: u2 = 0,
/// OSPEEDR13 [26:27]
/// Port x configuration bits (y =
OSPEEDR13: u2 = 0,
/// OSPEEDR14 [28:29]
/// Port x configuration bits (y =
OSPEEDR14: u2 = 0,
/// OSPEEDR15 [30:31]
/// Port x configuration bits (y =
OSPEEDR15: u2 = 0,
};
/// GPIO port output speed
pub const OSPEEDR = Register(OSPEEDR_val).init(base_address + 0x8);

/// PUPDR
const PUPDR_val = packed struct {
/// PUPDR0 [0:1]
/// Port x configuration bits (y =
PUPDR0: u2 = 0,
/// PUPDR1 [2:3]
/// Port x configuration bits (y =
PUPDR1: u2 = 0,
/// PUPDR2 [4:5]
/// Port x configuration bits (y =
PUPDR2: u2 = 0,
/// PUPDR3 [6:7]
/// Port x configuration bits (y =
PUPDR3: u2 = 0,
/// PUPDR4 [8:9]
/// Port x configuration bits (y =
PUPDR4: u2 = 0,
/// PUPDR5 [10:11]
/// Port x configuration bits (y =
PUPDR5: u2 = 0,
/// PUPDR6 [12:13]
/// Port x configuration bits (y =
PUPDR6: u2 = 0,
/// PUPDR7 [14:15]
/// Port x configuration bits (y =
PUPDR7: u2 = 0,
/// PUPDR8 [16:17]
/// Port x configuration bits (y =
PUPDR8: u2 = 0,
/// PUPDR9 [18:19]
/// Port x configuration bits (y =
PUPDR9: u2 = 0,
/// PUPDR10 [20:21]
/// Port x configuration bits (y =
PUPDR10: u2 = 0,
/// PUPDR11 [22:23]
/// Port x configuration bits (y =
PUPDR11: u2 = 0,
/// PUPDR12 [24:25]
/// Port x configuration bits (y =
PUPDR12: u2 = 0,
/// PUPDR13 [26:27]
/// Port x configuration bits (y =
PUPDR13: u2 = 0,
/// PUPDR14 [28:29]
/// Port x configuration bits (y =
PUPDR14: u2 = 0,
/// PUPDR15 [30:31]
/// Port x configuration bits (y =
PUPDR15: u2 = 0,
};
/// GPIO port pull-up/pull-down
pub const PUPDR = Register(PUPDR_val).init(base_address + 0xc);

/// IDR
const IDR_val = packed struct {
/// IDR0 [0:0]
/// Port input data (y =
IDR0: u1 = 0,
/// IDR1 [1:1]
/// Port input data (y =
IDR1: u1 = 0,
/// IDR2 [2:2]
/// Port input data (y =
IDR2: u1 = 0,
/// IDR3 [3:3]
/// Port input data (y =
IDR3: u1 = 0,
/// IDR4 [4:4]
/// Port input data (y =
IDR4: u1 = 0,
/// IDR5 [5:5]
/// Port input data (y =
IDR5: u1 = 0,
/// IDR6 [6:6]
/// Port input data (y =
IDR6: u1 = 0,
/// IDR7 [7:7]
/// Port input data (y =
IDR7: u1 = 0,
/// IDR8 [8:8]
/// Port input data (y =
IDR8: u1 = 0,
/// IDR9 [9:9]
/// Port input data (y =
IDR9: u1 = 0,
/// IDR10 [10:10]
/// Port input data (y =
IDR10: u1 = 0,
/// IDR11 [11:11]
/// Port input data (y =
IDR11: u1 = 0,
/// IDR12 [12:12]
/// Port input data (y =
IDR12: u1 = 0,
/// IDR13 [13:13]
/// Port input data (y =
IDR13: u1 = 0,
/// IDR14 [14:14]
/// Port input data (y =
IDR14: u1 = 0,
/// IDR15 [15:15]
/// Port input data (y =
IDR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port input data register
pub const IDR = Register(IDR_val).init(base_address + 0x10);

/// ODR
const ODR_val = packed struct {
/// ODR0 [0:0]
/// Port output data (y =
ODR0: u1 = 0,
/// ODR1 [1:1]
/// Port output data (y =
ODR1: u1 = 0,
/// ODR2 [2:2]
/// Port output data (y =
ODR2: u1 = 0,
/// ODR3 [3:3]
/// Port output data (y =
ODR3: u1 = 0,
/// ODR4 [4:4]
/// Port output data (y =
ODR4: u1 = 0,
/// ODR5 [5:5]
/// Port output data (y =
ODR5: u1 = 0,
/// ODR6 [6:6]
/// Port output data (y =
ODR6: u1 = 0,
/// ODR7 [7:7]
/// Port output data (y =
ODR7: u1 = 0,
/// ODR8 [8:8]
/// Port output data (y =
ODR8: u1 = 0,
/// ODR9 [9:9]
/// Port output data (y =
ODR9: u1 = 0,
/// ODR10 [10:10]
/// Port output data (y =
ODR10: u1 = 0,
/// ODR11 [11:11]
/// Port output data (y =
ODR11: u1 = 0,
/// ODR12 [12:12]
/// Port output data (y =
ODR12: u1 = 0,
/// ODR13 [13:13]
/// Port output data (y =
ODR13: u1 = 0,
/// ODR14 [14:14]
/// Port output data (y =
ODR14: u1 = 0,
/// ODR15 [15:15]
/// Port output data (y =
ODR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output data register
pub const ODR = Register(ODR_val).init(base_address + 0x14);

/// BSRR
const BSRR_val = packed struct {
/// BS0 [0:0]
/// Port x set bit y (y=
BS0: u1 = 0,
/// BS1 [1:1]
/// Port x set bit y (y=
BS1: u1 = 0,
/// BS2 [2:2]
/// Port x set bit y (y=
BS2: u1 = 0,
/// BS3 [3:3]
/// Port x set bit y (y=
BS3: u1 = 0,
/// BS4 [4:4]
/// Port x set bit y (y=
BS4: u1 = 0,
/// BS5 [5:5]
/// Port x set bit y (y=
BS5: u1 = 0,
/// BS6 [6:6]
/// Port x set bit y (y=
BS6: u1 = 0,
/// BS7 [7:7]
/// Port x set bit y (y=
BS7: u1 = 0,
/// BS8 [8:8]
/// Port x set bit y (y=
BS8: u1 = 0,
/// BS9 [9:9]
/// Port x set bit y (y=
BS9: u1 = 0,
/// BS10 [10:10]
/// Port x set bit y (y=
BS10: u1 = 0,
/// BS11 [11:11]
/// Port x set bit y (y=
BS11: u1 = 0,
/// BS12 [12:12]
/// Port x set bit y (y=
BS12: u1 = 0,
/// BS13 [13:13]
/// Port x set bit y (y=
BS13: u1 = 0,
/// BS14 [14:14]
/// Port x set bit y (y=
BS14: u1 = 0,
/// BS15 [15:15]
/// Port x set bit y (y=
BS15: u1 = 0,
/// BR0 [16:16]
/// Port x set bit y (y=
BR0: u1 = 0,
/// BR1 [17:17]
/// Port x reset bit y (y =
BR1: u1 = 0,
/// BR2 [18:18]
/// Port x reset bit y (y =
BR2: u1 = 0,
/// BR3 [19:19]
/// Port x reset bit y (y =
BR3: u1 = 0,
/// BR4 [20:20]
/// Port x reset bit y (y =
BR4: u1 = 0,
/// BR5 [21:21]
/// Port x reset bit y (y =
BR5: u1 = 0,
/// BR6 [22:22]
/// Port x reset bit y (y =
BR6: u1 = 0,
/// BR7 [23:23]
/// Port x reset bit y (y =
BR7: u1 = 0,
/// BR8 [24:24]
/// Port x reset bit y (y =
BR8: u1 = 0,
/// BR9 [25:25]
/// Port x reset bit y (y =
BR9: u1 = 0,
/// BR10 [26:26]
/// Port x reset bit y (y =
BR10: u1 = 0,
/// BR11 [27:27]
/// Port x reset bit y (y =
BR11: u1 = 0,
/// BR12 [28:28]
/// Port x reset bit y (y =
BR12: u1 = 0,
/// BR13 [29:29]
/// Port x reset bit y (y =
BR13: u1 = 0,
/// BR14 [30:30]
/// Port x reset bit y (y =
BR14: u1 = 0,
/// BR15 [31:31]
/// Port x reset bit y (y =
BR15: u1 = 0,
};
/// GPIO port bit set/reset
pub const BSRR = Register(BSRR_val).init(base_address + 0x18);

/// LCKR
const LCKR_val = packed struct {
/// LCK0 [0:0]
/// Port x lock bit y (y=
LCK0: u1 = 0,
/// LCK1 [1:1]
/// Port x lock bit y (y=
LCK1: u1 = 0,
/// LCK2 [2:2]
/// Port x lock bit y (y=
LCK2: u1 = 0,
/// LCK3 [3:3]
/// Port x lock bit y (y=
LCK3: u1 = 0,
/// LCK4 [4:4]
/// Port x lock bit y (y=
LCK4: u1 = 0,
/// LCK5 [5:5]
/// Port x lock bit y (y=
LCK5: u1 = 0,
/// LCK6 [6:6]
/// Port x lock bit y (y=
LCK6: u1 = 0,
/// LCK7 [7:7]
/// Port x lock bit y (y=
LCK7: u1 = 0,
/// LCK8 [8:8]
/// Port x lock bit y (y=
LCK8: u1 = 0,
/// LCK9 [9:9]
/// Port x lock bit y (y=
LCK9: u1 = 0,
/// LCK10 [10:10]
/// Port x lock bit y (y=
LCK10: u1 = 0,
/// LCK11 [11:11]
/// Port x lock bit y (y=
LCK11: u1 = 0,
/// LCK12 [12:12]
/// Port x lock bit y (y=
LCK12: u1 = 0,
/// LCK13 [13:13]
/// Port x lock bit y (y=
LCK13: u1 = 0,
/// LCK14 [14:14]
/// Port x lock bit y (y=
LCK14: u1 = 0,
/// LCK15 [15:15]
/// Port x lock bit y (y=
LCK15: u1 = 0,
/// LCKK [16:16]
/// Port x lock bit y
LCKK: u1 = 0,
/// unused [17:31]
_unused17: u7 = 0,
_unused24: u8 = 0,
};
/// GPIO port configuration lock
pub const LCKR = Register(LCKR_val).init(base_address + 0x1c);

/// AFRL
const AFRL_val = packed struct {
/// AFRL0 [0:3]
/// Alternate function selection for port x
AFRL0: u4 = 0,
/// AFRL1 [4:7]
/// Alternate function selection for port x
AFRL1: u4 = 0,
/// AFRL2 [8:11]
/// Alternate function selection for port x
AFRL2: u4 = 0,
/// AFRL3 [12:15]
/// Alternate function selection for port x
AFRL3: u4 = 0,
/// AFRL4 [16:19]
/// Alternate function selection for port x
AFRL4: u4 = 0,
/// AFRL5 [20:23]
/// Alternate function selection for port x
AFRL5: u4 = 0,
/// AFRL6 [24:27]
/// Alternate function selection for port x
AFRL6: u4 = 0,
/// AFRL7 [28:31]
/// Alternate function selection for port x
AFRL7: u4 = 0,
};
/// GPIO alternate function low
pub const AFRL = Register(AFRL_val).init(base_address + 0x20);

/// AFRH
const AFRH_val = packed struct {
/// AFRH8 [0:3]
/// Alternate function selection for port x
AFRH8: u4 = 0,
/// AFRH9 [4:7]
/// Alternate function selection for port x
AFRH9: u4 = 0,
/// AFRH10 [8:11]
/// Alternate function selection for port x
AFRH10: u4 = 0,
/// AFRH11 [12:15]
/// Alternate function selection for port x
AFRH11: u4 = 0,
/// AFRH12 [16:19]
/// Alternate function selection for port x
AFRH12: u4 = 0,
/// AFRH13 [20:23]
/// Alternate function selection for port x
AFRH13: u4 = 0,
/// AFRH14 [24:27]
/// Alternate function selection for port x
AFRH14: u4 = 0,
/// AFRH15 [28:31]
/// Alternate function selection for port x
AFRH15: u4 = 0,
};
/// GPIO alternate function high
pub const AFRH = Register(AFRH_val).init(base_address + 0x24);

/// BRR
const BRR_val = packed struct {
/// BR0 [0:0]
/// Port x Reset bit y
BR0: u1 = 0,
/// BR1 [1:1]
/// Port x Reset bit y
BR1: u1 = 0,
/// BR2 [2:2]
/// Port x Reset bit y
BR2: u1 = 0,
/// BR3 [3:3]
/// Port x Reset bit y
BR3: u1 = 0,
/// BR4 [4:4]
/// Port x Reset bit y
BR4: u1 = 0,
/// BR5 [5:5]
/// Port x Reset bit y
BR5: u1 = 0,
/// BR6 [6:6]
/// Port x Reset bit y
BR6: u1 = 0,
/// BR7 [7:7]
/// Port x Reset bit y
BR7: u1 = 0,
/// BR8 [8:8]
/// Port x Reset bit y
BR8: u1 = 0,
/// BR9 [9:9]
/// Port x Reset bit y
BR9: u1 = 0,
/// BR10 [10:10]
/// Port x Reset bit y
BR10: u1 = 0,
/// BR11 [11:11]
/// Port x Reset bit y
BR11: u1 = 0,
/// BR12 [12:12]
/// Port x Reset bit y
BR12: u1 = 0,
/// BR13 [13:13]
/// Port x Reset bit y
BR13: u1 = 0,
/// BR14 [14:14]
/// Port x Reset bit y
BR14: u1 = 0,
/// BR15 [15:15]
/// Port x Reset bit y
BR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Port bit reset register
pub const BRR = Register(BRR_val).init(base_address + 0x28);
};

/// General-purpose I/Os
pub const GPIOA = struct {

const base_address = 0x48000000;
/// MODER
const MODER_val = packed struct {
/// MODER0 [0:1]
/// Port x configuration bits (y =
MODER0: u2 = 0,
/// MODER1 [2:3]
/// Port x configuration bits (y =
MODER1: u2 = 0,
/// MODER2 [4:5]
/// Port x configuration bits (y =
MODER2: u2 = 0,
/// MODER3 [6:7]
/// Port x configuration bits (y =
MODER3: u2 = 0,
/// MODER4 [8:9]
/// Port x configuration bits (y =
MODER4: u2 = 0,
/// MODER5 [10:11]
/// Port x configuration bits (y =
MODER5: u2 = 0,
/// MODER6 [12:13]
/// Port x configuration bits (y =
MODER6: u2 = 0,
/// MODER7 [14:15]
/// Port x configuration bits (y =
MODER7: u2 = 0,
/// MODER8 [16:17]
/// Port x configuration bits (y =
MODER8: u2 = 0,
/// MODER9 [18:19]
/// Port x configuration bits (y =
MODER9: u2 = 0,
/// MODER10 [20:21]
/// Port x configuration bits (y =
MODER10: u2 = 0,
/// MODER11 [22:23]
/// Port x configuration bits (y =
MODER11: u2 = 0,
/// MODER12 [24:25]
/// Port x configuration bits (y =
MODER12: u2 = 0,
/// MODER13 [26:27]
/// Port x configuration bits (y =
MODER13: u2 = 2,
/// MODER14 [28:29]
/// Port x configuration bits (y =
MODER14: u2 = 2,
/// MODER15 [30:31]
/// Port x configuration bits (y =
MODER15: u2 = 0,
};
/// GPIO port mode register
pub const MODER = Register(MODER_val).init(base_address + 0x0);

/// OTYPER
const OTYPER_val = packed struct {
/// OT0 [0:0]
/// Port x configuration bits (y =
OT0: u1 = 0,
/// OT1 [1:1]
/// Port x configuration bits (y =
OT1: u1 = 0,
/// OT2 [2:2]
/// Port x configuration bits (y =
OT2: u1 = 0,
/// OT3 [3:3]
/// Port x configuration bits (y =
OT3: u1 = 0,
/// OT4 [4:4]
/// Port x configuration bits (y =
OT4: u1 = 0,
/// OT5 [5:5]
/// Port x configuration bits (y =
OT5: u1 = 0,
/// OT6 [6:6]
/// Port x configuration bits (y =
OT6: u1 = 0,
/// OT7 [7:7]
/// Port x configuration bits (y =
OT7: u1 = 0,
/// OT8 [8:8]
/// Port x configuration bits (y =
OT8: u1 = 0,
/// OT9 [9:9]
/// Port x configuration bits (y =
OT9: u1 = 0,
/// OT10 [10:10]
/// Port x configuration bits (y =
OT10: u1 = 0,
/// OT11 [11:11]
/// Port x configuration bits (y =
OT11: u1 = 0,
/// OT12 [12:12]
/// Port x configuration bits (y =
OT12: u1 = 0,
/// OT13 [13:13]
/// Port x configuration bits (y =
OT13: u1 = 0,
/// OT14 [14:14]
/// Port x configuration bits (y =
OT14: u1 = 0,
/// OT15 [15:15]
/// Port x configuration bits (y =
OT15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output type register
pub const OTYPER = Register(OTYPER_val).init(base_address + 0x4);

/// OSPEEDR
const OSPEEDR_val = packed struct {
/// OSPEEDR0 [0:1]
/// Port x configuration bits (y =
OSPEEDR0: u2 = 0,
/// OSPEEDR1 [2:3]
/// Port x configuration bits (y =
OSPEEDR1: u2 = 0,
/// OSPEEDR2 [4:5]
/// Port x configuration bits (y =
OSPEEDR2: u2 = 0,
/// OSPEEDR3 [6:7]
/// Port x configuration bits (y =
OSPEEDR3: u2 = 0,
/// OSPEEDR4 [8:9]
/// Port x configuration bits (y =
OSPEEDR4: u2 = 0,
/// OSPEEDR5 [10:11]
/// Port x configuration bits (y =
OSPEEDR5: u2 = 0,
/// OSPEEDR6 [12:13]
/// Port x configuration bits (y =
OSPEEDR6: u2 = 0,
/// OSPEEDR7 [14:15]
/// Port x configuration bits (y =
OSPEEDR7: u2 = 0,
/// OSPEEDR8 [16:17]
/// Port x configuration bits (y =
OSPEEDR8: u2 = 0,
/// OSPEEDR9 [18:19]
/// Port x configuration bits (y =
OSPEEDR9: u2 = 0,
/// OSPEEDR10 [20:21]
/// Port x configuration bits (y =
OSPEEDR10: u2 = 0,
/// OSPEEDR11 [22:23]
/// Port x configuration bits (y =
OSPEEDR11: u2 = 0,
/// OSPEEDR12 [24:25]
/// Port x configuration bits (y =
OSPEEDR12: u2 = 0,
/// OSPEEDR13 [26:27]
/// Port x configuration bits (y =
OSPEEDR13: u2 = 0,
/// OSPEEDR14 [28:29]
/// Port x configuration bits (y =
OSPEEDR14: u2 = 0,
/// OSPEEDR15 [30:31]
/// Port x configuration bits (y =
OSPEEDR15: u2 = 0,
};
/// GPIO port output speed
pub const OSPEEDR = Register(OSPEEDR_val).init(base_address + 0x8);

/// PUPDR
const PUPDR_val = packed struct {
/// PUPDR0 [0:1]
/// Port x configuration bits (y =
PUPDR0: u2 = 0,
/// PUPDR1 [2:3]
/// Port x configuration bits (y =
PUPDR1: u2 = 0,
/// PUPDR2 [4:5]
/// Port x configuration bits (y =
PUPDR2: u2 = 0,
/// PUPDR3 [6:7]
/// Port x configuration bits (y =
PUPDR3: u2 = 0,
/// PUPDR4 [8:9]
/// Port x configuration bits (y =
PUPDR4: u2 = 0,
/// PUPDR5 [10:11]
/// Port x configuration bits (y =
PUPDR5: u2 = 0,
/// PUPDR6 [12:13]
/// Port x configuration bits (y =
PUPDR6: u2 = 0,
/// PUPDR7 [14:15]
/// Port x configuration bits (y =
PUPDR7: u2 = 0,
/// PUPDR8 [16:17]
/// Port x configuration bits (y =
PUPDR8: u2 = 0,
/// PUPDR9 [18:19]
/// Port x configuration bits (y =
PUPDR9: u2 = 0,
/// PUPDR10 [20:21]
/// Port x configuration bits (y =
PUPDR10: u2 = 0,
/// PUPDR11 [22:23]
/// Port x configuration bits (y =
PUPDR11: u2 = 0,
/// PUPDR12 [24:25]
/// Port x configuration bits (y =
PUPDR12: u2 = 0,
/// PUPDR13 [26:27]
/// Port x configuration bits (y =
PUPDR13: u2 = 1,
/// PUPDR14 [28:29]
/// Port x configuration bits (y =
PUPDR14: u2 = 2,
/// PUPDR15 [30:31]
/// Port x configuration bits (y =
PUPDR15: u2 = 0,
};
/// GPIO port pull-up/pull-down
pub const PUPDR = Register(PUPDR_val).init(base_address + 0xc);

/// IDR
const IDR_val = packed struct {
/// IDR0 [0:0]
/// Port input data (y =
IDR0: u1 = 0,
/// IDR1 [1:1]
/// Port input data (y =
IDR1: u1 = 0,
/// IDR2 [2:2]
/// Port input data (y =
IDR2: u1 = 0,
/// IDR3 [3:3]
/// Port input data (y =
IDR3: u1 = 0,
/// IDR4 [4:4]
/// Port input data (y =
IDR4: u1 = 0,
/// IDR5 [5:5]
/// Port input data (y =
IDR5: u1 = 0,
/// IDR6 [6:6]
/// Port input data (y =
IDR6: u1 = 0,
/// IDR7 [7:7]
/// Port input data (y =
IDR7: u1 = 0,
/// IDR8 [8:8]
/// Port input data (y =
IDR8: u1 = 0,
/// IDR9 [9:9]
/// Port input data (y =
IDR9: u1 = 0,
/// IDR10 [10:10]
/// Port input data (y =
IDR10: u1 = 0,
/// IDR11 [11:11]
/// Port input data (y =
IDR11: u1 = 0,
/// IDR12 [12:12]
/// Port input data (y =
IDR12: u1 = 0,
/// IDR13 [13:13]
/// Port input data (y =
IDR13: u1 = 0,
/// IDR14 [14:14]
/// Port input data (y =
IDR14: u1 = 0,
/// IDR15 [15:15]
/// Port input data (y =
IDR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port input data register
pub const IDR = Register(IDR_val).init(base_address + 0x10);

/// ODR
const ODR_val = packed struct {
/// ODR0 [0:0]
/// Port output data (y =
ODR0: u1 = 0,
/// ODR1 [1:1]
/// Port output data (y =
ODR1: u1 = 0,
/// ODR2 [2:2]
/// Port output data (y =
ODR2: u1 = 0,
/// ODR3 [3:3]
/// Port output data (y =
ODR3: u1 = 0,
/// ODR4 [4:4]
/// Port output data (y =
ODR4: u1 = 0,
/// ODR5 [5:5]
/// Port output data (y =
ODR5: u1 = 0,
/// ODR6 [6:6]
/// Port output data (y =
ODR6: u1 = 0,
/// ODR7 [7:7]
/// Port output data (y =
ODR7: u1 = 0,
/// ODR8 [8:8]
/// Port output data (y =
ODR8: u1 = 0,
/// ODR9 [9:9]
/// Port output data (y =
ODR9: u1 = 0,
/// ODR10 [10:10]
/// Port output data (y =
ODR10: u1 = 0,
/// ODR11 [11:11]
/// Port output data (y =
ODR11: u1 = 0,
/// ODR12 [12:12]
/// Port output data (y =
ODR12: u1 = 0,
/// ODR13 [13:13]
/// Port output data (y =
ODR13: u1 = 0,
/// ODR14 [14:14]
/// Port output data (y =
ODR14: u1 = 0,
/// ODR15 [15:15]
/// Port output data (y =
ODR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// GPIO port output data register
pub const ODR = Register(ODR_val).init(base_address + 0x14);

/// BSRR
const BSRR_val = packed struct {
/// BS0 [0:0]
/// Port x set bit y (y=
BS0: u1 = 0,
/// BS1 [1:1]
/// Port x set bit y (y=
BS1: u1 = 0,
/// BS2 [2:2]
/// Port x set bit y (y=
BS2: u1 = 0,
/// BS3 [3:3]
/// Port x set bit y (y=
BS3: u1 = 0,
/// BS4 [4:4]
/// Port x set bit y (y=
BS4: u1 = 0,
/// BS5 [5:5]
/// Port x set bit y (y=
BS5: u1 = 0,
/// BS6 [6:6]
/// Port x set bit y (y=
BS6: u1 = 0,
/// BS7 [7:7]
/// Port x set bit y (y=
BS7: u1 = 0,
/// BS8 [8:8]
/// Port x set bit y (y=
BS8: u1 = 0,
/// BS9 [9:9]
/// Port x set bit y (y=
BS9: u1 = 0,
/// BS10 [10:10]
/// Port x set bit y (y=
BS10: u1 = 0,
/// BS11 [11:11]
/// Port x set bit y (y=
BS11: u1 = 0,
/// BS12 [12:12]
/// Port x set bit y (y=
BS12: u1 = 0,
/// BS13 [13:13]
/// Port x set bit y (y=
BS13: u1 = 0,
/// BS14 [14:14]
/// Port x set bit y (y=
BS14: u1 = 0,
/// BS15 [15:15]
/// Port x set bit y (y=
BS15: u1 = 0,
/// BR0 [16:16]
/// Port x set bit y (y=
BR0: u1 = 0,
/// BR1 [17:17]
/// Port x reset bit y (y =
BR1: u1 = 0,
/// BR2 [18:18]
/// Port x reset bit y (y =
BR2: u1 = 0,
/// BR3 [19:19]
/// Port x reset bit y (y =
BR3: u1 = 0,
/// BR4 [20:20]
/// Port x reset bit y (y =
BR4: u1 = 0,
/// BR5 [21:21]
/// Port x reset bit y (y =
BR5: u1 = 0,
/// BR6 [22:22]
/// Port x reset bit y (y =
BR6: u1 = 0,
/// BR7 [23:23]
/// Port x reset bit y (y =
BR7: u1 = 0,
/// BR8 [24:24]
/// Port x reset bit y (y =
BR8: u1 = 0,
/// BR9 [25:25]
/// Port x reset bit y (y =
BR9: u1 = 0,
/// BR10 [26:26]
/// Port x reset bit y (y =
BR10: u1 = 0,
/// BR11 [27:27]
/// Port x reset bit y (y =
BR11: u1 = 0,
/// BR12 [28:28]
/// Port x reset bit y (y =
BR12: u1 = 0,
/// BR13 [29:29]
/// Port x reset bit y (y =
BR13: u1 = 0,
/// BR14 [30:30]
/// Port x reset bit y (y =
BR14: u1 = 0,
/// BR15 [31:31]
/// Port x reset bit y (y =
BR15: u1 = 0,
};
/// GPIO port bit set/reset
pub const BSRR = Register(BSRR_val).init(base_address + 0x18);

/// LCKR
const LCKR_val = packed struct {
/// LCK0 [0:0]
/// Port x lock bit y (y=
LCK0: u1 = 0,
/// LCK1 [1:1]
/// Port x lock bit y (y=
LCK1: u1 = 0,
/// LCK2 [2:2]
/// Port x lock bit y (y=
LCK2: u1 = 0,
/// LCK3 [3:3]
/// Port x lock bit y (y=
LCK3: u1 = 0,
/// LCK4 [4:4]
/// Port x lock bit y (y=
LCK4: u1 = 0,
/// LCK5 [5:5]
/// Port x lock bit y (y=
LCK5: u1 = 0,
/// LCK6 [6:6]
/// Port x lock bit y (y=
LCK6: u1 = 0,
/// LCK7 [7:7]
/// Port x lock bit y (y=
LCK7: u1 = 0,
/// LCK8 [8:8]
/// Port x lock bit y (y=
LCK8: u1 = 0,
/// LCK9 [9:9]
/// Port x lock bit y (y=
LCK9: u1 = 0,
/// LCK10 [10:10]
/// Port x lock bit y (y=
LCK10: u1 = 0,
/// LCK11 [11:11]
/// Port x lock bit y (y=
LCK11: u1 = 0,
/// LCK12 [12:12]
/// Port x lock bit y (y=
LCK12: u1 = 0,
/// LCK13 [13:13]
/// Port x lock bit y (y=
LCK13: u1 = 0,
/// LCK14 [14:14]
/// Port x lock bit y (y=
LCK14: u1 = 0,
/// LCK15 [15:15]
/// Port x lock bit y (y=
LCK15: u1 = 0,
/// LCKK [16:16]
/// Port x lock bit y (y=
LCKK: u1 = 0,
/// unused [17:31]
_unused17: u7 = 0,
_unused24: u8 = 0,
};
/// GPIO port configuration lock
pub const LCKR = Register(LCKR_val).init(base_address + 0x1c);

/// AFRL
const AFRL_val = packed struct {
/// AFRL0 [0:3]
/// Alternate function selection for port x
AFRL0: u4 = 0,
/// AFRL1 [4:7]
/// Alternate function selection for port x
AFRL1: u4 = 0,
/// AFRL2 [8:11]
/// Alternate function selection for port x
AFRL2: u4 = 0,
/// AFRL3 [12:15]
/// Alternate function selection for port x
AFRL3: u4 = 0,
/// AFRL4 [16:19]
/// Alternate function selection for port x
AFRL4: u4 = 0,
/// AFRL5 [20:23]
/// Alternate function selection for port x
AFRL5: u4 = 0,
/// AFRL6 [24:27]
/// Alternate function selection for port x
AFRL6: u4 = 0,
/// AFRL7 [28:31]
/// Alternate function selection for port x
AFRL7: u4 = 0,
};
/// GPIO alternate function low
pub const AFRL = Register(AFRL_val).init(base_address + 0x20);

/// AFRH
const AFRH_val = packed struct {
/// AFRH8 [0:3]
/// Alternate function selection for port x
AFRH8: u4 = 0,
/// AFRH9 [4:7]
/// Alternate function selection for port x
AFRH9: u4 = 0,
/// AFRH10 [8:11]
/// Alternate function selection for port x
AFRH10: u4 = 0,
/// AFRH11 [12:15]
/// Alternate function selection for port x
AFRH11: u4 = 0,
/// AFRH12 [16:19]
/// Alternate function selection for port x
AFRH12: u4 = 0,
/// AFRH13 [20:23]
/// Alternate function selection for port x
AFRH13: u4 = 0,
/// AFRH14 [24:27]
/// Alternate function selection for port x
AFRH14: u4 = 0,
/// AFRH15 [28:31]
/// Alternate function selection for port x
AFRH15: u4 = 0,
};
/// GPIO alternate function high
pub const AFRH = Register(AFRH_val).init(base_address + 0x24);

/// BRR
const BRR_val = packed struct {
/// BR0 [0:0]
/// Port x Reset bit y
BR0: u1 = 0,
/// BR1 [1:1]
/// Port x Reset bit y
BR1: u1 = 0,
/// BR2 [2:2]
/// Port x Reset bit y
BR2: u1 = 0,
/// BR3 [3:3]
/// Port x Reset bit y
BR3: u1 = 0,
/// BR4 [4:4]
/// Port x Reset bit y
BR4: u1 = 0,
/// BR5 [5:5]
/// Port x Reset bit y
BR5: u1 = 0,
/// BR6 [6:6]
/// Port x Reset bit y
BR6: u1 = 0,
/// BR7 [7:7]
/// Port x Reset bit y
BR7: u1 = 0,
/// BR8 [8:8]
/// Port x Reset bit y
BR8: u1 = 0,
/// BR9 [9:9]
/// Port x Reset bit y
BR9: u1 = 0,
/// BR10 [10:10]
/// Port x Reset bit y
BR10: u1 = 0,
/// BR11 [11:11]
/// Port x Reset bit y
BR11: u1 = 0,
/// BR12 [12:12]
/// Port x Reset bit y
BR12: u1 = 0,
/// BR13 [13:13]
/// Port x Reset bit y
BR13: u1 = 0,
/// BR14 [14:14]
/// Port x Reset bit y
BR14: u1 = 0,
/// BR15 [15:15]
/// Port x Reset bit y
BR15: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Port bit reset register
pub const BRR = Register(BRR_val).init(base_address + 0x28);
};

/// Serial peripheral interface
pub const SPI1 = struct {

const base_address = 0x40013000;
/// CR1
const CR1_val = packed struct {
/// CPHA [0:0]
/// Clock phase
CPHA: u1 = 0,
/// CPOL [1:1]
/// Clock polarity
CPOL: u1 = 0,
/// MSTR [2:2]
/// Master selection
MSTR: u1 = 0,
/// BR [3:5]
/// Baud rate control
BR: u3 = 0,
/// SPE [6:6]
/// SPI enable
SPE: u1 = 0,
/// LSBFIRST [7:7]
/// Frame format
LSBFIRST: u1 = 0,
/// SSI [8:8]
/// Internal slave select
SSI: u1 = 0,
/// SSM [9:9]
/// Software slave management
SSM: u1 = 0,
/// RXONLY [10:10]
/// Receive only
RXONLY: u1 = 0,
/// DFF [11:11]
/// Data frame format
DFF: u1 = 0,
/// CRCNEXT [12:12]
/// CRC transfer next
CRCNEXT: u1 = 0,
/// CRCEN [13:13]
/// Hardware CRC calculation
CRCEN: u1 = 0,
/// BIDIOE [14:14]
/// Output enable in bidirectional
BIDIOE: u1 = 0,
/// BIDIMODE [15:15]
/// Bidirectional data mode
BIDIMODE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// RXDMAEN [0:0]
/// Rx buffer DMA enable
RXDMAEN: u1 = 0,
/// TXDMAEN [1:1]
/// Tx buffer DMA enable
TXDMAEN: u1 = 0,
/// SSOE [2:2]
/// SS output enable
SSOE: u1 = 0,
/// NSSP [3:3]
/// NSS pulse management
NSSP: u1 = 0,
/// FRF [4:4]
/// Frame format
FRF: u1 = 0,
/// ERRIE [5:5]
/// Error interrupt enable
ERRIE: u1 = 0,
/// RXNEIE [6:6]
/// RX buffer not empty interrupt
RXNEIE: u1 = 0,
/// TXEIE [7:7]
/// Tx buffer empty interrupt
TXEIE: u1 = 0,
/// DS [8:11]
/// Data size
DS: u4 = 0,
/// FRXTH [12:12]
/// FIFO reception threshold
FRXTH: u1 = 0,
/// LDMA_RX [13:13]
/// Last DMA transfer for
LDMA_RX: u1 = 0,
/// LDMA_TX [14:14]
/// Last DMA transfer for
LDMA_TX: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// SR
const SR_val = packed struct {
/// RXNE [0:0]
/// Receive buffer not empty
RXNE: u1 = 0,
/// TXE [1:1]
/// Transmit buffer empty
TXE: u1 = 1,
/// CHSIDE [2:2]
/// Channel side
CHSIDE: u1 = 0,
/// UDR [3:3]
/// Underrun flag
UDR: u1 = 0,
/// CRCERR [4:4]
/// CRC error flag
CRCERR: u1 = 0,
/// MODF [5:5]
/// Mode fault
MODF: u1 = 0,
/// OVR [6:6]
/// Overrun flag
OVR: u1 = 0,
/// BSY [7:7]
/// Busy flag
BSY: u1 = 0,
/// TIFRFE [8:8]
/// TI frame format error
TIFRFE: u1 = 0,
/// FRLVL [9:10]
/// FIFO reception level
FRLVL: u2 = 0,
/// FTLVL [11:12]
/// FIFO transmission level
FTLVL: u2 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x8);

/// DR
const DR_val = packed struct {
/// DR [0:15]
/// Data register
DR: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// data register
pub const DR = Register(DR_val).init(base_address + 0xc);

/// CRCPR
const CRCPR_val = packed struct {
/// CRCPOLY [0:15]
/// CRC polynomial register
CRCPOLY: u16 = 7,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// CRC polynomial register
pub const CRCPR = Register(CRCPR_val).init(base_address + 0x10);

/// RXCRCR
const RXCRCR_val = packed struct {
/// RxCRC [0:15]
/// Rx CRC register
RxCRC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// RX CRC register
pub const RXCRCR = Register(RXCRCR_val).init(base_address + 0x14);

/// TXCRCR
const TXCRCR_val = packed struct {
/// TxCRC [0:15]
/// Tx CRC register
TxCRC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// TX CRC register
pub const TXCRCR = Register(TXCRCR_val).init(base_address + 0x18);

/// I2SCFGR
const I2SCFGR_val = packed struct {
/// CHLEN [0:0]
/// Channel length (number of bits per audio
CHLEN: u1 = 0,
/// DATLEN [1:2]
/// Data length to be
DATLEN: u2 = 0,
/// CKPOL [3:3]
/// Steady state clock
CKPOL: u1 = 0,
/// I2SSTD [4:5]
/// I2S standard selection
I2SSTD: u2 = 0,
/// unused [6:6]
_unused6: u1 = 0,
/// PCMSYNC [7:7]
/// PCM frame synchronization
PCMSYNC: u1 = 0,
/// I2SCFG [8:9]
/// I2S configuration mode
I2SCFG: u2 = 0,
/// I2SE [10:10]
/// I2S Enable
I2SE: u1 = 0,
/// I2SMOD [11:11]
/// I2S mode selection
I2SMOD: u1 = 0,
/// unused [12:31]
_unused12: u4 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// I2S configuration register
pub const I2SCFGR = Register(I2SCFGR_val).init(base_address + 0x1c);

/// I2SPR
const I2SPR_val = packed struct {
/// I2SDIV [0:7]
/// I2S Linear prescaler
I2SDIV: u8 = 16,
/// ODD [8:8]
/// Odd factor for the
ODD: u1 = 0,
/// MCKOE [9:9]
/// Master clock output enable
MCKOE: u1 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// I2S prescaler register
pub const I2SPR = Register(I2SPR_val).init(base_address + 0x20);
};

/// Serial peripheral interface
pub const SPI2 = struct {

const base_address = 0x40003800;
/// CR1
const CR1_val = packed struct {
/// CPHA [0:0]
/// Clock phase
CPHA: u1 = 0,
/// CPOL [1:1]
/// Clock polarity
CPOL: u1 = 0,
/// MSTR [2:2]
/// Master selection
MSTR: u1 = 0,
/// BR [3:5]
/// Baud rate control
BR: u3 = 0,
/// SPE [6:6]
/// SPI enable
SPE: u1 = 0,
/// LSBFIRST [7:7]
/// Frame format
LSBFIRST: u1 = 0,
/// SSI [8:8]
/// Internal slave select
SSI: u1 = 0,
/// SSM [9:9]
/// Software slave management
SSM: u1 = 0,
/// RXONLY [10:10]
/// Receive only
RXONLY: u1 = 0,
/// DFF [11:11]
/// Data frame format
DFF: u1 = 0,
/// CRCNEXT [12:12]
/// CRC transfer next
CRCNEXT: u1 = 0,
/// CRCEN [13:13]
/// Hardware CRC calculation
CRCEN: u1 = 0,
/// BIDIOE [14:14]
/// Output enable in bidirectional
BIDIOE: u1 = 0,
/// BIDIMODE [15:15]
/// Bidirectional data mode
BIDIMODE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// RXDMAEN [0:0]
/// Rx buffer DMA enable
RXDMAEN: u1 = 0,
/// TXDMAEN [1:1]
/// Tx buffer DMA enable
TXDMAEN: u1 = 0,
/// SSOE [2:2]
/// SS output enable
SSOE: u1 = 0,
/// NSSP [3:3]
/// NSS pulse management
NSSP: u1 = 0,
/// FRF [4:4]
/// Frame format
FRF: u1 = 0,
/// ERRIE [5:5]
/// Error interrupt enable
ERRIE: u1 = 0,
/// RXNEIE [6:6]
/// RX buffer not empty interrupt
RXNEIE: u1 = 0,
/// TXEIE [7:7]
/// Tx buffer empty interrupt
TXEIE: u1 = 0,
/// DS [8:11]
/// Data size
DS: u4 = 0,
/// FRXTH [12:12]
/// FIFO reception threshold
FRXTH: u1 = 0,
/// LDMA_RX [13:13]
/// Last DMA transfer for
LDMA_RX: u1 = 0,
/// LDMA_TX [14:14]
/// Last DMA transfer for
LDMA_TX: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// SR
const SR_val = packed struct {
/// RXNE [0:0]
/// Receive buffer not empty
RXNE: u1 = 0,
/// TXE [1:1]
/// Transmit buffer empty
TXE: u1 = 1,
/// CHSIDE [2:2]
/// Channel side
CHSIDE: u1 = 0,
/// UDR [3:3]
/// Underrun flag
UDR: u1 = 0,
/// CRCERR [4:4]
/// CRC error flag
CRCERR: u1 = 0,
/// MODF [5:5]
/// Mode fault
MODF: u1 = 0,
/// OVR [6:6]
/// Overrun flag
OVR: u1 = 0,
/// BSY [7:7]
/// Busy flag
BSY: u1 = 0,
/// TIFRFE [8:8]
/// TI frame format error
TIFRFE: u1 = 0,
/// FRLVL [9:10]
/// FIFO reception level
FRLVL: u2 = 0,
/// FTLVL [11:12]
/// FIFO transmission level
FTLVL: u2 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x8);

/// DR
const DR_val = packed struct {
/// DR [0:15]
/// Data register
DR: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// data register
pub const DR = Register(DR_val).init(base_address + 0xc);

/// CRCPR
const CRCPR_val = packed struct {
/// CRCPOLY [0:15]
/// CRC polynomial register
CRCPOLY: u16 = 7,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// CRC polynomial register
pub const CRCPR = Register(CRCPR_val).init(base_address + 0x10);

/// RXCRCR
const RXCRCR_val = packed struct {
/// RxCRC [0:15]
/// Rx CRC register
RxCRC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// RX CRC register
pub const RXCRCR = Register(RXCRCR_val).init(base_address + 0x14);

/// TXCRCR
const TXCRCR_val = packed struct {
/// TxCRC [0:15]
/// Tx CRC register
TxCRC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// TX CRC register
pub const TXCRCR = Register(TXCRCR_val).init(base_address + 0x18);

/// I2SCFGR
const I2SCFGR_val = packed struct {
/// CHLEN [0:0]
/// Channel length (number of bits per audio
CHLEN: u1 = 0,
/// DATLEN [1:2]
/// Data length to be
DATLEN: u2 = 0,
/// CKPOL [3:3]
/// Steady state clock
CKPOL: u1 = 0,
/// I2SSTD [4:5]
/// I2S standard selection
I2SSTD: u2 = 0,
/// unused [6:6]
_unused6: u1 = 0,
/// PCMSYNC [7:7]
/// PCM frame synchronization
PCMSYNC: u1 = 0,
/// I2SCFG [8:9]
/// I2S configuration mode
I2SCFG: u2 = 0,
/// I2SE [10:10]
/// I2S Enable
I2SE: u1 = 0,
/// I2SMOD [11:11]
/// I2S mode selection
I2SMOD: u1 = 0,
/// unused [12:31]
_unused12: u4 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// I2S configuration register
pub const I2SCFGR = Register(I2SCFGR_val).init(base_address + 0x1c);

/// I2SPR
const I2SPR_val = packed struct {
/// I2SDIV [0:7]
/// I2S Linear prescaler
I2SDIV: u8 = 16,
/// ODD [8:8]
/// Odd factor for the
ODD: u1 = 0,
/// MCKOE [9:9]
/// Master clock output enable
MCKOE: u1 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// I2S prescaler register
pub const I2SPR = Register(I2SPR_val).init(base_address + 0x20);
};

/// Digital-to-analog converter
pub const DAC = struct {

const base_address = 0x40007400;
/// CR
const CR_val = packed struct {
/// EN1 [0:0]
/// DAC channel1 enable
EN1: u1 = 0,
/// BOFF1 [1:1]
/// DAC channel1 output buffer
BOFF1: u1 = 0,
/// TEN1 [2:2]
/// DAC channel1 trigger
TEN1: u1 = 0,
/// TSEL10 [3:3]
/// DAC channel1 trigger
TSEL10: u1 = 0,
/// TSEL11 [4:4]
/// DAC channel1 trigger
TSEL11: u1 = 0,
/// TSEL12 [5:5]
/// DAC channel1 trigger
TSEL12: u1 = 0,
/// unused [6:11]
_unused6: u2 = 0,
_unused8: u4 = 0,
/// DMAEN1 [12:12]
/// DAC channel1 DMA enable
DMAEN1: u1 = 0,
/// DMAUDRIE1 [13:13]
/// DAC channel1 DMA Underrun Interrupt
DMAUDRIE1: u1 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register
pub const CR = Register(CR_val).init(base_address + 0x0);

/// SWTRIGR
const SWTRIGR_val = packed struct {
/// SWTRIG1 [0:0]
/// DAC channel1 software
SWTRIG1: u1 = 0,
/// unused [1:31]
_unused1: u7 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// software trigger register
pub const SWTRIGR = Register(SWTRIGR_val).init(base_address + 0x4);

/// DHR12R1
const DHR12R1_val = packed struct {
/// DACC1DHR [0:11]
/// DAC channel1 12-bit right-aligned
DACC1DHR: u12 = 0,
/// unused [12:31]
_unused12: u4 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// channel1 12-bit right-aligned data holding
pub const DHR12R1 = Register(DHR12R1_val).init(base_address + 0x8);

/// DHR12L1
const DHR12L1_val = packed struct {
/// unused [0:3]
_unused0: u4 = 0,
/// DACC1DHR [4:15]
/// DAC channel1 12-bit left-aligned
DACC1DHR: u12 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// channel1 12-bit left aligned data holding
pub const DHR12L1 = Register(DHR12L1_val).init(base_address + 0xc);

/// DHR8R1
const DHR8R1_val = packed struct {
/// DACC1DHR [0:7]
/// DAC channel1 8-bit right-aligned
DACC1DHR: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// channel1 8-bit right aligned data holding
pub const DHR8R1 = Register(DHR8R1_val).init(base_address + 0x10);

/// DOR1
const DOR1_val = packed struct {
/// DACC1DOR [0:11]
/// DAC channel1 data output
DACC1DOR: u12 = 0,
/// unused [12:31]
_unused12: u4 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// channel1 data output register
pub const DOR1 = Register(DOR1_val).init(base_address + 0x2c);

/// SR
const SR_val = packed struct {
/// unused [0:12]
_unused0: u8 = 0,
_unused8: u5 = 0,
/// DMAUDR1 [13:13]
/// DAC channel1 DMA underrun
DMAUDR1: u1 = 0,
/// unused [14:28]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u5 = 0,
/// DMAUDR2 [29:29]
/// DAC channel2 DMA underrun
DMAUDR2: u1 = 0,
/// unused [30:31]
_unused30: u2 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x34);
};

/// Power control
pub const PWR = struct {

const base_address = 0x40007000;
/// CR
const CR_val = packed struct {
/// LPDS [0:0]
/// Low-power deep sleep
LPDS: u1 = 0,
/// PDDS [1:1]
/// Power down deepsleep
PDDS: u1 = 0,
/// CWUF [2:2]
/// Clear wakeup flag
CWUF: u1 = 0,
/// CSBF [3:3]
/// Clear standby flag
CSBF: u1 = 0,
/// PVDE [4:4]
/// Power voltage detector
PVDE: u1 = 0,
/// PLS [5:7]
/// PVD level selection
PLS: u3 = 0,
/// DBP [8:8]
/// Disable backup domain write
DBP: u1 = 0,
/// FPDS [9:9]
/// Flash power down in Stop
FPDS: u1 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// power control register
pub const CR = Register(CR_val).init(base_address + 0x0);

/// CSR
const CSR_val = packed struct {
/// WUF [0:0]
/// Wakeup flag
WUF: u1 = 0,
/// SBF [1:1]
/// Standby flag
SBF: u1 = 0,
/// PVDO [2:2]
/// PVD output
PVDO: u1 = 0,
/// BRR [3:3]
/// Backup regulator ready
BRR: u1 = 0,
/// unused [4:7]
_unused4: u4 = 0,
/// EWUP [8:8]
/// Enable WKUP pin
EWUP: u1 = 0,
/// BRE [9:9]
/// Backup regulator enable
BRE: u1 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// power control/status register
pub const CSR = Register(CSR_val).init(base_address + 0x4);
};

/// Inter-integrated circuit
pub const I2C1 = struct {

const base_address = 0x40005400;
/// CR1
const CR1_val = packed struct {
/// PE [0:0]
/// Peripheral enable
PE: u1 = 0,
/// TXIE [1:1]
/// TX Interrupt enable
TXIE: u1 = 0,
/// RXIE [2:2]
/// RX Interrupt enable
RXIE: u1 = 0,
/// ADDRIE [3:3]
/// Address match interrupt enable (slave
ADDRIE: u1 = 0,
/// NACKIE [4:4]
/// Not acknowledge received interrupt
NACKIE: u1 = 0,
/// STOPIE [5:5]
/// STOP detection Interrupt
STOPIE: u1 = 0,
/// TCIE [6:6]
/// Transfer Complete interrupt
TCIE: u1 = 0,
/// ERRIE [7:7]
/// Error interrupts enable
ERRIE: u1 = 0,
/// DNF [8:11]
/// Digital noise filter
DNF: u4 = 0,
/// ANFOFF [12:12]
/// Analog noise filter OFF
ANFOFF: u1 = 0,
/// SWRST [13:13]
/// Software reset
SWRST: u1 = 0,
/// TXDMAEN [14:14]
/// DMA transmission requests
TXDMAEN: u1 = 0,
/// RXDMAEN [15:15]
/// DMA reception requests
RXDMAEN: u1 = 0,
/// SBC [16:16]
/// Slave byte control
SBC: u1 = 0,
/// NOSTRETCH [17:17]
/// Clock stretching disable
NOSTRETCH: u1 = 0,
/// WUPEN [18:18]
/// Wakeup from STOP enable
WUPEN: u1 = 0,
/// GCEN [19:19]
/// General call enable
GCEN: u1 = 0,
/// SMBHEN [20:20]
/// SMBus Host address enable
SMBHEN: u1 = 0,
/// SMBDEN [21:21]
/// SMBus Device Default address
SMBDEN: u1 = 0,
/// ALERTEN [22:22]
/// SMBUS alert enable
ALERTEN: u1 = 0,
/// PECEN [23:23]
/// PEC enable
PECEN: u1 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// Control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// SADD0 [0:0]
/// Slave address bit 0 (master
SADD0: u1 = 0,
/// SADD1 [1:7]
/// Slave address bit 7:1 (master
SADD1: u7 = 0,
/// SADD8 [8:9]
/// Slave address bit 9:8 (master
SADD8: u2 = 0,
/// RD_WRN [10:10]
/// Transfer direction (master
RD_WRN: u1 = 0,
/// ADD10 [11:11]
/// 10-bit addressing mode (master
ADD10: u1 = 0,
/// HEAD10R [12:12]
/// 10-bit address header only read
HEAD10R: u1 = 0,
/// START [13:13]
/// Start generation
START: u1 = 0,
/// STOP [14:14]
/// Stop generation (master
STOP: u1 = 0,
/// NACK [15:15]
/// NACK generation (slave
NACK: u1 = 0,
/// NBYTES [16:23]
/// Number of bytes
NBYTES: u8 = 0,
/// RELOAD [24:24]
/// NBYTES reload mode
RELOAD: u1 = 0,
/// AUTOEND [25:25]
/// Automatic end mode (master
AUTOEND: u1 = 0,
/// PECBYTE [26:26]
/// Packet error checking byte
PECBYTE: u1 = 0,
/// unused [27:31]
_unused27: u5 = 0,
};
/// Control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// OAR1
const OAR1_val = packed struct {
/// OA1_0 [0:0]
/// Interface address
OA1_0: u1 = 0,
/// OA1_1 [1:7]
/// Interface address
OA1_1: u7 = 0,
/// OA1_8 [8:9]
/// Interface address
OA1_8: u2 = 0,
/// OA1MODE [10:10]
/// Own Address 1 10-bit mode
OA1MODE: u1 = 0,
/// unused [11:14]
_unused11: u4 = 0,
/// OA1EN [15:15]
/// Own Address 1 enable
OA1EN: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Own address register 1
pub const OAR1 = Register(OAR1_val).init(base_address + 0x8);

/// OAR2
const OAR2_val = packed struct {
/// unused [0:0]
_unused0: u1 = 0,
/// OA2 [1:7]
/// Interface address
OA2: u7 = 0,
/// OA2MSK [8:10]
/// Own Address 2 masks
OA2MSK: u3 = 0,
/// unused [11:14]
_unused11: u4 = 0,
/// OA2EN [15:15]
/// Own Address 2 enable
OA2EN: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Own address register 2
pub const OAR2 = Register(OAR2_val).init(base_address + 0xc);

/// TIMINGR
const TIMINGR_val = packed struct {
/// SCLL [0:7]
/// SCL low period (master
SCLL: u8 = 0,
/// SCLH [8:15]
/// SCL high period (master
SCLH: u8 = 0,
/// SDADEL [16:19]
/// Data hold time
SDADEL: u4 = 0,
/// SCLDEL [20:23]
/// Data setup time
SCLDEL: u4 = 0,
/// unused [24:27]
_unused24: u4 = 0,
/// PRESC [28:31]
/// Timing prescaler
PRESC: u4 = 0,
};
/// Timing register
pub const TIMINGR = Register(TIMINGR_val).init(base_address + 0x10);

/// TIMEOUTR
const TIMEOUTR_val = packed struct {
/// TIMEOUTA [0:11]
/// Bus timeout A
TIMEOUTA: u12 = 0,
/// TIDLE [12:12]
/// Idle clock timeout
TIDLE: u1 = 0,
/// unused [13:14]
_unused13: u2 = 0,
/// TIMOUTEN [15:15]
/// Clock timeout enable
TIMOUTEN: u1 = 0,
/// TIMEOUTB [16:27]
/// Bus timeout B
TIMEOUTB: u12 = 0,
/// unused [28:30]
_unused28: u3 = 0,
/// TEXTEN [31:31]
/// Extended clock timeout
TEXTEN: u1 = 0,
};
/// Status register 1
pub const TIMEOUTR = Register(TIMEOUTR_val).init(base_address + 0x14);

/// ISR
const ISR_val = packed struct {
/// TXE [0:0]
/// Transmit data register empty
TXE: u1 = 1,
/// TXIS [1:1]
/// Transmit interrupt status
TXIS: u1 = 0,
/// RXNE [2:2]
/// Receive data register not empty
RXNE: u1 = 0,
/// ADDR [3:3]
/// Address matched (slave
ADDR: u1 = 0,
/// NACKF [4:4]
/// Not acknowledge received
NACKF: u1 = 0,
/// STOPF [5:5]
/// Stop detection flag
STOPF: u1 = 0,
/// TC [6:6]
/// Transfer Complete (master
TC: u1 = 0,
/// TCR [7:7]
/// Transfer Complete Reload
TCR: u1 = 0,
/// BERR [8:8]
/// Bus error
BERR: u1 = 0,
/// ARLO [9:9]
/// Arbitration lost
ARLO: u1 = 0,
/// OVR [10:10]
/// Overrun/Underrun (slave
OVR: u1 = 0,
/// PECERR [11:11]
/// PEC Error in reception
PECERR: u1 = 0,
/// TIMEOUT [12:12]
/// Timeout or t_low detection
TIMEOUT: u1 = 0,
/// ALERT [13:13]
/// SMBus alert
ALERT: u1 = 0,
/// unused [14:14]
_unused14: u1 = 0,
/// BUSY [15:15]
/// Bus busy
BUSY: u1 = 0,
/// DIR [16:16]
/// Transfer direction (Slave
DIR: u1 = 0,
/// ADDCODE [17:23]
/// Address match code (Slave
ADDCODE: u7 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// Interrupt and Status register
pub const ISR = Register(ISR_val).init(base_address + 0x18);

/// ICR
const ICR_val = packed struct {
/// unused [0:2]
_unused0: u3 = 0,
/// ADDRCF [3:3]
/// Address Matched flag clear
ADDRCF: u1 = 0,
/// NACKCF [4:4]
/// Not Acknowledge flag clear
NACKCF: u1 = 0,
/// STOPCF [5:5]
/// Stop detection flag clear
STOPCF: u1 = 0,
/// unused [6:7]
_unused6: u2 = 0,
/// BERRCF [8:8]
/// Bus error flag clear
BERRCF: u1 = 0,
/// ARLOCF [9:9]
/// Arbitration lost flag
ARLOCF: u1 = 0,
/// OVRCF [10:10]
/// Overrun/Underrun flag
OVRCF: u1 = 0,
/// PECCF [11:11]
/// PEC Error flag clear
PECCF: u1 = 0,
/// TIMOUTCF [12:12]
/// Timeout detection flag
TIMOUTCF: u1 = 0,
/// ALERTCF [13:13]
/// Alert flag clear
ALERTCF: u1 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Interrupt clear register
pub const ICR = Register(ICR_val).init(base_address + 0x1c);

/// PECR
const PECR_val = packed struct {
/// PEC [0:7]
/// Packet error checking
PEC: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// PEC register
pub const PECR = Register(PECR_val).init(base_address + 0x20);

/// RXDR
const RXDR_val = packed struct {
/// RXDATA [0:7]
/// 8-bit receive data
RXDATA: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Receive data register
pub const RXDR = Register(RXDR_val).init(base_address + 0x24);

/// TXDR
const TXDR_val = packed struct {
/// TXDATA [0:7]
/// 8-bit transmit data
TXDATA: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Transmit data register
pub const TXDR = Register(TXDR_val).init(base_address + 0x28);
};

/// Inter-integrated circuit
pub const I2C2 = struct {

const base_address = 0x40005800;
/// CR1
const CR1_val = packed struct {
/// PE [0:0]
/// Peripheral enable
PE: u1 = 0,
/// TXIE [1:1]
/// TX Interrupt enable
TXIE: u1 = 0,
/// RXIE [2:2]
/// RX Interrupt enable
RXIE: u1 = 0,
/// ADDRIE [3:3]
/// Address match interrupt enable (slave
ADDRIE: u1 = 0,
/// NACKIE [4:4]
/// Not acknowledge received interrupt
NACKIE: u1 = 0,
/// STOPIE [5:5]
/// STOP detection Interrupt
STOPIE: u1 = 0,
/// TCIE [6:6]
/// Transfer Complete interrupt
TCIE: u1 = 0,
/// ERRIE [7:7]
/// Error interrupts enable
ERRIE: u1 = 0,
/// DNF [8:11]
/// Digital noise filter
DNF: u4 = 0,
/// ANFOFF [12:12]
/// Analog noise filter OFF
ANFOFF: u1 = 0,
/// SWRST [13:13]
/// Software reset
SWRST: u1 = 0,
/// TXDMAEN [14:14]
/// DMA transmission requests
TXDMAEN: u1 = 0,
/// RXDMAEN [15:15]
/// DMA reception requests
RXDMAEN: u1 = 0,
/// SBC [16:16]
/// Slave byte control
SBC: u1 = 0,
/// NOSTRETCH [17:17]
/// Clock stretching disable
NOSTRETCH: u1 = 0,
/// WUPEN [18:18]
/// Wakeup from STOP enable
WUPEN: u1 = 0,
/// GCEN [19:19]
/// General call enable
GCEN: u1 = 0,
/// SMBHEN [20:20]
/// SMBus Host address enable
SMBHEN: u1 = 0,
/// SMBDEN [21:21]
/// SMBus Device Default address
SMBDEN: u1 = 0,
/// ALERTEN [22:22]
/// SMBUS alert enable
ALERTEN: u1 = 0,
/// PECEN [23:23]
/// PEC enable
PECEN: u1 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// Control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// SADD0 [0:0]
/// Slave address bit 0 (master
SADD0: u1 = 0,
/// SADD1 [1:7]
/// Slave address bit 7:1 (master
SADD1: u7 = 0,
/// SADD8 [8:9]
/// Slave address bit 9:8 (master
SADD8: u2 = 0,
/// RD_WRN [10:10]
/// Transfer direction (master
RD_WRN: u1 = 0,
/// ADD10 [11:11]
/// 10-bit addressing mode (master
ADD10: u1 = 0,
/// HEAD10R [12:12]
/// 10-bit address header only read
HEAD10R: u1 = 0,
/// START [13:13]
/// Start generation
START: u1 = 0,
/// STOP [14:14]
/// Stop generation (master
STOP: u1 = 0,
/// NACK [15:15]
/// NACK generation (slave
NACK: u1 = 0,
/// NBYTES [16:23]
/// Number of bytes
NBYTES: u8 = 0,
/// RELOAD [24:24]
/// NBYTES reload mode
RELOAD: u1 = 0,
/// AUTOEND [25:25]
/// Automatic end mode (master
AUTOEND: u1 = 0,
/// PECBYTE [26:26]
/// Packet error checking byte
PECBYTE: u1 = 0,
/// unused [27:31]
_unused27: u5 = 0,
};
/// Control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// OAR1
const OAR1_val = packed struct {
/// OA1_0 [0:0]
/// Interface address
OA1_0: u1 = 0,
/// OA1_1 [1:7]
/// Interface address
OA1_1: u7 = 0,
/// OA1_8 [8:9]
/// Interface address
OA1_8: u2 = 0,
/// OA1MODE [10:10]
/// Own Address 1 10-bit mode
OA1MODE: u1 = 0,
/// unused [11:14]
_unused11: u4 = 0,
/// OA1EN [15:15]
/// Own Address 1 enable
OA1EN: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Own address register 1
pub const OAR1 = Register(OAR1_val).init(base_address + 0x8);

/// OAR2
const OAR2_val = packed struct {
/// unused [0:0]
_unused0: u1 = 0,
/// OA2 [1:7]
/// Interface address
OA2: u7 = 0,
/// OA2MSK [8:10]
/// Own Address 2 masks
OA2MSK: u3 = 0,
/// unused [11:14]
_unused11: u4 = 0,
/// OA2EN [15:15]
/// Own Address 2 enable
OA2EN: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Own address register 2
pub const OAR2 = Register(OAR2_val).init(base_address + 0xc);

/// TIMINGR
const TIMINGR_val = packed struct {
/// SCLL [0:7]
/// SCL low period (master
SCLL: u8 = 0,
/// SCLH [8:15]
/// SCL high period (master
SCLH: u8 = 0,
/// SDADEL [16:19]
/// Data hold time
SDADEL: u4 = 0,
/// SCLDEL [20:23]
/// Data setup time
SCLDEL: u4 = 0,
/// unused [24:27]
_unused24: u4 = 0,
/// PRESC [28:31]
/// Timing prescaler
PRESC: u4 = 0,
};
/// Timing register
pub const TIMINGR = Register(TIMINGR_val).init(base_address + 0x10);

/// TIMEOUTR
const TIMEOUTR_val = packed struct {
/// TIMEOUTA [0:11]
/// Bus timeout A
TIMEOUTA: u12 = 0,
/// TIDLE [12:12]
/// Idle clock timeout
TIDLE: u1 = 0,
/// unused [13:14]
_unused13: u2 = 0,
/// TIMOUTEN [15:15]
/// Clock timeout enable
TIMOUTEN: u1 = 0,
/// TIMEOUTB [16:27]
/// Bus timeout B
TIMEOUTB: u12 = 0,
/// unused [28:30]
_unused28: u3 = 0,
/// TEXTEN [31:31]
/// Extended clock timeout
TEXTEN: u1 = 0,
};
/// Status register 1
pub const TIMEOUTR = Register(TIMEOUTR_val).init(base_address + 0x14);

/// ISR
const ISR_val = packed struct {
/// TXE [0:0]
/// Transmit data register empty
TXE: u1 = 1,
/// TXIS [1:1]
/// Transmit interrupt status
TXIS: u1 = 0,
/// RXNE [2:2]
/// Receive data register not empty
RXNE: u1 = 0,
/// ADDR [3:3]
/// Address matched (slave
ADDR: u1 = 0,
/// NACKF [4:4]
/// Not acknowledge received
NACKF: u1 = 0,
/// STOPF [5:5]
/// Stop detection flag
STOPF: u1 = 0,
/// TC [6:6]
/// Transfer Complete (master
TC: u1 = 0,
/// TCR [7:7]
/// Transfer Complete Reload
TCR: u1 = 0,
/// BERR [8:8]
/// Bus error
BERR: u1 = 0,
/// ARLO [9:9]
/// Arbitration lost
ARLO: u1 = 0,
/// OVR [10:10]
/// Overrun/Underrun (slave
OVR: u1 = 0,
/// PECERR [11:11]
/// PEC Error in reception
PECERR: u1 = 0,
/// TIMEOUT [12:12]
/// Timeout or t_low detection
TIMEOUT: u1 = 0,
/// ALERT [13:13]
/// SMBus alert
ALERT: u1 = 0,
/// unused [14:14]
_unused14: u1 = 0,
/// BUSY [15:15]
/// Bus busy
BUSY: u1 = 0,
/// DIR [16:16]
/// Transfer direction (Slave
DIR: u1 = 0,
/// ADDCODE [17:23]
/// Address match code (Slave
ADDCODE: u7 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// Interrupt and Status register
pub const ISR = Register(ISR_val).init(base_address + 0x18);

/// ICR
const ICR_val = packed struct {
/// unused [0:2]
_unused0: u3 = 0,
/// ADDRCF [3:3]
/// Address Matched flag clear
ADDRCF: u1 = 0,
/// NACKCF [4:4]
/// Not Acknowledge flag clear
NACKCF: u1 = 0,
/// STOPCF [5:5]
/// Stop detection flag clear
STOPCF: u1 = 0,
/// unused [6:7]
_unused6: u2 = 0,
/// BERRCF [8:8]
/// Bus error flag clear
BERRCF: u1 = 0,
/// ARLOCF [9:9]
/// Arbitration lost flag
ARLOCF: u1 = 0,
/// OVRCF [10:10]
/// Overrun/Underrun flag
OVRCF: u1 = 0,
/// PECCF [11:11]
/// PEC Error flag clear
PECCF: u1 = 0,
/// TIMOUTCF [12:12]
/// Timeout detection flag
TIMOUTCF: u1 = 0,
/// ALERTCF [13:13]
/// Alert flag clear
ALERTCF: u1 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Interrupt clear register
pub const ICR = Register(ICR_val).init(base_address + 0x1c);

/// PECR
const PECR_val = packed struct {
/// PEC [0:7]
/// Packet error checking
PEC: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// PEC register
pub const PECR = Register(PECR_val).init(base_address + 0x20);

/// RXDR
const RXDR_val = packed struct {
/// RXDATA [0:7]
/// 8-bit receive data
RXDATA: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Receive data register
pub const RXDR = Register(RXDR_val).init(base_address + 0x24);

/// TXDR
const TXDR_val = packed struct {
/// TXDATA [0:7]
/// 8-bit transmit data
TXDATA: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Transmit data register
pub const TXDR = Register(TXDR_val).init(base_address + 0x28);
};

/// Independent watchdog
pub const IWDG = struct {

const base_address = 0x40003000;
/// KR
const KR_val = packed struct {
/// KEY [0:15]
/// Key value
KEY: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Key register
pub const KR = Register(KR_val).init(base_address + 0x0);

/// PR
const PR_val = packed struct {
/// PR [0:2]
/// Prescaler divider
PR: u3 = 0,
/// unused [3:31]
_unused3: u5 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Prescaler register
pub const PR = Register(PR_val).init(base_address + 0x4);

/// RLR
const RLR_val = packed struct {
/// RL [0:11]
/// Watchdog counter reload
RL: u12 = 4095,
/// unused [12:31]
_unused12: u4 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Reload register
pub const RLR = Register(RLR_val).init(base_address + 0x8);

/// SR
const SR_val = packed struct {
/// PVU [0:0]
/// Watchdog prescaler value
PVU: u1 = 0,
/// RVU [1:1]
/// Watchdog counter reload value
RVU: u1 = 0,
/// WVU [2:2]
/// Watchdog counter window value
WVU: u1 = 0,
/// unused [3:31]
_unused3: u5 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Status register
pub const SR = Register(SR_val).init(base_address + 0xc);

/// WINR
const WINR_val = packed struct {
/// WIN [0:11]
/// Watchdog counter window
WIN: u12 = 4095,
/// unused [12:31]
_unused12: u4 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Window register
pub const WINR = Register(WINR_val).init(base_address + 0x10);
};

/// Window watchdog
pub const WWDG = struct {

const base_address = 0x40002c00;
/// CR
const CR_val = packed struct {
/// T [0:6]
/// 7-bit counter
T: u7 = 127,
/// WDGA [7:7]
/// Activation bit
WDGA: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Control register
pub const CR = Register(CR_val).init(base_address + 0x0);

/// CFR
const CFR_val = packed struct {
/// W [0:6]
/// 7-bit window value
W: u7 = 127,
/// WDGTB [7:8]
/// Timer base
WDGTB: u2 = 0,
/// EWI [9:9]
/// Early wakeup interrupt
EWI: u1 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Configuration register
pub const CFR = Register(CFR_val).init(base_address + 0x4);

/// SR
const SR_val = packed struct {
/// EWIF [0:0]
/// Early wakeup interrupt
EWIF: u1 = 0,
/// unused [1:31]
_unused1: u7 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Status register
pub const SR = Register(SR_val).init(base_address + 0x8);
};

/// Advanced-timers
pub const TIM1 = struct {

const base_address = 0x40012c00;
/// CR1
const CR1_val = packed struct {
/// CEN [0:0]
/// Counter enable
CEN: u1 = 0,
/// UDIS [1:1]
/// Update disable
UDIS: u1 = 0,
/// URS [2:2]
/// Update request source
URS: u1 = 0,
/// OPM [3:3]
/// One-pulse mode
OPM: u1 = 0,
/// DIR [4:4]
/// Direction
DIR: u1 = 0,
/// CMS [5:6]
/// Center-aligned mode
CMS: u2 = 0,
/// ARPE [7:7]
/// Auto-reload preload enable
ARPE: u1 = 0,
/// CKD [8:9]
/// Clock division
CKD: u2 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// CCPC [0:0]
/// Capture/compare preloaded
CCPC: u1 = 0,
/// unused [1:1]
_unused1: u1 = 0,
/// CCUS [2:2]
/// Capture/compare control update
CCUS: u1 = 0,
/// CCDS [3:3]
/// Capture/compare DMA
CCDS: u1 = 0,
/// MMS [4:6]
/// Master mode selection
MMS: u3 = 0,
/// TI1S [7:7]
/// TI1 selection
TI1S: u1 = 0,
/// OIS1 [8:8]
/// Output Idle state 1
OIS1: u1 = 0,
/// OIS1N [9:9]
/// Output Idle state 1
OIS1N: u1 = 0,
/// OIS2 [10:10]
/// Output Idle state 2
OIS2: u1 = 0,
/// OIS2N [11:11]
/// Output Idle state 2
OIS2N: u1 = 0,
/// OIS3 [12:12]
/// Output Idle state 3
OIS3: u1 = 0,
/// OIS3N [13:13]
/// Output Idle state 3
OIS3N: u1 = 0,
/// OIS4 [14:14]
/// Output Idle state 4
OIS4: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// SMCR
const SMCR_val = packed struct {
/// SMS [0:2]
/// Slave mode selection
SMS: u3 = 0,
/// unused [3:3]
_unused3: u1 = 0,
/// TS [4:6]
/// Trigger selection
TS: u3 = 0,
/// MSM [7:7]
/// Master/Slave mode
MSM: u1 = 0,
/// ETF [8:11]
/// External trigger filter
ETF: u4 = 0,
/// ETPS [12:13]
/// External trigger prescaler
ETPS: u2 = 0,
/// ECE [14:14]
/// External clock enable
ECE: u1 = 0,
/// ETP [15:15]
/// External trigger polarity
ETP: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// slave mode control register
pub const SMCR = Register(SMCR_val).init(base_address + 0x8);

/// DIER
const DIER_val = packed struct {
/// UIE [0:0]
/// Update interrupt enable
UIE: u1 = 0,
/// CC1IE [1:1]
/// Capture/Compare 1 interrupt
CC1IE: u1 = 0,
/// CC2IE [2:2]
/// Capture/Compare 2 interrupt
CC2IE: u1 = 0,
/// CC3IE [3:3]
/// Capture/Compare 3 interrupt
CC3IE: u1 = 0,
/// CC4IE [4:4]
/// Capture/Compare 4 interrupt
CC4IE: u1 = 0,
/// COMIE [5:5]
/// COM interrupt enable
COMIE: u1 = 0,
/// TIE [6:6]
/// Trigger interrupt enable
TIE: u1 = 0,
/// BIE [7:7]
/// Break interrupt enable
BIE: u1 = 0,
/// UDE [8:8]
/// Update DMA request enable
UDE: u1 = 0,
/// CC1DE [9:9]
/// Capture/Compare 1 DMA request
CC1DE: u1 = 0,
/// CC2DE [10:10]
/// Capture/Compare 2 DMA request
CC2DE: u1 = 0,
/// CC3DE [11:11]
/// Capture/Compare 3 DMA request
CC3DE: u1 = 0,
/// CC4DE [12:12]
/// Capture/Compare 4 DMA request
CC4DE: u1 = 0,
/// COMDE [13:13]
/// Reserved
COMDE: u1 = 0,
/// TDE [14:14]
/// Trigger DMA request enable
TDE: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA/Interrupt enable register
pub const DIER = Register(DIER_val).init(base_address + 0xc);

/// SR
const SR_val = packed struct {
/// UIF [0:0]
/// Update interrupt flag
UIF: u1 = 0,
/// CC1IF [1:1]
/// Capture/compare 1 interrupt
CC1IF: u1 = 0,
/// CC2IF [2:2]
/// Capture/Compare 2 interrupt
CC2IF: u1 = 0,
/// CC3IF [3:3]
/// Capture/Compare 3 interrupt
CC3IF: u1 = 0,
/// CC4IF [4:4]
/// Capture/Compare 4 interrupt
CC4IF: u1 = 0,
/// COMIF [5:5]
/// COM interrupt flag
COMIF: u1 = 0,
/// TIF [6:6]
/// Trigger interrupt flag
TIF: u1 = 0,
/// BIF [7:7]
/// Break interrupt flag
BIF: u1 = 0,
/// unused [8:8]
_unused8: u1 = 0,
/// CC1OF [9:9]
/// Capture/Compare 1 overcapture
CC1OF: u1 = 0,
/// CC2OF [10:10]
/// Capture/compare 2 overcapture
CC2OF: u1 = 0,
/// CC3OF [11:11]
/// Capture/Compare 3 overcapture
CC3OF: u1 = 0,
/// CC4OF [12:12]
/// Capture/Compare 4 overcapture
CC4OF: u1 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x10);

/// EGR
const EGR_val = packed struct {
/// UG [0:0]
/// Update generation
UG: u1 = 0,
/// CC1G [1:1]
/// Capture/compare 1
CC1G: u1 = 0,
/// CC2G [2:2]
/// Capture/compare 2
CC2G: u1 = 0,
/// CC3G [3:3]
/// Capture/compare 3
CC3G: u1 = 0,
/// CC4G [4:4]
/// Capture/compare 4
CC4G: u1 = 0,
/// COMG [5:5]
/// Capture/Compare control update
COMG: u1 = 0,
/// TG [6:6]
/// Trigger generation
TG: u1 = 0,
/// BG [7:7]
/// Break generation
BG: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// event generation register
pub const EGR = Register(EGR_val).init(base_address + 0x14);

/// CCMR1_Output
const CCMR1_Output_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// OC1FE [2:2]
/// Output Compare 1 fast
OC1FE: u1 = 0,
/// OC1PE [3:3]
/// Output Compare 1 preload
OC1PE: u1 = 0,
/// OC1M [4:6]
/// Output Compare 1 mode
OC1M: u3 = 0,
/// OC1CE [7:7]
/// Output Compare 1 clear
OC1CE: u1 = 0,
/// CC2S [8:9]
/// Capture/Compare 2
CC2S: u2 = 0,
/// OC2FE [10:10]
/// Output Compare 2 fast
OC2FE: u1 = 0,
/// OC2PE [11:11]
/// Output Compare 2 preload
OC2PE: u1 = 0,
/// OC2M [12:14]
/// Output Compare 2 mode
OC2M: u3 = 0,
/// OC2CE [15:15]
/// Output Compare 2 clear
OC2CE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register (output
pub const CCMR1_Output = Register(CCMR1_Output_val).init(base_address + 0x18);

/// CCMR1_Input
const CCMR1_Input_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// IC1PCS [2:3]
/// Input capture 1 prescaler
IC1PCS: u2 = 0,
/// IC1F [4:7]
/// Input capture 1 filter
IC1F: u4 = 0,
/// CC2S [8:9]
/// Capture/Compare 2
CC2S: u2 = 0,
/// IC2PCS [10:11]
/// Input capture 2 prescaler
IC2PCS: u2 = 0,
/// IC2F [12:15]
/// Input capture 2 filter
IC2F: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 1 (input
pub const CCMR1_Input = Register(CCMR1_Input_val).init(base_address + 0x18);

/// CCMR2_Output
const CCMR2_Output_val = packed struct {
/// CC3S [0:1]
/// Capture/Compare 3
CC3S: u2 = 0,
/// OC3FE [2:2]
/// Output compare 3 fast
OC3FE: u1 = 0,
/// OC3PE [3:3]
/// Output compare 3 preload
OC3PE: u1 = 0,
/// OC3M [4:6]
/// Output compare 3 mode
OC3M: u3 = 0,
/// OC3CE [7:7]
/// Output compare 3 clear
OC3CE: u1 = 0,
/// CC4S [8:9]
/// Capture/Compare 4
CC4S: u2 = 0,
/// OC4FE [10:10]
/// Output compare 4 fast
OC4FE: u1 = 0,
/// OC4PE [11:11]
/// Output compare 4 preload
OC4PE: u1 = 0,
/// OC4M [12:14]
/// Output compare 4 mode
OC4M: u3 = 0,
/// OC4CE [15:15]
/// Output compare 4 clear
OC4CE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register (output
pub const CCMR2_Output = Register(CCMR2_Output_val).init(base_address + 0x1c);

/// CCMR2_Input
const CCMR2_Input_val = packed struct {
/// CC3S [0:1]
/// Capture/compare 3
CC3S: u2 = 0,
/// IC3PSC [2:3]
/// Input capture 3 prescaler
IC3PSC: u2 = 0,
/// IC3F [4:7]
/// Input capture 3 filter
IC3F: u4 = 0,
/// CC4S [8:9]
/// Capture/Compare 4
CC4S: u2 = 0,
/// IC4PSC [10:11]
/// Input capture 4 prescaler
IC4PSC: u2 = 0,
/// IC4F [12:15]
/// Input capture 4 filter
IC4F: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 2 (input
pub const CCMR2_Input = Register(CCMR2_Input_val).init(base_address + 0x1c);

/// CCER
const CCER_val = packed struct {
/// CC1E [0:0]
/// Capture/Compare 1 output
CC1E: u1 = 0,
/// CC1P [1:1]
/// Capture/Compare 1 output
CC1P: u1 = 0,
/// CC1NE [2:2]
/// Capture/Compare 1 complementary output
CC1NE: u1 = 0,
/// CC1NP [3:3]
/// Capture/Compare 1 output
CC1NP: u1 = 0,
/// CC2E [4:4]
/// Capture/Compare 2 output
CC2E: u1 = 0,
/// CC2P [5:5]
/// Capture/Compare 2 output
CC2P: u1 = 0,
/// CC2NE [6:6]
/// Capture/Compare 2 complementary output
CC2NE: u1 = 0,
/// CC2NP [7:7]
/// Capture/Compare 2 output
CC2NP: u1 = 0,
/// CC3E [8:8]
/// Capture/Compare 3 output
CC3E: u1 = 0,
/// CC3P [9:9]
/// Capture/Compare 3 output
CC3P: u1 = 0,
/// CC3NE [10:10]
/// Capture/Compare 3 complementary output
CC3NE: u1 = 0,
/// CC3NP [11:11]
/// Capture/Compare 3 output
CC3NP: u1 = 0,
/// CC4E [12:12]
/// Capture/Compare 4 output
CC4E: u1 = 0,
/// CC4P [13:13]
/// Capture/Compare 3 output
CC4P: u1 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare enable
pub const CCER = Register(CCER_val).init(base_address + 0x20);

/// CNT
const CNT_val = packed struct {
/// CNT [0:15]
/// counter value
CNT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// counter
pub const CNT = Register(CNT_val).init(base_address + 0x24);

/// PSC
const PSC_val = packed struct {
/// PSC [0:15]
/// Prescaler value
PSC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// prescaler
pub const PSC = Register(PSC_val).init(base_address + 0x28);

/// ARR
const ARR_val = packed struct {
/// ARR [0:15]
/// Auto-reload value
ARR: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// auto-reload register
pub const ARR = Register(ARR_val).init(base_address + 0x2c);

/// RCR
const RCR_val = packed struct {
/// REP [0:7]
/// Repetition counter value
REP: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// repetition counter register
pub const RCR = Register(RCR_val).init(base_address + 0x30);

/// CCR1
const CCR1_val = packed struct {
/// CCR1 [0:15]
/// Capture/Compare 1 value
CCR1: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare register 1
pub const CCR1 = Register(CCR1_val).init(base_address + 0x34);

/// CCR2
const CCR2_val = packed struct {
/// CCR2 [0:15]
/// Capture/Compare 2 value
CCR2: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare register 2
pub const CCR2 = Register(CCR2_val).init(base_address + 0x38);

/// CCR3
const CCR3_val = packed struct {
/// CCR3 [0:15]
/// Capture/Compare 3 value
CCR3: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare register 3
pub const CCR3 = Register(CCR3_val).init(base_address + 0x3c);

/// CCR4
const CCR4_val = packed struct {
/// CCR4 [0:15]
/// Capture/Compare 3 value
CCR4: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare register 4
pub const CCR4 = Register(CCR4_val).init(base_address + 0x40);

/// BDTR
const BDTR_val = packed struct {
/// DTG [0:7]
/// Dead-time generator setup
DTG: u8 = 0,
/// LOCK [8:9]
/// Lock configuration
LOCK: u2 = 0,
/// OSSI [10:10]
/// Off-state selection for Idle
OSSI: u1 = 0,
/// OSSR [11:11]
/// Off-state selection for Run
OSSR: u1 = 0,
/// BKE [12:12]
/// Break enable
BKE: u1 = 0,
/// BKP [13:13]
/// Break polarity
BKP: u1 = 0,
/// AOE [14:14]
/// Automatic output enable
AOE: u1 = 0,
/// MOE [15:15]
/// Main output enable
MOE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// break and dead-time register
pub const BDTR = Register(BDTR_val).init(base_address + 0x44);

/// DCR
const DCR_val = packed struct {
/// DBA [0:4]
/// DMA base address
DBA: u5 = 0,
/// unused [5:7]
_unused5: u3 = 0,
/// DBL [8:12]
/// DMA burst length
DBL: u5 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA control register
pub const DCR = Register(DCR_val).init(base_address + 0x48);

/// DMAR
const DMAR_val = packed struct {
/// DMAB [0:15]
/// DMA register for burst
DMAB: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA address for full transfer
pub const DMAR = Register(DMAR_val).init(base_address + 0x4c);
};

/// General-purpose-timers
pub const TIM2 = struct {

const base_address = 0x40000000;
/// CR1
const CR1_val = packed struct {
/// CEN [0:0]
/// Counter enable
CEN: u1 = 0,
/// UDIS [1:1]
/// Update disable
UDIS: u1 = 0,
/// URS [2:2]
/// Update request source
URS: u1 = 0,
/// OPM [3:3]
/// One-pulse mode
OPM: u1 = 0,
/// DIR [4:4]
/// Direction
DIR: u1 = 0,
/// CMS [5:6]
/// Center-aligned mode
CMS: u2 = 0,
/// ARPE [7:7]
/// Auto-reload preload enable
ARPE: u1 = 0,
/// CKD [8:9]
/// Clock division
CKD: u2 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// unused [0:2]
_unused0: u3 = 0,
/// CCDS [3:3]
/// Capture/compare DMA
CCDS: u1 = 0,
/// MMS [4:6]
/// Master mode selection
MMS: u3 = 0,
/// TI1S [7:7]
/// TI1 selection
TI1S: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// SMCR
const SMCR_val = packed struct {
/// SMS [0:2]
/// Slave mode selection
SMS: u3 = 0,
/// unused [3:3]
_unused3: u1 = 0,
/// TS [4:6]
/// Trigger selection
TS: u3 = 0,
/// MSM [7:7]
/// Master/Slave mode
MSM: u1 = 0,
/// ETF [8:11]
/// External trigger filter
ETF: u4 = 0,
/// ETPS [12:13]
/// External trigger prescaler
ETPS: u2 = 0,
/// ECE [14:14]
/// External clock enable
ECE: u1 = 0,
/// ETP [15:15]
/// External trigger polarity
ETP: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// slave mode control register
pub const SMCR = Register(SMCR_val).init(base_address + 0x8);

/// DIER
const DIER_val = packed struct {
/// UIE [0:0]
/// Update interrupt enable
UIE: u1 = 0,
/// CC1IE [1:1]
/// Capture/Compare 1 interrupt
CC1IE: u1 = 0,
/// CC2IE [2:2]
/// Capture/Compare 2 interrupt
CC2IE: u1 = 0,
/// CC3IE [3:3]
/// Capture/Compare 3 interrupt
CC3IE: u1 = 0,
/// CC4IE [4:4]
/// Capture/Compare 4 interrupt
CC4IE: u1 = 0,
/// unused [5:5]
_unused5: u1 = 0,
/// TIE [6:6]
/// Trigger interrupt enable
TIE: u1 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// UDE [8:8]
/// Update DMA request enable
UDE: u1 = 0,
/// CC1DE [9:9]
/// Capture/Compare 1 DMA request
CC1DE: u1 = 0,
/// CC2DE [10:10]
/// Capture/Compare 2 DMA request
CC2DE: u1 = 0,
/// CC3DE [11:11]
/// Capture/Compare 3 DMA request
CC3DE: u1 = 0,
/// CC4DE [12:12]
/// Capture/Compare 4 DMA request
CC4DE: u1 = 0,
/// COMDE [13:13]
/// Reserved
COMDE: u1 = 0,
/// TDE [14:14]
/// Trigger DMA request enable
TDE: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA/Interrupt enable register
pub const DIER = Register(DIER_val).init(base_address + 0xc);

/// SR
const SR_val = packed struct {
/// UIF [0:0]
/// Update interrupt flag
UIF: u1 = 0,
/// CC1IF [1:1]
/// Capture/compare 1 interrupt
CC1IF: u1 = 0,
/// CC2IF [2:2]
/// Capture/Compare 2 interrupt
CC2IF: u1 = 0,
/// CC3IF [3:3]
/// Capture/Compare 3 interrupt
CC3IF: u1 = 0,
/// CC4IF [4:4]
/// Capture/Compare 4 interrupt
CC4IF: u1 = 0,
/// unused [5:5]
_unused5: u1 = 0,
/// TIF [6:6]
/// Trigger interrupt flag
TIF: u1 = 0,
/// unused [7:8]
_unused7: u1 = 0,
_unused8: u1 = 0,
/// CC1OF [9:9]
/// Capture/Compare 1 overcapture
CC1OF: u1 = 0,
/// CC2OF [10:10]
/// Capture/compare 2 overcapture
CC2OF: u1 = 0,
/// CC3OF [11:11]
/// Capture/Compare 3 overcapture
CC3OF: u1 = 0,
/// CC4OF [12:12]
/// Capture/Compare 4 overcapture
CC4OF: u1 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x10);

/// EGR
const EGR_val = packed struct {
/// UG [0:0]
/// Update generation
UG: u1 = 0,
/// CC1G [1:1]
/// Capture/compare 1
CC1G: u1 = 0,
/// CC2G [2:2]
/// Capture/compare 2
CC2G: u1 = 0,
/// CC3G [3:3]
/// Capture/compare 3
CC3G: u1 = 0,
/// CC4G [4:4]
/// Capture/compare 4
CC4G: u1 = 0,
/// unused [5:5]
_unused5: u1 = 0,
/// TG [6:6]
/// Trigger generation
TG: u1 = 0,
/// unused [7:31]
_unused7: u1 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// event generation register
pub const EGR = Register(EGR_val).init(base_address + 0x14);

/// CCMR1_Output
const CCMR1_Output_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// OC1FE [2:2]
/// Output compare 1 fast
OC1FE: u1 = 0,
/// OC1PE [3:3]
/// Output compare 1 preload
OC1PE: u1 = 0,
/// OC1M [4:6]
/// Output compare 1 mode
OC1M: u3 = 0,
/// OC1CE [7:7]
/// Output compare 1 clear
OC1CE: u1 = 0,
/// CC2S [8:9]
/// Capture/Compare 2
CC2S: u2 = 0,
/// OC2FE [10:10]
/// Output compare 2 fast
OC2FE: u1 = 0,
/// OC2PE [11:11]
/// Output compare 2 preload
OC2PE: u1 = 0,
/// OC2M [12:14]
/// Output compare 2 mode
OC2M: u3 = 0,
/// OC2CE [15:15]
/// Output compare 2 clear
OC2CE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 1 (output
pub const CCMR1_Output = Register(CCMR1_Output_val).init(base_address + 0x18);

/// CCMR1_Input
const CCMR1_Input_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// IC1PSC [2:3]
/// Input capture 1 prescaler
IC1PSC: u2 = 0,
/// IC1F [4:7]
/// Input capture 1 filter
IC1F: u4 = 0,
/// CC2S [8:9]
/// Capture/compare 2
CC2S: u2 = 0,
/// IC2PSC [10:11]
/// Input capture 2 prescaler
IC2PSC: u2 = 0,
/// IC2F [12:15]
/// Input capture 2 filter
IC2F: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 1 (input
pub const CCMR1_Input = Register(CCMR1_Input_val).init(base_address + 0x18);

/// CCMR2_Output
const CCMR2_Output_val = packed struct {
/// CC3S [0:1]
/// Capture/Compare 3
CC3S: u2 = 0,
/// OC3FE [2:2]
/// Output compare 3 fast
OC3FE: u1 = 0,
/// OC3PE [3:3]
/// Output compare 3 preload
OC3PE: u1 = 0,
/// OC3M [4:6]
/// Output compare 3 mode
OC3M: u3 = 0,
/// OC3CE [7:7]
/// Output compare 3 clear
OC3CE: u1 = 0,
/// CC4S [8:9]
/// Capture/Compare 4
CC4S: u2 = 0,
/// OC4FE [10:10]
/// Output compare 4 fast
OC4FE: u1 = 0,
/// OC4PE [11:11]
/// Output compare 4 preload
OC4PE: u1 = 0,
/// OC4M [12:14]
/// Output compare 4 mode
OC4M: u3 = 0,
/// OC4CE [15:15]
/// Output compare 4 clear
OC4CE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 2 (output
pub const CCMR2_Output = Register(CCMR2_Output_val).init(base_address + 0x1c);

/// CCMR2_Input
const CCMR2_Input_val = packed struct {
/// CC3S [0:1]
/// Capture/Compare 3
CC3S: u2 = 0,
/// IC3PSC [2:3]
/// Input capture 3 prescaler
IC3PSC: u2 = 0,
/// IC3F [4:7]
/// Input capture 3 filter
IC3F: u4 = 0,
/// CC4S [8:9]
/// Capture/Compare 4
CC4S: u2 = 0,
/// IC4PSC [10:11]
/// Input capture 4 prescaler
IC4PSC: u2 = 0,
/// IC4F [12:15]
/// Input capture 4 filter
IC4F: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 2 (input
pub const CCMR2_Input = Register(CCMR2_Input_val).init(base_address + 0x1c);

/// CCER
const CCER_val = packed struct {
/// CC1E [0:0]
/// Capture/Compare 1 output
CC1E: u1 = 0,
/// CC1P [1:1]
/// Capture/Compare 1 output
CC1P: u1 = 0,
/// unused [2:2]
_unused2: u1 = 0,
/// CC1NP [3:3]
/// Capture/Compare 1 output
CC1NP: u1 = 0,
/// CC2E [4:4]
/// Capture/Compare 2 output
CC2E: u1 = 0,
/// CC2P [5:5]
/// Capture/Compare 2 output
CC2P: u1 = 0,
/// unused [6:6]
_unused6: u1 = 0,
/// CC2NP [7:7]
/// Capture/Compare 2 output
CC2NP: u1 = 0,
/// CC3E [8:8]
/// Capture/Compare 3 output
CC3E: u1 = 0,
/// CC3P [9:9]
/// Capture/Compare 3 output
CC3P: u1 = 0,
/// unused [10:10]
_unused10: u1 = 0,
/// CC3NP [11:11]
/// Capture/Compare 3 output
CC3NP: u1 = 0,
/// CC4E [12:12]
/// Capture/Compare 4 output
CC4E: u1 = 0,
/// CC4P [13:13]
/// Capture/Compare 3 output
CC4P: u1 = 0,
/// unused [14:14]
_unused14: u1 = 0,
/// CC4NP [15:15]
/// Capture/Compare 4 output
CC4NP: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare enable
pub const CCER = Register(CCER_val).init(base_address + 0x20);

/// CNT
const CNT_val = packed struct {
/// CNT_L [0:15]
/// Low counter value
CNT_L: u16 = 0,
/// CNT_H [16:31]
/// High counter value (TIM2
CNT_H: u16 = 0,
};
/// counter
pub const CNT = Register(CNT_val).init(base_address + 0x24);

/// PSC
const PSC_val = packed struct {
/// PSC [0:15]
/// Prescaler value
PSC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// prescaler
pub const PSC = Register(PSC_val).init(base_address + 0x28);

/// ARR
const ARR_val = packed struct {
/// ARR_L [0:15]
/// Low Auto-reload value
ARR_L: u16 = 0,
/// ARR_H [16:31]
/// High Auto-reload value (TIM2
ARR_H: u16 = 0,
};
/// auto-reload register
pub const ARR = Register(ARR_val).init(base_address + 0x2c);

/// CCR1
const CCR1_val = packed struct {
/// CCR1_L [0:15]
/// Low Capture/Compare 1
CCR1_L: u16 = 0,
/// CCR1_H [16:31]
/// High Capture/Compare 1 value (TIM2
CCR1_H: u16 = 0,
};
/// capture/compare register 1
pub const CCR1 = Register(CCR1_val).init(base_address + 0x34);

/// CCR2
const CCR2_val = packed struct {
/// CCR2_L [0:15]
/// Low Capture/Compare 2
CCR2_L: u16 = 0,
/// CCR2_H [16:31]
/// High Capture/Compare 2 value (TIM2
CCR2_H: u16 = 0,
};
/// capture/compare register 2
pub const CCR2 = Register(CCR2_val).init(base_address + 0x38);

/// CCR3
const CCR3_val = packed struct {
/// CCR3_L [0:15]
/// Low Capture/Compare value
CCR3_L: u16 = 0,
/// CCR3_H [16:31]
/// High Capture/Compare value (TIM2
CCR3_H: u16 = 0,
};
/// capture/compare register 3
pub const CCR3 = Register(CCR3_val).init(base_address + 0x3c);

/// CCR4
const CCR4_val = packed struct {
/// CCR4_L [0:15]
/// Low Capture/Compare value
CCR4_L: u16 = 0,
/// CCR4_H [16:31]
/// High Capture/Compare value (TIM2
CCR4_H: u16 = 0,
};
/// capture/compare register 4
pub const CCR4 = Register(CCR4_val).init(base_address + 0x40);

/// DCR
const DCR_val = packed struct {
/// DBA [0:4]
/// DMA base address
DBA: u5 = 0,
/// unused [5:7]
_unused5: u3 = 0,
/// DBL [8:12]
/// DMA burst length
DBL: u5 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA control register
pub const DCR = Register(DCR_val).init(base_address + 0x48);

/// DMAR
const DMAR_val = packed struct {
/// DMAR [0:15]
/// DMA register for burst
DMAR: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA address for full transfer
pub const DMAR = Register(DMAR_val).init(base_address + 0x4c);
};

/// General-purpose-timers
pub const TIM3 = struct {

const base_address = 0x40000400;
/// CR1
const CR1_val = packed struct {
/// CEN [0:0]
/// Counter enable
CEN: u1 = 0,
/// UDIS [1:1]
/// Update disable
UDIS: u1 = 0,
/// URS [2:2]
/// Update request source
URS: u1 = 0,
/// OPM [3:3]
/// One-pulse mode
OPM: u1 = 0,
/// DIR [4:4]
/// Direction
DIR: u1 = 0,
/// CMS [5:6]
/// Center-aligned mode
CMS: u2 = 0,
/// ARPE [7:7]
/// Auto-reload preload enable
ARPE: u1 = 0,
/// CKD [8:9]
/// Clock division
CKD: u2 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// unused [0:2]
_unused0: u3 = 0,
/// CCDS [3:3]
/// Capture/compare DMA
CCDS: u1 = 0,
/// MMS [4:6]
/// Master mode selection
MMS: u3 = 0,
/// TI1S [7:7]
/// TI1 selection
TI1S: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// SMCR
const SMCR_val = packed struct {
/// SMS [0:2]
/// Slave mode selection
SMS: u3 = 0,
/// unused [3:3]
_unused3: u1 = 0,
/// TS [4:6]
/// Trigger selection
TS: u3 = 0,
/// MSM [7:7]
/// Master/Slave mode
MSM: u1 = 0,
/// ETF [8:11]
/// External trigger filter
ETF: u4 = 0,
/// ETPS [12:13]
/// External trigger prescaler
ETPS: u2 = 0,
/// ECE [14:14]
/// External clock enable
ECE: u1 = 0,
/// ETP [15:15]
/// External trigger polarity
ETP: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// slave mode control register
pub const SMCR = Register(SMCR_val).init(base_address + 0x8);

/// DIER
const DIER_val = packed struct {
/// UIE [0:0]
/// Update interrupt enable
UIE: u1 = 0,
/// CC1IE [1:1]
/// Capture/Compare 1 interrupt
CC1IE: u1 = 0,
/// CC2IE [2:2]
/// Capture/Compare 2 interrupt
CC2IE: u1 = 0,
/// CC3IE [3:3]
/// Capture/Compare 3 interrupt
CC3IE: u1 = 0,
/// CC4IE [4:4]
/// Capture/Compare 4 interrupt
CC4IE: u1 = 0,
/// unused [5:5]
_unused5: u1 = 0,
/// TIE [6:6]
/// Trigger interrupt enable
TIE: u1 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// UDE [8:8]
/// Update DMA request enable
UDE: u1 = 0,
/// CC1DE [9:9]
/// Capture/Compare 1 DMA request
CC1DE: u1 = 0,
/// CC2DE [10:10]
/// Capture/Compare 2 DMA request
CC2DE: u1 = 0,
/// CC3DE [11:11]
/// Capture/Compare 3 DMA request
CC3DE: u1 = 0,
/// CC4DE [12:12]
/// Capture/Compare 4 DMA request
CC4DE: u1 = 0,
/// COMDE [13:13]
/// Reserved
COMDE: u1 = 0,
/// TDE [14:14]
/// Trigger DMA request enable
TDE: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA/Interrupt enable register
pub const DIER = Register(DIER_val).init(base_address + 0xc);

/// SR
const SR_val = packed struct {
/// UIF [0:0]
/// Update interrupt flag
UIF: u1 = 0,
/// CC1IF [1:1]
/// Capture/compare 1 interrupt
CC1IF: u1 = 0,
/// CC2IF [2:2]
/// Capture/Compare 2 interrupt
CC2IF: u1 = 0,
/// CC3IF [3:3]
/// Capture/Compare 3 interrupt
CC3IF: u1 = 0,
/// CC4IF [4:4]
/// Capture/Compare 4 interrupt
CC4IF: u1 = 0,
/// unused [5:5]
_unused5: u1 = 0,
/// TIF [6:6]
/// Trigger interrupt flag
TIF: u1 = 0,
/// unused [7:8]
_unused7: u1 = 0,
_unused8: u1 = 0,
/// CC1OF [9:9]
/// Capture/Compare 1 overcapture
CC1OF: u1 = 0,
/// CC2OF [10:10]
/// Capture/compare 2 overcapture
CC2OF: u1 = 0,
/// CC3OF [11:11]
/// Capture/Compare 3 overcapture
CC3OF: u1 = 0,
/// CC4OF [12:12]
/// Capture/Compare 4 overcapture
CC4OF: u1 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x10);

/// EGR
const EGR_val = packed struct {
/// UG [0:0]
/// Update generation
UG: u1 = 0,
/// CC1G [1:1]
/// Capture/compare 1
CC1G: u1 = 0,
/// CC2G [2:2]
/// Capture/compare 2
CC2G: u1 = 0,
/// CC3G [3:3]
/// Capture/compare 3
CC3G: u1 = 0,
/// CC4G [4:4]
/// Capture/compare 4
CC4G: u1 = 0,
/// unused [5:5]
_unused5: u1 = 0,
/// TG [6:6]
/// Trigger generation
TG: u1 = 0,
/// unused [7:31]
_unused7: u1 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// event generation register
pub const EGR = Register(EGR_val).init(base_address + 0x14);

/// CCMR1_Output
const CCMR1_Output_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// OC1FE [2:2]
/// Output compare 1 fast
OC1FE: u1 = 0,
/// OC1PE [3:3]
/// Output compare 1 preload
OC1PE: u1 = 0,
/// OC1M [4:6]
/// Output compare 1 mode
OC1M: u3 = 0,
/// OC1CE [7:7]
/// Output compare 1 clear
OC1CE: u1 = 0,
/// CC2S [8:9]
/// Capture/Compare 2
CC2S: u2 = 0,
/// OC2FE [10:10]
/// Output compare 2 fast
OC2FE: u1 = 0,
/// OC2PE [11:11]
/// Output compare 2 preload
OC2PE: u1 = 0,
/// OC2M [12:14]
/// Output compare 2 mode
OC2M: u3 = 0,
/// OC2CE [15:15]
/// Output compare 2 clear
OC2CE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 1 (output
pub const CCMR1_Output = Register(CCMR1_Output_val).init(base_address + 0x18);

/// CCMR1_Input
const CCMR1_Input_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// IC1PSC [2:3]
/// Input capture 1 prescaler
IC1PSC: u2 = 0,
/// IC1F [4:7]
/// Input capture 1 filter
IC1F: u4 = 0,
/// CC2S [8:9]
/// Capture/compare 2
CC2S: u2 = 0,
/// IC2PSC [10:11]
/// Input capture 2 prescaler
IC2PSC: u2 = 0,
/// IC2F [12:15]
/// Input capture 2 filter
IC2F: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 1 (input
pub const CCMR1_Input = Register(CCMR1_Input_val).init(base_address + 0x18);

/// CCMR2_Output
const CCMR2_Output_val = packed struct {
/// CC3S [0:1]
/// Capture/Compare 3
CC3S: u2 = 0,
/// OC3FE [2:2]
/// Output compare 3 fast
OC3FE: u1 = 0,
/// OC3PE [3:3]
/// Output compare 3 preload
OC3PE: u1 = 0,
/// OC3M [4:6]
/// Output compare 3 mode
OC3M: u3 = 0,
/// OC3CE [7:7]
/// Output compare 3 clear
OC3CE: u1 = 0,
/// CC4S [8:9]
/// Capture/Compare 4
CC4S: u2 = 0,
/// OC4FE [10:10]
/// Output compare 4 fast
OC4FE: u1 = 0,
/// OC4PE [11:11]
/// Output compare 4 preload
OC4PE: u1 = 0,
/// OC4M [12:14]
/// Output compare 4 mode
OC4M: u3 = 0,
/// OC4CE [15:15]
/// Output compare 4 clear
OC4CE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 2 (output
pub const CCMR2_Output = Register(CCMR2_Output_val).init(base_address + 0x1c);

/// CCMR2_Input
const CCMR2_Input_val = packed struct {
/// CC3S [0:1]
/// Capture/Compare 3
CC3S: u2 = 0,
/// IC3PSC [2:3]
/// Input capture 3 prescaler
IC3PSC: u2 = 0,
/// IC3F [4:7]
/// Input capture 3 filter
IC3F: u4 = 0,
/// CC4S [8:9]
/// Capture/Compare 4
CC4S: u2 = 0,
/// IC4PSC [10:11]
/// Input capture 4 prescaler
IC4PSC: u2 = 0,
/// IC4F [12:15]
/// Input capture 4 filter
IC4F: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 2 (input
pub const CCMR2_Input = Register(CCMR2_Input_val).init(base_address + 0x1c);

/// CCER
const CCER_val = packed struct {
/// CC1E [0:0]
/// Capture/Compare 1 output
CC1E: u1 = 0,
/// CC1P [1:1]
/// Capture/Compare 1 output
CC1P: u1 = 0,
/// unused [2:2]
_unused2: u1 = 0,
/// CC1NP [3:3]
/// Capture/Compare 1 output
CC1NP: u1 = 0,
/// CC2E [4:4]
/// Capture/Compare 2 output
CC2E: u1 = 0,
/// CC2P [5:5]
/// Capture/Compare 2 output
CC2P: u1 = 0,
/// unused [6:6]
_unused6: u1 = 0,
/// CC2NP [7:7]
/// Capture/Compare 2 output
CC2NP: u1 = 0,
/// CC3E [8:8]
/// Capture/Compare 3 output
CC3E: u1 = 0,
/// CC3P [9:9]
/// Capture/Compare 3 output
CC3P: u1 = 0,
/// unused [10:10]
_unused10: u1 = 0,
/// CC3NP [11:11]
/// Capture/Compare 3 output
CC3NP: u1 = 0,
/// CC4E [12:12]
/// Capture/Compare 4 output
CC4E: u1 = 0,
/// CC4P [13:13]
/// Capture/Compare 3 output
CC4P: u1 = 0,
/// unused [14:14]
_unused14: u1 = 0,
/// CC4NP [15:15]
/// Capture/Compare 4 output
CC4NP: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare enable
pub const CCER = Register(CCER_val).init(base_address + 0x20);

/// CNT
const CNT_val = packed struct {
/// CNT_L [0:15]
/// Low counter value
CNT_L: u16 = 0,
/// CNT_H [16:31]
/// High counter value (TIM2
CNT_H: u16 = 0,
};
/// counter
pub const CNT = Register(CNT_val).init(base_address + 0x24);

/// PSC
const PSC_val = packed struct {
/// PSC [0:15]
/// Prescaler value
PSC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// prescaler
pub const PSC = Register(PSC_val).init(base_address + 0x28);

/// ARR
const ARR_val = packed struct {
/// ARR_L [0:15]
/// Low Auto-reload value
ARR_L: u16 = 0,
/// ARR_H [16:31]
/// High Auto-reload value (TIM2
ARR_H: u16 = 0,
};
/// auto-reload register
pub const ARR = Register(ARR_val).init(base_address + 0x2c);

/// CCR1
const CCR1_val = packed struct {
/// CCR1_L [0:15]
/// Low Capture/Compare 1
CCR1_L: u16 = 0,
/// CCR1_H [16:31]
/// High Capture/Compare 1 value (TIM2
CCR1_H: u16 = 0,
};
/// capture/compare register 1
pub const CCR1 = Register(CCR1_val).init(base_address + 0x34);

/// CCR2
const CCR2_val = packed struct {
/// CCR2_L [0:15]
/// Low Capture/Compare 2
CCR2_L: u16 = 0,
/// CCR2_H [16:31]
/// High Capture/Compare 2 value (TIM2
CCR2_H: u16 = 0,
};
/// capture/compare register 2
pub const CCR2 = Register(CCR2_val).init(base_address + 0x38);

/// CCR3
const CCR3_val = packed struct {
/// CCR3_L [0:15]
/// Low Capture/Compare value
CCR3_L: u16 = 0,
/// CCR3_H [16:31]
/// High Capture/Compare value (TIM2
CCR3_H: u16 = 0,
};
/// capture/compare register 3
pub const CCR3 = Register(CCR3_val).init(base_address + 0x3c);

/// CCR4
const CCR4_val = packed struct {
/// CCR4_L [0:15]
/// Low Capture/Compare value
CCR4_L: u16 = 0,
/// CCR4_H [16:31]
/// High Capture/Compare value (TIM2
CCR4_H: u16 = 0,
};
/// capture/compare register 4
pub const CCR4 = Register(CCR4_val).init(base_address + 0x40);

/// DCR
const DCR_val = packed struct {
/// DBA [0:4]
/// DMA base address
DBA: u5 = 0,
/// unused [5:7]
_unused5: u3 = 0,
/// DBL [8:12]
/// DMA burst length
DBL: u5 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA control register
pub const DCR = Register(DCR_val).init(base_address + 0x48);

/// DMAR
const DMAR_val = packed struct {
/// DMAR [0:15]
/// DMA register for burst
DMAR: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA address for full transfer
pub const DMAR = Register(DMAR_val).init(base_address + 0x4c);
};

/// General-purpose-timers
pub const TIM14 = struct {

const base_address = 0x40002000;
/// CR1
const CR1_val = packed struct {
/// CEN [0:0]
/// Counter enable
CEN: u1 = 0,
/// UDIS [1:1]
/// Update disable
UDIS: u1 = 0,
/// URS [2:2]
/// Update request source
URS: u1 = 0,
/// unused [3:6]
_unused3: u4 = 0,
/// ARPE [7:7]
/// Auto-reload preload enable
ARPE: u1 = 0,
/// CKD [8:9]
/// Clock division
CKD: u2 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// DIER
const DIER_val = packed struct {
/// UIE [0:0]
/// Update interrupt enable
UIE: u1 = 0,
/// CC1IE [1:1]
/// Capture/Compare 1 interrupt
CC1IE: u1 = 0,
/// unused [2:31]
_unused2: u6 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA/Interrupt enable register
pub const DIER = Register(DIER_val).init(base_address + 0xc);

/// SR
const SR_val = packed struct {
/// UIF [0:0]
/// Update interrupt flag
UIF: u1 = 0,
/// CC1IF [1:1]
/// Capture/compare 1 interrupt
CC1IF: u1 = 0,
/// unused [2:8]
_unused2: u6 = 0,
_unused8: u1 = 0,
/// CC1OF [9:9]
/// Capture/Compare 1 overcapture
CC1OF: u1 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x10);

/// EGR
const EGR_val = packed struct {
/// UG [0:0]
/// Update generation
UG: u1 = 0,
/// CC1G [1:1]
/// Capture/compare 1
CC1G: u1 = 0,
/// unused [2:31]
_unused2: u6 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// event generation register
pub const EGR = Register(EGR_val).init(base_address + 0x14);

/// CCMR1_Output
const CCMR1_Output_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// OC1FE [2:2]
/// Output compare 1 fast
OC1FE: u1 = 0,
/// OC1PE [3:3]
/// Output Compare 1 preload
OC1PE: u1 = 0,
/// OC1M [4:6]
/// Output Compare 1 mode
OC1M: u3 = 0,
/// unused [7:31]
_unused7: u1 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register (output
pub const CCMR1_Output = Register(CCMR1_Output_val).init(base_address + 0x18);

/// CCMR1_Input
const CCMR1_Input_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// IC1PSC [2:3]
/// Input capture 1 prescaler
IC1PSC: u2 = 0,
/// IC1F [4:7]
/// Input capture 1 filter
IC1F: u4 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register (input
pub const CCMR1_Input = Register(CCMR1_Input_val).init(base_address + 0x18);

/// CCER
const CCER_val = packed struct {
/// CC1E [0:0]
/// Capture/Compare 1 output
CC1E: u1 = 0,
/// CC1P [1:1]
/// Capture/Compare 1 output
CC1P: u1 = 0,
/// unused [2:2]
_unused2: u1 = 0,
/// CC1NP [3:3]
/// Capture/Compare 1 output
CC1NP: u1 = 0,
/// unused [4:31]
_unused4: u4 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare enable
pub const CCER = Register(CCER_val).init(base_address + 0x20);

/// CNT
const CNT_val = packed struct {
/// CNT [0:15]
/// counter value
CNT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// counter
pub const CNT = Register(CNT_val).init(base_address + 0x24);

/// PSC
const PSC_val = packed struct {
/// PSC [0:15]
/// Prescaler value
PSC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// prescaler
pub const PSC = Register(PSC_val).init(base_address + 0x28);

/// ARR
const ARR_val = packed struct {
/// ARR [0:15]
/// Auto-reload value
ARR: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// auto-reload register
pub const ARR = Register(ARR_val).init(base_address + 0x2c);

/// CCR1
const CCR1_val = packed struct {
/// CCR1 [0:15]
/// Capture/Compare 1 value
CCR1: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare register 1
pub const CCR1 = Register(CCR1_val).init(base_address + 0x34);

/// OR
const OR_val = packed struct {
/// RMP [0:1]
/// Timer input 1 remap
RMP: u2 = 0,
/// unused [2:31]
_unused2: u6 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// option register
pub const OR = Register(OR_val).init(base_address + 0x50);
};

/// Basic-timers
pub const TIM6 = struct {

const base_address = 0x40001000;
/// CR1
const CR1_val = packed struct {
/// CEN [0:0]
/// Counter enable
CEN: u1 = 0,
/// UDIS [1:1]
/// Update disable
UDIS: u1 = 0,
/// URS [2:2]
/// Update request source
URS: u1 = 0,
/// OPM [3:3]
/// One-pulse mode
OPM: u1 = 0,
/// unused [4:6]
_unused4: u3 = 0,
/// ARPE [7:7]
/// Auto-reload preload enable
ARPE: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// unused [0:3]
_unused0: u4 = 0,
/// MMS [4:6]
/// Master mode selection
MMS: u3 = 0,
/// unused [7:31]
_unused7: u1 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// DIER
const DIER_val = packed struct {
/// UIE [0:0]
/// Update interrupt enable
UIE: u1 = 0,
/// unused [1:7]
_unused1: u7 = 0,
/// UDE [8:8]
/// Update DMA request enable
UDE: u1 = 0,
/// unused [9:31]
_unused9: u7 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA/Interrupt enable register
pub const DIER = Register(DIER_val).init(base_address + 0xc);

/// SR
const SR_val = packed struct {
/// UIF [0:0]
/// Update interrupt flag
UIF: u1 = 0,
/// unused [1:31]
_unused1: u7 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x10);

/// EGR
const EGR_val = packed struct {
/// UG [0:0]
/// Update generation
UG: u1 = 0,
/// unused [1:31]
_unused1: u7 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// event generation register
pub const EGR = Register(EGR_val).init(base_address + 0x14);

/// CNT
const CNT_val = packed struct {
/// CNT [0:15]
/// Low counter value
CNT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// counter
pub const CNT = Register(CNT_val).init(base_address + 0x24);

/// PSC
const PSC_val = packed struct {
/// PSC [0:15]
/// Prescaler value
PSC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// prescaler
pub const PSC = Register(PSC_val).init(base_address + 0x28);

/// ARR
const ARR_val = packed struct {
/// ARR [0:15]
/// Low Auto-reload value
ARR: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// auto-reload register
pub const ARR = Register(ARR_val).init(base_address + 0x2c);
};

/// External interrupt/event
pub const EXTI = struct {

const base_address = 0x40010400;
/// IMR
const IMR_val = packed struct {
/// MR0 [0:0]
/// Interrupt Mask on line 0
MR0: u1 = 0,
/// MR1 [1:1]
/// Interrupt Mask on line 1
MR1: u1 = 0,
/// MR2 [2:2]
/// Interrupt Mask on line 2
MR2: u1 = 0,
/// MR3 [3:3]
/// Interrupt Mask on line 3
MR3: u1 = 0,
/// MR4 [4:4]
/// Interrupt Mask on line 4
MR4: u1 = 0,
/// MR5 [5:5]
/// Interrupt Mask on line 5
MR5: u1 = 0,
/// MR6 [6:6]
/// Interrupt Mask on line 6
MR6: u1 = 0,
/// MR7 [7:7]
/// Interrupt Mask on line 7
MR7: u1 = 0,
/// MR8 [8:8]
/// Interrupt Mask on line 8
MR8: u1 = 0,
/// MR9 [9:9]
/// Interrupt Mask on line 9
MR9: u1 = 0,
/// MR10 [10:10]
/// Interrupt Mask on line 10
MR10: u1 = 0,
/// MR11 [11:11]
/// Interrupt Mask on line 11
MR11: u1 = 0,
/// MR12 [12:12]
/// Interrupt Mask on line 12
MR12: u1 = 0,
/// MR13 [13:13]
/// Interrupt Mask on line 13
MR13: u1 = 0,
/// MR14 [14:14]
/// Interrupt Mask on line 14
MR14: u1 = 0,
/// MR15 [15:15]
/// Interrupt Mask on line 15
MR15: u1 = 0,
/// MR16 [16:16]
/// Interrupt Mask on line 16
MR16: u1 = 0,
/// MR17 [17:17]
/// Interrupt Mask on line 17
MR17: u1 = 0,
/// MR18 [18:18]
/// Interrupt Mask on line 18
MR18: u1 = 1,
/// MR19 [19:19]
/// Interrupt Mask on line 19
MR19: u1 = 0,
/// MR20 [20:20]
/// Interrupt Mask on line 20
MR20: u1 = 1,
/// MR21 [21:21]
/// Interrupt Mask on line 21
MR21: u1 = 0,
/// MR22 [22:22]
/// Interrupt Mask on line 22
MR22: u1 = 0,
/// MR23 [23:23]
/// Interrupt Mask on line 23
MR23: u1 = 1,
/// MR24 [24:24]
/// Interrupt Mask on line 24
MR24: u1 = 1,
/// MR25 [25:25]
/// Interrupt Mask on line 25
MR25: u1 = 1,
/// MR26 [26:26]
/// Interrupt Mask on line 26
MR26: u1 = 1,
/// MR27 [27:27]
/// Interrupt Mask on line 27
MR27: u1 = 1,
/// unused [28:31]
_unused28: u4 = 0,
};
/// Interrupt mask register
pub const IMR = Register(IMR_val).init(base_address + 0x0);

/// EMR
const EMR_val = packed struct {
/// MR0 [0:0]
/// Event Mask on line 0
MR0: u1 = 0,
/// MR1 [1:1]
/// Event Mask on line 1
MR1: u1 = 0,
/// MR2 [2:2]
/// Event Mask on line 2
MR2: u1 = 0,
/// MR3 [3:3]
/// Event Mask on line 3
MR3: u1 = 0,
/// MR4 [4:4]
/// Event Mask on line 4
MR4: u1 = 0,
/// MR5 [5:5]
/// Event Mask on line 5
MR5: u1 = 0,
/// MR6 [6:6]
/// Event Mask on line 6
MR6: u1 = 0,
/// MR7 [7:7]
/// Event Mask on line 7
MR7: u1 = 0,
/// MR8 [8:8]
/// Event Mask on line 8
MR8: u1 = 0,
/// MR9 [9:9]
/// Event Mask on line 9
MR9: u1 = 0,
/// MR10 [10:10]
/// Event Mask on line 10
MR10: u1 = 0,
/// MR11 [11:11]
/// Event Mask on line 11
MR11: u1 = 0,
/// MR12 [12:12]
/// Event Mask on line 12
MR12: u1 = 0,
/// MR13 [13:13]
/// Event Mask on line 13
MR13: u1 = 0,
/// MR14 [14:14]
/// Event Mask on line 14
MR14: u1 = 0,
/// MR15 [15:15]
/// Event Mask on line 15
MR15: u1 = 0,
/// MR16 [16:16]
/// Event Mask on line 16
MR16: u1 = 0,
/// MR17 [17:17]
/// Event Mask on line 17
MR17: u1 = 0,
/// MR18 [18:18]
/// Event Mask on line 18
MR18: u1 = 0,
/// MR19 [19:19]
/// Event Mask on line 19
MR19: u1 = 0,
/// MR20 [20:20]
/// Event Mask on line 20
MR20: u1 = 0,
/// MR21 [21:21]
/// Event Mask on line 21
MR21: u1 = 0,
/// MR22 [22:22]
/// Event Mask on line 22
MR22: u1 = 0,
/// MR23 [23:23]
/// Event Mask on line 23
MR23: u1 = 0,
/// MR24 [24:24]
/// Event Mask on line 24
MR24: u1 = 0,
/// MR25 [25:25]
/// Event Mask on line 25
MR25: u1 = 0,
/// MR26 [26:26]
/// Event Mask on line 26
MR26: u1 = 0,
/// MR27 [27:27]
/// Event Mask on line 27
MR27: u1 = 0,
/// unused [28:31]
_unused28: u4 = 0,
};
/// Event mask register (EXTI_EMR)
pub const EMR = Register(EMR_val).init(base_address + 0x4);

/// RTSR
const RTSR_val = packed struct {
/// TR0 [0:0]
/// Rising trigger event configuration of
TR0: u1 = 0,
/// TR1 [1:1]
/// Rising trigger event configuration of
TR1: u1 = 0,
/// TR2 [2:2]
/// Rising trigger event configuration of
TR2: u1 = 0,
/// TR3 [3:3]
/// Rising trigger event configuration of
TR3: u1 = 0,
/// TR4 [4:4]
/// Rising trigger event configuration of
TR4: u1 = 0,
/// TR5 [5:5]
/// Rising trigger event configuration of
TR5: u1 = 0,
/// TR6 [6:6]
/// Rising trigger event configuration of
TR6: u1 = 0,
/// TR7 [7:7]
/// Rising trigger event configuration of
TR7: u1 = 0,
/// TR8 [8:8]
/// Rising trigger event configuration of
TR8: u1 = 0,
/// TR9 [9:9]
/// Rising trigger event configuration of
TR9: u1 = 0,
/// TR10 [10:10]
/// Rising trigger event configuration of
TR10: u1 = 0,
/// TR11 [11:11]
/// Rising trigger event configuration of
TR11: u1 = 0,
/// TR12 [12:12]
/// Rising trigger event configuration of
TR12: u1 = 0,
/// TR13 [13:13]
/// Rising trigger event configuration of
TR13: u1 = 0,
/// TR14 [14:14]
/// Rising trigger event configuration of
TR14: u1 = 0,
/// TR15 [15:15]
/// Rising trigger event configuration of
TR15: u1 = 0,
/// TR16 [16:16]
/// Rising trigger event configuration of
TR16: u1 = 0,
/// TR17 [17:17]
/// Rising trigger event configuration of
TR17: u1 = 0,
/// unused [18:18]
_unused18: u1 = 0,
/// TR19 [19:19]
/// Rising trigger event configuration of
TR19: u1 = 0,
/// unused [20:31]
_unused20: u4 = 0,
_unused24: u8 = 0,
};
/// Rising Trigger selection register
pub const RTSR = Register(RTSR_val).init(base_address + 0x8);

/// FTSR
const FTSR_val = packed struct {
/// TR0 [0:0]
/// Falling trigger event configuration of
TR0: u1 = 0,
/// TR1 [1:1]
/// Falling trigger event configuration of
TR1: u1 = 0,
/// TR2 [2:2]
/// Falling trigger event configuration of
TR2: u1 = 0,
/// TR3 [3:3]
/// Falling trigger event configuration of
TR3: u1 = 0,
/// TR4 [4:4]
/// Falling trigger event configuration of
TR4: u1 = 0,
/// TR5 [5:5]
/// Falling trigger event configuration of
TR5: u1 = 0,
/// TR6 [6:6]
/// Falling trigger event configuration of
TR6: u1 = 0,
/// TR7 [7:7]
/// Falling trigger event configuration of
TR7: u1 = 0,
/// TR8 [8:8]
/// Falling trigger event configuration of
TR8: u1 = 0,
/// TR9 [9:9]
/// Falling trigger event configuration of
TR9: u1 = 0,
/// TR10 [10:10]
/// Falling trigger event configuration of
TR10: u1 = 0,
/// TR11 [11:11]
/// Falling trigger event configuration of
TR11: u1 = 0,
/// TR12 [12:12]
/// Falling trigger event configuration of
TR12: u1 = 0,
/// TR13 [13:13]
/// Falling trigger event configuration of
TR13: u1 = 0,
/// TR14 [14:14]
/// Falling trigger event configuration of
TR14: u1 = 0,
/// TR15 [15:15]
/// Falling trigger event configuration of
TR15: u1 = 0,
/// TR16 [16:16]
/// Falling trigger event configuration of
TR16: u1 = 0,
/// TR17 [17:17]
/// Falling trigger event configuration of
TR17: u1 = 0,
/// unused [18:18]
_unused18: u1 = 0,
/// TR19 [19:19]
/// Falling trigger event configuration of
TR19: u1 = 0,
/// unused [20:31]
_unused20: u4 = 0,
_unused24: u8 = 0,
};
/// Falling Trigger selection register
pub const FTSR = Register(FTSR_val).init(base_address + 0xc);

/// SWIER
const SWIER_val = packed struct {
/// SWIER0 [0:0]
/// Software Interrupt on line
SWIER0: u1 = 0,
/// SWIER1 [1:1]
/// Software Interrupt on line
SWIER1: u1 = 0,
/// SWIER2 [2:2]
/// Software Interrupt on line
SWIER2: u1 = 0,
/// SWIER3 [3:3]
/// Software Interrupt on line
SWIER3: u1 = 0,
/// SWIER4 [4:4]
/// Software Interrupt on line
SWIER4: u1 = 0,
/// SWIER5 [5:5]
/// Software Interrupt on line
SWIER5: u1 = 0,
/// SWIER6 [6:6]
/// Software Interrupt on line
SWIER6: u1 = 0,
/// SWIER7 [7:7]
/// Software Interrupt on line
SWIER7: u1 = 0,
/// SWIER8 [8:8]
/// Software Interrupt on line
SWIER8: u1 = 0,
/// SWIER9 [9:9]
/// Software Interrupt on line
SWIER9: u1 = 0,
/// SWIER10 [10:10]
/// Software Interrupt on line
SWIER10: u1 = 0,
/// SWIER11 [11:11]
/// Software Interrupt on line
SWIER11: u1 = 0,
/// SWIER12 [12:12]
/// Software Interrupt on line
SWIER12: u1 = 0,
/// SWIER13 [13:13]
/// Software Interrupt on line
SWIER13: u1 = 0,
/// SWIER14 [14:14]
/// Software Interrupt on line
SWIER14: u1 = 0,
/// SWIER15 [15:15]
/// Software Interrupt on line
SWIER15: u1 = 0,
/// SWIER16 [16:16]
/// Software Interrupt on line
SWIER16: u1 = 0,
/// SWIER17 [17:17]
/// Software Interrupt on line
SWIER17: u1 = 0,
/// unused [18:18]
_unused18: u1 = 0,
/// SWIER19 [19:19]
/// Software Interrupt on line
SWIER19: u1 = 0,
/// unused [20:31]
_unused20: u4 = 0,
_unused24: u8 = 0,
};
/// Software interrupt event register
pub const SWIER = Register(SWIER_val).init(base_address + 0x10);

/// PR
const PR_val = packed struct {
/// PR0 [0:0]
/// Pending bit 0
PR0: u1 = 0,
/// PR1 [1:1]
/// Pending bit 1
PR1: u1 = 0,
/// PR2 [2:2]
/// Pending bit 2
PR2: u1 = 0,
/// PR3 [3:3]
/// Pending bit 3
PR3: u1 = 0,
/// PR4 [4:4]
/// Pending bit 4
PR4: u1 = 0,
/// PR5 [5:5]
/// Pending bit 5
PR5: u1 = 0,
/// PR6 [6:6]
/// Pending bit 6
PR6: u1 = 0,
/// PR7 [7:7]
/// Pending bit 7
PR7: u1 = 0,
/// PR8 [8:8]
/// Pending bit 8
PR8: u1 = 0,
/// PR9 [9:9]
/// Pending bit 9
PR9: u1 = 0,
/// PR10 [10:10]
/// Pending bit 10
PR10: u1 = 0,
/// PR11 [11:11]
/// Pending bit 11
PR11: u1 = 0,
/// PR12 [12:12]
/// Pending bit 12
PR12: u1 = 0,
/// PR13 [13:13]
/// Pending bit 13
PR13: u1 = 0,
/// PR14 [14:14]
/// Pending bit 14
PR14: u1 = 0,
/// PR15 [15:15]
/// Pending bit 15
PR15: u1 = 0,
/// PR16 [16:16]
/// Pending bit 16
PR16: u1 = 0,
/// PR17 [17:17]
/// Pending bit 17
PR17: u1 = 0,
/// unused [18:18]
_unused18: u1 = 0,
/// PR19 [19:19]
/// Pending bit 19
PR19: u1 = 0,
/// unused [20:31]
_unused20: u4 = 0,
_unused24: u8 = 0,
};
/// Pending register (EXTI_PR)
pub const PR = Register(PR_val).init(base_address + 0x14);
};

/// Nested Vectored Interrupt
pub const NVIC = struct {

const base_address = 0xe000e100;
/// ISER
const ISER_val = packed struct {
/// SETENA [0:31]
/// SETENA
SETENA: u32 = 0,
};
/// Interrupt Set Enable Register
pub const ISER = Register(ISER_val).init(base_address + 0x0);

/// ICER
const ICER_val = packed struct {
/// CLRENA [0:31]
/// CLRENA
CLRENA: u32 = 0,
};
/// Interrupt Clear Enable
pub const ICER = Register(ICER_val).init(base_address + 0x80);

/// ISPR
const ISPR_val = packed struct {
/// SETPEND [0:31]
/// SETPEND
SETPEND: u32 = 0,
};
/// Interrupt Set-Pending Register
pub const ISPR = Register(ISPR_val).init(base_address + 0x100);

/// ICPR
const ICPR_val = packed struct {
/// CLRPEND [0:31]
/// CLRPEND
CLRPEND: u32 = 0,
};
/// Interrupt Clear-Pending
pub const ICPR = Register(ICPR_val).init(base_address + 0x180);

/// IPR0
const IPR0_val = packed struct {
/// unused [0:5]
_unused0: u6 = 0,
/// PRI_00 [6:7]
/// PRI_00
PRI_00: u2 = 0,
/// unused [8:13]
_unused8: u6 = 0,
/// PRI_01 [14:15]
/// PRI_01
PRI_01: u2 = 0,
/// unused [16:21]
_unused16: u6 = 0,
/// PRI_02 [22:23]
/// PRI_02
PRI_02: u2 = 0,
/// unused [24:29]
_unused24: u6 = 0,
/// PRI_03 [30:31]
/// PRI_03
PRI_03: u2 = 0,
};
/// Interrupt Priority Register 0
pub const IPR0 = Register(IPR0_val).init(base_address + 0x300);

/// IPR1
const IPR1_val = packed struct {
/// unused [0:5]
_unused0: u6 = 0,
/// PRI_40 [6:7]
/// PRI_40
PRI_40: u2 = 0,
/// unused [8:13]
_unused8: u6 = 0,
/// PRI_41 [14:15]
/// PRI_41
PRI_41: u2 = 0,
/// unused [16:21]
_unused16: u6 = 0,
/// PRI_42 [22:23]
/// PRI_42
PRI_42: u2 = 0,
/// unused [24:29]
_unused24: u6 = 0,
/// PRI_43 [30:31]
/// PRI_43
PRI_43: u2 = 0,
};
/// Interrupt Priority Register 1
pub const IPR1 = Register(IPR1_val).init(base_address + 0x304);

/// IPR2
const IPR2_val = packed struct {
/// unused [0:5]
_unused0: u6 = 0,
/// PRI_80 [6:7]
/// PRI_80
PRI_80: u2 = 0,
/// unused [8:13]
_unused8: u6 = 0,
/// PRI_81 [14:15]
/// PRI_81
PRI_81: u2 = 0,
/// unused [16:21]
_unused16: u6 = 0,
/// PRI_82 [22:23]
/// PRI_82
PRI_82: u2 = 0,
/// unused [24:29]
_unused24: u6 = 0,
/// PRI_83 [30:31]
/// PRI_83
PRI_83: u2 = 0,
};
/// Interrupt Priority Register 2
pub const IPR2 = Register(IPR2_val).init(base_address + 0x308);

/// IPR3
const IPR3_val = packed struct {
/// unused [0:5]
_unused0: u6 = 0,
/// PRI_120 [6:7]
/// PRI_120
PRI_120: u2 = 0,
/// unused [8:13]
_unused8: u6 = 0,
/// PRI_121 [14:15]
/// PRI_121
PRI_121: u2 = 0,
/// unused [16:21]
_unused16: u6 = 0,
/// PRI_122 [22:23]
/// PRI_122
PRI_122: u2 = 0,
/// unused [24:29]
_unused24: u6 = 0,
/// PRI_123 [30:31]
/// PRI_123
PRI_123: u2 = 0,
};
/// Interrupt Priority Register 3
pub const IPR3 = Register(IPR3_val).init(base_address + 0x30c);

/// IPR4
const IPR4_val = packed struct {
/// unused [0:5]
_unused0: u6 = 0,
/// PRI_160 [6:7]
/// PRI_160
PRI_160: u2 = 0,
/// unused [8:13]
_unused8: u6 = 0,
/// PRI_161 [14:15]
/// PRI_161
PRI_161: u2 = 0,
/// unused [16:21]
_unused16: u6 = 0,
/// PRI_162 [22:23]
/// PRI_162
PRI_162: u2 = 0,
/// unused [24:29]
_unused24: u6 = 0,
/// PRI_163 [30:31]
/// PRI_163
PRI_163: u2 = 0,
};
/// Interrupt Priority Register 4
pub const IPR4 = Register(IPR4_val).init(base_address + 0x310);

/// IPR5
const IPR5_val = packed struct {
/// unused [0:5]
_unused0: u6 = 0,
/// PRI_200 [6:7]
/// PRI_200
PRI_200: u2 = 0,
/// unused [8:13]
_unused8: u6 = 0,
/// PRI_201 [14:15]
/// PRI_201
PRI_201: u2 = 0,
/// unused [16:21]
_unused16: u6 = 0,
/// PRI_202 [22:23]
/// PRI_202
PRI_202: u2 = 0,
/// unused [24:29]
_unused24: u6 = 0,
/// PRI_203 [30:31]
/// PRI_203
PRI_203: u2 = 0,
};
/// Interrupt Priority Register 5
pub const IPR5 = Register(IPR5_val).init(base_address + 0x314);

/// IPR6
const IPR6_val = packed struct {
/// unused [0:5]
_unused0: u6 = 0,
/// PRI_240 [6:7]
/// PRI_240
PRI_240: u2 = 0,
/// unused [8:13]
_unused8: u6 = 0,
/// PRI_241 [14:15]
/// PRI_241
PRI_241: u2 = 0,
/// unused [16:21]
_unused16: u6 = 0,
/// PRI_242 [22:23]
/// PRI_242
PRI_242: u2 = 0,
/// unused [24:29]
_unused24: u6 = 0,
/// PRI_243 [30:31]
/// PRI_243
PRI_243: u2 = 0,
};
/// Interrupt Priority Register 6
pub const IPR6 = Register(IPR6_val).init(base_address + 0x318);

/// IPR7
const IPR7_val = packed struct {
/// unused [0:5]
_unused0: u6 = 0,
/// PRI_280 [6:7]
/// PRI_280
PRI_280: u2 = 0,
/// unused [8:13]
_unused8: u6 = 0,
/// PRI_281 [14:15]
/// PRI_281
PRI_281: u2 = 0,
/// unused [16:21]
_unused16: u6 = 0,
/// PRI_282 [22:23]
/// PRI_282
PRI_282: u2 = 0,
/// unused [24:29]
_unused24: u6 = 0,
/// PRI_283 [30:31]
/// PRI_283
PRI_283: u2 = 0,
};
/// Interrupt Priority Register 7
pub const IPR7 = Register(IPR7_val).init(base_address + 0x31c);
};

/// DMA controller
pub const DMA = struct {

const base_address = 0x40020000;
/// ISR
const ISR_val = packed struct {
/// GIF1 [0:0]
/// Channel 1 Global interrupt
GIF1: u1 = 0,
/// TCIF1 [1:1]
/// Channel 1 Transfer Complete
TCIF1: u1 = 0,
/// HTIF1 [2:2]
/// Channel 1 Half Transfer Complete
HTIF1: u1 = 0,
/// TEIF1 [3:3]
/// Channel 1 Transfer Error
TEIF1: u1 = 0,
/// GIF2 [4:4]
/// Channel 2 Global interrupt
GIF2: u1 = 0,
/// TCIF2 [5:5]
/// Channel 2 Transfer Complete
TCIF2: u1 = 0,
/// HTIF2 [6:6]
/// Channel 2 Half Transfer Complete
HTIF2: u1 = 0,
/// TEIF2 [7:7]
/// Channel 2 Transfer Error
TEIF2: u1 = 0,
/// GIF3 [8:8]
/// Channel 3 Global interrupt
GIF3: u1 = 0,
/// TCIF3 [9:9]
/// Channel 3 Transfer Complete
TCIF3: u1 = 0,
/// HTIF3 [10:10]
/// Channel 3 Half Transfer Complete
HTIF3: u1 = 0,
/// TEIF3 [11:11]
/// Channel 3 Transfer Error
TEIF3: u1 = 0,
/// GIF4 [12:12]
/// Channel 4 Global interrupt
GIF4: u1 = 0,
/// TCIF4 [13:13]
/// Channel 4 Transfer Complete
TCIF4: u1 = 0,
/// HTIF4 [14:14]
/// Channel 4 Half Transfer Complete
HTIF4: u1 = 0,
/// TEIF4 [15:15]
/// Channel 4 Transfer Error
TEIF4: u1 = 0,
/// GIF5 [16:16]
/// Channel 5 Global interrupt
GIF5: u1 = 0,
/// TCIF5 [17:17]
/// Channel 5 Transfer Complete
TCIF5: u1 = 0,
/// HTIF5 [18:18]
/// Channel 5 Half Transfer Complete
HTIF5: u1 = 0,
/// TEIF5 [19:19]
/// Channel 5 Transfer Error
TEIF5: u1 = 0,
/// GIF6 [20:20]
/// Channel 6 Global interrupt
GIF6: u1 = 0,
/// TCIF6 [21:21]
/// Channel 6 Transfer Complete
TCIF6: u1 = 0,
/// HTIF6 [22:22]
/// Channel 6 Half Transfer Complete
HTIF6: u1 = 0,
/// TEIF6 [23:23]
/// Channel 6 Transfer Error
TEIF6: u1 = 0,
/// GIF7 [24:24]
/// Channel 7 Global interrupt
GIF7: u1 = 0,
/// TCIF7 [25:25]
/// Channel 7 Transfer Complete
TCIF7: u1 = 0,
/// HTIF7 [26:26]
/// Channel 7 Half Transfer Complete
HTIF7: u1 = 0,
/// TEIF7 [27:27]
/// Channel 7 Transfer Error
TEIF7: u1 = 0,
/// unused [28:31]
_unused28: u4 = 0,
};
/// DMA interrupt status register
pub const ISR = Register(ISR_val).init(base_address + 0x0);

/// IFCR
const IFCR_val = packed struct {
/// CGIF1 [0:0]
/// Channel 1 Global interrupt
CGIF1: u1 = 0,
/// CTCIF1 [1:1]
/// Channel 1 Transfer Complete
CTCIF1: u1 = 0,
/// CHTIF1 [2:2]
/// Channel 1 Half Transfer
CHTIF1: u1 = 0,
/// CTEIF1 [3:3]
/// Channel 1 Transfer Error
CTEIF1: u1 = 0,
/// CGIF2 [4:4]
/// Channel 2 Global interrupt
CGIF2: u1 = 0,
/// CTCIF2 [5:5]
/// Channel 2 Transfer Complete
CTCIF2: u1 = 0,
/// CHTIF2 [6:6]
/// Channel 2 Half Transfer
CHTIF2: u1 = 0,
/// CTEIF2 [7:7]
/// Channel 2 Transfer Error
CTEIF2: u1 = 0,
/// CGIF3 [8:8]
/// Channel 3 Global interrupt
CGIF3: u1 = 0,
/// CTCIF3 [9:9]
/// Channel 3 Transfer Complete
CTCIF3: u1 = 0,
/// CHTIF3 [10:10]
/// Channel 3 Half Transfer
CHTIF3: u1 = 0,
/// CTEIF3 [11:11]
/// Channel 3 Transfer Error
CTEIF3: u1 = 0,
/// CGIF4 [12:12]
/// Channel 4 Global interrupt
CGIF4: u1 = 0,
/// CTCIF4 [13:13]
/// Channel 4 Transfer Complete
CTCIF4: u1 = 0,
/// CHTIF4 [14:14]
/// Channel 4 Half Transfer
CHTIF4: u1 = 0,
/// CTEIF4 [15:15]
/// Channel 4 Transfer Error
CTEIF4: u1 = 0,
/// CGIF5 [16:16]
/// Channel 5 Global interrupt
CGIF5: u1 = 0,
/// CTCIF5 [17:17]
/// Channel 5 Transfer Complete
CTCIF5: u1 = 0,
/// CHTIF5 [18:18]
/// Channel 5 Half Transfer
CHTIF5: u1 = 0,
/// CTEIF5 [19:19]
/// Channel 5 Transfer Error
CTEIF5: u1 = 0,
/// CGIF6 [20:20]
/// Channel 6 Global interrupt
CGIF6: u1 = 0,
/// CTCIF6 [21:21]
/// Channel 6 Transfer Complete
CTCIF6: u1 = 0,
/// CHTIF6 [22:22]
/// Channel 6 Half Transfer
CHTIF6: u1 = 0,
/// CTEIF6 [23:23]
/// Channel 6 Transfer Error
CTEIF6: u1 = 0,
/// CGIF7 [24:24]
/// Channel 7 Global interrupt
CGIF7: u1 = 0,
/// CTCIF7 [25:25]
/// Channel 7 Transfer Complete
CTCIF7: u1 = 0,
/// CHTIF7 [26:26]
/// Channel 7 Half Transfer
CHTIF7: u1 = 0,
/// CTEIF7 [27:27]
/// Channel 7 Transfer Error
CTEIF7: u1 = 0,
/// unused [28:31]
_unused28: u4 = 0,
};
/// DMA interrupt flag clear register
pub const IFCR = Register(IFCR_val).init(base_address + 0x4);

/// CCR1
const CCR1_val = packed struct {
/// EN [0:0]
/// Channel enable
EN: u1 = 0,
/// TCIE [1:1]
/// Transfer complete interrupt
TCIE: u1 = 0,
/// HTIE [2:2]
/// Half Transfer interrupt
HTIE: u1 = 0,
/// TEIE [3:3]
/// Transfer error interrupt
TEIE: u1 = 0,
/// DIR [4:4]
/// Data transfer direction
DIR: u1 = 0,
/// CIRC [5:5]
/// Circular mode
CIRC: u1 = 0,
/// PINC [6:6]
/// Peripheral increment mode
PINC: u1 = 0,
/// MINC [7:7]
/// Memory increment mode
MINC: u1 = 0,
/// PSIZE [8:9]
/// Peripheral size
PSIZE: u2 = 0,
/// MSIZE [10:11]
/// Memory size
MSIZE: u2 = 0,
/// PL [12:13]
/// Channel Priority level
PL: u2 = 0,
/// MEM2MEM [14:14]
/// Memory to memory mode
MEM2MEM: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel configuration register
pub const CCR1 = Register(CCR1_val).init(base_address + 0x8);

/// CNDTR1
const CNDTR1_val = packed struct {
/// NDT [0:15]
/// Number of data to transfer
NDT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel 1 number of data
pub const CNDTR1 = Register(CNDTR1_val).init(base_address + 0xc);

/// CPAR1
const CPAR1_val = packed struct {
/// PA [0:31]
/// Peripheral address
PA: u32 = 0,
};
/// DMA channel 1 peripheral address
pub const CPAR1 = Register(CPAR1_val).init(base_address + 0x10);

/// CMAR1
const CMAR1_val = packed struct {
/// MA [0:31]
/// Memory address
MA: u32 = 0,
};
/// DMA channel 1 memory address
pub const CMAR1 = Register(CMAR1_val).init(base_address + 0x14);

/// CCR2
const CCR2_val = packed struct {
/// EN [0:0]
/// Channel enable
EN: u1 = 0,
/// TCIE [1:1]
/// Transfer complete interrupt
TCIE: u1 = 0,
/// HTIE [2:2]
/// Half Transfer interrupt
HTIE: u1 = 0,
/// TEIE [3:3]
/// Transfer error interrupt
TEIE: u1 = 0,
/// DIR [4:4]
/// Data transfer direction
DIR: u1 = 0,
/// CIRC [5:5]
/// Circular mode
CIRC: u1 = 0,
/// PINC [6:6]
/// Peripheral increment mode
PINC: u1 = 0,
/// MINC [7:7]
/// Memory increment mode
MINC: u1 = 0,
/// PSIZE [8:9]
/// Peripheral size
PSIZE: u2 = 0,
/// MSIZE [10:11]
/// Memory size
MSIZE: u2 = 0,
/// PL [12:13]
/// Channel Priority level
PL: u2 = 0,
/// MEM2MEM [14:14]
/// Memory to memory mode
MEM2MEM: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel configuration register
pub const CCR2 = Register(CCR2_val).init(base_address + 0x1c);

/// CNDTR2
const CNDTR2_val = packed struct {
/// NDT [0:15]
/// Number of data to transfer
NDT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel 2 number of data
pub const CNDTR2 = Register(CNDTR2_val).init(base_address + 0x20);

/// CPAR2
const CPAR2_val = packed struct {
/// PA [0:31]
/// Peripheral address
PA: u32 = 0,
};
/// DMA channel 2 peripheral address
pub const CPAR2 = Register(CPAR2_val).init(base_address + 0x24);

/// CMAR2
const CMAR2_val = packed struct {
/// MA [0:31]
/// Memory address
MA: u32 = 0,
};
/// DMA channel 2 memory address
pub const CMAR2 = Register(CMAR2_val).init(base_address + 0x28);

/// CCR3
const CCR3_val = packed struct {
/// EN [0:0]
/// Channel enable
EN: u1 = 0,
/// TCIE [1:1]
/// Transfer complete interrupt
TCIE: u1 = 0,
/// HTIE [2:2]
/// Half Transfer interrupt
HTIE: u1 = 0,
/// TEIE [3:3]
/// Transfer error interrupt
TEIE: u1 = 0,
/// DIR [4:4]
/// Data transfer direction
DIR: u1 = 0,
/// CIRC [5:5]
/// Circular mode
CIRC: u1 = 0,
/// PINC [6:6]
/// Peripheral increment mode
PINC: u1 = 0,
/// MINC [7:7]
/// Memory increment mode
MINC: u1 = 0,
/// PSIZE [8:9]
/// Peripheral size
PSIZE: u2 = 0,
/// MSIZE [10:11]
/// Memory size
MSIZE: u2 = 0,
/// PL [12:13]
/// Channel Priority level
PL: u2 = 0,
/// MEM2MEM [14:14]
/// Memory to memory mode
MEM2MEM: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel configuration register
pub const CCR3 = Register(CCR3_val).init(base_address + 0x30);

/// CNDTR3
const CNDTR3_val = packed struct {
/// NDT [0:15]
/// Number of data to transfer
NDT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel 3 number of data
pub const CNDTR3 = Register(CNDTR3_val).init(base_address + 0x34);

/// CPAR3
const CPAR3_val = packed struct {
/// PA [0:31]
/// Peripheral address
PA: u32 = 0,
};
/// DMA channel 3 peripheral address
pub const CPAR3 = Register(CPAR3_val).init(base_address + 0x38);

/// CMAR3
const CMAR3_val = packed struct {
/// MA [0:31]
/// Memory address
MA: u32 = 0,
};
/// DMA channel 3 memory address
pub const CMAR3 = Register(CMAR3_val).init(base_address + 0x3c);

/// CCR4
const CCR4_val = packed struct {
/// EN [0:0]
/// Channel enable
EN: u1 = 0,
/// TCIE [1:1]
/// Transfer complete interrupt
TCIE: u1 = 0,
/// HTIE [2:2]
/// Half Transfer interrupt
HTIE: u1 = 0,
/// TEIE [3:3]
/// Transfer error interrupt
TEIE: u1 = 0,
/// DIR [4:4]
/// Data transfer direction
DIR: u1 = 0,
/// CIRC [5:5]
/// Circular mode
CIRC: u1 = 0,
/// PINC [6:6]
/// Peripheral increment mode
PINC: u1 = 0,
/// MINC [7:7]
/// Memory increment mode
MINC: u1 = 0,
/// PSIZE [8:9]
/// Peripheral size
PSIZE: u2 = 0,
/// MSIZE [10:11]
/// Memory size
MSIZE: u2 = 0,
/// PL [12:13]
/// Channel Priority level
PL: u2 = 0,
/// MEM2MEM [14:14]
/// Memory to memory mode
MEM2MEM: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel configuration register
pub const CCR4 = Register(CCR4_val).init(base_address + 0x44);

/// CNDTR4
const CNDTR4_val = packed struct {
/// NDT [0:15]
/// Number of data to transfer
NDT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel 4 number of data
pub const CNDTR4 = Register(CNDTR4_val).init(base_address + 0x48);

/// CPAR4
const CPAR4_val = packed struct {
/// PA [0:31]
/// Peripheral address
PA: u32 = 0,
};
/// DMA channel 4 peripheral address
pub const CPAR4 = Register(CPAR4_val).init(base_address + 0x4c);

/// CMAR4
const CMAR4_val = packed struct {
/// MA [0:31]
/// Memory address
MA: u32 = 0,
};
/// DMA channel 4 memory address
pub const CMAR4 = Register(CMAR4_val).init(base_address + 0x50);

/// CCR5
const CCR5_val = packed struct {
/// EN [0:0]
/// Channel enable
EN: u1 = 0,
/// TCIE [1:1]
/// Transfer complete interrupt
TCIE: u1 = 0,
/// HTIE [2:2]
/// Half Transfer interrupt
HTIE: u1 = 0,
/// TEIE [3:3]
/// Transfer error interrupt
TEIE: u1 = 0,
/// DIR [4:4]
/// Data transfer direction
DIR: u1 = 0,
/// CIRC [5:5]
/// Circular mode
CIRC: u1 = 0,
/// PINC [6:6]
/// Peripheral increment mode
PINC: u1 = 0,
/// MINC [7:7]
/// Memory increment mode
MINC: u1 = 0,
/// PSIZE [8:9]
/// Peripheral size
PSIZE: u2 = 0,
/// MSIZE [10:11]
/// Memory size
MSIZE: u2 = 0,
/// PL [12:13]
/// Channel Priority level
PL: u2 = 0,
/// MEM2MEM [14:14]
/// Memory to memory mode
MEM2MEM: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel configuration register
pub const CCR5 = Register(CCR5_val).init(base_address + 0x58);

/// CNDTR5
const CNDTR5_val = packed struct {
/// NDT [0:15]
/// Number of data to transfer
NDT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel 5 number of data
pub const CNDTR5 = Register(CNDTR5_val).init(base_address + 0x5c);

/// CPAR5
const CPAR5_val = packed struct {
/// PA [0:31]
/// Peripheral address
PA: u32 = 0,
};
/// DMA channel 5 peripheral address
pub const CPAR5 = Register(CPAR5_val).init(base_address + 0x60);

/// CMAR5
const CMAR5_val = packed struct {
/// MA [0:31]
/// Memory address
MA: u32 = 0,
};
/// DMA channel 5 memory address
pub const CMAR5 = Register(CMAR5_val).init(base_address + 0x64);

/// CCR6
const CCR6_val = packed struct {
/// EN [0:0]
/// Channel enable
EN: u1 = 0,
/// TCIE [1:1]
/// Transfer complete interrupt
TCIE: u1 = 0,
/// HTIE [2:2]
/// Half Transfer interrupt
HTIE: u1 = 0,
/// TEIE [3:3]
/// Transfer error interrupt
TEIE: u1 = 0,
/// DIR [4:4]
/// Data transfer direction
DIR: u1 = 0,
/// CIRC [5:5]
/// Circular mode
CIRC: u1 = 0,
/// PINC [6:6]
/// Peripheral increment mode
PINC: u1 = 0,
/// MINC [7:7]
/// Memory increment mode
MINC: u1 = 0,
/// PSIZE [8:9]
/// Peripheral size
PSIZE: u2 = 0,
/// MSIZE [10:11]
/// Memory size
MSIZE: u2 = 0,
/// PL [12:13]
/// Channel Priority level
PL: u2 = 0,
/// MEM2MEM [14:14]
/// Memory to memory mode
MEM2MEM: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel configuration register
pub const CCR6 = Register(CCR6_val).init(base_address + 0x6c);

/// CNDTR6
const CNDTR6_val = packed struct {
/// NDT [0:15]
/// Number of data to transfer
NDT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel 6 number of data
pub const CNDTR6 = Register(CNDTR6_val).init(base_address + 0x70);

/// CPAR6
const CPAR6_val = packed struct {
/// PA [0:31]
/// Peripheral address
PA: u32 = 0,
};
/// DMA channel 6 peripheral address
pub const CPAR6 = Register(CPAR6_val).init(base_address + 0x74);

/// CMAR6
const CMAR6_val = packed struct {
/// MA [0:31]
/// Memory address
MA: u32 = 0,
};
/// DMA channel 6 memory address
pub const CMAR6 = Register(CMAR6_val).init(base_address + 0x78);

/// CCR7
const CCR7_val = packed struct {
/// EN [0:0]
/// Channel enable
EN: u1 = 0,
/// TCIE [1:1]
/// Transfer complete interrupt
TCIE: u1 = 0,
/// HTIE [2:2]
/// Half Transfer interrupt
HTIE: u1 = 0,
/// TEIE [3:3]
/// Transfer error interrupt
TEIE: u1 = 0,
/// DIR [4:4]
/// Data transfer direction
DIR: u1 = 0,
/// CIRC [5:5]
/// Circular mode
CIRC: u1 = 0,
/// PINC [6:6]
/// Peripheral increment mode
PINC: u1 = 0,
/// MINC [7:7]
/// Memory increment mode
MINC: u1 = 0,
/// PSIZE [8:9]
/// Peripheral size
PSIZE: u2 = 0,
/// MSIZE [10:11]
/// Memory size
MSIZE: u2 = 0,
/// PL [12:13]
/// Channel Priority level
PL: u2 = 0,
/// MEM2MEM [14:14]
/// Memory to memory mode
MEM2MEM: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel configuration register
pub const CCR7 = Register(CCR7_val).init(base_address + 0x80);

/// CNDTR7
const CNDTR7_val = packed struct {
/// NDT [0:15]
/// Number of data to transfer
NDT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA channel 7 number of data
pub const CNDTR7 = Register(CNDTR7_val).init(base_address + 0x84);

/// CPAR7
const CPAR7_val = packed struct {
/// PA [0:31]
/// Peripheral address
PA: u32 = 0,
};
/// DMA channel 7 peripheral address
pub const CPAR7 = Register(CPAR7_val).init(base_address + 0x88);

/// CMAR7
const CMAR7_val = packed struct {
/// MA [0:31]
/// Memory address
MA: u32 = 0,
};
/// DMA channel 7 memory address
pub const CMAR7 = Register(CMAR7_val).init(base_address + 0x8c);
};

/// Reset and clock control
pub const RCC = struct {

const base_address = 0x40021000;
/// CR
const CR_val = packed struct {
/// HSION [0:0]
/// Internal High Speed clock
HSION: u1 = 1,
/// HSIRDY [1:1]
/// Internal High Speed clock ready
HSIRDY: u1 = 1,
/// unused [2:2]
_unused2: u1 = 0,
/// HSITRIM [3:7]
/// Internal High Speed clock
HSITRIM: u5 = 16,
/// HSICAL [8:15]
/// Internal High Speed clock
HSICAL: u8 = 0,
/// HSEON [16:16]
/// External High Speed clock
HSEON: u1 = 0,
/// HSERDY [17:17]
/// External High Speed clock ready
HSERDY: u1 = 0,
/// HSEBYP [18:18]
/// External High Speed clock
HSEBYP: u1 = 0,
/// CSSON [19:19]
/// Clock Security System
CSSON: u1 = 0,
/// unused [20:23]
_unused20: u4 = 0,
/// PLLON [24:24]
/// PLL enable
PLLON: u1 = 0,
/// PLLRDY [25:25]
/// PLL clock ready flag
PLLRDY: u1 = 0,
/// unused [26:31]
_unused26: u6 = 0,
};
/// Clock control register
pub const CR = Register(CR_val).init(base_address + 0x0);

/// CFGR
const CFGR_val = packed struct {
/// SW [0:1]
/// System clock Switch
SW: u2 = 0,
/// SWS [2:3]
/// System Clock Switch Status
SWS: u2 = 0,
/// HPRE [4:7]
/// AHB prescaler
HPRE: u4 = 0,
/// PPRE [8:10]
/// APB Low speed prescaler
PPRE: u3 = 0,
/// unused [11:13]
_unused11: u3 = 0,
/// ADCPRE [14:15]
/// ADC prescaler
ADCPRE: u2 = 0,
/// PLLSRC [16:16]
/// PLL entry clock source
PLLSRC: u1 = 0,
/// PLLXTPRE [17:17]
/// HSE divider for PLL entry
PLLXTPRE: u1 = 0,
/// PLLMUL [18:21]
/// PLL Multiplication Factor
PLLMUL: u4 = 0,
/// unused [22:23]
_unused22: u2 = 0,
/// MCO [24:26]
/// Microcontroller clock
MCO: u3 = 0,
/// unused [27:31]
_unused27: u5 = 0,
};
/// Clock configuration register
pub const CFGR = Register(CFGR_val).init(base_address + 0x4);

/// CIR
const CIR_val = packed struct {
/// LSIRDYF [0:0]
/// LSI Ready Interrupt flag
LSIRDYF: u1 = 0,
/// LSERDYF [1:1]
/// LSE Ready Interrupt flag
LSERDYF: u1 = 0,
/// HSIRDYF [2:2]
/// HSI Ready Interrupt flag
HSIRDYF: u1 = 0,
/// HSERDYF [3:3]
/// HSE Ready Interrupt flag
HSERDYF: u1 = 0,
/// PLLRDYF [4:4]
/// PLL Ready Interrupt flag
PLLRDYF: u1 = 0,
/// HSI14RDYF [5:5]
/// HSI14 ready interrupt flag
HSI14RDYF: u1 = 0,
/// unused [6:6]
_unused6: u1 = 0,
/// CSSF [7:7]
/// Clock Security System Interrupt
CSSF: u1 = 0,
/// LSIRDYIE [8:8]
/// LSI Ready Interrupt Enable
LSIRDYIE: u1 = 0,
/// LSERDYIE [9:9]
/// LSE Ready Interrupt Enable
LSERDYIE: u1 = 0,
/// HSIRDYIE [10:10]
/// HSI Ready Interrupt Enable
HSIRDYIE: u1 = 0,
/// HSERDYIE [11:11]
/// HSE Ready Interrupt Enable
HSERDYIE: u1 = 0,
/// PLLRDYIE [12:12]
/// PLL Ready Interrupt Enable
PLLRDYIE: u1 = 0,
/// HSI14RDYE [13:13]
/// HSI14 ready interrupt
HSI14RDYE: u1 = 0,
/// unused [14:15]
_unused14: u2 = 0,
/// LSIRDYC [16:16]
/// LSI Ready Interrupt Clear
LSIRDYC: u1 = 0,
/// LSERDYC [17:17]
/// LSE Ready Interrupt Clear
LSERDYC: u1 = 0,
/// HSIRDYC [18:18]
/// HSI Ready Interrupt Clear
HSIRDYC: u1 = 0,
/// HSERDYC [19:19]
/// HSE Ready Interrupt Clear
HSERDYC: u1 = 0,
/// PLLRDYC [20:20]
/// PLL Ready Interrupt Clear
PLLRDYC: u1 = 0,
/// HSI14RDYC [21:21]
/// HSI 14 MHz Ready Interrupt
HSI14RDYC: u1 = 0,
/// unused [22:22]
_unused22: u1 = 0,
/// CSSC [23:23]
/// Clock security system interrupt
CSSC: u1 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// Clock interrupt register
pub const CIR = Register(CIR_val).init(base_address + 0x8);

/// APB2RSTR
const APB2RSTR_val = packed struct {
/// SYSCFGRST [0:0]
/// SYSCFG and COMP reset
SYSCFGRST: u1 = 0,
/// unused [1:8]
_unused1: u7 = 0,
_unused8: u1 = 0,
/// ADCRST [9:9]
/// ADC interface reset
ADCRST: u1 = 0,
/// unused [10:10]
_unused10: u1 = 0,
/// TIM1RST [11:11]
/// TIM1 timer reset
TIM1RST: u1 = 0,
/// SPI1RST [12:12]
/// SPI 1 reset
SPI1RST: u1 = 0,
/// unused [13:13]
_unused13: u1 = 0,
/// USART1RST [14:14]
/// USART1 reset
USART1RST: u1 = 0,
/// unused [15:15]
_unused15: u1 = 0,
/// TIM15RST [16:16]
/// TIM15 timer reset
TIM15RST: u1 = 0,
/// TIM16RST [17:17]
/// TIM16 timer reset
TIM16RST: u1 = 0,
/// TIM17RST [18:18]
/// TIM17 timer reset
TIM17RST: u1 = 0,
/// unused [19:21]
_unused19: u3 = 0,
/// DBGMCURST [22:22]
/// Debug MCU reset
DBGMCURST: u1 = 0,
/// unused [23:31]
_unused23: u1 = 0,
_unused24: u8 = 0,
};
/// APB2 peripheral reset register
pub const APB2RSTR = Register(APB2RSTR_val).init(base_address + 0xc);

/// APB1RSTR
const APB1RSTR_val = packed struct {
/// TIM2RST [0:0]
/// Timer 2 reset
TIM2RST: u1 = 0,
/// TIM3RST [1:1]
/// Timer 3 reset
TIM3RST: u1 = 0,
/// unused [2:3]
_unused2: u2 = 0,
/// TIM6RST [4:4]
/// Timer 6 reset
TIM6RST: u1 = 0,
/// unused [5:7]
_unused5: u3 = 0,
/// TIM14RST [8:8]
/// Timer 14 reset
TIM14RST: u1 = 0,
/// unused [9:10]
_unused9: u2 = 0,
/// WWDGRST [11:11]
/// Window watchdog reset
WWDGRST: u1 = 0,
/// unused [12:13]
_unused12: u2 = 0,
/// SPI2RST [14:14]
/// SPI2 reset
SPI2RST: u1 = 0,
/// unused [15:16]
_unused15: u1 = 0,
_unused16: u1 = 0,
/// USART2RST [17:17]
/// USART 2 reset
USART2RST: u1 = 0,
/// unused [18:20]
_unused18: u3 = 0,
/// I2C1RST [21:21]
/// I2C1 reset
I2C1RST: u1 = 0,
/// I2C2RST [22:22]
/// I2C2 reset
I2C2RST: u1 = 0,
/// unused [23:27]
_unused23: u1 = 0,
_unused24: u4 = 0,
/// PWRRST [28:28]
/// Power interface reset
PWRRST: u1 = 0,
/// DACRST [29:29]
/// DAC interface reset
DACRST: u1 = 0,
/// CECRST [30:30]
/// HDMI CEC reset
CECRST: u1 = 0,
/// unused [31:31]
_unused31: u1 = 0,
};
/// APB1 peripheral reset register
pub const APB1RSTR = Register(APB1RSTR_val).init(base_address + 0x10);

/// AHBENR
const AHBENR_val = packed struct {
/// DMAEN [0:0]
/// DMA1 clock enable
DMAEN: u1 = 0,
/// unused [1:1]
_unused1: u1 = 0,
/// SRAMEN [2:2]
/// SRAM interface clock
SRAMEN: u1 = 1,
/// unused [3:3]
_unused3: u1 = 0,
/// FLITFEN [4:4]
/// FLITF clock enable
FLITFEN: u1 = 1,
/// unused [5:5]
_unused5: u1 = 0,
/// CRCEN [6:6]
/// CRC clock enable
CRCEN: u1 = 0,
/// unused [7:16]
_unused7: u1 = 0,
_unused8: u8 = 0,
_unused16: u1 = 0,
/// IOPAEN [17:17]
/// I/O port A clock enable
IOPAEN: u1 = 0,
/// IOPBEN [18:18]
/// I/O port B clock enable
IOPBEN: u1 = 0,
/// IOPCEN [19:19]
/// I/O port C clock enable
IOPCEN: u1 = 0,
/// IOPDEN [20:20]
/// I/O port D clock enable
IOPDEN: u1 = 0,
/// unused [21:21]
_unused21: u1 = 0,
/// IOPFEN [22:22]
/// I/O port F clock enable
IOPFEN: u1 = 0,
/// unused [23:23]
_unused23: u1 = 0,
/// TSCEN [24:24]
/// Touch sensing controller clock
TSCEN: u1 = 0,
/// unused [25:31]
_unused25: u7 = 0,
};
/// AHB Peripheral Clock enable register
pub const AHBENR = Register(AHBENR_val).init(base_address + 0x14);

/// APB2ENR
const APB2ENR_val = packed struct {
/// SYSCFGEN [0:0]
/// SYSCFG clock enable
SYSCFGEN: u1 = 0,
/// unused [1:8]
_unused1: u7 = 0,
_unused8: u1 = 0,
/// ADCEN [9:9]
/// ADC 1 interface clock
ADCEN: u1 = 0,
/// unused [10:10]
_unused10: u1 = 0,
/// TIM1EN [11:11]
/// TIM1 Timer clock enable
TIM1EN: u1 = 0,
/// SPI1EN [12:12]
/// SPI 1 clock enable
SPI1EN: u1 = 0,
/// unused [13:13]
_unused13: u1 = 0,
/// USART1EN [14:14]
/// USART1 clock enable
USART1EN: u1 = 0,
/// unused [15:15]
_unused15: u1 = 0,
/// TIM15EN [16:16]
/// TIM15 timer clock enable
TIM15EN: u1 = 0,
/// TIM16EN [17:17]
/// TIM16 timer clock enable
TIM16EN: u1 = 0,
/// TIM17EN [18:18]
/// TIM17 timer clock enable
TIM17EN: u1 = 0,
/// unused [19:21]
_unused19: u3 = 0,
/// DBGMCUEN [22:22]
/// MCU debug module clock
DBGMCUEN: u1 = 0,
/// unused [23:31]
_unused23: u1 = 0,
_unused24: u8 = 0,
};
/// APB2 peripheral clock enable register
pub const APB2ENR = Register(APB2ENR_val).init(base_address + 0x18);

/// APB1ENR
const APB1ENR_val = packed struct {
/// TIM2EN [0:0]
/// Timer 2 clock enable
TIM2EN: u1 = 0,
/// TIM3EN [1:1]
/// Timer 3 clock enable
TIM3EN: u1 = 0,
/// unused [2:3]
_unused2: u2 = 0,
/// TIM6EN [4:4]
/// Timer 6 clock enable
TIM6EN: u1 = 0,
/// unused [5:7]
_unused5: u3 = 0,
/// TIM14EN [8:8]
/// Timer 14 clock enable
TIM14EN: u1 = 0,
/// unused [9:10]
_unused9: u2 = 0,
/// WWDGEN [11:11]
/// Window watchdog clock
WWDGEN: u1 = 0,
/// unused [12:13]
_unused12: u2 = 0,
/// SPI2EN [14:14]
/// SPI 2 clock enable
SPI2EN: u1 = 0,
/// unused [15:16]
_unused15: u1 = 0,
_unused16: u1 = 0,
/// USART2EN [17:17]
/// USART 2 clock enable
USART2EN: u1 = 0,
/// unused [18:20]
_unused18: u3 = 0,
/// I2C1EN [21:21]
/// I2C 1 clock enable
I2C1EN: u1 = 0,
/// I2C2EN [22:22]
/// I2C 2 clock enable
I2C2EN: u1 = 0,
/// unused [23:27]
_unused23: u1 = 0,
_unused24: u4 = 0,
/// PWREN [28:28]
/// Power interface clock
PWREN: u1 = 0,
/// DACEN [29:29]
/// DAC interface clock enable
DACEN: u1 = 0,
/// CECEN [30:30]
/// HDMI CEC interface clock
CECEN: u1 = 0,
/// unused [31:31]
_unused31: u1 = 0,
};
/// APB1 peripheral clock enable register
pub const APB1ENR = Register(APB1ENR_val).init(base_address + 0x1c);

/// BDCR
const BDCR_val = packed struct {
/// LSEON [0:0]
/// External Low Speed oscillator
LSEON: u1 = 0,
/// LSERDY [1:1]
/// External Low Speed oscillator
LSERDY: u1 = 0,
/// LSEBYP [2:2]
/// External Low Speed oscillator
LSEBYP: u1 = 0,
/// LSEDRV [3:4]
/// LSE oscillator drive
LSEDRV: u2 = 0,
/// unused [5:7]
_unused5: u3 = 0,
/// RTCSEL [8:9]
/// RTC clock source selection
RTCSEL: u2 = 0,
/// unused [10:14]
_unused10: u5 = 0,
/// RTCEN [15:15]
/// RTC clock enable
RTCEN: u1 = 0,
/// BDRST [16:16]
/// Backup domain software
BDRST: u1 = 0,
/// unused [17:31]
_unused17: u7 = 0,
_unused24: u8 = 0,
};
/// Backup domain control register
pub const BDCR = Register(BDCR_val).init(base_address + 0x20);

/// CSR
const CSR_val = packed struct {
/// LSION [0:0]
/// Internal low speed oscillator
LSION: u1 = 0,
/// LSIRDY [1:1]
/// Internal low speed oscillator
LSIRDY: u1 = 0,
/// unused [2:23]
_unused2: u6 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
/// RMVF [24:24]
/// Remove reset flag
RMVF: u1 = 0,
/// OBLRSTF [25:25]
/// Option byte loader reset
OBLRSTF: u1 = 0,
/// PINRSTF [26:26]
/// PIN reset flag
PINRSTF: u1 = 1,
/// PORRSTF [27:27]
/// POR/PDR reset flag
PORRSTF: u1 = 1,
/// SFTRSTF [28:28]
/// Software reset flag
SFTRSTF: u1 = 0,
/// IWDGRSTF [29:29]
/// Independent watchdog reset
IWDGRSTF: u1 = 0,
/// WWDGRSTF [30:30]
/// Window watchdog reset flag
WWDGRSTF: u1 = 0,
/// LPWRRSTF [31:31]
/// Low-power reset flag
LPWRRSTF: u1 = 0,
};
/// Control/status register
pub const CSR = Register(CSR_val).init(base_address + 0x24);

/// AHBRSTR
const AHBRSTR_val = packed struct {
/// unused [0:16]
_unused0: u8 = 0,
_unused8: u8 = 0,
_unused16: u1 = 0,
/// IOPARST [17:17]
/// I/O port A reset
IOPARST: u1 = 0,
/// IOPBRST [18:18]
/// I/O port B reset
IOPBRST: u1 = 0,
/// IOPCRST [19:19]
/// I/O port C reset
IOPCRST: u1 = 0,
/// IOPDRST [20:20]
/// I/O port D reset
IOPDRST: u1 = 0,
/// unused [21:21]
_unused21: u1 = 0,
/// IOPFRST [22:22]
/// I/O port F reset
IOPFRST: u1 = 0,
/// unused [23:23]
_unused23: u1 = 0,
/// TSCRST [24:24]
/// Touch sensing controller
TSCRST: u1 = 0,
/// unused [25:31]
_unused25: u7 = 0,
};
/// AHB peripheral reset register
pub const AHBRSTR = Register(AHBRSTR_val).init(base_address + 0x28);

/// CFGR2
const CFGR2_val = packed struct {
/// PREDIV [0:3]
/// PREDIV division factor
PREDIV: u4 = 0,
/// unused [4:31]
_unused4: u4 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Clock configuration register 2
pub const CFGR2 = Register(CFGR2_val).init(base_address + 0x2c);

/// CFGR3
const CFGR3_val = packed struct {
/// USART1SW [0:1]
/// USART1 clock source
USART1SW: u2 = 0,
/// unused [2:3]
_unused2: u2 = 0,
/// I2C1SW [4:4]
/// I2C1 clock source
I2C1SW: u1 = 0,
/// unused [5:5]
_unused5: u1 = 0,
/// CECSW [6:6]
/// HDMI CEC clock source
CECSW: u1 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// ADCSW [8:8]
/// ADC clock source selection
ADCSW: u1 = 0,
/// unused [9:31]
_unused9: u7 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Clock configuration register 3
pub const CFGR3 = Register(CFGR3_val).init(base_address + 0x30);

/// CR2
const CR2_val = packed struct {
/// HSI14ON [0:0]
/// HSI14 clock enable
HSI14ON: u1 = 0,
/// HSI14RDY [1:1]
/// HR14 clock ready flag
HSI14RDY: u1 = 0,
/// HSI14DIS [2:2]
/// HSI14 clock request from ADC
HSI14DIS: u1 = 0,
/// HSI14TRIM [3:7]
/// HSI14 clock trimming
HSI14TRIM: u5 = 16,
/// HSI14CAL [8:15]
/// HSI14 clock calibration
HSI14CAL: u8 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Clock control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x34);
};

/// System configuration controller
pub const SYSCFG = struct {

const base_address = 0x40010000;
/// CFGR1
const CFGR1_val = packed struct {
/// MEM_MODE [0:1]
/// Memory mapping selection
MEM_MODE: u2 = 0,
/// unused [2:7]
_unused2: u6 = 0,
/// ADC_DMA_RMP [8:8]
/// ADC DMA remapping bit
ADC_DMA_RMP: u1 = 0,
/// USART1_TX_DMA_RMP [9:9]
/// USART1_TX DMA remapping
USART1_TX_DMA_RMP: u1 = 0,
/// USART1_RX_DMA_RMP [10:10]
/// USART1_RX DMA request remapping
USART1_RX_DMA_RMP: u1 = 0,
/// TIM16_DMA_RMP [11:11]
/// TIM16 DMA request remapping
TIM16_DMA_RMP: u1 = 0,
/// TIM17_DMA_RMP [12:12]
/// TIM17 DMA request remapping
TIM17_DMA_RMP: u1 = 0,
/// unused [13:15]
_unused13: u3 = 0,
/// I2C_PB6_FM [16:16]
/// Fast Mode Plus (FM+) driving capability
I2C_PB6_FM: u1 = 0,
/// I2C_PB7_FM [17:17]
/// Fast Mode Plus (FM+) driving capability
I2C_PB7_FM: u1 = 0,
/// I2C_PB8_FM [18:18]
/// Fast Mode Plus (FM+) driving capability
I2C_PB8_FM: u1 = 0,
/// I2C_PB9_FM [19:19]
/// Fast Mode Plus (FM+) driving capability
I2C_PB9_FM: u1 = 0,
/// unused [20:31]
_unused20: u4 = 0,
_unused24: u8 = 0,
};
/// configuration register 1
pub const CFGR1 = Register(CFGR1_val).init(base_address + 0x0);

/// EXTICR1
const EXTICR1_val = packed struct {
/// EXTI0 [0:3]
/// EXTI 0 configuration bits
EXTI0: u4 = 0,
/// EXTI1 [4:7]
/// EXTI 1 configuration bits
EXTI1: u4 = 0,
/// EXTI2 [8:11]
/// EXTI 2 configuration bits
EXTI2: u4 = 0,
/// EXTI3 [12:15]
/// EXTI 3 configuration bits
EXTI3: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// external interrupt configuration register
pub const EXTICR1 = Register(EXTICR1_val).init(base_address + 0x8);

/// EXTICR2
const EXTICR2_val = packed struct {
/// EXTI4 [0:3]
/// EXTI 4 configuration bits
EXTI4: u4 = 0,
/// EXTI5 [4:7]
/// EXTI 5 configuration bits
EXTI5: u4 = 0,
/// EXTI6 [8:11]
/// EXTI 6 configuration bits
EXTI6: u4 = 0,
/// EXTI7 [12:15]
/// EXTI 7 configuration bits
EXTI7: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// external interrupt configuration register
pub const EXTICR2 = Register(EXTICR2_val).init(base_address + 0xc);

/// EXTICR3
const EXTICR3_val = packed struct {
/// EXTI8 [0:3]
/// EXTI 8 configuration bits
EXTI8: u4 = 0,
/// EXTI9 [4:7]
/// EXTI 9 configuration bits
EXTI9: u4 = 0,
/// EXTI10 [8:11]
/// EXTI 10 configuration bits
EXTI10: u4 = 0,
/// EXTI11 [12:15]
/// EXTI 11 configuration bits
EXTI11: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// external interrupt configuration register
pub const EXTICR3 = Register(EXTICR3_val).init(base_address + 0x10);

/// EXTICR4
const EXTICR4_val = packed struct {
/// EXTI12 [0:3]
/// EXTI 12 configuration bits
EXTI12: u4 = 0,
/// EXTI13 [4:7]
/// EXTI 13 configuration bits
EXTI13: u4 = 0,
/// EXTI14 [8:11]
/// EXTI 14 configuration bits
EXTI14: u4 = 0,
/// EXTI15 [12:15]
/// EXTI 15 configuration bits
EXTI15: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// external interrupt configuration register
pub const EXTICR4 = Register(EXTICR4_val).init(base_address + 0x14);

/// CFGR2
const CFGR2_val = packed struct {
/// LOCUP_LOCK [0:0]
/// Cortex-M0 LOCKUP bit enable
LOCUP_LOCK: u1 = 0,
/// SRAM_PARITY_LOCK [1:1]
/// SRAM parity lock bit
SRAM_PARITY_LOCK: u1 = 0,
/// PVD_LOCK [2:2]
/// PVD lock enable bit
PVD_LOCK: u1 = 0,
/// unused [3:7]
_unused3: u5 = 0,
/// SRAM_PEF [8:8]
/// SRAM parity flag
SRAM_PEF: u1 = 0,
/// unused [9:31]
_unused9: u7 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// configuration register 2
pub const CFGR2 = Register(CFGR2_val).init(base_address + 0x18);
};

/// Analog-to-digital converter
pub const ADC = struct {

const base_address = 0x40012400;
/// ISR
const ISR_val = packed struct {
/// ADRDY [0:0]
/// ADC ready
ADRDY: u1 = 0,
/// EOSMP [1:1]
/// End of sampling flag
EOSMP: u1 = 0,
/// EOC [2:2]
/// End of conversion flag
EOC: u1 = 0,
/// EOS [3:3]
/// End of sequence flag
EOS: u1 = 0,
/// OVR [4:4]
/// ADC overrun
OVR: u1 = 0,
/// unused [5:6]
_unused5: u2 = 0,
/// AWD [7:7]
/// Analog watchdog flag
AWD: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// interrupt and status register
pub const ISR = Register(ISR_val).init(base_address + 0x0);

/// IER
const IER_val = packed struct {
/// ADRDYIE [0:0]
/// ADC ready interrupt enable
ADRDYIE: u1 = 0,
/// EOSMPIE [1:1]
/// End of sampling flag interrupt
EOSMPIE: u1 = 0,
/// EOCIE [2:2]
/// End of conversion interrupt
EOCIE: u1 = 0,
/// EOSIE [3:3]
/// End of conversion sequence interrupt
EOSIE: u1 = 0,
/// OVRIE [4:4]
/// Overrun interrupt enable
OVRIE: u1 = 0,
/// unused [5:6]
_unused5: u2 = 0,
/// AWDIE [7:7]
/// Analog watchdog interrupt
AWDIE: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// interrupt enable register
pub const IER = Register(IER_val).init(base_address + 0x4);

/// CR
const CR_val = packed struct {
/// ADEN [0:0]
/// ADC enable command
ADEN: u1 = 0,
/// ADDIS [1:1]
/// ADC disable command
ADDIS: u1 = 0,
/// ADSTART [2:2]
/// ADC start conversion
ADSTART: u1 = 0,
/// unused [3:3]
_unused3: u1 = 0,
/// ADSTP [4:4]
/// ADC stop conversion
ADSTP: u1 = 0,
/// unused [5:30]
_unused5: u3 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u7 = 0,
/// ADCAL [31:31]
/// ADC calibration
ADCAL: u1 = 0,
};
/// control register
pub const CR = Register(CR_val).init(base_address + 0x8);

/// CFGR1
const CFGR1_val = packed struct {
/// DMAEN [0:0]
/// Direct memory access
DMAEN: u1 = 0,
/// DMACFG [1:1]
/// Direct memery access
DMACFG: u1 = 0,
/// SCANDIR [2:2]
/// Scan sequence direction
SCANDIR: u1 = 0,
/// RES [3:4]
/// Data resolution
RES: u2 = 0,
/// ALIGN [5:5]
/// Data alignment
ALIGN: u1 = 0,
/// EXTSEL [6:8]
/// External trigger selection
EXTSEL: u3 = 0,
/// unused [9:9]
_unused9: u1 = 0,
/// EXTEN [10:11]
/// External trigger enable and polarity
EXTEN: u2 = 0,
/// OVRMOD [12:12]
/// Overrun management mode
OVRMOD: u1 = 0,
/// CONT [13:13]
/// Single / continuous conversion
CONT: u1 = 0,
/// AUTDLY [14:14]
/// Auto-delayed conversion
AUTDLY: u1 = 0,
/// AUTOFF [15:15]
/// Auto-off mode
AUTOFF: u1 = 0,
/// DISCEN [16:16]
/// Discontinuous mode
DISCEN: u1 = 0,
/// unused [17:21]
_unused17: u5 = 0,
/// AWDSGL [22:22]
/// Enable the watchdog on a single channel
AWDSGL: u1 = 0,
/// AWDEN [23:23]
/// Analog watchdog enable
AWDEN: u1 = 0,
/// unused [24:25]
_unused24: u2 = 0,
/// AWDCH [26:30]
/// Analog watchdog channel
AWDCH: u5 = 0,
/// unused [31:31]
_unused31: u1 = 0,
};
/// configuration register 1
pub const CFGR1 = Register(CFGR1_val).init(base_address + 0xc);

/// CFGR2
const CFGR2_val = packed struct {
/// unused [0:29]
_unused0: u8 = 0,
_unused8: u8 = 128,
_unused16: u8 = 0,
_unused24: u6 = 0,
/// JITOFF_D2 [30:30]
/// JITOFF_D2
JITOFF_D2: u1 = 0,
/// JITOFF_D4 [31:31]
/// JITOFF_D4
JITOFF_D4: u1 = 0,
};
/// configuration register 2
pub const CFGR2 = Register(CFGR2_val).init(base_address + 0x10);

/// SMPR
const SMPR_val = packed struct {
/// SMPR [0:2]
/// Sampling time selection
SMPR: u3 = 0,
/// unused [3:31]
_unused3: u5 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// sampling time register
pub const SMPR = Register(SMPR_val).init(base_address + 0x14);

/// TR
const TR_val = packed struct {
/// LT [0:11]
/// Analog watchdog lower
LT: u12 = 4095,
/// unused [12:15]
_unused12: u4 = 0,
/// HT [16:27]
/// Analog watchdog higher
HT: u12 = 0,
/// unused [28:31]
_unused28: u4 = 0,
};
/// watchdog threshold register
pub const TR = Register(TR_val).init(base_address + 0x20);

/// CHSELR
const CHSELR_val = packed struct {
/// CHSEL0 [0:0]
/// Channel-x selection
CHSEL0: u1 = 0,
/// CHSEL1 [1:1]
/// Channel-x selection
CHSEL1: u1 = 0,
/// CHSEL2 [2:2]
/// Channel-x selection
CHSEL2: u1 = 0,
/// CHSEL3 [3:3]
/// Channel-x selection
CHSEL3: u1 = 0,
/// CHSEL4 [4:4]
/// Channel-x selection
CHSEL4: u1 = 0,
/// CHSEL5 [5:5]
/// Channel-x selection
CHSEL5: u1 = 0,
/// CHSEL6 [6:6]
/// Channel-x selection
CHSEL6: u1 = 0,
/// CHSEL7 [7:7]
/// Channel-x selection
CHSEL7: u1 = 0,
/// CHSEL8 [8:8]
/// Channel-x selection
CHSEL8: u1 = 0,
/// CHSEL9 [9:9]
/// Channel-x selection
CHSEL9: u1 = 0,
/// CHSEL10 [10:10]
/// Channel-x selection
CHSEL10: u1 = 0,
/// CHSEL11 [11:11]
/// Channel-x selection
CHSEL11: u1 = 0,
/// CHSEL12 [12:12]
/// Channel-x selection
CHSEL12: u1 = 0,
/// CHSEL13 [13:13]
/// Channel-x selection
CHSEL13: u1 = 0,
/// CHSEL14 [14:14]
/// Channel-x selection
CHSEL14: u1 = 0,
/// CHSEL15 [15:15]
/// Channel-x selection
CHSEL15: u1 = 0,
/// CHSEL16 [16:16]
/// Channel-x selection
CHSEL16: u1 = 0,
/// CHSEL17 [17:17]
/// Channel-x selection
CHSEL17: u1 = 0,
/// CHSEL18 [18:18]
/// Channel-x selection
CHSEL18: u1 = 0,
/// unused [19:31]
_unused19: u5 = 0,
_unused24: u8 = 0,
};
/// channel selection register
pub const CHSELR = Register(CHSELR_val).init(base_address + 0x28);

/// DR
const DR_val = packed struct {
/// DATA [0:15]
/// Converted data
DATA: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// data register
pub const DR = Register(DR_val).init(base_address + 0x40);

/// CCR
const CCR_val = packed struct {
/// unused [0:21]
_unused0: u8 = 0,
_unused8: u8 = 0,
_unused16: u6 = 0,
/// VREFEN [22:22]
/// Temperature sensor and VREFINT
VREFEN: u1 = 0,
/// TSEN [23:23]
/// Temperature sensor enable
TSEN: u1 = 0,
/// VBATEN [24:24]
/// VBAT enable
VBATEN: u1 = 0,
/// unused [25:31]
_unused25: u7 = 0,
};
/// common configuration register
pub const CCR = Register(CCR_val).init(base_address + 0x308);
};

/// Universal synchronous asynchronous receiver
pub const USART1 = struct {

const base_address = 0x40013800;
/// CR1
const CR1_val = packed struct {
/// UE [0:0]
/// USART enable
UE: u1 = 0,
/// UESM [1:1]
/// USART enable in Stop mode
UESM: u1 = 0,
/// RE [2:2]
/// Receiver enable
RE: u1 = 0,
/// TE [3:3]
/// Transmitter enable
TE: u1 = 0,
/// IDLEIE [4:4]
/// IDLE interrupt enable
IDLEIE: u1 = 0,
/// RXNEIE [5:5]
/// RXNE interrupt enable
RXNEIE: u1 = 0,
/// TCIE [6:6]
/// Transmission complete interrupt
TCIE: u1 = 0,
/// TXEIE [7:7]
/// interrupt enable
TXEIE: u1 = 0,
/// PEIE [8:8]
/// PE interrupt enable
PEIE: u1 = 0,
/// PS [9:9]
/// Parity selection
PS: u1 = 0,
/// PCE [10:10]
/// Parity control enable
PCE: u1 = 0,
/// WAKE [11:11]
/// Receiver wakeup method
WAKE: u1 = 0,
/// M [12:12]
/// Word length
M: u1 = 0,
/// MME [13:13]
/// Mute mode enable
MME: u1 = 0,
/// CMIE [14:14]
/// Character match interrupt
CMIE: u1 = 0,
/// OVER8 [15:15]
/// Oversampling mode
OVER8: u1 = 0,
/// DEDT [16:20]
/// Driver Enable deassertion
DEDT: u5 = 0,
/// DEAT [21:25]
/// Driver Enable assertion
DEAT: u5 = 0,
/// RTOIE [26:26]
/// Receiver timeout interrupt
RTOIE: u1 = 0,
/// EOBIE [27:27]
/// End of Block interrupt
EOBIE: u1 = 0,
/// unused [28:31]
_unused28: u4 = 0,
};
/// Control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// unused [0:3]
_unused0: u4 = 0,
/// ADDM7 [4:4]
/// 7-bit Address Detection/4-bit Address
ADDM7: u1 = 0,
/// LBDL [5:5]
/// LIN break detection length
LBDL: u1 = 0,
/// LBDIE [6:6]
/// LIN break detection interrupt
LBDIE: u1 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// LBCL [8:8]
/// Last bit clock pulse
LBCL: u1 = 0,
/// CPHA [9:9]
/// Clock phase
CPHA: u1 = 0,
/// CPOL [10:10]
/// Clock polarity
CPOL: u1 = 0,
/// CLKEN [11:11]
/// Clock enable
CLKEN: u1 = 0,
/// STOP [12:13]
/// STOP bits
STOP: u2 = 0,
/// LINEN [14:14]
/// LIN mode enable
LINEN: u1 = 0,
/// SWAP [15:15]
/// Swap TX/RX pins
SWAP: u1 = 0,
/// RXINV [16:16]
/// RX pin active level
RXINV: u1 = 0,
/// TXINV [17:17]
/// TX pin active level
TXINV: u1 = 0,
/// DATAINV [18:18]
/// Binary data inversion
DATAINV: u1 = 0,
/// MSBFIRST [19:19]
/// Most significant bit first
MSBFIRST: u1 = 0,
/// ABREN [20:20]
/// Auto baud rate enable
ABREN: u1 = 0,
/// ABRMOD [21:22]
/// Auto baud rate mode
ABRMOD: u2 = 0,
/// RTOEN [23:23]
/// Receiver timeout enable
RTOEN: u1 = 0,
/// ADD0 [24:27]
/// Address of the USART node
ADD0: u4 = 0,
/// ADD4 [28:31]
/// Address of the USART node
ADD4: u4 = 0,
};
/// Control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// CR3
const CR3_val = packed struct {
/// EIE [0:0]
/// Error interrupt enable
EIE: u1 = 0,
/// IREN [1:1]
/// IrDA mode enable
IREN: u1 = 0,
/// IRLP [2:2]
/// IrDA low-power
IRLP: u1 = 0,
/// HDSEL [3:3]
/// Half-duplex selection
HDSEL: u1 = 0,
/// NACK [4:4]
/// Smartcard NACK enable
NACK: u1 = 0,
/// SCEN [5:5]
/// Smartcard mode enable
SCEN: u1 = 0,
/// DMAR [6:6]
/// DMA enable receiver
DMAR: u1 = 0,
/// DMAT [7:7]
/// DMA enable transmitter
DMAT: u1 = 0,
/// RTSE [8:8]
/// RTS enable
RTSE: u1 = 0,
/// CTSE [9:9]
/// CTS enable
CTSE: u1 = 0,
/// CTSIE [10:10]
/// CTS interrupt enable
CTSIE: u1 = 0,
/// ONEBIT [11:11]
/// One sample bit method
ONEBIT: u1 = 0,
/// OVRDIS [12:12]
/// Overrun Disable
OVRDIS: u1 = 0,
/// DDRE [13:13]
/// DMA Disable on Reception
DDRE: u1 = 0,
/// DEM [14:14]
/// Driver enable mode
DEM: u1 = 0,
/// DEP [15:15]
/// Driver enable polarity
DEP: u1 = 0,
/// unused [16:16]
_unused16: u1 = 0,
/// SCARCNT [17:19]
/// Smartcard auto-retry count
SCARCNT: u3 = 0,
/// WUS [20:21]
/// Wakeup from Stop mode interrupt flag
WUS: u2 = 0,
/// WUFIE [22:22]
/// Wakeup from Stop mode interrupt
WUFIE: u1 = 0,
/// unused [23:31]
_unused23: u1 = 0,
_unused24: u8 = 0,
};
/// Control register 3
pub const CR3 = Register(CR3_val).init(base_address + 0x8);

/// BRR
const BRR_val = packed struct {
/// DIV_Fraction [0:3]
/// fraction of USARTDIV
DIV_Fraction: u4 = 0,
/// DIV_Mantissa [4:15]
/// mantissa of USARTDIV
DIV_Mantissa: u12 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Baud rate register
pub const BRR = Register(BRR_val).init(base_address + 0xc);

/// GTPR
const GTPR_val = packed struct {
/// PSC [0:7]
/// Prescaler value
PSC: u8 = 0,
/// GT [8:15]
/// Guard time value
GT: u8 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Guard time and prescaler
pub const GTPR = Register(GTPR_val).init(base_address + 0x10);

/// RTOR
const RTOR_val = packed struct {
/// RTO [0:23]
/// Receiver timeout value
RTO: u24 = 0,
/// BLEN [24:31]
/// Block Length
BLEN: u8 = 0,
};
/// Receiver timeout register
pub const RTOR = Register(RTOR_val).init(base_address + 0x14);

/// RQR
const RQR_val = packed struct {
/// ABRRQ [0:0]
/// Auto baud rate request
ABRRQ: u1 = 0,
/// SBKRQ [1:1]
/// Send break request
SBKRQ: u1 = 0,
/// MMRQ [2:2]
/// Mute mode request
MMRQ: u1 = 0,
/// RXFRQ [3:3]
/// Receive data flush request
RXFRQ: u1 = 0,
/// TXFRQ [4:4]
/// Transmit data flush
TXFRQ: u1 = 0,
/// unused [5:31]
_unused5: u3 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Request register
pub const RQR = Register(RQR_val).init(base_address + 0x18);

/// ISR
const ISR_val = packed struct {
/// PE [0:0]
/// Parity error
PE: u1 = 0,
/// FE [1:1]
/// Framing error
FE: u1 = 0,
/// NF [2:2]
/// Noise detected flag
NF: u1 = 0,
/// ORE [3:3]
/// Overrun error
ORE: u1 = 0,
/// IDLE [4:4]
/// Idle line detected
IDLE: u1 = 0,
/// RXNE [5:5]
/// Read data register not
RXNE: u1 = 0,
/// TC [6:6]
/// Transmission complete
TC: u1 = 1,
/// TXE [7:7]
/// Transmit data register
TXE: u1 = 1,
/// LBDF [8:8]
/// LIN break detection flag
LBDF: u1 = 0,
/// CTSIF [9:9]
/// CTS interrupt flag
CTSIF: u1 = 0,
/// CTS [10:10]
/// CTS flag
CTS: u1 = 0,
/// RTOF [11:11]
/// Receiver timeout
RTOF: u1 = 0,
/// EOBF [12:12]
/// End of block flag
EOBF: u1 = 0,
/// unused [13:13]
_unused13: u1 = 0,
/// ABRE [14:14]
/// Auto baud rate error
ABRE: u1 = 0,
/// ABRF [15:15]
/// Auto baud rate flag
ABRF: u1 = 0,
/// BUSY [16:16]
/// Busy flag
BUSY: u1 = 0,
/// CMF [17:17]
/// character match flag
CMF: u1 = 0,
/// SBKF [18:18]
/// Send break flag
SBKF: u1 = 0,
/// RWU [19:19]
/// Receiver wakeup from Mute
RWU: u1 = 0,
/// WUF [20:20]
/// Wakeup from Stop mode flag
WUF: u1 = 0,
/// TEACK [21:21]
/// Transmit enable acknowledge
TEACK: u1 = 0,
/// REACK [22:22]
/// Receive enable acknowledge
REACK: u1 = 0,
/// unused [23:31]
_unused23: u1 = 0,
_unused24: u8 = 0,
};
/// Interrupt &amp; status
pub const ISR = Register(ISR_val).init(base_address + 0x1c);

/// ICR
const ICR_val = packed struct {
/// PECF [0:0]
/// Parity error clear flag
PECF: u1 = 0,
/// FECF [1:1]
/// Framing error clear flag
FECF: u1 = 0,
/// NCF [2:2]
/// Noise detected clear flag
NCF: u1 = 0,
/// ORECF [3:3]
/// Overrun error clear flag
ORECF: u1 = 0,
/// IDLECF [4:4]
/// Idle line detected clear
IDLECF: u1 = 0,
/// unused [5:5]
_unused5: u1 = 0,
/// TCCF [6:6]
/// Transmission complete clear
TCCF: u1 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// LBDCF [8:8]
/// LIN break detection clear
LBDCF: u1 = 0,
/// CTSCF [9:9]
/// CTS clear flag
CTSCF: u1 = 0,
/// unused [10:10]
_unused10: u1 = 0,
/// RTOCF [11:11]
/// Receiver timeout clear
RTOCF: u1 = 0,
/// EOBCF [12:12]
/// End of timeout clear flag
EOBCF: u1 = 0,
/// unused [13:16]
_unused13: u3 = 0,
_unused16: u1 = 0,
/// CMCF [17:17]
/// Character match clear flag
CMCF: u1 = 0,
/// unused [18:19]
_unused18: u2 = 0,
/// WUCF [20:20]
/// Wakeup from Stop mode clear
WUCF: u1 = 0,
/// unused [21:31]
_unused21: u3 = 0,
_unused24: u8 = 0,
};
/// Interrupt flag clear register
pub const ICR = Register(ICR_val).init(base_address + 0x20);

/// RDR
const RDR_val = packed struct {
/// RDR [0:8]
/// Receive data value
RDR: u9 = 0,
/// unused [9:31]
_unused9: u7 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Receive data register
pub const RDR = Register(RDR_val).init(base_address + 0x24);

/// TDR
const TDR_val = packed struct {
/// TDR [0:8]
/// Transmit data value
TDR: u9 = 0,
/// unused [9:31]
_unused9: u7 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Transmit data register
pub const TDR = Register(TDR_val).init(base_address + 0x28);
};

/// Universal synchronous asynchronous receiver
pub const USART2 = struct {

const base_address = 0x40004400;
/// CR1
const CR1_val = packed struct {
/// UE [0:0]
/// USART enable
UE: u1 = 0,
/// UESM [1:1]
/// USART enable in Stop mode
UESM: u1 = 0,
/// RE [2:2]
/// Receiver enable
RE: u1 = 0,
/// TE [3:3]
/// Transmitter enable
TE: u1 = 0,
/// IDLEIE [4:4]
/// IDLE interrupt enable
IDLEIE: u1 = 0,
/// RXNEIE [5:5]
/// RXNE interrupt enable
RXNEIE: u1 = 0,
/// TCIE [6:6]
/// Transmission complete interrupt
TCIE: u1 = 0,
/// TXEIE [7:7]
/// interrupt enable
TXEIE: u1 = 0,
/// PEIE [8:8]
/// PE interrupt enable
PEIE: u1 = 0,
/// PS [9:9]
/// Parity selection
PS: u1 = 0,
/// PCE [10:10]
/// Parity control enable
PCE: u1 = 0,
/// WAKE [11:11]
/// Receiver wakeup method
WAKE: u1 = 0,
/// M [12:12]
/// Word length
M: u1 = 0,
/// MME [13:13]
/// Mute mode enable
MME: u1 = 0,
/// CMIE [14:14]
/// Character match interrupt
CMIE: u1 = 0,
/// OVER8 [15:15]
/// Oversampling mode
OVER8: u1 = 0,
/// DEDT [16:20]
/// Driver Enable deassertion
DEDT: u5 = 0,
/// DEAT [21:25]
/// Driver Enable assertion
DEAT: u5 = 0,
/// RTOIE [26:26]
/// Receiver timeout interrupt
RTOIE: u1 = 0,
/// EOBIE [27:27]
/// End of Block interrupt
EOBIE: u1 = 0,
/// unused [28:31]
_unused28: u4 = 0,
};
/// Control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// unused [0:3]
_unused0: u4 = 0,
/// ADDM7 [4:4]
/// 7-bit Address Detection/4-bit Address
ADDM7: u1 = 0,
/// LBDL [5:5]
/// LIN break detection length
LBDL: u1 = 0,
/// LBDIE [6:6]
/// LIN break detection interrupt
LBDIE: u1 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// LBCL [8:8]
/// Last bit clock pulse
LBCL: u1 = 0,
/// CPHA [9:9]
/// Clock phase
CPHA: u1 = 0,
/// CPOL [10:10]
/// Clock polarity
CPOL: u1 = 0,
/// CLKEN [11:11]
/// Clock enable
CLKEN: u1 = 0,
/// STOP [12:13]
/// STOP bits
STOP: u2 = 0,
/// LINEN [14:14]
/// LIN mode enable
LINEN: u1 = 0,
/// SWAP [15:15]
/// Swap TX/RX pins
SWAP: u1 = 0,
/// RXINV [16:16]
/// RX pin active level
RXINV: u1 = 0,
/// TXINV [17:17]
/// TX pin active level
TXINV: u1 = 0,
/// DATAINV [18:18]
/// Binary data inversion
DATAINV: u1 = 0,
/// MSBFIRST [19:19]
/// Most significant bit first
MSBFIRST: u1 = 0,
/// ABREN [20:20]
/// Auto baud rate enable
ABREN: u1 = 0,
/// ABRMOD [21:22]
/// Auto baud rate mode
ABRMOD: u2 = 0,
/// RTOEN [23:23]
/// Receiver timeout enable
RTOEN: u1 = 0,
/// ADD0 [24:27]
/// Address of the USART node
ADD0: u4 = 0,
/// ADD4 [28:31]
/// Address of the USART node
ADD4: u4 = 0,
};
/// Control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// CR3
const CR3_val = packed struct {
/// EIE [0:0]
/// Error interrupt enable
EIE: u1 = 0,
/// IREN [1:1]
/// IrDA mode enable
IREN: u1 = 0,
/// IRLP [2:2]
/// IrDA low-power
IRLP: u1 = 0,
/// HDSEL [3:3]
/// Half-duplex selection
HDSEL: u1 = 0,
/// NACK [4:4]
/// Smartcard NACK enable
NACK: u1 = 0,
/// SCEN [5:5]
/// Smartcard mode enable
SCEN: u1 = 0,
/// DMAR [6:6]
/// DMA enable receiver
DMAR: u1 = 0,
/// DMAT [7:7]
/// DMA enable transmitter
DMAT: u1 = 0,
/// RTSE [8:8]
/// RTS enable
RTSE: u1 = 0,
/// CTSE [9:9]
/// CTS enable
CTSE: u1 = 0,
/// CTSIE [10:10]
/// CTS interrupt enable
CTSIE: u1 = 0,
/// ONEBIT [11:11]
/// One sample bit method
ONEBIT: u1 = 0,
/// OVRDIS [12:12]
/// Overrun Disable
OVRDIS: u1 = 0,
/// DDRE [13:13]
/// DMA Disable on Reception
DDRE: u1 = 0,
/// DEM [14:14]
/// Driver enable mode
DEM: u1 = 0,
/// DEP [15:15]
/// Driver enable polarity
DEP: u1 = 0,
/// unused [16:16]
_unused16: u1 = 0,
/// SCARCNT [17:19]
/// Smartcard auto-retry count
SCARCNT: u3 = 0,
/// WUS [20:21]
/// Wakeup from Stop mode interrupt flag
WUS: u2 = 0,
/// WUFIE [22:22]
/// Wakeup from Stop mode interrupt
WUFIE: u1 = 0,
/// unused [23:31]
_unused23: u1 = 0,
_unused24: u8 = 0,
};
/// Control register 3
pub const CR3 = Register(CR3_val).init(base_address + 0x8);

/// BRR
const BRR_val = packed struct {
/// DIV_Fraction [0:3]
/// fraction of USARTDIV
DIV_Fraction: u4 = 0,
/// DIV_Mantissa [4:15]
/// mantissa of USARTDIV
DIV_Mantissa: u12 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Baud rate register
pub const BRR = Register(BRR_val).init(base_address + 0xc);

/// GTPR
const GTPR_val = packed struct {
/// PSC [0:7]
/// Prescaler value
PSC: u8 = 0,
/// GT [8:15]
/// Guard time value
GT: u8 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Guard time and prescaler
pub const GTPR = Register(GTPR_val).init(base_address + 0x10);

/// RTOR
const RTOR_val = packed struct {
/// RTO [0:23]
/// Receiver timeout value
RTO: u24 = 0,
/// BLEN [24:31]
/// Block Length
BLEN: u8 = 0,
};
/// Receiver timeout register
pub const RTOR = Register(RTOR_val).init(base_address + 0x14);

/// RQR
const RQR_val = packed struct {
/// ABRRQ [0:0]
/// Auto baud rate request
ABRRQ: u1 = 0,
/// SBKRQ [1:1]
/// Send break request
SBKRQ: u1 = 0,
/// MMRQ [2:2]
/// Mute mode request
MMRQ: u1 = 0,
/// RXFRQ [3:3]
/// Receive data flush request
RXFRQ: u1 = 0,
/// TXFRQ [4:4]
/// Transmit data flush
TXFRQ: u1 = 0,
/// unused [5:31]
_unused5: u3 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Request register
pub const RQR = Register(RQR_val).init(base_address + 0x18);

/// ISR
const ISR_val = packed struct {
/// PE [0:0]
/// Parity error
PE: u1 = 0,
/// FE [1:1]
/// Framing error
FE: u1 = 0,
/// NF [2:2]
/// Noise detected flag
NF: u1 = 0,
/// ORE [3:3]
/// Overrun error
ORE: u1 = 0,
/// IDLE [4:4]
/// Idle line detected
IDLE: u1 = 0,
/// RXNE [5:5]
/// Read data register not
RXNE: u1 = 0,
/// TC [6:6]
/// Transmission complete
TC: u1 = 1,
/// TXE [7:7]
/// Transmit data register
TXE: u1 = 1,
/// LBDF [8:8]
/// LIN break detection flag
LBDF: u1 = 0,
/// CTSIF [9:9]
/// CTS interrupt flag
CTSIF: u1 = 0,
/// CTS [10:10]
/// CTS flag
CTS: u1 = 0,
/// RTOF [11:11]
/// Receiver timeout
RTOF: u1 = 0,
/// EOBF [12:12]
/// End of block flag
EOBF: u1 = 0,
/// unused [13:13]
_unused13: u1 = 0,
/// ABRE [14:14]
/// Auto baud rate error
ABRE: u1 = 0,
/// ABRF [15:15]
/// Auto baud rate flag
ABRF: u1 = 0,
/// BUSY [16:16]
/// Busy flag
BUSY: u1 = 0,
/// CMF [17:17]
/// character match flag
CMF: u1 = 0,
/// SBKF [18:18]
/// Send break flag
SBKF: u1 = 0,
/// RWU [19:19]
/// Receiver wakeup from Mute
RWU: u1 = 0,
/// WUF [20:20]
/// Wakeup from Stop mode flag
WUF: u1 = 0,
/// TEACK [21:21]
/// Transmit enable acknowledge
TEACK: u1 = 0,
/// REACK [22:22]
/// Receive enable acknowledge
REACK: u1 = 0,
/// unused [23:31]
_unused23: u1 = 0,
_unused24: u8 = 0,
};
/// Interrupt &amp; status
pub const ISR = Register(ISR_val).init(base_address + 0x1c);

/// ICR
const ICR_val = packed struct {
/// PECF [0:0]
/// Parity error clear flag
PECF: u1 = 0,
/// FECF [1:1]
/// Framing error clear flag
FECF: u1 = 0,
/// NCF [2:2]
/// Noise detected clear flag
NCF: u1 = 0,
/// ORECF [3:3]
/// Overrun error clear flag
ORECF: u1 = 0,
/// IDLECF [4:4]
/// Idle line detected clear
IDLECF: u1 = 0,
/// unused [5:5]
_unused5: u1 = 0,
/// TCCF [6:6]
/// Transmission complete clear
TCCF: u1 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// LBDCF [8:8]
/// LIN break detection clear
LBDCF: u1 = 0,
/// CTSCF [9:9]
/// CTS clear flag
CTSCF: u1 = 0,
/// unused [10:10]
_unused10: u1 = 0,
/// RTOCF [11:11]
/// Receiver timeout clear
RTOCF: u1 = 0,
/// EOBCF [12:12]
/// End of timeout clear flag
EOBCF: u1 = 0,
/// unused [13:16]
_unused13: u3 = 0,
_unused16: u1 = 0,
/// CMCF [17:17]
/// Character match clear flag
CMCF: u1 = 0,
/// unused [18:19]
_unused18: u2 = 0,
/// WUCF [20:20]
/// Wakeup from Stop mode clear
WUCF: u1 = 0,
/// unused [21:31]
_unused21: u3 = 0,
_unused24: u8 = 0,
};
/// Interrupt flag clear register
pub const ICR = Register(ICR_val).init(base_address + 0x20);

/// RDR
const RDR_val = packed struct {
/// RDR [0:8]
/// Receive data value
RDR: u9 = 0,
/// unused [9:31]
_unused9: u7 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Receive data register
pub const RDR = Register(RDR_val).init(base_address + 0x24);

/// TDR
const TDR_val = packed struct {
/// TDR [0:8]
/// Transmit data value
TDR: u9 = 0,
/// unused [9:31]
_unused9: u7 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Transmit data register
pub const TDR = Register(TDR_val).init(base_address + 0x28);
};

/// Comparator
pub const COMP = struct {

const base_address = 0x4001001c;
/// CSR
const CSR_val = packed struct {
/// COMP1EN [0:0]
/// Comparator 1 enable
COMP1EN: u1 = 0,
/// COMP1_INP_DAC [1:1]
/// COMP1_INP_DAC
COMP1_INP_DAC: u1 = 0,
/// COMP1MODE [2:3]
/// Comparator 1 mode
COMP1MODE: u2 = 0,
/// COMP1INSEL [4:6]
/// Comparator 1 inverting input
COMP1INSEL: u3 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// COMP1OUTSEL [8:10]
/// Comparator 1 output
COMP1OUTSEL: u3 = 0,
/// COMP1POL [11:11]
/// Comparator 1 output
COMP1POL: u1 = 0,
/// COMP1HYST [12:13]
/// Comparator 1 hysteresis
COMP1HYST: u2 = 0,
/// COMP1OUT [14:14]
/// Comparator 1 output
COMP1OUT: u1 = 0,
/// COMP1LOCK [15:15]
/// Comparator 1 lock
COMP1LOCK: u1 = 0,
/// COMP2EN [16:16]
/// Comparator 2 enable
COMP2EN: u1 = 0,
/// unused [17:17]
_unused17: u1 = 0,
/// COMP2MODE [18:19]
/// Comparator 2 mode
COMP2MODE: u2 = 0,
/// COMP2INSEL [20:22]
/// Comparator 2 inverting input
COMP2INSEL: u3 = 0,
/// WNDWEN [23:23]
/// Window mode enable
WNDWEN: u1 = 0,
/// COMP2OUTSEL [24:26]
/// Comparator 2 output
COMP2OUTSEL: u3 = 0,
/// COMP2POL [27:27]
/// Comparator 2 output
COMP2POL: u1 = 0,
/// COMP2HYST [28:29]
/// Comparator 2 hysteresis
COMP2HYST: u2 = 0,
/// COMP2OUT [30:30]
/// Comparator 2 output
COMP2OUT: u1 = 0,
/// COMP2LOCK [31:31]
/// Comparator 2 lock
COMP2LOCK: u1 = 0,
};
/// control and status register
pub const CSR = Register(CSR_val).init(base_address + 0x0);
};

/// Real-time clock
pub const RTC = struct {

const base_address = 0x40002800;
/// TR
const TR_val = packed struct {
/// SU [0:3]
/// Second units in BCD format
SU: u4 = 0,
/// ST [4:6]
/// Second tens in BCD format
ST: u3 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// MNU [8:11]
/// Minute units in BCD format
MNU: u4 = 0,
/// MNT [12:14]
/// Minute tens in BCD format
MNT: u3 = 0,
/// unused [15:15]
_unused15: u1 = 0,
/// HU [16:19]
/// Hour units in BCD format
HU: u4 = 0,
/// HT [20:21]
/// Hour tens in BCD format
HT: u2 = 0,
/// PM [22:22]
/// AM/PM notation
PM: u1 = 0,
/// unused [23:31]
_unused23: u1 = 0,
_unused24: u8 = 0,
};
/// time register
pub const TR = Register(TR_val).init(base_address + 0x0);

/// DR
const DR_val = packed struct {
/// DU [0:3]
/// Date units in BCD format
DU: u4 = 1,
/// DT [4:5]
/// Date tens in BCD format
DT: u2 = 0,
/// unused [6:7]
_unused6: u2 = 0,
/// MU [8:11]
/// Month units in BCD format
MU: u4 = 1,
/// MT [12:12]
/// Month tens in BCD format
MT: u1 = 0,
/// WDU [13:15]
/// Week day units
WDU: u3 = 1,
/// YU [16:19]
/// Year units in BCD format
YU: u4 = 0,
/// YT [20:23]
/// Year tens in BCD format
YT: u4 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// date register
pub const DR = Register(DR_val).init(base_address + 0x4);

/// CR
const CR_val = packed struct {
/// unused [0:2]
_unused0: u3 = 0,
/// TSEDGE [3:3]
/// Time-stamp event active
TSEDGE: u1 = 0,
/// REFCKON [4:4]
/// RTC_REFIN reference clock detection
REFCKON: u1 = 0,
/// BYPSHAD [5:5]
/// Bypass the shadow
BYPSHAD: u1 = 0,
/// FMT [6:6]
/// Hour format
FMT: u1 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// ALRAE [8:8]
/// Alarm A enable
ALRAE: u1 = 0,
/// unused [9:10]
_unused9: u2 = 0,
/// TSE [11:11]
/// timestamp enable
TSE: u1 = 0,
/// ALRAIE [12:12]
/// Alarm A interrupt enable
ALRAIE: u1 = 0,
/// unused [13:14]
_unused13: u2 = 0,
/// TSIE [15:15]
/// Time-stamp interrupt
TSIE: u1 = 0,
/// ADD1H [16:16]
/// Add 1 hour (summer time
ADD1H: u1 = 0,
/// SUB1H [17:17]
/// Subtract 1 hour (winter time
SUB1H: u1 = 0,
/// BKP [18:18]
/// Backup
BKP: u1 = 0,
/// COSEL [19:19]
/// Calibration output
COSEL: u1 = 0,
/// POL [20:20]
/// Output polarity
POL: u1 = 0,
/// OSEL [21:22]
/// Output selection
OSEL: u2 = 0,
/// COE [23:23]
/// Calibration output enable
COE: u1 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// control register
pub const CR = Register(CR_val).init(base_address + 0x8);

/// ISR
const ISR_val = packed struct {
/// ALRAWF [0:0]
/// Alarm A write flag
ALRAWF: u1 = 1,
/// unused [1:2]
_unused1: u2 = 3,
/// SHPF [3:3]
/// Shift operation pending
SHPF: u1 = 0,
/// INITS [4:4]
/// Initialization status flag
INITS: u1 = 0,
/// RSF [5:5]
/// Registers synchronization
RSF: u1 = 0,
/// INITF [6:6]
/// Initialization flag
INITF: u1 = 0,
/// INIT [7:7]
/// Initialization mode
INIT: u1 = 0,
/// ALRAF [8:8]
/// Alarm A flag
ALRAF: u1 = 0,
/// unused [9:10]
_unused9: u2 = 0,
/// TSF [11:11]
/// Time-stamp flag
TSF: u1 = 0,
/// TSOVF [12:12]
/// Time-stamp overflow flag
TSOVF: u1 = 0,
/// TAMP1F [13:13]
/// RTC_TAMP1 detection flag
TAMP1F: u1 = 0,
/// TAMP2F [14:14]
/// RTC_TAMP2 detection flag
TAMP2F: u1 = 0,
/// unused [15:15]
_unused15: u1 = 0,
/// RECALPF [16:16]
/// Recalibration pending Flag
RECALPF: u1 = 0,
/// unused [17:31]
_unused17: u7 = 0,
_unused24: u8 = 0,
};
/// initialization and status
pub const ISR = Register(ISR_val).init(base_address + 0xc);

/// PRER
const PRER_val = packed struct {
/// PREDIV_S [0:14]
/// Synchronous prescaler
PREDIV_S: u15 = 255,
/// unused [15:15]
_unused15: u1 = 0,
/// PREDIV_A [16:22]
/// Asynchronous prescaler
PREDIV_A: u7 = 127,
/// unused [23:31]
_unused23: u1 = 0,
_unused24: u8 = 0,
};
/// prescaler register
pub const PRER = Register(PRER_val).init(base_address + 0x10);

/// ALRMAR
const ALRMAR_val = packed struct {
/// SU [0:3]
/// Second units in BCD
SU: u4 = 0,
/// ST [4:6]
/// Second tens in BCD format.
ST: u3 = 0,
/// MSK1 [7:7]
/// Alarm A seconds mask
MSK1: u1 = 0,
/// MNU [8:11]
/// Minute units in BCD
MNU: u4 = 0,
/// MNT [12:14]
/// Minute tens in BCD format.
MNT: u3 = 0,
/// MSK2 [15:15]
/// Alarm A minutes mask
MSK2: u1 = 0,
/// HU [16:19]
/// Hour units in BCD format.
HU: u4 = 0,
/// HT [20:21]
/// Hour tens in BCD format.
HT: u2 = 0,
/// PM [22:22]
/// AM/PM notation
PM: u1 = 0,
/// MSK3 [23:23]
/// Alarm A hours mask
MSK3: u1 = 0,
/// DU [24:27]
/// Date units or day in BCD
DU: u4 = 0,
/// DT [28:29]
/// Date tens in BCD format.
DT: u2 = 0,
/// WDSEL [30:30]
/// Week day selection
WDSEL: u1 = 0,
/// MSK4 [31:31]
/// Alarm A date mask
MSK4: u1 = 0,
};
/// alarm A register
pub const ALRMAR = Register(ALRMAR_val).init(base_address + 0x1c);

/// WPR
const WPR_val = packed struct {
/// KEY [0:7]
/// Write protection key
KEY: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// write protection register
pub const WPR = Register(WPR_val).init(base_address + 0x24);

/// SSR
const SSR_val = packed struct {
/// SS [0:15]
/// Sub second value
SS: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// sub second register
pub const SSR = Register(SSR_val).init(base_address + 0x28);

/// SHIFTR
const SHIFTR_val = packed struct {
/// SUBFS [0:14]
/// Subtract a fraction of a
SUBFS: u15 = 0,
/// unused [15:30]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u7 = 0,
/// ADD1S [31:31]
/// Reserved
ADD1S: u1 = 0,
};
/// shift control register
pub const SHIFTR = Register(SHIFTR_val).init(base_address + 0x2c);

/// TSTR
const TSTR_val = packed struct {
/// SU [0:3]
/// Second units in BCD
SU: u4 = 0,
/// ST [4:6]
/// Second tens in BCD format.
ST: u3 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// MNU [8:11]
/// Minute units in BCD
MNU: u4 = 0,
/// MNT [12:14]
/// Minute tens in BCD format.
MNT: u3 = 0,
/// unused [15:15]
_unused15: u1 = 0,
/// HU [16:19]
/// Hour units in BCD format.
HU: u4 = 0,
/// HT [20:21]
/// Hour tens in BCD format.
HT: u2 = 0,
/// PM [22:22]
/// AM/PM notation
PM: u1 = 0,
/// unused [23:31]
_unused23: u1 = 0,
_unused24: u8 = 0,
};
/// timestamp time register
pub const TSTR = Register(TSTR_val).init(base_address + 0x30);

/// TSDR
const TSDR_val = packed struct {
/// DU [0:3]
/// Date units in BCD format
DU: u4 = 0,
/// DT [4:5]
/// Date tens in BCD format
DT: u2 = 0,
/// unused [6:7]
_unused6: u2 = 0,
/// MU [8:11]
/// Month units in BCD format
MU: u4 = 0,
/// MT [12:12]
/// Month tens in BCD format
MT: u1 = 0,
/// WDU [13:15]
/// Week day units
WDU: u3 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// timestamp date register
pub const TSDR = Register(TSDR_val).init(base_address + 0x34);

/// TSSSR
const TSSSR_val = packed struct {
/// SS [0:15]
/// Sub second value
SS: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// time-stamp sub second register
pub const TSSSR = Register(TSSSR_val).init(base_address + 0x38);

/// CALR
const CALR_val = packed struct {
/// CALM [0:8]
/// Calibration minus
CALM: u9 = 0,
/// unused [9:12]
_unused9: u4 = 0,
/// CALW16 [13:13]
/// Reserved
CALW16: u1 = 0,
/// CALW8 [14:14]
/// Use a 16-second calibration cycle
CALW8: u1 = 0,
/// CALP [15:15]
/// Use an 8-second calibration cycle
CALP: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// calibration register
pub const CALR = Register(CALR_val).init(base_address + 0x3c);

/// TAFCR
const TAFCR_val = packed struct {
/// TAMP1E [0:0]
/// RTC_TAMP1 input detection
TAMP1E: u1 = 0,
/// TAMP1TRG [1:1]
/// Active level for RTC_TAMP1
TAMP1TRG: u1 = 0,
/// TAMPIE [2:2]
/// Tamper interrupt enable
TAMPIE: u1 = 0,
/// TAMP2E [3:3]
/// RTC_TAMP2 input detection
TAMP2E: u1 = 0,
/// TAMP2_TRG [4:4]
/// Active level for RTC_TAMP2
TAMP2_TRG: u1 = 0,
/// unused [5:6]
_unused5: u2 = 0,
/// TAMPTS [7:7]
/// Activate timestamp on tamper detection
TAMPTS: u1 = 0,
/// TAMPFREQ [8:10]
/// Tamper sampling frequency
TAMPFREQ: u3 = 0,
/// TAMPFLT [11:12]
/// RTC_TAMPx filter count
TAMPFLT: u2 = 0,
/// TAMP_PRCH [13:14]
/// RTC_TAMPx precharge
TAMP_PRCH: u2 = 0,
/// TAMP_PUDIS [15:15]
/// RTC_TAMPx pull-up disable
TAMP_PUDIS: u1 = 0,
/// unused [16:17]
_unused16: u2 = 0,
/// PC13VALUE [18:18]
/// RTC_ALARM output type/PC13
PC13VALUE: u1 = 0,
/// PC13MODE [19:19]
/// PC13 mode
PC13MODE: u1 = 0,
/// PC14VALUE [20:20]
/// PC14 value
PC14VALUE: u1 = 0,
/// PC14MODE [21:21]
/// PC14 mode
PC14MODE: u1 = 0,
/// PC15VALUE [22:22]
/// PC15 value
PC15VALUE: u1 = 0,
/// PC15MODE [23:23]
/// PC15 mode
PC15MODE: u1 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// tamper and alternate function configuration
pub const TAFCR = Register(TAFCR_val).init(base_address + 0x40);

/// ALRMASSR
const ALRMASSR_val = packed struct {
/// SS [0:14]
/// Sub seconds value
SS: u15 = 0,
/// unused [15:23]
_unused15: u1 = 0,
_unused16: u8 = 0,
/// MASKSS [24:27]
/// Mask the most-significant bits starting
MASKSS: u4 = 0,
/// unused [28:31]
_unused28: u4 = 0,
};
/// alarm A sub second register
pub const ALRMASSR = Register(ALRMASSR_val).init(base_address + 0x44);

/// BKP0R
const BKP0R_val = packed struct {
/// BKP [0:31]
/// BKP
BKP: u32 = 0,
};
/// backup register
pub const BKP0R = Register(BKP0R_val).init(base_address + 0x50);

/// BKP1R
const BKP1R_val = packed struct {
/// BKP [0:31]
/// BKP
BKP: u32 = 0,
};
/// backup register
pub const BKP1R = Register(BKP1R_val).init(base_address + 0x54);

/// BKP2R
const BKP2R_val = packed struct {
/// BKP [0:31]
/// BKP
BKP: u32 = 0,
};
/// backup register
pub const BKP2R = Register(BKP2R_val).init(base_address + 0x58);

/// BKP3R
const BKP3R_val = packed struct {
/// BKP [0:31]
/// BKP
BKP: u32 = 0,
};
/// backup register
pub const BKP3R = Register(BKP3R_val).init(base_address + 0x5c);

/// BKP4R
const BKP4R_val = packed struct {
/// BKP [0:31]
/// BKP
BKP: u32 = 0,
};
/// backup register
pub const BKP4R = Register(BKP4R_val).init(base_address + 0x60);
};

/// General-purpose-timers
pub const TIM15 = struct {

const base_address = 0x40014000;
/// CR1
const CR1_val = packed struct {
/// CEN [0:0]
/// Counter enable
CEN: u1 = 0,
/// UDIS [1:1]
/// Update disable
UDIS: u1 = 0,
/// URS [2:2]
/// Update request source
URS: u1 = 0,
/// OPM [3:3]
/// One-pulse mode
OPM: u1 = 0,
/// unused [4:6]
_unused4: u3 = 0,
/// ARPE [7:7]
/// Auto-reload preload enable
ARPE: u1 = 0,
/// CKD [8:9]
/// Clock division
CKD: u2 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// CCPC [0:0]
/// Capture/compare preloaded
CCPC: u1 = 0,
/// unused [1:1]
_unused1: u1 = 0,
/// CCUS [2:2]
/// Capture/compare control update
CCUS: u1 = 0,
/// CCDS [3:3]
/// Capture/compare DMA
CCDS: u1 = 0,
/// MMS [4:6]
/// Master mode selection
MMS: u3 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// OIS1 [8:8]
/// Output Idle state 1
OIS1: u1 = 0,
/// OIS1N [9:9]
/// Output Idle state 1
OIS1N: u1 = 0,
/// OIS2 [10:10]
/// Output Idle state 2
OIS2: u1 = 0,
/// unused [11:31]
_unused11: u5 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// SMCR
const SMCR_val = packed struct {
/// SMS [0:2]
/// Slave mode selection
SMS: u3 = 0,
/// unused [3:3]
_unused3: u1 = 0,
/// TS [4:6]
/// Trigger selection
TS: u3 = 0,
/// MSM [7:7]
/// Master/Slave mode
MSM: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// slave mode control register
pub const SMCR = Register(SMCR_val).init(base_address + 0x8);

/// DIER
const DIER_val = packed struct {
/// UIE [0:0]
/// Update interrupt enable
UIE: u1 = 0,
/// CC1IE [1:1]
/// Capture/Compare 1 interrupt
CC1IE: u1 = 0,
/// CC2IE [2:2]
/// Capture/Compare 2 interrupt
CC2IE: u1 = 0,
/// unused [3:4]
_unused3: u2 = 0,
/// COMIE [5:5]
/// COM interrupt enable
COMIE: u1 = 0,
/// TIE [6:6]
/// Trigger interrupt enable
TIE: u1 = 0,
/// BIE [7:7]
/// Break interrupt enable
BIE: u1 = 0,
/// UDE [8:8]
/// Update DMA request enable
UDE: u1 = 0,
/// CC1DE [9:9]
/// Capture/Compare 1 DMA request
CC1DE: u1 = 0,
/// CC2DE [10:10]
/// Capture/Compare 2 DMA request
CC2DE: u1 = 0,
/// unused [11:13]
_unused11: u3 = 0,
/// TDE [14:14]
/// Trigger DMA request enable
TDE: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA/Interrupt enable register
pub const DIER = Register(DIER_val).init(base_address + 0xc);

/// SR
const SR_val = packed struct {
/// UIF [0:0]
/// Update interrupt flag
UIF: u1 = 0,
/// CC1IF [1:1]
/// Capture/compare 1 interrupt
CC1IF: u1 = 0,
/// CC2IF [2:2]
/// Capture/Compare 2 interrupt
CC2IF: u1 = 0,
/// unused [3:4]
_unused3: u2 = 0,
/// COMIF [5:5]
/// COM interrupt flag
COMIF: u1 = 0,
/// TIF [6:6]
/// Trigger interrupt flag
TIF: u1 = 0,
/// BIF [7:7]
/// Break interrupt flag
BIF: u1 = 0,
/// unused [8:8]
_unused8: u1 = 0,
/// CC1OF [9:9]
/// Capture/Compare 1 overcapture
CC1OF: u1 = 0,
/// CC2OF [10:10]
/// Capture/compare 2 overcapture
CC2OF: u1 = 0,
/// unused [11:31]
_unused11: u5 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x10);

/// EGR
const EGR_val = packed struct {
/// UG [0:0]
/// Update generation
UG: u1 = 0,
/// CC1G [1:1]
/// Capture/compare 1
CC1G: u1 = 0,
/// CC2G [2:2]
/// Capture/compare 2
CC2G: u1 = 0,
/// unused [3:4]
_unused3: u2 = 0,
/// COMG [5:5]
/// Capture/Compare control update
COMG: u1 = 0,
/// TG [6:6]
/// Trigger generation
TG: u1 = 0,
/// BG [7:7]
/// Break generation
BG: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// event generation register
pub const EGR = Register(EGR_val).init(base_address + 0x14);

/// CCMR1_Output
const CCMR1_Output_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// OC1FE [2:2]
/// Output Compare 1 fast
OC1FE: u1 = 0,
/// OC1PE [3:3]
/// Output Compare 1 preload
OC1PE: u1 = 0,
/// OC1M [4:6]
/// Output Compare 1 mode
OC1M: u3 = 0,
/// unused [7:7]
_unused7: u1 = 0,
/// CC2S [8:9]
/// Capture/Compare 2
CC2S: u2 = 0,
/// OC2FE [10:10]
/// Output Compare 2 fast
OC2FE: u1 = 0,
/// OC2PE [11:11]
/// Output Compare 2 preload
OC2PE: u1 = 0,
/// OC2M [12:14]
/// Output Compare 2 mode
OC2M: u3 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register (output
pub const CCMR1_Output = Register(CCMR1_Output_val).init(base_address + 0x18);

/// CCMR1_Input
const CCMR1_Input_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// IC1PSC [2:3]
/// Input capture 1 prescaler
IC1PSC: u2 = 0,
/// IC1F [4:7]
/// Input capture 1 filter
IC1F: u4 = 0,
/// CC2S [8:9]
/// Capture/Compare 2
CC2S: u2 = 0,
/// IC2PSC [10:11]
/// Input capture 2 prescaler
IC2PSC: u2 = 0,
/// IC2F [12:15]
/// Input capture 2 filter
IC2F: u4 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 1 (input
pub const CCMR1_Input = Register(CCMR1_Input_val).init(base_address + 0x18);

/// CCER
const CCER_val = packed struct {
/// CC1E [0:0]
/// Capture/Compare 1 output
CC1E: u1 = 0,
/// CC1P [1:1]
/// Capture/Compare 1 output
CC1P: u1 = 0,
/// CC1NE [2:2]
/// Capture/Compare 1 complementary output
CC1NE: u1 = 0,
/// CC1NP [3:3]
/// Capture/Compare 1 output
CC1NP: u1 = 0,
/// CC2E [4:4]
/// Capture/Compare 2 output
CC2E: u1 = 0,
/// CC2P [5:5]
/// Capture/Compare 2 output
CC2P: u1 = 0,
/// unused [6:6]
_unused6: u1 = 0,
/// CC2NP [7:7]
/// Capture/Compare 2 output
CC2NP: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare enable
pub const CCER = Register(CCER_val).init(base_address + 0x20);

/// CNT
const CNT_val = packed struct {
/// CNT [0:15]
/// counter value
CNT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// counter
pub const CNT = Register(CNT_val).init(base_address + 0x24);

/// PSC
const PSC_val = packed struct {
/// PSC [0:15]
/// Prescaler value
PSC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// prescaler
pub const PSC = Register(PSC_val).init(base_address + 0x28);

/// ARR
const ARR_val = packed struct {
/// ARR [0:15]
/// Auto-reload value
ARR: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// auto-reload register
pub const ARR = Register(ARR_val).init(base_address + 0x2c);

/// RCR
const RCR_val = packed struct {
/// REP [0:7]
/// Repetition counter value
REP: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// repetition counter register
pub const RCR = Register(RCR_val).init(base_address + 0x30);

/// CCR1
const CCR1_val = packed struct {
/// CCR1 [0:15]
/// Capture/Compare 1 value
CCR1: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare register 1
pub const CCR1 = Register(CCR1_val).init(base_address + 0x34);

/// CCR2
const CCR2_val = packed struct {
/// CCR2 [0:15]
/// Capture/Compare 2 value
CCR2: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare register 2
pub const CCR2 = Register(CCR2_val).init(base_address + 0x38);

/// BDTR
const BDTR_val = packed struct {
/// DTG [0:7]
/// Dead-time generator setup
DTG: u8 = 0,
/// LOCK [8:9]
/// Lock configuration
LOCK: u2 = 0,
/// OSSI [10:10]
/// Off-state selection for Idle
OSSI: u1 = 0,
/// OSSR [11:11]
/// Off-state selection for Run
OSSR: u1 = 0,
/// BKE [12:12]
/// Break enable
BKE: u1 = 0,
/// BKP [13:13]
/// Break polarity
BKP: u1 = 0,
/// AOE [14:14]
/// Automatic output enable
AOE: u1 = 0,
/// MOE [15:15]
/// Main output enable
MOE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// break and dead-time register
pub const BDTR = Register(BDTR_val).init(base_address + 0x44);

/// DCR
const DCR_val = packed struct {
/// DBA [0:4]
/// DMA base address
DBA: u5 = 0,
/// unused [5:7]
_unused5: u3 = 0,
/// DBL [8:12]
/// DMA burst length
DBL: u5 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA control register
pub const DCR = Register(DCR_val).init(base_address + 0x48);

/// DMAR
const DMAR_val = packed struct {
/// DMAB [0:15]
/// DMA register for burst
DMAB: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA address for full transfer
pub const DMAR = Register(DMAR_val).init(base_address + 0x4c);
};

/// General-purpose-timers
pub const TIM16 = struct {

const base_address = 0x40014400;
/// CR1
const CR1_val = packed struct {
/// CEN [0:0]
/// Counter enable
CEN: u1 = 0,
/// UDIS [1:1]
/// Update disable
UDIS: u1 = 0,
/// URS [2:2]
/// Update request source
URS: u1 = 0,
/// OPM [3:3]
/// One-pulse mode
OPM: u1 = 0,
/// unused [4:6]
_unused4: u3 = 0,
/// ARPE [7:7]
/// Auto-reload preload enable
ARPE: u1 = 0,
/// CKD [8:9]
/// Clock division
CKD: u2 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// CCPC [0:0]
/// Capture/compare preloaded
CCPC: u1 = 0,
/// unused [1:1]
_unused1: u1 = 0,
/// CCUS [2:2]
/// Capture/compare control update
CCUS: u1 = 0,
/// CCDS [3:3]
/// Capture/compare DMA
CCDS: u1 = 0,
/// unused [4:7]
_unused4: u4 = 0,
/// OIS1 [8:8]
/// Output Idle state 1
OIS1: u1 = 0,
/// OIS1N [9:9]
/// Output Idle state 1
OIS1N: u1 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// DIER
const DIER_val = packed struct {
/// UIE [0:0]
/// Update interrupt enable
UIE: u1 = 0,
/// CC1IE [1:1]
/// Capture/Compare 1 interrupt
CC1IE: u1 = 0,
/// unused [2:4]
_unused2: u3 = 0,
/// COMIE [5:5]
/// COM interrupt enable
COMIE: u1 = 0,
/// TIE [6:6]
/// Trigger interrupt enable
TIE: u1 = 0,
/// BIE [7:7]
/// Break interrupt enable
BIE: u1 = 0,
/// UDE [8:8]
/// Update DMA request enable
UDE: u1 = 0,
/// CC1DE [9:9]
/// Capture/Compare 1 DMA request
CC1DE: u1 = 0,
/// unused [10:13]
_unused10: u4 = 0,
/// TDE [14:14]
/// Trigger DMA request enable
TDE: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA/Interrupt enable register
pub const DIER = Register(DIER_val).init(base_address + 0xc);

/// SR
const SR_val = packed struct {
/// UIF [0:0]
/// Update interrupt flag
UIF: u1 = 0,
/// CC1IF [1:1]
/// Capture/compare 1 interrupt
CC1IF: u1 = 0,
/// unused [2:4]
_unused2: u3 = 0,
/// COMIF [5:5]
/// COM interrupt flag
COMIF: u1 = 0,
/// TIF [6:6]
/// Trigger interrupt flag
TIF: u1 = 0,
/// BIF [7:7]
/// Break interrupt flag
BIF: u1 = 0,
/// unused [8:8]
_unused8: u1 = 0,
/// CC1OF [9:9]
/// Capture/Compare 1 overcapture
CC1OF: u1 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x10);

/// EGR
const EGR_val = packed struct {
/// UG [0:0]
/// Update generation
UG: u1 = 0,
/// CC1G [1:1]
/// Capture/compare 1
CC1G: u1 = 0,
/// unused [2:4]
_unused2: u3 = 0,
/// COMG [5:5]
/// Capture/Compare control update
COMG: u1 = 0,
/// TG [6:6]
/// Trigger generation
TG: u1 = 0,
/// BG [7:7]
/// Break generation
BG: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// event generation register
pub const EGR = Register(EGR_val).init(base_address + 0x14);

/// CCMR1_Output
const CCMR1_Output_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// OC1FE [2:2]
/// Output Compare 1 fast
OC1FE: u1 = 0,
/// OC1PE [3:3]
/// Output Compare 1 preload
OC1PE: u1 = 0,
/// OC1M [4:6]
/// Output Compare 1 mode
OC1M: u3 = 0,
/// unused [7:31]
_unused7: u1 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register (output
pub const CCMR1_Output = Register(CCMR1_Output_val).init(base_address + 0x18);

/// CCMR1_Input
const CCMR1_Input_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// IC1PSC [2:3]
/// Input capture 1 prescaler
IC1PSC: u2 = 0,
/// IC1F [4:7]
/// Input capture 1 filter
IC1F: u4 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 1 (input
pub const CCMR1_Input = Register(CCMR1_Input_val).init(base_address + 0x18);

/// CCER
const CCER_val = packed struct {
/// CC1E [0:0]
/// Capture/Compare 1 output
CC1E: u1 = 0,
/// CC1P [1:1]
/// Capture/Compare 1 output
CC1P: u1 = 0,
/// CC1NE [2:2]
/// Capture/Compare 1 complementary output
CC1NE: u1 = 0,
/// CC1NP [3:3]
/// Capture/Compare 1 output
CC1NP: u1 = 0,
/// unused [4:31]
_unused4: u4 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare enable
pub const CCER = Register(CCER_val).init(base_address + 0x20);

/// CNT
const CNT_val = packed struct {
/// CNT [0:15]
/// counter value
CNT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// counter
pub const CNT = Register(CNT_val).init(base_address + 0x24);

/// PSC
const PSC_val = packed struct {
/// PSC [0:15]
/// Prescaler value
PSC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// prescaler
pub const PSC = Register(PSC_val).init(base_address + 0x28);

/// ARR
const ARR_val = packed struct {
/// ARR [0:15]
/// Auto-reload value
ARR: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// auto-reload register
pub const ARR = Register(ARR_val).init(base_address + 0x2c);

/// RCR
const RCR_val = packed struct {
/// REP [0:7]
/// Repetition counter value
REP: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// repetition counter register
pub const RCR = Register(RCR_val).init(base_address + 0x30);

/// CCR1
const CCR1_val = packed struct {
/// CCR1 [0:15]
/// Capture/Compare 1 value
CCR1: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare register 1
pub const CCR1 = Register(CCR1_val).init(base_address + 0x34);

/// BDTR
const BDTR_val = packed struct {
/// DTG [0:7]
/// Dead-time generator setup
DTG: u8 = 0,
/// LOCK [8:9]
/// Lock configuration
LOCK: u2 = 0,
/// OSSI [10:10]
/// Off-state selection for Idle
OSSI: u1 = 0,
/// OSSR [11:11]
/// Off-state selection for Run
OSSR: u1 = 0,
/// BKE [12:12]
/// Break enable
BKE: u1 = 0,
/// BKP [13:13]
/// Break polarity
BKP: u1 = 0,
/// AOE [14:14]
/// Automatic output enable
AOE: u1 = 0,
/// MOE [15:15]
/// Main output enable
MOE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// break and dead-time register
pub const BDTR = Register(BDTR_val).init(base_address + 0x44);

/// DCR
const DCR_val = packed struct {
/// DBA [0:4]
/// DMA base address
DBA: u5 = 0,
/// unused [5:7]
_unused5: u3 = 0,
/// DBL [8:12]
/// DMA burst length
DBL: u5 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA control register
pub const DCR = Register(DCR_val).init(base_address + 0x48);

/// DMAR
const DMAR_val = packed struct {
/// DMAB [0:15]
/// DMA register for burst
DMAB: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA address for full transfer
pub const DMAR = Register(DMAR_val).init(base_address + 0x4c);
};

/// General-purpose-timers
pub const TIM17 = struct {

const base_address = 0x40014800;
/// CR1
const CR1_val = packed struct {
/// CEN [0:0]
/// Counter enable
CEN: u1 = 0,
/// UDIS [1:1]
/// Update disable
UDIS: u1 = 0,
/// URS [2:2]
/// Update request source
URS: u1 = 0,
/// OPM [3:3]
/// One-pulse mode
OPM: u1 = 0,
/// unused [4:6]
_unused4: u3 = 0,
/// ARPE [7:7]
/// Auto-reload preload enable
ARPE: u1 = 0,
/// CKD [8:9]
/// Clock division
CKD: u2 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 1
pub const CR1 = Register(CR1_val).init(base_address + 0x0);

/// CR2
const CR2_val = packed struct {
/// CCPC [0:0]
/// Capture/compare preloaded
CCPC: u1 = 0,
/// unused [1:1]
_unused1: u1 = 0,
/// CCUS [2:2]
/// Capture/compare control update
CCUS: u1 = 0,
/// CCDS [3:3]
/// Capture/compare DMA
CCDS: u1 = 0,
/// unused [4:7]
_unused4: u4 = 0,
/// OIS1 [8:8]
/// Output Idle state 1
OIS1: u1 = 0,
/// OIS1N [9:9]
/// Output Idle state 1
OIS1N: u1 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register 2
pub const CR2 = Register(CR2_val).init(base_address + 0x4);

/// DIER
const DIER_val = packed struct {
/// UIE [0:0]
/// Update interrupt enable
UIE: u1 = 0,
/// CC1IE [1:1]
/// Capture/Compare 1 interrupt
CC1IE: u1 = 0,
/// unused [2:4]
_unused2: u3 = 0,
/// COMIE [5:5]
/// COM interrupt enable
COMIE: u1 = 0,
/// TIE [6:6]
/// Trigger interrupt enable
TIE: u1 = 0,
/// BIE [7:7]
/// Break interrupt enable
BIE: u1 = 0,
/// UDE [8:8]
/// Update DMA request enable
UDE: u1 = 0,
/// CC1DE [9:9]
/// Capture/Compare 1 DMA request
CC1DE: u1 = 0,
/// unused [10:13]
_unused10: u4 = 0,
/// TDE [14:14]
/// Trigger DMA request enable
TDE: u1 = 0,
/// unused [15:31]
_unused15: u1 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA/Interrupt enable register
pub const DIER = Register(DIER_val).init(base_address + 0xc);

/// SR
const SR_val = packed struct {
/// UIF [0:0]
/// Update interrupt flag
UIF: u1 = 0,
/// CC1IF [1:1]
/// Capture/compare 1 interrupt
CC1IF: u1 = 0,
/// unused [2:4]
_unused2: u3 = 0,
/// COMIF [5:5]
/// COM interrupt flag
COMIF: u1 = 0,
/// TIF [6:6]
/// Trigger interrupt flag
TIF: u1 = 0,
/// BIF [7:7]
/// Break interrupt flag
BIF: u1 = 0,
/// unused [8:8]
_unused8: u1 = 0,
/// CC1OF [9:9]
/// Capture/Compare 1 overcapture
CC1OF: u1 = 0,
/// unused [10:31]
_unused10: u6 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// status register
pub const SR = Register(SR_val).init(base_address + 0x10);

/// EGR
const EGR_val = packed struct {
/// UG [0:0]
/// Update generation
UG: u1 = 0,
/// CC1G [1:1]
/// Capture/compare 1
CC1G: u1 = 0,
/// unused [2:4]
_unused2: u3 = 0,
/// COMG [5:5]
/// Capture/Compare control update
COMG: u1 = 0,
/// TG [6:6]
/// Trigger generation
TG: u1 = 0,
/// BG [7:7]
/// Break generation
BG: u1 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// event generation register
pub const EGR = Register(EGR_val).init(base_address + 0x14);

/// CCMR1_Output
const CCMR1_Output_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// OC1FE [2:2]
/// Output Compare 1 fast
OC1FE: u1 = 0,
/// OC1PE [3:3]
/// Output Compare 1 preload
OC1PE: u1 = 0,
/// OC1M [4:6]
/// Output Compare 1 mode
OC1M: u3 = 0,
/// unused [7:31]
_unused7: u1 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register (output
pub const CCMR1_Output = Register(CCMR1_Output_val).init(base_address + 0x18);

/// CCMR1_Input
const CCMR1_Input_val = packed struct {
/// CC1S [0:1]
/// Capture/Compare 1
CC1S: u2 = 0,
/// IC1PSC [2:3]
/// Input capture 1 prescaler
IC1PSC: u2 = 0,
/// IC1F [4:7]
/// Input capture 1 filter
IC1F: u4 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare mode register 1 (input
pub const CCMR1_Input = Register(CCMR1_Input_val).init(base_address + 0x18);

/// CCER
const CCER_val = packed struct {
/// CC1E [0:0]
/// Capture/Compare 1 output
CC1E: u1 = 0,
/// CC1P [1:1]
/// Capture/Compare 1 output
CC1P: u1 = 0,
/// CC1NE [2:2]
/// Capture/Compare 1 complementary output
CC1NE: u1 = 0,
/// CC1NP [3:3]
/// Capture/Compare 1 output
CC1NP: u1 = 0,
/// unused [4:31]
_unused4: u4 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare enable
pub const CCER = Register(CCER_val).init(base_address + 0x20);

/// CNT
const CNT_val = packed struct {
/// CNT [0:15]
/// counter value
CNT: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// counter
pub const CNT = Register(CNT_val).init(base_address + 0x24);

/// PSC
const PSC_val = packed struct {
/// PSC [0:15]
/// Prescaler value
PSC: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// prescaler
pub const PSC = Register(PSC_val).init(base_address + 0x28);

/// ARR
const ARR_val = packed struct {
/// ARR [0:15]
/// Auto-reload value
ARR: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// auto-reload register
pub const ARR = Register(ARR_val).init(base_address + 0x2c);

/// RCR
const RCR_val = packed struct {
/// REP [0:7]
/// Repetition counter value
REP: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// repetition counter register
pub const RCR = Register(RCR_val).init(base_address + 0x30);

/// CCR1
const CCR1_val = packed struct {
/// CCR1 [0:15]
/// Capture/Compare 1 value
CCR1: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// capture/compare register 1
pub const CCR1 = Register(CCR1_val).init(base_address + 0x34);

/// BDTR
const BDTR_val = packed struct {
/// DTG [0:7]
/// Dead-time generator setup
DTG: u8 = 0,
/// LOCK [8:9]
/// Lock configuration
LOCK: u2 = 0,
/// OSSI [10:10]
/// Off-state selection for Idle
OSSI: u1 = 0,
/// OSSR [11:11]
/// Off-state selection for Run
OSSR: u1 = 0,
/// BKE [12:12]
/// Break enable
BKE: u1 = 0,
/// BKP [13:13]
/// Break polarity
BKP: u1 = 0,
/// AOE [14:14]
/// Automatic output enable
AOE: u1 = 0,
/// MOE [15:15]
/// Main output enable
MOE: u1 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// break and dead-time register
pub const BDTR = Register(BDTR_val).init(base_address + 0x44);

/// DCR
const DCR_val = packed struct {
/// DBA [0:4]
/// DMA base address
DBA: u5 = 0,
/// unused [5:7]
_unused5: u3 = 0,
/// DBL [8:12]
/// DMA burst length
DBL: u5 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA control register
pub const DCR = Register(DCR_val).init(base_address + 0x48);

/// DMAR
const DMAR_val = packed struct {
/// DMAB [0:15]
/// DMA register for burst
DMAB: u16 = 0,
/// unused [16:31]
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// DMA address for full transfer
pub const DMAR = Register(DMAR_val).init(base_address + 0x4c);
};

/// Touch sensing controller
pub const TSC = struct {

const base_address = 0x40024000;
/// CR
const CR_val = packed struct {
/// TSCE [0:0]
/// Touch sensing controller
TSCE: u1 = 0,
/// START [1:1]
/// Start a new acquisition
START: u1 = 0,
/// AM [2:2]
/// Acquisition mode
AM: u1 = 0,
/// SYNCPOL [3:3]
/// Synchronization pin
SYNCPOL: u1 = 0,
/// IODEF [4:4]
/// I/O Default mode
IODEF: u1 = 0,
/// MCV [5:7]
/// Max count value
MCV: u3 = 0,
/// unused [8:11]
_unused8: u4 = 0,
/// PGPSC [12:14]
/// pulse generator prescaler
PGPSC: u3 = 0,
/// SSPSC [15:15]
/// Spread spectrum prescaler
SSPSC: u1 = 0,
/// SSE [16:16]
/// Spread spectrum enable
SSE: u1 = 0,
/// SSD [17:23]
/// Spread spectrum deviation
SSD: u7 = 0,
/// CTPL [24:27]
/// Charge transfer pulse low
CTPL: u4 = 0,
/// CTPH [28:31]
/// Charge transfer pulse high
CTPH: u4 = 0,
};
/// control register
pub const CR = Register(CR_val).init(base_address + 0x0);

/// IER
const IER_val = packed struct {
/// EOAIE [0:0]
/// End of acquisition interrupt
EOAIE: u1 = 0,
/// MCEIE [1:1]
/// Max count error interrupt
MCEIE: u1 = 0,
/// unused [2:31]
_unused2: u6 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// interrupt enable register
pub const IER = Register(IER_val).init(base_address + 0x4);

/// ICR
const ICR_val = packed struct {
/// EOAIC [0:0]
/// End of acquisition interrupt
EOAIC: u1 = 0,
/// MCEIC [1:1]
/// Max count error interrupt
MCEIC: u1 = 0,
/// unused [2:31]
_unused2: u6 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// interrupt clear register
pub const ICR = Register(ICR_val).init(base_address + 0x8);

/// ISR
const ISR_val = packed struct {
/// EOAF [0:0]
/// End of acquisition flag
EOAF: u1 = 0,
/// MCEF [1:1]
/// Max count error flag
MCEF: u1 = 0,
/// unused [2:31]
_unused2: u6 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// interrupt status register
pub const ISR = Register(ISR_val).init(base_address + 0xc);

/// IOHCR
const IOHCR_val = packed struct {
/// G1_IO1 [0:0]
/// G1_IO1 Schmitt trigger hysteresis
G1_IO1: u1 = 1,
/// G1_IO2 [1:1]
/// G1_IO2 Schmitt trigger hysteresis
G1_IO2: u1 = 1,
/// G1_IO3 [2:2]
/// G1_IO3 Schmitt trigger hysteresis
G1_IO3: u1 = 1,
/// G1_IO4 [3:3]
/// G1_IO4 Schmitt trigger hysteresis
G1_IO4: u1 = 1,
/// G2_IO1 [4:4]
/// G2_IO1 Schmitt trigger hysteresis
G2_IO1: u1 = 1,
/// G2_IO2 [5:5]
/// G2_IO2 Schmitt trigger hysteresis
G2_IO2: u1 = 1,
/// G2_IO3 [6:6]
/// G2_IO3 Schmitt trigger hysteresis
G2_IO3: u1 = 1,
/// G2_IO4 [7:7]
/// G2_IO4 Schmitt trigger hysteresis
G2_IO4: u1 = 1,
/// G3_IO1 [8:8]
/// G3_IO1 Schmitt trigger hysteresis
G3_IO1: u1 = 1,
/// G3_IO2 [9:9]
/// G3_IO2 Schmitt trigger hysteresis
G3_IO2: u1 = 1,
/// G3_IO3 [10:10]
/// G3_IO3 Schmitt trigger hysteresis
G3_IO3: u1 = 1,
/// G3_IO4 [11:11]
/// G3_IO4 Schmitt trigger hysteresis
G3_IO4: u1 = 1,
/// G4_IO1 [12:12]
/// G4_IO1 Schmitt trigger hysteresis
G4_IO1: u1 = 1,
/// G4_IO2 [13:13]
/// G4_IO2 Schmitt trigger hysteresis
G4_IO2: u1 = 1,
/// G4_IO3 [14:14]
/// G4_IO3 Schmitt trigger hysteresis
G4_IO3: u1 = 1,
/// G4_IO4 [15:15]
/// G4_IO4 Schmitt trigger hysteresis
G4_IO4: u1 = 1,
/// G5_IO1 [16:16]
/// G5_IO1 Schmitt trigger hysteresis
G5_IO1: u1 = 1,
/// G5_IO2 [17:17]
/// G5_IO2 Schmitt trigger hysteresis
G5_IO2: u1 = 1,
/// G5_IO3 [18:18]
/// G5_IO3 Schmitt trigger hysteresis
G5_IO3: u1 = 1,
/// G5_IO4 [19:19]
/// G5_IO4 Schmitt trigger hysteresis
G5_IO4: u1 = 1,
/// G6_IO1 [20:20]
/// G6_IO1 Schmitt trigger hysteresis
G6_IO1: u1 = 1,
/// G6_IO2 [21:21]
/// G6_IO2 Schmitt trigger hysteresis
G6_IO2: u1 = 1,
/// G6_IO3 [22:22]
/// G6_IO3 Schmitt trigger hysteresis
G6_IO3: u1 = 1,
/// G6_IO4 [23:23]
/// G6_IO4 Schmitt trigger hysteresis
G6_IO4: u1 = 1,
/// unused [24:31]
_unused24: u8 = 255,
};
/// I/O hysteresis control
pub const IOHCR = Register(IOHCR_val).init(base_address + 0x10);

/// IOASCR
const IOASCR_val = packed struct {
/// G1_IO1 [0:0]
/// G1_IO1 analog switch
G1_IO1: u1 = 0,
/// G1_IO2 [1:1]
/// G1_IO2 analog switch
G1_IO2: u1 = 0,
/// G1_IO3 [2:2]
/// G1_IO3 analog switch
G1_IO3: u1 = 0,
/// G1_IO4 [3:3]
/// G1_IO4 analog switch
G1_IO4: u1 = 0,
/// G2_IO1 [4:4]
/// G2_IO1 analog switch
G2_IO1: u1 = 0,
/// G2_IO2 [5:5]
/// G2_IO2 analog switch
G2_IO2: u1 = 0,
/// G2_IO3 [6:6]
/// G2_IO3 analog switch
G2_IO3: u1 = 0,
/// G2_IO4 [7:7]
/// G2_IO4 analog switch
G2_IO4: u1 = 0,
/// G3_IO1 [8:8]
/// G3_IO1 analog switch
G3_IO1: u1 = 0,
/// G3_IO2 [9:9]
/// G3_IO2 analog switch
G3_IO2: u1 = 0,
/// G3_IO3 [10:10]
/// G3_IO3 analog switch
G3_IO3: u1 = 0,
/// G3_IO4 [11:11]
/// G3_IO4 analog switch
G3_IO4: u1 = 0,
/// G4_IO1 [12:12]
/// G4_IO1 analog switch
G4_IO1: u1 = 0,
/// G4_IO2 [13:13]
/// G4_IO2 analog switch
G4_IO2: u1 = 0,
/// G4_IO3 [14:14]
/// G4_IO3 analog switch
G4_IO3: u1 = 0,
/// G4_IO4 [15:15]
/// G4_IO4 analog switch
G4_IO4: u1 = 0,
/// G5_IO1 [16:16]
/// G5_IO1 analog switch
G5_IO1: u1 = 0,
/// G5_IO2 [17:17]
/// G5_IO2 analog switch
G5_IO2: u1 = 0,
/// G5_IO3 [18:18]
/// G5_IO3 analog switch
G5_IO3: u1 = 0,
/// G5_IO4 [19:19]
/// G5_IO4 analog switch
G5_IO4: u1 = 0,
/// G6_IO1 [20:20]
/// G6_IO1 analog switch
G6_IO1: u1 = 0,
/// G6_IO2 [21:21]
/// G6_IO2 analog switch
G6_IO2: u1 = 0,
/// G6_IO3 [22:22]
/// G6_IO3 analog switch
G6_IO3: u1 = 0,
/// G6_IO4 [23:23]
/// G6_IO4 analog switch
G6_IO4: u1 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// I/O analog switch control
pub const IOASCR = Register(IOASCR_val).init(base_address + 0x18);

/// IOSCR
const IOSCR_val = packed struct {
/// G1_IO1 [0:0]
/// G1_IO1 sampling mode
G1_IO1: u1 = 0,
/// G1_IO2 [1:1]
/// G1_IO2 sampling mode
G1_IO2: u1 = 0,
/// G1_IO3 [2:2]
/// G1_IO3 sampling mode
G1_IO3: u1 = 0,
/// G1_IO4 [3:3]
/// G1_IO4 sampling mode
G1_IO4: u1 = 0,
/// G2_IO1 [4:4]
/// G2_IO1 sampling mode
G2_IO1: u1 = 0,
/// G2_IO2 [5:5]
/// G2_IO2 sampling mode
G2_IO2: u1 = 0,
/// G2_IO3 [6:6]
/// G2_IO3 sampling mode
G2_IO3: u1 = 0,
/// G2_IO4 [7:7]
/// G2_IO4 sampling mode
G2_IO4: u1 = 0,
/// G3_IO1 [8:8]
/// G3_IO1 sampling mode
G3_IO1: u1 = 0,
/// G3_IO2 [9:9]
/// G3_IO2 sampling mode
G3_IO2: u1 = 0,
/// G3_IO3 [10:10]
/// G3_IO3 sampling mode
G3_IO3: u1 = 0,
/// G3_IO4 [11:11]
/// G3_IO4 sampling mode
G3_IO4: u1 = 0,
/// G4_IO1 [12:12]
/// G4_IO1 sampling mode
G4_IO1: u1 = 0,
/// G4_IO2 [13:13]
/// G4_IO2 sampling mode
G4_IO2: u1 = 0,
/// G4_IO3 [14:14]
/// G4_IO3 sampling mode
G4_IO3: u1 = 0,
/// G4_IO4 [15:15]
/// G4_IO4 sampling mode
G4_IO4: u1 = 0,
/// G5_IO1 [16:16]
/// G5_IO1 sampling mode
G5_IO1: u1 = 0,
/// G5_IO2 [17:17]
/// G5_IO2 sampling mode
G5_IO2: u1 = 0,
/// G5_IO3 [18:18]
/// G5_IO3 sampling mode
G5_IO3: u1 = 0,
/// G5_IO4 [19:19]
/// G5_IO4 sampling mode
G5_IO4: u1 = 0,
/// G6_IO1 [20:20]
/// G6_IO1 sampling mode
G6_IO1: u1 = 0,
/// G6_IO2 [21:21]
/// G6_IO2 sampling mode
G6_IO2: u1 = 0,
/// G6_IO3 [22:22]
/// G6_IO3 sampling mode
G6_IO3: u1 = 0,
/// G6_IO4 [23:23]
/// G6_IO4 sampling mode
G6_IO4: u1 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// I/O sampling control register
pub const IOSCR = Register(IOSCR_val).init(base_address + 0x20);

/// IOCCR
const IOCCR_val = packed struct {
/// G1_IO1 [0:0]
/// G1_IO1 channel mode
G1_IO1: u1 = 0,
/// G1_IO2 [1:1]
/// G1_IO2 channel mode
G1_IO2: u1 = 0,
/// G1_IO3 [2:2]
/// G1_IO3 channel mode
G1_IO3: u1 = 0,
/// G1_IO4 [3:3]
/// G1_IO4 channel mode
G1_IO4: u1 = 0,
/// G2_IO1 [4:4]
/// G2_IO1 channel mode
G2_IO1: u1 = 0,
/// G2_IO2 [5:5]
/// G2_IO2 channel mode
G2_IO2: u1 = 0,
/// G2_IO3 [6:6]
/// G2_IO3 channel mode
G2_IO3: u1 = 0,
/// G2_IO4 [7:7]
/// G2_IO4 channel mode
G2_IO4: u1 = 0,
/// G3_IO1 [8:8]
/// G3_IO1 channel mode
G3_IO1: u1 = 0,
/// G3_IO2 [9:9]
/// G3_IO2 channel mode
G3_IO2: u1 = 0,
/// G3_IO3 [10:10]
/// G3_IO3 channel mode
G3_IO3: u1 = 0,
/// G3_IO4 [11:11]
/// G3_IO4 channel mode
G3_IO4: u1 = 0,
/// G4_IO1 [12:12]
/// G4_IO1 channel mode
G4_IO1: u1 = 0,
/// G4_IO2 [13:13]
/// G4_IO2 channel mode
G4_IO2: u1 = 0,
/// G4_IO3 [14:14]
/// G4_IO3 channel mode
G4_IO3: u1 = 0,
/// G4_IO4 [15:15]
/// G4_IO4 channel mode
G4_IO4: u1 = 0,
/// G5_IO1 [16:16]
/// G5_IO1 channel mode
G5_IO1: u1 = 0,
/// G5_IO2 [17:17]
/// G5_IO2 channel mode
G5_IO2: u1 = 0,
/// G5_IO3 [18:18]
/// G5_IO3 channel mode
G5_IO3: u1 = 0,
/// G5_IO4 [19:19]
/// G5_IO4 channel mode
G5_IO4: u1 = 0,
/// G6_IO1 [20:20]
/// G6_IO1 channel mode
G6_IO1: u1 = 0,
/// G6_IO2 [21:21]
/// G6_IO2 channel mode
G6_IO2: u1 = 0,
/// G6_IO3 [22:22]
/// G6_IO3 channel mode
G6_IO3: u1 = 0,
/// G6_IO4 [23:23]
/// G6_IO4 channel mode
G6_IO4: u1 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// I/O channel control register
pub const IOCCR = Register(IOCCR_val).init(base_address + 0x28);

/// IOGCSR
const IOGCSR_val = packed struct {
/// G1E [0:0]
/// Analog I/O group x enable
G1E: u1 = 0,
/// G2E [1:1]
/// Analog I/O group x enable
G2E: u1 = 0,
/// G3E [2:2]
/// Analog I/O group x enable
G3E: u1 = 0,
/// G4E [3:3]
/// Analog I/O group x enable
G4E: u1 = 0,
/// G5E [4:4]
/// Analog I/O group x enable
G5E: u1 = 0,
/// G6E [5:5]
/// Analog I/O group x enable
G6E: u1 = 0,
/// G7E [6:6]
/// Analog I/O group x enable
G7E: u1 = 0,
/// G8E [7:7]
/// Analog I/O group x enable
G8E: u1 = 0,
/// unused [8:15]
_unused8: u8 = 0,
/// G1S [16:16]
/// Analog I/O group x status
G1S: u1 = 0,
/// G2S [17:17]
/// Analog I/O group x status
G2S: u1 = 0,
/// G3S [18:18]
/// Analog I/O group x status
G3S: u1 = 0,
/// G4S [19:19]
/// Analog I/O group x status
G4S: u1 = 0,
/// G5S [20:20]
/// Analog I/O group x status
G5S: u1 = 0,
/// G6S [21:21]
/// Analog I/O group x status
G6S: u1 = 0,
/// G7S [22:22]
/// Analog I/O group x status
G7S: u1 = 0,
/// G8S [23:23]
/// Analog I/O group x status
G8S: u1 = 0,
/// unused [24:31]
_unused24: u8 = 0,
};
/// I/O group control status
pub const IOGCSR = Register(IOGCSR_val).init(base_address + 0x30);

/// IOG1CR
const IOG1CR_val = packed struct {
/// CNT [0:13]
/// Counter value
CNT: u14 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// I/O group x counter register
pub const IOG1CR = Register(IOG1CR_val).init(base_address + 0x34);

/// IOG2CR
const IOG2CR_val = packed struct {
/// CNT [0:13]
/// Counter value
CNT: u14 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// I/O group x counter register
pub const IOG2CR = Register(IOG2CR_val).init(base_address + 0x38);

/// IOG3CR
const IOG3CR_val = packed struct {
/// CNT [0:13]
/// Counter value
CNT: u14 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// I/O group x counter register
pub const IOG3CR = Register(IOG3CR_val).init(base_address + 0x3c);

/// IOG4CR
const IOG4CR_val = packed struct {
/// CNT [0:13]
/// Counter value
CNT: u14 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// I/O group x counter register
pub const IOG4CR = Register(IOG4CR_val).init(base_address + 0x40);

/// IOG5CR
const IOG5CR_val = packed struct {
/// CNT [0:13]
/// Counter value
CNT: u14 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// I/O group x counter register
pub const IOG5CR = Register(IOG5CR_val).init(base_address + 0x44);

/// IOG6CR
const IOG6CR_val = packed struct {
/// CNT [0:13]
/// Counter value
CNT: u14 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// I/O group x counter register
pub const IOG6CR = Register(IOG6CR_val).init(base_address + 0x48);
};

/// HDMI-CEC controller
pub const CEC = struct {

const base_address = 0x40007800;
/// CR
const CR_val = packed struct {
/// CECEN [0:0]
/// CEC Enable
CECEN: u1 = 0,
/// TXSOM [1:1]
/// Tx start of message
TXSOM: u1 = 0,
/// TXEOM [2:2]
/// Tx End Of Message
TXEOM: u1 = 0,
/// unused [3:31]
_unused3: u5 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// control register
pub const CR = Register(CR_val).init(base_address + 0x0);

/// CFGR
const CFGR_val = packed struct {
/// OAR [0:3]
/// Own Address
OAR: u4 = 0,
/// LSTN [4:4]
/// Listen mode
LSTN: u1 = 0,
/// SFT [5:7]
/// Signal Free Time
SFT: u3 = 0,
/// RXTOL [8:8]
/// Rx-Tolerance
RXTOL: u1 = 0,
/// BRESTP [9:9]
/// Rx-stop on bit rising
BRESTP: u1 = 0,
/// BREGEN [10:10]
/// Generate error-bit on bit rising
BREGEN: u1 = 0,
/// LBPEGEN [11:11]
/// Generate Error-Bit on Long Bit Period
LBPEGEN: u1 = 0,
/// unused [12:31]
_unused12: u4 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// configuration register
pub const CFGR = Register(CFGR_val).init(base_address + 0x4);

/// TXDR
const TXDR_val = packed struct {
/// TXD [0:7]
/// Tx Data register
TXD: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Tx data register
pub const TXDR = Register(TXDR_val).init(base_address + 0x8);

/// RXDR
const RXDR_val = packed struct {
/// RXDR [0:7]
/// CEC Rx Data Register
RXDR: u8 = 0,
/// unused [8:31]
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Rx Data Register
pub const RXDR = Register(RXDR_val).init(base_address + 0xc);

/// ISR
const ISR_val = packed struct {
/// RXBR [0:0]
/// Rx-Byte Received
RXBR: u1 = 0,
/// RXEND [1:1]
/// End Of Reception
RXEND: u1 = 0,
/// RXOVR [2:2]
/// Rx-Overrun
RXOVR: u1 = 0,
/// BRE [3:3]
/// Rx-Bit rising error
BRE: u1 = 0,
/// SBPE [4:4]
/// Rx-Short Bit period error
SBPE: u1 = 0,
/// LBPE [5:5]
/// Rx-Long Bit Period Error
LBPE: u1 = 0,
/// RXACKE [6:6]
/// Rx-Missing Acknowledge
RXACKE: u1 = 0,
/// ARBLST [7:7]
/// Arbitration Lost
ARBLST: u1 = 0,
/// TXBR [8:8]
/// Tx-Byte Request
TXBR: u1 = 0,
/// TXEND [9:9]
/// End of Transmission
TXEND: u1 = 0,
/// TXUDR [10:10]
/// Tx-Buffer Underrun
TXUDR: u1 = 0,
/// TXERR [11:11]
/// Tx-Error
TXERR: u1 = 0,
/// TXACKE [12:12]
/// Tx-Missing acknowledge
TXACKE: u1 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Interrupt and Status Register
pub const ISR = Register(ISR_val).init(base_address + 0x10);

/// IER
const IER_val = packed struct {
/// RXBRIE [0:0]
/// Rx-Byte Received Interrupt
RXBRIE: u1 = 0,
/// RXENDIE [1:1]
/// End Of Reception Interrupt
RXENDIE: u1 = 0,
/// RXOVRIE [2:2]
/// Rx-Buffer Overrun Interrupt
RXOVRIE: u1 = 0,
/// BREIE [3:3]
/// Bit Rising Error Interrupt
BREIE: u1 = 0,
/// SBPEIE [4:4]
/// Short Bit Period Error Interrupt
SBPEIE: u1 = 0,
/// LBPEIE [5:5]
/// Long Bit Period Error Interrupt
LBPEIE: u1 = 0,
/// RXACKIE [6:6]
/// Rx-Missing Acknowledge Error Interrupt
RXACKIE: u1 = 0,
/// ARBLSTIE [7:7]
/// Arbitration Lost Interrupt
ARBLSTIE: u1 = 0,
/// TXBRIE [8:8]
/// Tx-Byte Request Interrupt
TXBRIE: u1 = 0,
/// TXENDIE [9:9]
/// Tx-End of message interrupt
TXENDIE: u1 = 0,
/// TXUDRIE [10:10]
/// Tx-Underrun interrupt
TXUDRIE: u1 = 0,
/// TXERRIE [11:11]
/// Tx-Error Interrupt Enable
TXERRIE: u1 = 0,
/// TXACKIE [12:12]
/// Tx-Missing Acknowledge Error Interrupt
TXACKIE: u1 = 0,
/// unused [13:31]
_unused13: u3 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// interrupt enable register
pub const IER = Register(IER_val).init(base_address + 0x14);
};

/// Flash
pub const Flash = struct {

const base_address = 0x40022000;
/// ACR
const ACR_val = packed struct {
/// LATENCY [0:2]
/// LATENCY
LATENCY: u3 = 0,
/// unused [3:3]
_unused3: u1 = 0,
/// PRFTBE [4:4]
/// PRFTBE
PRFTBE: u1 = 1,
/// PRFTBS [5:5]
/// PRFTBS
PRFTBS: u1 = 1,
/// unused [6:31]
_unused6: u2 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Flash access control register
pub const ACR = Register(ACR_val).init(base_address + 0x0);

/// KEYR
const KEYR_val = packed struct {
/// FKEYR [0:31]
/// Flash Key
FKEYR: u32 = 0,
};
/// Flash key register
pub const KEYR = Register(KEYR_val).init(base_address + 0x4);

/// OPTKEYR
const OPTKEYR_val = packed struct {
/// OPTKEYR [0:31]
/// Option byte key
OPTKEYR: u32 = 0,
};
/// Flash option key register
pub const OPTKEYR = Register(OPTKEYR_val).init(base_address + 0x8);

/// SR
const SR_val = packed struct {
/// BSY [0:0]
/// Busy
BSY: u1 = 0,
/// unused [1:1]
_unused1: u1 = 0,
/// PGERR [2:2]
/// Programming error
PGERR: u1 = 0,
/// unused [3:3]
_unused3: u1 = 0,
/// WRPRT [4:4]
/// Write protection error
WRPRT: u1 = 0,
/// EOP [5:5]
/// End of operation
EOP: u1 = 0,
/// unused [6:31]
_unused6: u2 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Flash status register
pub const SR = Register(SR_val).init(base_address + 0xc);

/// CR
const CR_val = packed struct {
/// PG [0:0]
/// Programming
PG: u1 = 0,
/// PER [1:1]
/// Page erase
PER: u1 = 0,
/// MER [2:2]
/// Mass erase
MER: u1 = 0,
/// unused [3:3]
_unused3: u1 = 0,
/// OPTPG [4:4]
/// Option byte programming
OPTPG: u1 = 0,
/// OPTER [5:5]
/// Option byte erase
OPTER: u1 = 0,
/// STRT [6:6]
/// Start
STRT: u1 = 0,
/// LOCK [7:7]
/// Lock
LOCK: u1 = 1,
/// unused [8:8]
_unused8: u1 = 0,
/// OPTWRE [9:9]
/// Option bytes write enable
OPTWRE: u1 = 0,
/// ERRIE [10:10]
/// Error interrupt enable
ERRIE: u1 = 0,
/// unused [11:11]
_unused11: u1 = 0,
/// EOPIE [12:12]
/// End of operation interrupt
EOPIE: u1 = 0,
/// FORCE_OPTLOAD [13:13]
/// Force option byte loading
FORCE_OPTLOAD: u1 = 0,
/// unused [14:31]
_unused14: u2 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Flash control register
pub const CR = Register(CR_val).init(base_address + 0x10);

/// AR
const AR_val = packed struct {
/// FAR [0:31]
/// Flash address
FAR: u32 = 0,
};
/// Flash address register
pub const AR = Register(AR_val).init(base_address + 0x14);

/// OBR
const OBR_val = packed struct {
/// OPTERR [0:0]
/// Option byte error
OPTERR: u1 = 0,
/// LEVEL1_PROT [1:1]
/// Level 1 protection status
LEVEL1_PROT: u1 = 1,
/// LEVEL2_PROT [2:2]
/// Level 2 protection status
LEVEL2_PROT: u1 = 0,
/// unused [3:7]
_unused3: u5 = 30,
/// WDG_SW [8:8]
/// WDG_SW
WDG_SW: u1 = 1,
/// nRST_STOP [9:9]
/// nRST_STOP
nRST_STOP: u1 = 1,
/// nRST_STDBY [10:10]
/// nRST_STDBY
nRST_STDBY: u1 = 1,
/// unused [11:11]
_unused11: u1 = 1,
/// BOOT1 [12:12]
/// BOOT1
BOOT1: u1 = 1,
/// VDDA_MONITOR [13:13]
/// VDDA_MONITOR
VDDA_MONITOR: u1 = 1,
/// unused [14:15]
_unused14: u2 = 3,
/// Data0 [16:23]
/// Data0
Data0: u8 = 255,
/// Data1 [24:31]
/// Data1
Data1: u8 = 3,
};
/// Option byte register
pub const OBR = Register(OBR_val).init(base_address + 0x1c);

/// WRPR
const WRPR_val = packed struct {
/// WRP [0:15]
/// Write protect
WRP: u16 = 65535,
/// unused [16:31]
_unused16: u8 = 255,
_unused24: u8 = 255,
};
/// Write protection register
pub const WRPR = Register(WRPR_val).init(base_address + 0x20);
};

/// Debug support
pub const DBGMCU = struct {

const base_address = 0x40015800;
/// IDCODE
const IDCODE_val = packed struct {
/// DEV_ID [0:11]
/// Device Identifier
DEV_ID: u12 = 0,
/// DIV_ID [12:15]
/// Division Identifier
DIV_ID: u4 = 0,
/// REV_ID [16:31]
/// Revision Identifier
REV_ID: u16 = 0,
};
/// MCU Device ID Code Register
pub const IDCODE = Register(IDCODE_val).init(base_address + 0x0);

/// CR
const CR_val = packed struct {
/// unused [0:0]
_unused0: u1 = 0,
/// DBG_STOP [1:1]
/// Debug Stop Mode
DBG_STOP: u1 = 0,
/// DBG_STANDBY [2:2]
/// Debug Standby Mode
DBG_STANDBY: u1 = 0,
/// unused [3:31]
_unused3: u5 = 0,
_unused8: u8 = 0,
_unused16: u8 = 0,
_unused24: u8 = 0,
};
/// Debug MCU Configuration
pub const CR = Register(CR_val).init(base_address + 0x4);

/// APBLFZ
const APBLFZ_val = packed struct {
/// DBG_TIMER2_STOP [0:0]
/// Debug Timer 2 stopped when Core is
DBG_TIMER2_STOP: u1 = 0,
/// DBG_TIMER3_STOP [1:1]
/// Debug Timer 3 stopped when Core is
DBG_TIMER3_STOP: u1 = 0,
/// unused [2:3]
_unused2: u2 = 0,
/// DBG_TIMER6_STOP [4:4]
/// Debug Timer 6 stopped when Core is
DBG_TIMER6_STOP: u1 = 0,
/// unused [5:7]
_unused5: u3 = 0,
/// DBG_TIMER14_STOP [8:8]
/// Debug Timer 14 stopped when Core is
DBG_TIMER14_STOP: u1 = 0,
/// unused [9:9]
_unused9: u1 = 0,
/// DBG_RTC_STOP [10:10]
/// Debug RTC stopped when Core is
DBG_RTC_STOP: u1 = 0,
/// DBG_WWDG_STOP [11:11]
/// Debug Window Wachdog stopped when Core
DBG_WWDG_STOP: u1 = 0,
/// DBG_IWDG_STOP [12:12]
/// Debug Independent Wachdog stopped when
DBG_IWDG_STOP: u1 = 0,
/// unused [13:20]
_unused13: u3 = 0,
_unused16: u5 = 0,
/// I2C1_SMBUS_TIMEOUT [21:21]
/// SMBUS timeout mode stopped when Core is
I2C1_SMBUS_TIMEOUT: u1 = 0,
/// unused [22:31]
_unused22: u2 = 0,
_unused24: u8 = 0,
};
/// APB Low Freeze Register
pub const APBLFZ = Register(APBLFZ_val).init(base_address + 0x8);

/// APBHFZ
const APBHFZ_val = packed struct {
/// unused [0:10]
_unused0: u8 = 0,
_unused8: u3 = 0,
/// DBG_TIMER1_STOP [11:11]
/// Debug Timer 1 stopped when Core is
DBG_TIMER1_STOP: u1 = 0,
/// unused [12:15]
_unused12: u4 = 0,
/// DBG_TIMER15_STO [16:16]
/// Debug Timer 15 stopped when Core is
DBG_TIMER15_STO: u1 = 0,
/// DBG_TIMER16_STO [17:17]
/// Debug Timer 16 stopped when Core is
DBG_TIMER16_STO: u1 = 0,
/// DBG_TIMER17_STO [18:18]
/// Debug Timer 17 stopped when Core is
DBG_TIMER17_STO: u1 = 0,
/// unused [19:31]
_unused19: u5 = 0,
_unused24: u8 = 0,
};
/// APB High Freeze Register
pub const APBHFZ = Register(APBHFZ_val).init(base_address + 0xc);
};
pub const interrupts = struct {
pub const SPI2_IRQ = 26;
pub const FLASH_IRQ = 3;
pub const TIM17_IRQ = 22;
pub const TIM6_DAC_IRQ = 17;
pub const DMA_CH1_IRQ = 9;
pub const I2C1_IRQ = 23;
pub const USART1_IRQ = 27;
pub const EXTI2_3_IRQ = 6;
pub const RTC_IRQ = 2;
pub const TIM16_IRQ = 21;
pub const EXTI4_15_IRQ = 7;
pub const CEC_IRQ = 30;
pub const USART2_IRQ = 28;
pub const ADC_COMP_IRQ = 12;
pub const WWDG_IRQ = 0;
pub const TIM1_CC_IRQ = 14;
pub const EXTI0_1_IRQ = 5;
pub const TSC_IRQ = 8;
pub const SPI1_IRQ = 25;
pub const TIM3_IRQ = 16;
pub const TIM15_IRQ = 20;
pub const TIM14_IRQ = 19;
pub const PVD_IRQ = 1;
pub const RCC_IRQ = 4;
pub const I2C2_IRQ = 24;
pub const TIM1_BRK_UP_IRQ = 13;
pub const DMA_CH4_5_IRQ = 11;
pub const TIM2_IRQ = 15;
pub const DMA_CH2_3_IRQ = 10;
};
