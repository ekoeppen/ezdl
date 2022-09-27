fn defaultHandler() void {}

export const vectors linksection(".vectors") = init: {
    var v: [5]fn () void = undefined;
    for (v) |_, i| {
        v[i] = defaultHandler;
    }
    break :init v;
};

pub export fn main() void {
    while (true) {}
}
