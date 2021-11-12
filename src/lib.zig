const std = @import("std");

pub const c = @cImport({
    @cDefine("TRACY_ENABLE", "");
    @cInclude("TracyC.h");
});

pub const Frame = struct {
    name: [*c]const u8,

    pub fn end(self: Frame) void {
        c.___tracy_emit_frame_mark_end(self.name);
    }
};

pub fn frame(name: ?[*c]const u8) callconv(.Inline) Frame {
    const f = Frame{
        .name = if (name) |n| n else null,
    };
    c.___tracy_emit_frame_mark_start(f.name);
    return f;
}

pub const Ctx = struct {
    c: c.___tracy_c_zone_context,

    pub fn end(self: Ctx) void {
        c.___tracy_emit_zone_end(self.c);
    }
};

pub fn trace(comptime src: std.builtin.SourceLocation, name: ?[*c]const u8) callconv(.Inline) Ctx {
    const loc: c.___tracy_source_location_data = .{
        .name = if (name) |n| n else null,
        .function = src.fn_name.ptr,
        .file = src.file.ptr,
        .line = src.line,
        .color = 0,
    };
    return Ctx{
        .c = c.___tracy_emit_zone_begin_callstack(&loc, 1, 1),
    };
}
