const std = @import("std");

pub fn Action(comptime E: type, comptime S: type, comptime A: type) type {
    return struct {
        event: ?E = null,
        action: ?A = null,
        new_state: ?S = null,
    };
}

pub fn Transition(comptime E: type, comptime S: type, comptime A: type) type {
    return struct {
        state: ?S = null,
        actions: []const Action(E, S, A),
    };
}

pub fn Fsm(comptime E: type, comptime S: type, comptime A: type) type {
    return struct {
        const Self = @This();
        state: S,
        transitions: []const Transition(E, S, A),

        pub fn input(self: *Self, event: E) ?A {
            find_state: for (self.transitions) |transition| {
                if (transition.state) |state| {
                    if (self.state != state) {
                        continue :find_state;
                    }
                }
                find_action: for (transition.actions) |action| {
                    if (action.event) |e| {
                        if (e != event) {
                            continue :find_action;
                        }
                    }
                    if (action.new_state) |new_state| {
                        self.state = new_state;
                    }
                    return action.action;
                }
            }
            return null;
        }
    };
}

test "Simple FSM" {
    const DoorState = enum { door_open, door_closed };
    const ButtonEvent = enum { button_open, button_close };
    const DoorAction = enum { open_door, close_door };
    var fsm: Fsm(ButtonEvent, DoorState, DoorAction) = .{
        .state = .door_open,
        .transitions = &.{
            .{ .state = .door_open, .actions = &.{
                .{
                    .event = .button_close,
                    .action = .close_door,
                    .new_state = .door_closed,
                },
                .{
                    .event = .button_open,
                    .new_state = .door_open,
                },
            } },
            .{ .state = .door_closed, .actions = &.{
                .{
                    .event = .button_open,
                    .action = .open_door,
                    .new_state = .door_open,
                },
            } },
        },
    };
    try std.testing.expect(fsm.input(.button_close).? == .close_door);
    try std.testing.expect(fsm.state == .door_closed);
    try std.testing.expect(fsm.input(.button_close) == null);
    try std.testing.expect(fsm.input(.button_open).? == .open_door);
    try std.testing.expect(fsm.state == .door_open);
}
