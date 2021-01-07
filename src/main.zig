const std = @import("std");

const tracy = @import("./lib.zig");

pub fn main() anyerror!void {
    const t = tracy.trace(@src());
    defer t.end();
    std.log.info("All your codebase are belong to us.", .{});
}
