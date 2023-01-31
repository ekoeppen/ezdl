const std = @import("std");

pub fn Usb(
    comptime usb_periph: anytype,
    comptime eps: anytype,
    comptime dp_pin: anytype,
) type {
    return struct {
        pub const usb = usb_periph;
        pub const endpoints = eps;
        pub const reset_via_dp = @TypeOf(dp_pin) != @TypeOf(null);

        pub fn init() void {
            if (reset_via_dp) {
                dp_pin.init();
                dp_pin.clear();
            } else {
                usb.BCDR.modify(.{ .DPPU = 0 });
            }
            var i: u32 = 1000;
            while (i > 0) {
                i -= 1;
                asm volatile ("");
            }
            if (reset_via_dp) {
                dp_pin.setConfig(.{ .output = .{ .mode = .open_drain } });
            } else {
                usb.BCDR.modify(.{ .DPPU = 1 });
            }
            usb.CNTR.modify(.{ .FRES = 1 });
            usb.CNTR.modify(.{ .PDWN = 0, .FRES = 0 });
            usb.ISTR.modify(.{
                .PMAOVR = 0,
                .ERR = 0,
                .WKUP = 0,
                .SUSP = 0,
                .RESET = 0,
                .SOF = 0,
                .ESOF = 0,
            });

            usb.CNTR.modify(.{ .CTRM = 1, .WKUPM = 1, .SUSPM = 1, .RESETM = 1 });
        }

        pub fn irqHandler() ?u8 {
            const istr = usb.ISTR.read();
            const ep_id: ?u8 = ep_id: {
                if (istr.CTR == 1) {
                    usb.ISTR.modify(.{ .CTR = 0 });
                    break :ep_id istr.EP_ID;
                } else break :ep_id null;
            };
            if (istr.RESET == 1) {
                usb.ISTR.modify(.{ .RESET = 0 });
                resetRequest();
            }
            if (istr.SUSP == 1) {
                usb.ISTR.modify(.{ .SUSP = 0 });
                suspendRequest();
            }
            if (istr.WKUP == 1) {
                usb.ISTR.modify(.{ .WKUP = 0 });
                wakeupRequest();
            }
            return ep_id;
        }

        fn resetRequest() void {
            usb.DADDR.write(.{ .ADD = 0, .EF = 1 });
            var btable_offset: u16 = 16 * endpoints.len;
            inline for (endpoints) |endpoint| btable_offset += endpoint.init(btable_offset);
        }

        fn suspendRequest() void {
            usb.CNTR.modify(.{ .LPMODE = 1, .FSUSP = 1 });
        }

        fn wakeupRequest() void {
            usb.CNTR.modify(.{ .LPMODE = 0, .FSUSP = 0 });
            usb.CNTR.modify(.{ .CTRM = 1, .WKUPM = 1, .SUSPM = 1, .RESETM = 1 });
        }
    };
}

const StandardRequests = enum(u8) {
    getStatus = 0,
    clear_feature = 1,
    set_feature = 3,
    set_address = 5,
    get_descriptor = 6,
    set_descriptor = 7,
    get_configuration = 8,
    set_configuration = 9,
    get_interface = 10,
    set_interface = 11,
    synch_frame = 12,
    _,
};

const Recipient = enum(u5) {
    device = 0,
    interface = 1,
    endpoint = 2,
    other = 3,
    reserved = 4,
};

const DescriptorType = enum(u8) {
    device = 1,
    config = 2,
    string = 3,
    interface = 4,
    endpoint = 5,
};

const Direction = enum(u1) {
    out = 0,
    in = 1,
};

const RequestType = enum(u2) {
    standard = 0,
    class = 1,
    vendor = 2,
    reserved = 3,
};

pub const SetupPacket = packed struct {
    recipient: Recipient,
    request_type: RequestType,
    direction: Direction,
    request_number: u8,
    request: packed union {
        generic: GenericRequest,
        clear_feature: ClearFeatureRequest,
        get_configuration: GetConfigurationRequest,
        get_descriptor: GetDescriptorRequest,
        get_interface: GetInterfaceRequest,
        getStatus: GetStatusRequest,
        set_address: SetAddressRequest,
        set_configuration: SetConfigurationRequest,
        set_descriptor: SetDescriptorRequest,
        set_feature: SetFeatureRequest,
        set_interface: SetInterfaceRequest,
        syncFrame: SyncFrame,
    },
};

pub const GenericRequest = packed struct {
    value: u16,
    index: u16,
    length: u16,
};

