const Direction = enum {
    input,
    output,
};

const Drive = enum {
    normal,
    strong,
};

const Mux = enum(u4) {
    A = 0,
    B = 1,
    C = 2,
    D = 3,
    E = 4,
    F = 5,
    G = 6,
    H = 7,
    _,
};

const Config = struct {
    pull_enable: bool = false,
    direction: Direction = .input,
    in_enable: bool = false,
    mux_enable: bool = false,
    drive: Drive = .normal,
    mux: Mux = .A,
};

pub fn Pin(comptime periph: anytype, comptime pin: u5, comptime config: Config) type {
    const pin_bit = @as(u32, 1) << pin;
    return struct {
        pub fn init() void {
            setConfig(config);
        }

        pub fn setConfig(c: Config) void {
            switch (c.direction) {
                .input => periph.DIRCLR.write(.{ .DIRCLR = pin_bit }),
                .output => periph.DIRSET.write(.{ .DIRSET = pin_bit }),
            }
            periph.PINCFG[pin].write(.{
                .DRVSTR = if (c.drive == .strong) 0 else 1,
                .PULLEN = if (c.pull_enable) 1 else 0,
                .INEN = if (c.in_enable) 1 else 0,
                .PMUXEN = if (c.mux_enable) 1 else 0,
                .reserved6 = 0,
                .padding = 0,
            });
            if (pin % 2 == 0) {
                periph.PMUX[pin / 2].modify(.{ .PMUXE = .{ .raw = @enumToInt(c.mux) } });
            } else {
                periph.PMUX[pin / 2].modify(.{ .PMUXO = .{ .raw = @enumToInt(c.mux) } });
            }
        }

        pub fn isSet() bool {
            return periph.IN.read() & pin_bit == 1;
        }

        pub fn set() void {
            periph.OUTSET.write(.{ .OUTSET = pin_bit });
        }

        pub fn clear() void {
            periph.OUTCLR.write(.{ .OUTCLR = pin_bit });
        }

        pub fn toggle() void {
            periph.OUTTGL.write(.{ .OUTTGL = pin_bit });
        }
    };
}
