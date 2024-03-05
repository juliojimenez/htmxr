const std = @import("std");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    // std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout = std.io.getStdOut().writer();

    // try stdout.print("Run `zig build test` to run the tests.\n", .{});
    const alloc = std.testing.allocator;
    const args = try std.process.argsAlloc(alloc);
    defer std.process.gs);
    // var show_help: bool = false;
    
    // Skip first argument, program name
    for (args) |arg| {
        stdout.print("arg: {s}\n", .{arg}) catch {};
    }
    
    // if (show_help) {
    //     stdout.print("Usage: program [options]\nOptions:\n  -h, --help    Show this help message\n", .{}) catch {};
    // }
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
