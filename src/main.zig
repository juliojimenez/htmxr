const std = @import("std");

const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    
    var showHelp: bool = false;

    // Iterate through command-line arguments, starting from the second to skip the program name
    for (std.os.argv[1..]) |arg| {
        const constArg = std.mem.span(arg);
        if (std.mem.eql(u8, constArg, "-h") or std.mem.eql(u8, constArg, "--help")) {
            showHelp = true;
            break;
        }
        if (std.mem.eql(u8, constArg, "-s") or std.mem.eql(u8, constArg, "--symlink")) {
            showHelp = true;
            break;
        }
        if (std.mem.eql(u8, constArg, "-b") or std.mem.eql(u8, constArg, "--backend")) {
            showHelp = true;
            break;
        }
        
    }

    if (showHelp) {
        try usage();
    } else {
        try usage();
    }
}

fn usage() !void {
    try stdout.print("Usage: htmxr [options]\nOptions:\n  -h, --help       Show this help message\n  -b, --backend    Initialize a backend\n  -s, --symlink    Add symlink to /usr/local/bin\n", .{});
}
