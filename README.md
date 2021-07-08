# zig-tracy
![loc](https://sloc.xyz/github/nektro/zig-tracy)
[![license](https://img.shields.io/github/license/nektro/zig-tracy.svg)](https://github.com/nektro/zig-tracy/blob/master/LICENSE)
[![discord](https://img.shields.io/discord/551971034593755159.svg?logo=discord)](https://discord.gg/P6Y4zQC)

Zig integration for the Tracy profiler.

https://github.com/wolfpld/tracy

Currently uses tracy v0.7.7

## Adding to your project
Using the https://github.com/nektro/zigmod package manager.

```yml
dependencies:
  - src: git https://github.com/nektro/zig-tracy
```

## Adding it to your code
```zig
const tracy = @import("tracy");

fn function_i_wish_to_trace() void {
    const t = tracy.trace(@src());
    defer t.end();
    // ...
    // the rest of the function body
}
```

## Building
```
$ zigmod fetch
$ zig build -Dtarget=native-native-gnu.2.18
```

## License
MIT
