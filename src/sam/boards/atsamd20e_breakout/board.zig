pub const ezdl = @import("ezdl");
pub const mcu = ezdl.sam.mcus.atsamd20e;
pub const svd = ezdl.sam.svd.atsamd20e;

pub const periph = svd.peripherals;

pub const led = mcu.Pin(&periph.PORT_GROUP[0], 15, .{ .direction = .output });

pub fn init() void {
    periph.PM.APBBMASK.modify(.{ .PORT_ = 1 });
}
