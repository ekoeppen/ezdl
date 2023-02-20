const std = @import("std");

pub fn Nrf24(
    comptime spi: anytype,
    comptime cs: anytype,
    comptime ce: anytype,
    comptime irq: anytype,
) type {
    return struct {
        pub const Register = enum(u8) {
            CONFIG = 0x00,
            EN_AA = 0x01,
            EN_RXADDR = 0x02,
            SETUP_AW = 0x03,
            SETUP_RETR = 0x04,
            RF_CH = 0x05,
            RF_SETUP = 0x06,
            STATUS = 0x07,
            OBSERVE_TX = 0x08,
            RPD = 0x09,
            RX_ADDR_P0 = 0x0A,
            RX_ADDR_P1 = 0x0B,
            RX_ADDR_P2 = 0x0C,
            RX_ADDR_P3 = 0x0D,
            RX_ADDR_P4 = 0x0E,
            RX_ADDR_P5 = 0x0F,
            TX_ADDR = 0x10,
            RX_PW_P0 = 0x11,
            RX_PW_P1 = 0x12,
            RX_PW_P2 = 0x13,
            RX_PW_P3 = 0x14,
            RX_PW_P4 = 0x15,
            RX_PW_P5 = 0x16,
            FIFO_STATUS = 0x17,
            DYNPD = 0x1C,
            FEATURE = 0x1D,
        };

        pub const Command = enum(u8) {
            R_REGISTER = 0b0000_0000,
            W_REGISTER = 0b0010_0000,
            R_RX_PL_WID = 0b0110_0000,
            R_RX_PAYLOAD = 0b0110_0001,
            W_TX_PAYLOAD = 0b1010_0000,
            W_ACK_PAYLOAD = 0b1010_1000,
            W_TX_PAYLOAD_NOACK = 0b1011_0000,
            FLUSH_TX = 0b1110_0001,
            FLUSH_RX = 0b1110_0010,
            REUSE_TX_PL = 0b1110_0011,
            NOP = 0b1111_1111,
        };

        pub const CONFIG = packed struct {
            PRIM_RX: u1 = 0,
            PWR_UP: u1 = 0,
            CRCO: u1 = 0,
            EN_CRC: u1 = 0,
            MASK_MAX_RT: u1 = 0,
            MASK_TX_DS: u1 = 0,
            MASK_RX_DR: u1 = 0,
            _: u1 = 0,
        };

        pub const EN_AA = packed struct {
            ENAA_P0: u1 = 0,
            ENAA_P1: u1 = 0,
            ENAA_P2: u1 = 0,
            ENAA_P3: u1 = 0,
            ENAA_P4: u1 = 0,
            ENAA_P5: u1 = 0,
            _: u2 = 0,
        };

        pub const EN_RXADDR = packed struct {
            ERX_P0: u1 = 0,
            ERX_P1: u1 = 0,
            ERX_P2: u1 = 0,
            ERX_P3: u1 = 0,
            ERX_P4: u1 = 0,
            ERX_P5: u1 = 0,
            _: u2 = 0,
        };

        pub const AddressWidthType = enum(u2) {
            AW_3_Bytes = 1,
            AW_4_Bytes = 2,
            AW_5_Bytes = 3,
        };

        pub const SETUP_AW = packed struct {
            AW: AddressWidthType,
            _: u6 = 0,
        };

        pub const RF_SETUP = packed struct {
            _1: u1 = 0,
            RF_PWR: u2 = 0,
            RF_DR_HIGH: u1 = 0,
            PLL_LOCK: u1 = 0,
            RF_DR_LOW: u1 = 0,
            _6: u1 = 0,
            CONST_WAVE: u1 = 0,
        };

        pub const STATUS = packed struct {
            TX_FULL: u1 = 0,
            RX_P_NO: u3 = 0,
            MAX_RT: u1 = 0,
            TX_DS: u1 = 0,
            RX_DR: u1 = 0,
            _: u1 = 0,
        };

        pub const FIFO_STATUS = packed struct {
            RX_EMPTY: u1 = 0,
            RX_FULL: u1 = 0,
            _: u2 = 0,
            TX_EMPTY: u1 = 0,
            TX_FULL: u1 = 0,
            TX_REUSE: u1 = 0,
            _: u1 = 0,
        };

        pub const DYNPD = packed struct {
            DPL_P0: u1 = 0,
            DPL_P1: u1 = 0,
            DPL_P2: u1 = 0,
            DPL_P3: u1 = 0,
            DPL_P4: u1 = 0,
            DPL_P5: u1 = 0,
            _: u2 = 0,
        };

        pub const FEATURE = packed struct {
            EN_DYN_ACK: u1 = 0,
            EN_ACK_PAY: u1 = 0,
            EN_DPL: u1 = 0,
            _: u5 = 0,
        };

        const CONFIG_Init = CONFIG{ .EN_CRC = 1 };
        const STATUS_Init = STATUS{ .RX_DR = 1, .TX_DS = 1, .MAX_RT = 1 };
        const SETUP_AW_Init = SETUP_AW{ .AW = .AW_5_Bytes };
        const EN_RXADDR_Init = EN_RXADDR{ .ERX_P0 = 1, .ERX_P1 = 1 };
        const RF_SETUP_Init = RF_SETUP{ .RF_DR_LOW = 1, .RF_PWR = 3 };
        const FEATURE_Init = FEATURE{ .EN_DPL = 1, .EN_DYN_ACK = 1 };
        const DYNPD_Init = DYNPD{ .DPL_P0 = 1, .DPL_P1 = 1 };
        const EN_AA_Init = EN_AA{};

        pub fn init() void {
            writeRegister(.CONFIG, CONFIG_Init);
            writeRegister(.STATUS, STATUS_Init);
            writeRegister(.SETUP_AW, SETUP_AW_Init);
            writeRegister(.EN_AA, EN_AA_Init);
            writeRegister(.EN_RXADDR, EN_RXADDR_Init);
            writeRegister(.FEATURE, FEATURE_Init);
            writeRegister(.RF_SETUP, RF_SETUP_Init);
            writeRegister(.DYNPD, DYNPD_Init);
        }

        fn readRegister(reg: Register) u8 {
            cs.clear();
            spi.send(@enumToInt(reg) + @enumToInt(Command.R_REGISTER));
            const r = spi.receive();
            cs.set();
            return r;
        }

        fn writeRegister(reg: Register, d: anytype) void {
            cs.clear();
            spi.send(@enumToInt(reg) + @enumToInt(Command.W_REGISTER));
            spi.send(@bitCast(u8, d));
            cs.set();
        }

        pub fn setChannel(channel: u8) void {
            writeRegister(.RF_CH, channel);
        }

        pub fn getChannel() u8 {
            return readRegister(.RF_CH);
        }

        pub fn setRxAddress(address: [5]u8) void {
            cs.clear();
            spi.send(@enumToInt(Register.RX_ADDR_P1) + @enumToInt(Command.W_REGISTER));
            for (address) |a| spi.send(a);
            cs.set();
        }

        pub fn setTxAddress(address: [5]u8) void {
            cs.clear();
            spi.send(@enumToInt(Register.TX_ADDR) + @enumToInt(Command.W_REGISTER));
            for (address) |a| spi.send(a);
            cs.set();
            cs.clear();
            spi.send(@enumToInt(Register.RX_ADDR_P0) + @enumToInt(Command.W_REGISTER));
            for (address) |a| spi.send(a);
            cs.set();
        }

        pub fn txMode() void {
            writeRegister(.CONFIG, CONFIG{ .EN_CRC = 1, .PWR_UP = 1 });
        }

        pub fn rxMode() void {
            writeRegister(.CONFIG, CONFIG{ .EN_CRC = 1, .PRIM_RX = 1, .PWR_UP = 1 });
            ce.set();
        }

        pub fn idle() void {
            ce.clear();
        }

        pub fn powerDown() void {
            ce.clear();
        }

        pub fn rxAvailable() bool {
            const reg = @bitCast(STATUS, readRegister(.STATUS));
            return reg.RX_DR == 1;
        }

        pub fn tx(data: []const u8) void {
            var status: STATUS = undefined;
            cs.clear();
            spi.send(@enumToInt(Command.FLUSH_TX));
            cs.set();
            cs.clear();
            spi.send(@enumToInt(Command.W_TX_PAYLOAD_NOACK));
            for (data) |d| spi.send(d);
            cs.set();
            ce.set();
            while (true) {
                status = @bitCast(STATUS, readRegister(.STATUS));
                if (status.TX_DS == 1) break;
            }
            ce.clear();
            writeRegister(.STATUS, status);
            if (!irq.isSet()) {}
        }

        pub fn readPayload(data: []u8) []u8 {
            cs.clear();
            spi.send(@enumToInt(Command.R_RX_PL_WID));
            const n = std.math.min(spi.receive(), data.len);
            cs.set();
            cs.clear();
            spi.send(@enumToInt(Command.R_RX_PAYLOAD));
            for (data) |*d| {
                d.* = spi.receive();
            }
            cs.set();
            cs.clear();
            spi.send(@enumToInt(Command.FLUSH_RX));
            cs.set();
            return data[0..n];
        }

        pub fn rx(data: []u8) []u8 {
            rxMode();
            while (!rxAvailable()) {}
            writeRegister(.STATUS, @bitCast(STATUS, readRegister(.STATUS)));
            return readPayload(data);
        }

        pub fn printRegisters(writer: anytype) @TypeOf(writer).Error!void {
            _ = try writer.print("Registers: \n", .{});
            inline for (@typeInfo(Register).Enum.fields) |reg| {
                const value = readRegister(@intToEnum(Register, reg.value));
                _ = try writer.print("{s: <11}: {X:0>2}\n", .{ reg.name, value });
            }
        }
    };
}