pub const ClearFeatureRequest = packed struct {
    feature: u16,
    index: u16,
};

pub const GetConfigurationRequest = packed struct {
    _: u32,
    length: u16,
};

pub const GetDescriptorRequest = packed struct {
    descriptor_index: u8,
    descriptor_type: u8,
    language_id: u16,
    length: u16,
};

pub const GetInterfaceRequest = packed struct {
    _: u16,
    interface: u16,
    length: u16,
};

pub const GetStatusRequest = packed struct {
    _: u16,
    index: u16,
    length: u16,
};

pub const SetAddressRequest = packed struct {
    address: u16,
};

pub const SetConfigurationRequest = packed struct {
    configuration: u16,
};

pub const SetDescriptorRequest = packed struct {
    descriptor_index: u8,
    descriptor_type: u8,
    language_id: u16,
    length: u16,
};

pub const SetFeatureRequest = packed struct {
    feature_selector: u16,
    index: u16,
};

pub const SetInterfaceRequest = packed struct {
    alternate_setting: u16,
    interface: u16,
};

pub const SyncFrame = packed struct {
    _: u16,
    endpoint: u16,
    length: u16,
};

const EndpointType = enum(u2) {
    bulk = 0b00,
    control = 0b01,
    iso = 0b10,
    interrupt = 0b11,
};

pub const EndpointState = enum(u2) {
    disabled = 0b00,
    stall = 0b01,
    nak = 0b10,
    valid = 0b11,
};

