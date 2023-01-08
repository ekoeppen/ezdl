pub const Config = struct {
    aclk: struct {
        speed: u32 = 32768,
        source: enum { vloclk, lfxt1clk } = .lfxt1clk,
    },

    mclk: struct {
        speed: u32 = 1_000_000,
        source: enum { vloclk, lfxt1clk, dcoclk } = .dcoclk,
    },

    smclk: struct {
        speed: u32 = 1_000_000,
        source: enum { vloclk, lfxt1clk, dcoclk } = .dcoclk,
    },
};

pub fn Clock(comptime system_clock: anytype, comptime c: Config, comptime calibration: anytype) type {
    return struct {
        pub const config = c;
        pub fn init() void {
            switch (c.smclk.source) {
                .vloclk => {},
                .lfxt1clk => {},
                .dcoclk => {
                    system_clock.DCOCTL.write(.{ .MOD = 0, .DCO = 0 });
                    switch (c.smclk.speed) {
                        1_000_000 => {
                            system_clock.BCSCTL1.write_raw(calibration.CALBC1_1MHZ.read().CALBC1_1MHZ);
                            system_clock.DCOCTL.write_raw(calibration.CALDCO_1MHZ.read().CALDCO_1MHZ);
                        },
                        8_000_000 => {
                            system_clock.BCSCTL1.write_raw(calibration.CALBC1_8MHZ.read().CALBC1_8MHZ);
                            system_clock.DCOCTL.write_raw(calibration.CALDCO_8MHZ.read().CALDCO_8MHZ);
                        },
                        12_000_000 => {
                            system_clock.BCSCTL1.write_raw(calibration.CALBC1_12MHZ.read().CALBC1_12MHZ);
                            system_clock.DCOCTL.write_raw(calibration.CALDCO_12MHZ.read().CALDCO_12MHZ);
                        },
                        16_000_000 => {
                            system_clock.BCSCTL1.write_raw(calibration.CALBC1_16MHZ.read().CALBC1_16MHZ);
                            system_clock.DCOCTL.write_raw(calibration.CALDCO_16MHZ.read().CALDCO_16MHZ);
                        },
                        else => unreachable,
                    }
                },
            }
        }
    };
}
