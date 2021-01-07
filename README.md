# zig-tracy
![loc](https://sloc.xyz/github/nektro/zig-tracy)
[![license](https://img.shields.io/github/license/nektro/zig-tracy.svg)](https://github.com/nektro/zig-tracy/blob/master/LICENSE)
[![discord](https://img.shields.io/discord/551971034593755159.svg?logo=discord)](https://discord.gg/P6Y4zQC)

Zig bindings for the Tracy profiler.

https://github.com/wolfpld/tracy

Currently uses tracy v0.7.4

## Adding to your project
Using the https://github.com/nektro/zigmod package manager.

```yml
dependencies:
  - type: git
    path: https://github.com/nektro/zig-tracy
```

## Building
```
$ zigmod fetch
$ zig build -Dtarget=native-native-gnu.2.18
```

## License
MIT
