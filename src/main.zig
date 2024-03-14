const std = @import("std");

pub fn main() !void {
    var showHelp: bool = false;

    // Iterate through command-line arguments, starting from the second to skip the program name
    for (std.os.argv[1..]) |arg| {
        const constArg = std.mem.span(arg);
        if (std.mem.eql(u8, constArg, "-h") or std.mem.eql(u8, constArg, "--help")) {
            showHelp = true;
            break;
        }
    }

    if (showHelp) {
        const stdout = std.io.getStdOut().writer();
        try stdout.print("Usage: htmxr [options]\nOptions:\n  -h, --help    Show this help message\n", .{});
    }
}