pub fn Endpoint(
    comptime usb: anytype,
    comptime ep_number: u3,
    comptime ep_type: EndpointType,
    comptime ep_max_rx: u10,
    comptime ep_max_tx: u10,
    comptime init_rxState: EndpointState,
    comptime init_txState: EndpointState,
) type {
    return struct {
        pub const gapless = @bitSizeOf(@TypeOf(usb.*)) / 8 > 84;
        pub const item_size = if (gapless) 1 else 2;
        pub const index_div = if (gapless) 2 else 1;

        pub const number = ep_number;
        pub const max_rx = ep_max_rx;
        pub const max_tx = ep_max_tx;
        pub const epr = switch (number) {
            0 => &usb.EP0R,
            1 => &usb.EP1R,
            2 => &usb.EP2R,
            3 => &usb.EP3R,
            4 => &usb.EP4R,
            5 => &usb.EP5R,
            6 => &usb.EP6R,
            7 => &usb.EP7R,
        };
        pub const BTABLE = @intToPtr(*[512]u16, 0x40006000);
        pub const addr_tx_index = item_size * (@as(u11, number) * 4);
        pub const count_tx_index = item_size * (@as(u11, number) * 4 + 1);
        pub const addr_rx_index = item_size * (@as(u11, number) * 4 + 2);
        pub const count_rx_index = item_size * (@as(u11, number) * 4 + 3);

        fn encodeOutSize(size: u10) u16 {
            return if (size > 62) 0x8000 | @as(u16, (size / 32)) << 10 //
            else @as(u16, (size / 2)) << 10;
        }

        pub fn init(btable_offset: u16) u16 {
            epr.modify(.{
                .STAT_RX = @enumToInt(init_rxState),
                .STAT_TX = @enumToInt(init_txState),
                .EP_TYPE = @enumToInt(ep_type),
                .EA = number,
            });
            BTABLE[addr_tx_index] = btable_offset;
            BTABLE[addr_rx_index] = btable_offset + max_tx;
            setInCount(0);
            resetOutCount();
            return max_rx + max_tx;
        }

        pub fn setInState(state: EndpointState) void {
            var epr_val = epr.readRaw();
            epr.writeRaw(((epr_val & 0x0fbf) | 0x8080) ^ @as(u16, @enumToInt(state)) << 4);
        }

        pub fn setOutState(state: EndpointState) void {
            var epr_val = epr.readRaw();
            epr.writeRaw(((epr_val & 0xbf0f) | 0x8080) ^ @as(u16, @enumToInt(state)) << 12);
        }

        pub fn setInOutState(txState: EndpointState, rxState: EndpointState) void {
            var epr_val = epr.readRaw();
            epr.writeRaw(((epr_val & 0xbfbf) | 0x8080) ^ //
                (@as(u16, @enumToInt(txState)) << 4 | @as(u16, @enumToInt(rxState)) << 12));
        }

        pub fn getInState() EndpointState {
            return @intToEnum(EndpointState, epr.read().STAT_TX);
        }

        pub fn getOutState() EndpointState {
            return @intToEnum(EndpointState, epr.read().STAT_RX);
        }

        pub fn setInCount(tx_count: u10) void {
            BTABLE[count_tx_index] = tx_count;
        }

        pub fn resetOutCount() void {
            BTABLE[count_rx_index] = encodeOutSize(max_rx);
        }

        pub fn inTransferComplete() bool {
            return epr.read().CTR_TX == 1;
        }

        pub fn outTransferComplete() bool {
            return epr.read().CTR_RX == 1;
        }

        pub fn clearInTransferComplete() void {
            var epr_val = epr.readRaw();
            epr.writeRaw(epr_val & 0x8f0f);
        }

        pub fn clearOutTransferComplete() void {
            var epr_val = epr.readRaw();
            epr.writeRaw(epr_val & 0x0f8f);
        }

        pub fn setupTransfer() bool {
            return epr.read().SETUP == 1;
        }

        pub fn getOutCount() u10 {
            return @truncate(u10, BTABLE[count_rx_index]);
        }

        pub fn getInCount() u10 {
            return @truncate(u10, BTABLE[count_tx_index]);
        }

        pub fn getOutData(buf: []u8) []u8 {
            var i: usize = 0;
            var j: usize = 0;
            const start: usize = BTABLE[addr_rx_index] / index_div;
            const len = getOutCount();
            while (i < len) : (i += item_size) {
                if (j == buf.len) break;
                const rx_word = BTABLE[start + i];
                buf[j] = @truncate(u8, rx_word);
                j += 1;
                if (j == buf.len) break;
                buf[j] = @truncate(u8, rx_word >> 8);
                j += 1;
            }
            return buf[0..j];
        }

        pub fn read(buffer: anytype) bool {
            const len = getOutCount();
            if (len > buffer.free()) return false;
            var i: usize = 0;
            const start: usize = BTABLE[addr_rx_index] / index_div;
            while (i < len) : (i += item_size) {
                const rx_word = BTABLE[start + i];
                _ = buffer.put(@truncate(u8, rx_word));
                if (i + 1 < len) {
                    _ = buffer.put(@truncate(u8, rx_word >> 8));
                }
            }
            return true;
        }

        pub fn putInData(buf: []const u8) []const u8 {
            const len = std.math.min(buf.len, max_tx);
            var i: usize = 0;
            var j: usize = 0;
            const start: usize = BTABLE[addr_tx_index] / index_div;
            setInCount(@truncate(u10, len));
            while (j < buf.len and i < len) : (i += item_size) {
                var w = @as(u16, buf[j]);
                if (j + 1 < buf.len) {
                    j += 1;
                    w += @as(u16, buf[j]) << 8;
                }
                BTABLE[start + i] = w;
                j += 1;
            }
            return buf[j..];
        }

        pub fn write(buffer: anytype) void {
            const len = std.math.min(buffer.used(), max_tx);
            var i: usize = 0;
            const start: usize = BTABLE[addr_tx_index] / index_div;
            setInCount(@truncate(u10, len));
            while (i < len) : (i += item_size) {
                if (buffer.get()) |lo| {
                    var w = @as(u16, lo);
                    if (buffer.get()) |hi| {
                        w += @as(u16, hi) << 8;
                        BTABLE[start + i] = w;
                    } else {
                        BTABLE[start + i] = w;
                        break;
                    }
                } else break;
            }
        }

        pub fn send(data: []const u8) void {
            defer setInState(.valid);
            _ = putInData(data);
        }
    };
}

pub const Descriptors = struct {
    device: []const u8,
    config: []const []const u8,
    string: []const []const u8,
    endpoint: []const []const u8,
    interface: []const []const u8,
};

fn getValid(data: []const []const u8, index: u16) []const u8 {
    return if (index < data.len) data[index] else &.{};
}

