pub fn Rfm69(
    comptime spi: anytype,
    comptime cs: anytype,
    comptime irq: anytype,
) type {
    return struct {
        const f_osc: u32 = 32_000_000;

        pub const Register = enum(u8) {
            Fifo = 0x00,
            OpMode = 0x01,
            Datamodul = 0x02,
            BitrateMsb = 0x03,
            BitrateLsb = 0x04,
            FdevMsb = 0x05,
            FdevLsb = 0x06,
            FrfMsb = 0x07,
            FrfMid = 0x08,
            FrfLsb = 0x09,
            Osc1 = 0x0a,
            AfcCtrl = 0x0b,
            LowBat = 0x0c,
            Listen1 = 0x0d,
            Listen2 = 0x0e,
            Listen3 = 0x0f,
            Version = 0x10,
            PaLevel = 0x11,
            PaRamp = 0x12,
            Ocp = 0x13,
            AgcRef = 0x14,
            AgcThresh1 = 0x15,
            AgcThresh2 = 0x16,
            AgcThresh3 = 0x17,
            Lna = 0x18,
            RxBw = 0x19,
            AfcBw = 0x1a,
            OokPeak = 0x1b,
            OokAvg = 0x1c,
            OokFix = 0x1d,
            AfcFei = 0x1e,
            AfcMsb = 0x1f,
            AfcLsb = 0x20,
            FeiMsb = 0x21,
            FeiLsb = 0x22,
            RssiConfig = 0x23,
            RssiValue = 0x24,
            DioMapping1 = 0x25,
            DioMapping2 = 0x26,
            IrqFlags1 = 0x27,
            IrqFlags2 = 0x28,
            RssiThresh = 0x29,
            RxTimeout1 = 0x2a,
            RxTimeout2 = 0x2b,
            PreambleMsb = 0x2c,
            PreambleLsb = 0x2d,
            SyncConfig = 0x2e,
            SyncValue1 = 0x2f,
            SyncValue2 = 0x30,
            SyncValue3 = 0x31,
            SyncValue4 = 0x32,
            SyncValue5 = 0x33,
            SyncValue6 = 0x34,
            SyncValue7 = 0x35,
            SyncValue8 = 0x36,
            PacketConfig1 = 0x37,
            PayloadLength = 0x38,
            NodeAdrs = 0x39,
            BroadcastAdrs = 0x3a,
            AutoModes = 0x3b,
            FifoThresh = 0x3c,
            PacketConfig2 = 0x3d,
            AesKey1 = 0x3e,
            AesKey2 = 0x3f,
            AesKey3 = 0x40,
            AesKey4 = 0x41,
            AesKey5 = 0x42,
            AesKey6 = 0x43,
            AesKey7 = 0x44,
            AesKey8 = 0x45,
            AesKey9 = 0x46,
            AesKey10 = 0x47,
            AesKey11 = 0x48,
            AesKey12 = 0x49,
            AesKey13 = 0x4a,
            AesKey14 = 0x4b,
            AesKey15 = 0x4c,
            AesKey16 = 0x4d,
            Temp1 = 0x4e,
            Temp2 = 0x4f,
        };

        pub const Command = enum(u8) {
            read = 0b0000_0000,
            write = 0b1000_0000,
        };

        pub const OpModeModeType = enum(u3) {
            sleep = 0b000,
            stdby = 0b001,
            fs = 0b010,
            tx = 0b011,
            rx = 0b100,
        };

        pub const OpMode = packed struct {
            _: u2 = 0,
            mode: OpModeModeType = .stdby,
            sequencer_off: u1 = 0,
            listen_on: u1 = 0,
            listen_abort: u1 = 0,
        };

        pub const DioMapping = packed struct {
            dio3_mapping: u2,
            dio2_mapping: u2,
            dio1_mapping: u2,
            dio0_mapping: u2,
        };

        pub const IrqFlags1 = packed struct {
            sync_address_match: u1 = 0,
            auto_mode: u1 = 0,
            timeout: u1 = 0,
            rssi: u1 = 0,
            pll_lock: u1 = 0,
            tx_ready: u1 = 0,
            rx_ready: u1 = 0,
            mode_ready: u1 = 0,
        };

        pub const IrqFlags2 = packed struct {
            _: u1,
            crc_ok: u1,
            payload_ready: u1,
            packet_sent: u1,
            fifo_overrun: u1,
            fifo_level: u1,
            fifo_not_emtpy: u1,
            fifo_full: u1,
        };

        pub const RssiThresh = packed struct {
            rssiThreshold: u8 = 0xe4,
        };

        pub const SyncConfigFifoFillConditionType = enum(u1) {
            sync_address = 0b0,
            always = 0b1,
        };

        pub const SyncConfig = packed struct {
            sync_tol: u3 = 0,
            sync_size: u3 = 3,
            fifo_fill_condition: SyncConfigFifoFillConditionType = .sync_address,
            sync_on: u1 = 1,
        };

        pub const SyncValue1 = packed struct {
            sync_value: u8 = 0x01,
        };

        pub const SyncValue2 = packed struct {
            sync_value: u8 = 0x01,
        };

        pub const SyncValue3 = packed struct {
            sync_value: u8 = 0x01,
        };

        pub const SyncValue4 = packed struct {
            sync_value: u8 = 0x01,
        };

        pub const SyncValue5 = packed struct {
            sync_value: u8 = 0x01,
        };

        pub const SyncValue6 = packed struct {
            sync_value: u8 = 0x01,
        };

        pub const SyncValue7 = packed struct {
            sync_value: u8 = 0x01,
        };

        pub const SyncValue8 = packed struct {
            sync_value: u8 = 0x01,
        };

        pub const PreambleMsb = packed struct {
            preamble_size_msb: u8 = 0,
        };

        pub const PreambleLsb = packed struct {
            preamble_size_lsb: u8 = 3,
        };

        pub const FdevMsb = packed struct {
            fdev_msb: u6 = 0,
            _: u2 = 0,
        };

        pub const FdevLsb = packed struct {
            fdev_lsb: u8 = 0x52,
        };

        pub const FregMsb = packed struct {
            frf_msb: u8 = 0xe4,
        };

        pub const FregMid = packed struct {
            frf_mid: u8 = 0xc0,
        };

        pub const FregLsb = packed struct {
            frf_lsb: u8 = 0x00,
        };

        pub const DataModulDataModeType = enum(u2) {
            packet_mode = 0b00,
            continuous_synchronizer = 0b10,
            continuous_no_synchronizer = 0b11,
        };

        pub const DataModulModulationType = enum(u2) {
            fsk = 0b00,
            ook = 0b01,
        };

        pub const DataModulModulationShaping = enum(u2) {
            no_shaping = 0,
            shaping_1 = 1,
            shaping_2 = 2,
            shaping_3 = 3,
        };

        pub const DataModul = packed struct {
            modulation_shaping: DataModulModulationShaping,
            _: u1 = 0,
            modulation_type: DataModulModulationType,
            data_mode: DataModulDataModeType,
            _2: u1 = 0,
        };

        pub const FifoThreshStartConditionType = enum(u1) {
            fifo_level = 0b0,
            fifo_not_empty = 0b1,
        };

        pub const FifoThresh = packed struct {
            fifo_threshold: u7 = 15,
            start_condition: FifoThreshStartConditionType = .fifo_not_empty,
        };

        pub const RxBw = packed struct {
            rx_bw_exp: u3 = 5,
            rx_bw_mant: u2 = 2,
            dcc_freq: u3 = 2,
        };

        pub const AfcBw = packed struct {
            rx_bw_exp_afc: u3 = 3,
            rx_bw_mant_afc: u2 = 1,
            dcc_freq_afc: u3 = 4,
        };

        pub const PaLevel = packed struct {
            output_power: u5 = 31,
            pa2_on: u1 = 0,
            pa1_on: u1 = 0,
            pa0_on: u1 = 1,
        };

        pub const PacketConfig1PacketFormatType = enum(u1) {
            fixed_length = 0b0,
            variable_length = 0b1,
        };

        pub const PacketConfig1DcFreeType = enum(u2) {
            none = 0b00,
            manchester = 0b01,
            whitening = 0b10,
        };

        pub const PacketConfig1AddressFilteringType = enum(u2) {
            none = 0b00,
            node_address = 0b01,
            node_or_broadcast_address = 0b10,
        };

        pub const PacketConfig1 = packed struct {
            _: u1 = 0,
            address_filtering: PacketConfig1AddressFilteringType = .none,
            crc_auto_clear_off: u1 = 0,
            crc_on: u1 = 1,
            dc_free: PacketConfig1DcFreeType = .none,
            packet_format: PacketConfig1PacketFormatType = .fixed_length,
        };

        fn readRegister(comptime RegisterType: type, reg: Register) RegisterType {
            cs.clear();
            spi.send(@enumToInt(reg) + @enumToInt(Command.read));
            const r: u8 = spi.receive();
            cs.set();
            return @bitCast(RegisterType, r);
        }

        fn writeRegister(reg: Register, d: anytype) void {
            cs.clear();
            spi.send(@enumToInt(reg) + @enumToInt(Command.write));
            spi.send(@bitCast(u8, d));
            cs.set();
        }

        pub fn printRegisters(writer: anytype) @TypeOf(writer).Error!void {
            _ = try writer.print("Registers: \n", .{});
            inline for (@typeInfo(Register).Enum.fields) |reg| {
                const value = readRegister(u8, @intToEnum(Register, reg.value));
                _ = try writer.print("{s: <14}: {X:0>2}\n", .{ reg.name, value });
            }
        }

        pub fn init() bool {
            _ = irq;
            if (!setMode(.stdby)) return false;
            writeRegister(.FifoThresh, FifoThresh{
                .fifo_threshold = 16,
                .start_condition = .fifo_not_empty,
            });
            writeRegister(.PacketConfig1, PacketConfig1{
                .address_filtering = .none,
                .crc_auto_clear_off = 0,
                .crc_on = 1,
                .dc_free = .none,
                .packet_format = .variable_length,
            });
            writeRegister(.RxBw, RxBw{
                .dcc_freq = 2,
                .rx_bw_mant = 2,
                .rx_bw_exp = 2,
            });
            writeRegister(.AfcBw, AfcBw{
                .dcc_freq_afc = 2,
                .rx_bw_mant_afc = 2,
                .rx_bw_exp_afc = 2,
            });
            writeRegister(.RssiThresh, RssiThresh{ .rssiThreshold = 100 * 2 });
            writeRegister(.SyncConfig, SyncConfig{
                .sync_tol = 0,
                .sync_size = 3,
                .fifo_fill_condition = .sync_address,
                .sync_on = 1,
            });
            writeRegister(.SyncValue1, SyncValue1{ .sync_value = 0xf0 });
            writeRegister(.SyncValue2, SyncValue2{ .sync_value = 0x12 });
            writeRegister(.SyncValue3, SyncValue3{ .sync_value = 0x78 });
            writeRegister(.Datamodul, DataModul{
                .data_mode = .packet_mode,
                .modulation_type = .fsk,
                .modulation_shaping = .no_shaping,
            });
            writeRegister(.PreambleLsb, PreambleLsb{ .preamble_size_lsb = 6 });
            writeRegister(.FdevMsb, FdevMsb{ .fdev_msb = 3 });
            writeRegister(.FdevLsb, FdevLsb{ .fdev_lsb = 5 });
            return true;
        }

        pub fn setMode(mode: OpModeModeType) bool {
            var opMode: OpMode = readRegister(OpMode, .OpMode);
            if (opMode.mode == mode) return true;
            opMode.mode = mode;
            writeRegister(.OpMode, opMode);
            var retries: u32 = 100;
            while (retries > 0) {
                const irqFlags = readRegister(IrqFlags1, .IrqFlags1);
                if (irqFlags.mode_ready == 1) break;
                retries -= 1;
            }
            return retries > 0;
        }

        pub fn setFrequency(comptime frequency: u32) void {
            const f = (frequency / 1_000_000) * (2 << (19 - 1)) / (f_osc / 1_000_000);
            cs.clear();
            spi.send(@enumToInt(Register.FrfMsb) + @enumToInt(Command.write));
            spi.send(@truncate(u8, f >> 16));
            spi.send(@truncate(u8, f >> 8));
            spi.send(@truncate(u8, f));
            cs.set();
        }

        pub fn setOutputPower(comptime power: i8) void {
            const p = if (power < -18) -18 else if (power > 17) 17 else power;
            var pa_level = readRegister(PaLevel, .PaLevel);
            pa_level.output_power = p;
            writeRegister(.PaLevel, pa_level);
        }

        pub fn rxMode() void {
            _ = setMode(.rx);
            clearIrq();
        }

        pub fn txMode() void {
            _ = setMode(.tx);
        }

        pub fn tx(packet: []const u8) void {
            txMode();
            cs.clear();
            spi.send(@enumToInt(Register.Fifo) + @enumToInt(Command.write));
            spi.send(if (packet.len > 255) 255 else @truncate(u8, packet.len));
            for (packet) |p| spi.send(p);
            cs.set();
        }

        pub fn rx(packet: []u8) u8 {
            cs.clear();
            spi.send(@enumToInt(Register.Fifo) + @enumToInt(Command.read));
            const length: u8 = spi.receive();
            var i: u8 = 0;
            while (i < length) {
                packet[i] = spi.receive();
                i += 1;
            }
            cs.set();
            return length;
        }

        pub fn rxAvailableFlag() bool {
            const irqFlags = readRegister(IrqFlags1, .IrqFlags1);
            return irqFlags.payload_ready == 1;
        }

        pub fn rxAvailable() bool {
            return irq.isSet();
        }

        pub fn waitForRx() void {
            while (!rxAvailable()) {
                asm volatile ("wfe");
            }
            clearIrq();
        }

        pub fn clearIrq() void {
            writeRegister(.IrqFlags1, IrqFlags1{ .sync_address_match = 1, .rssi = 1 });
        }
    };
}
