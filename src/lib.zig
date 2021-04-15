const std = @import("std");

pub const c = @cImport({
    @cDefine("TRACY_ENABLE", "");
    @cInclude("TracyC.h");
});

pub const Ctx = struct {
    c: c.___tracy_c_zone_context,

    pub fn end(self: Ctx) void {
        c.___tracy_emit_zone_end(self.c);
    }
};

pub fn trace(comptime src: std.builtin.SourceLocation) callconv(.Inline) Ctx {
    const loc: c.___tracy_source_location_data = .{
        .name = null,
        .function = src.fn_name.ptr,
        .file = src.file.ptr,
        .line = src.line,
        .color = 0,
    };
    return Ctx{
        .c = c.___tracy_emit_zone_begin_callstack(&loc, 1, 1),
    };
}