pub fn ControlEndpoint(
    comptime ep: anytype,
    comptime usb: anytype,
    comptime descriptors: Descriptors,
) type {
    return struct {
        const Self = @This();

        setup_address: u7 = undefined,
        active_configuration: u16 = undefined,
        pending_data: []const u8 = undefined,
        setup_packet: SetupPacket align(4) = undefined,

        pub fn init(self: *Self, btable_offset: u16) u16 {
            self.setup_address = 0;
            self.active_configuration = 0;
            return ep.init(btable_offset);
        }

        pub fn send(self: *Self, data: []const u8) void {
            const length = std.math.min(data.len, ep.max_tx);
            self.pending_data = ep.putInData(data[0..length]);
            ep.setInState(.valid);
        }

        fn sendDescriptor(self: *Self, d_type: u8, index: u8, max_length: u16) void {
            self.pending_data = switch (@intToEnum(DescriptorType, d_type)) {
                .device => descriptors.device,
                .config => getValid(descriptors.config, index),
                .string => getValid(descriptors.string, index),
                .endpoint => getValid(descriptors.endpoint, index),
                .interface => getValid(descriptors.interface, index),
            };
            const length = std.math.min(self.pending_data.len, max_length);
            self.pending_data = ep.putInData(self.pending_data[0..length]);
            ep.resetOutCount();
            ep.setInOutState(.valid, .valid);
        }

        fn handleIn(self: *Self) void {
            ep.clearInTransferComplete();
            if (self.setup_address != 0) {
                usb.DADDR.write(.{ .ADD = self.setup_address, .EF = 1 });
                self.setup_address = 0;
            }
            if (self.pending_data.len > 0) {
                self.pending_data = ep.putInData(self.pending_data);
            } else {
                ep.resetOutCount();
                ep.setInCount(0);
            }
            ep.setInOutState(.valid, .valid);
        }

        fn handleOut(self: *Self) void {
            _ = self;
        }

        fn handleSetup(self: *Self) void {
            var bytes = std.mem.asBytes(&self.setup_packet);
            _ = ep.getOutData(bytes);
            if (self.setup_packet.request_type == .standard) {
                ep.clearOutTransferComplete();
                const request = self.setup_packet.request;
                switch (@intToEnum(StandardRequests, self.setup_packet.request_number)) {
                    .set_address => {
                        self.setup_address = @truncate(u7, request.set_address.address);
                        ep.send(&.{});
                    },
                    .get_descriptor => self.sendDescriptor(
                        request.get_descriptor.descriptor_type,
                        request.get_descriptor.descriptor_index,
                        request.get_descriptor.length,
                    ),
                    .set_configuration => {
                        self.active_configuration = request.set_configuration.configuration;
                        ep.send(&.{});
                    },
                    else => ep.send(&.{}),
                }
            }
        }

        pub fn handleTransferComplete(self: *Self) void {
            if (ep.outTransferComplete()) {
                if (ep.setupTransfer()) {
                    self.handleSetup();
                } else {
                    self.handleOut();
                }
            } else {
                self.handleIn();
            }
        }
    };
}

pub fn BulkEndpoint(
    comptime ep: anytype,
    comptime Buffer: type,
) type {
    return struct {
        const Self = @This();
        const WriteError = error{};
        const ReadError = error{};

        rx_buffer: Buffer = .{},
        tx_buffer: Buffer = .{},

        fn handleIn(self: *Self) void {
            ep.clearInTransferComplete();
            if (!self.tx_buffer.empty()) {
                ep.write(&self.tx_buffer);
                ep.setInState(.valid);
            }
        }

        fn handleOut(self: *Self) void {
            ep.clearOutTransferComplete();
            if (ep.read(&self.rx_buffer)) {
                ep.resetOutCount();
                ep.setOutState(.valid);
            } else {
                ep.setOutState(.stall);
            }
        }

        pub fn handleTransferComplete(self: *Self) void {
            if (ep.outTransferComplete()) {
                self.handleOut();
            } else {
                self.handleIn();
            }
        }

        pub fn write(self: *Self, bytes: []const u8) WriteError!usize {
            if (ep.getInState() == .valid) return 0;
            var written: usize = 0;
            for (bytes) |b| {
                if (!self.tx_buffer.put(b)) break;
                written += 1;
            }
            ep.write(&self.tx_buffer);
            ep.setInState(.valid);
            return written;
        }

        pub const Writer = std.io.Writer(*Self, WriteError, write);

        pub fn writer(self: *Self) Writer {
            return .{ .context = self };
        }

        pub const Reader = std.io.Reader(*Self, ReadError, read);

        pub fn reader(self: *Self) Reader {
            return .{ .context = self };
        }

        pub fn read(self: *Self, bytes: []u8) ReadError!usize {
            var amount_read: usize = 0;
            while (amount_read < bytes.len) {
                if (self.rx_buffer.get()) |b| {
                    bytes[amount_read] = b;
                    amount_read += 1;
                } else break;
            }
            return amount_read;
        }
    };
}
