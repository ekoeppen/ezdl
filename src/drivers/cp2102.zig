const std = @import("std");

fn ControlEndpoint(
    comptime usb_periph: anytype,
    comptime ep: anytype,
) type {
    return struct {
        const ControlCommand = enum(u8) {
            ifc_enable = 0x00,
            set_bauddiv = 0x01,
            get_bauddiv = 0x02,
            set_line_ctl = 0x03,
            get_line_ctl = 0x04,
            set_break = 0x05,
            imm_char = 0x06,
            set_mhs = 0x07,
            get_mdmsts = 0x08,
            set_xon = 0x09,
            set_xoff = 0x0a,
            set_eventmask = 0x0b,
            get_eventmask = 0x0c,
            get_eventstate = 0x16,
            set_char = 0x0d,
            get_chars = 0x0e,
            get_props = 0x0f,
            get_comm_status = 0x10,
            reset = 0x11,
            purge = 0x12,
            set_flow = 0x13,
            get_flow = 0x14,
            embed_events = 0x15,
            get_baudrate = 0x1d,
            set_baudrate = 0x1e,
            set_chars = 0x19,
            vendor_specific = 0xff,
            _,
        };

        const CommStatus = packed struct {
            errors: packed struct {
                @"break": u1 = 0,
                framing_error: u1 = 0,
                hardware_overrun: u1 = 0,
                queue_overrun: u1 = 0,
                parity_error: u1 = 0,
                padding: u27 = 0,
            },
            hold_reasons: packed struct {
                tx_waiting_for_cts: u1 = 0,
                tx_waiting_for_dsr: u1 = 0,
                tx_waiting_for_dcd: u1 = 0,
                tx_waiting_for_xon: u1 = 0,
                tx_waiting_after_xoff: u1 = 0,
                tx_waiting_for_break: u1 = 0,
                rx_waiting_for_dsr: u1 = 0,
                padding: u25 = 0,
            },
            amount_in_in_queue: u32 = 0,
            amount_in_out_queue: u32 = 0,
            eof_received: u8 = 0,
            wait_for_immediate: u8 = 0,
            reserved: u8 = 0,
        };

        const CommProperties = extern struct {
            length: u16 = 64,
            version: u16 = 0x0100,
            service_mask: u32 = 1,
            max_tx_queue: u32 = 256,
            max_rx_queue: u32 = 256,
            max_baud: u32 = 3_000_000,
            prov_sub_type: u32 = 1,
            prov_capabilities: u32 = 0x13f,
            settable_params: u32 = 0x7f,
            settable_baud: u32 = 0b0001_0000_0000_1111_1111_1111_1111_1111,
            settable_data: u16 = 0b0000_0000_0000_1111,
            current_tx_queue: u32 = 256,
            current_rx_queue: u32 = 256,
            reserved0: u32 = 0,
            reserved1: u32 = 0,
            prov_name: [8]u8 = .{ '4', 0, '0', 0, 'H', 0, 'z', 0 },
        };

        const FlowControlState = packed struct {
            control_handshake: packed struct {
                serial_dtr_mask: u2 = 0,
                reserved0: u1 = 0,
                serial_cts_handshake: u1 = 0,
                serial_dsr_handshak: u1 = 0,
                serial_dcd_handshak: u1 = 0,
                serial_dsr_sensitivit: u1 = 0,
                reserved1: u25 = 0,
            },
            flow_replace: packed struct {
                serial_auto_transmit: u1 = 0,
                serial_auto_receive: u1 = 0,
                serial_error_char: u1 = 0,
                serial_null_stripping: u1 = 0,
                serial_break_char: u1 = 0,
                reserved0: u1 = 0,
                serial_rts_mask: u2 = 0,
                reserved1: u23 = 0,
                serial_xoff_continue: u1 = 0,
            },
            xon_limit: u32 = 0,
            xoff_limit: u32 = 0,
        };

        const comm_props: CommProperties = .{};
        var comm_status: CommStatus = .{ .errors = .{}, .hold_reasons = .{} };
        var flow_control_state: FlowControlState = .{
            .control_handshake = .{},
            .flow_replace = .{},
        };

        const State = struct {
            enable: bool = false,
            rts: bool = false,
            cts: bool = false,
            dtr: bool = false,
            dsr: bool = false,
            ri: bool = false,
            dcd: bool = false,
            xon: bool = false,
            chars: [6]u8 = .{ 0, 0, 0, 0, 17, 19 },
            baud_rate: u32 = 9600,
        };

        const Self = @This();
        state: State = .{},

        fn handleSetup(self: *Self, setup_packet: usb_periph.SetupPacket) void {
            if (setup_packet.request_type != .vendor and setup_packet.request_type != .class) {
                return;
            }
            ep.clearOutTransferComplete();
            const request = setup_packet.request;
            switch (@intToEnum(ControlCommand, setup_packet.request_number)) {
                .ifc_enable => {
                    self.state.enable = @truncate(u1, request.generic.value) == 1;
                    ep.send(&.{});
                },
                .get_line_ctl => ep.send(&.{ 0x08, 0x00 }),
                .set_mhs => {
                    self.state.dtr = request.generic.value & 0b0000_0001_0000_0000 != 0;
                    self.state.rts = request.generic.value & 0b0000_0010_0000_0000 != 0;
                    ep.send(&.{});
                },
                .get_mdmsts => {
                    var mdmsts: [1]u8 = .{
                        0b1011_0000 //
                        | @as(u8, if (self.state.dtr) 0b01 else 0x00) //
                        | @as(u8, if (self.state.rts) 0b10 else 0b00),
                    };
                    ep.send(&mdmsts);
                },
                .get_comm_status => ep.send(std.mem.asBytes(&comm_status)),
                .get_baudrate => ep.send(std.mem.asBytes(&self.state.baud_rate)),
                .get_props => ep.send(std.mem.asBytes(&comm_props)),
                .get_flow => ep.send(std.mem.asBytes(&flow_control_state)),
                .vendor_specific => ep.send(&.{0x02}),
                .set_baudrate, .set_flow, .set_chars => {
                    ep.resetOutCount();
                    ep.setOutState(.valid);
                },
                else => {
                    ep.resetOutCount();
                    ep.send(&.{});
                },
            }
        }

        fn handleOut(self: *Self, setup_packet: usb_periph.SetupPacket) void {
            ep.clearOutTransferComplete();
            switch (@intToEnum(ControlCommand, setup_packet.request_number)) {
                .set_baudrate => {
                    _ = ep.getOutData(std.mem.asBytes(&self.state.baud_rate));
                    ep.send(&.{});
                },
                .set_flow, .set_chars => {
                    ep.send(&.{});
                },
                else => {},
            }
        }

        pub fn handleTransferComplete(self: *Self, setup_packet: usb_periph.SetupPacket) void {
            if (ep.outTransferComplete()) {
                if (ep.setupTransfer()) {
                    self.handleSetup(setup_packet);
                } else {
                    self.handleOut(setup_packet);
                }
            }
        }
    };
}

