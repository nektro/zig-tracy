id: sn3eifbmh2px7ufmofu3voa4ep4xzbx4fkm7kca0jtx85c7d
name: tracy
main: src/lib.zig
license: MIT
description: Zig integration for the Tracy profiler.
dependencies:
  - src: git https://github.com/wolfpld/tracy tag-v0.7.8
    c_include_dirs:
      -
    c_source_flags:
      - -DTRACY_ENABLE
      - -fno-sanitize=undefined
    c_source_files:
      - TracyClient.cpp
  - src: system_lib c++
  - src: system_lib Ws2_32
    only_os: windows
  - src: system_lib DbgHelp
    only_os: windows
