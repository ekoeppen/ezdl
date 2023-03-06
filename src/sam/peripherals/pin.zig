const Direction = enum {
    input,
    output,
};

const Drive = enum {
    normal,
    strong,
};

const Config = struct {
    pull_up: bool = false,
    direction: Direction = .input,
    in_enable: bool = false,
    mux_enable: bool = false,
    drive: Drive = .normal,
    mux: u4 = 0,
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