pub fn Cp2102(
    comptime usb_periph: anytype,
    comptime usb: anytype,
    comptime Buffer: type,
) type {
    return struct {
        const Self = @This();

        const device_descriptor: []const u8 = &.{
            0x12, 0x01, 0x10, 0x01, 0x00, 0x00, 0x00, 0x40, 0xc4, 0x10, 0x60,
            0xea, 0x00, 0x01, 0x01, 0x02, 0x03, 0x01,
        };
        const config_descriptor: []const u8 = &.{
            0x09, 0x02, 0x20, 0x00, 0x01, 0x01, 0x00, 0x80, 0x32, 0x09, 0x04,
            0x00, 0x00, 0x02, 0xFF, 0x00, 0x00, 0x02, 0x07, 0x05, 0x81, 0x02,
            0x40, 0x00, 0x00, 0x07, 0x05, 0x01, 0x02, 0x40, 0x00, 0x00,
        };

        const manufacturer_string_descriptor: []const u8 = &.{
            0x0a, 0x03, '4', 0x00, '0', 0x00, 'H', 0x00, 'z', 0x00,
        };

        const product_string_descriptor: []const u8 = &.{
            0x22, 0x03, 'S', 0x00, 'T', 0x00, 'M', 0x00, '3', 0x00, '2', 0x00,
            ' ',  0x00, 'U', 0x00, 'S', 0x00, 'B', 0x00, ' ', 0x00, 'B', 0x00,
            'r',  0x00, 'i', 0x00, 'd', 0x00, 'g', 0x00, 'e', 0x00,
        };

        const serial_number_string_descriptor: []const u8 = &.{
            0x0a, 0x03, '0', 0x00, '0', 0x00, '0', 0x00, '0', 0x00,
        };

        const languages_descriptor: []const u8 = &.{ 0x04, 0x03, 0x09, 0x04 };

        std_control: usb_periph.ControlEndpoint(usb.endpoints[0], usb.usb, usb_periph.Descriptors{
            .device = device_descriptor,
            .config = &.{config_descriptor},
            .string = &.{
                languages_descriptor,
                manufacturer_string_descriptor,
                product_string_descriptor,
                serial_number_string_descriptor,
            },
            .endpoint = &.{},
            .interface = &.{},
        }) = .{},
        data: usb_periph.BulkEndpoint(usb.endpoints[1], Buffer) = .{},
        control: ControlEndpoint(usb_periph, usb.endpoints[0]) = .{},

        pub fn irqHandler(self: *Self) void {
            if (usb.irqHandler()) |ep| {
                switch (ep) {
                    0 => {
                        self.std_control.handleTransferComplete();
                        self.control.handleTransferComplete(self.std_control.setup_packet);
                        usb.endpoints[0].setOutState(.valid);
                    },
                    1 => self.data.handleTransferComplete(),
                    else => {},
                }
            }
        }
    };
}
