# stdjson

stdjson is a Cangjie package that implements JSON encoding/decoding using `stdx.encoding.json`.  

This is a copy of `stdx.encoding.json` separate from `stdx`. Changes from the original:

* namespace change: `stdx.encoding.json.*` -> `stdjson.*`
* namespace change: `stdx.encoding.json.stream.*` -> `stdjson.*`

## Building

### Build Requirements

To build this package, you must have the following tools installed and available in your system's PATH:

*   **C Compiler**: Clang or GCC
*   **CMake**

### How it Works

To use `stdjson` in your project, download the latest release and extract the `stdjson` folder
into your project directory. Then, configure your `cjpm.toml` to use it as a binary dependency.

### Static Linking

```toml
[package]
  cjc-version = "1.0.5"
  name = "test"
  description = "nothing here"
  version = "1.0.0"
  target-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[target.aarch64-apple-darwin.bin-dependencies]
  path-option = ["stdjson/darwin_aarch64_cjnative/static/stdjson"]

[target.x86_64-unknown-linux-gnu.bin-dependencies]
  path-option = ["stdjson/linux_x86_64_cjnative/static/stdjson"]

[target.x86_64-w64-mingw32.bin-dependencies]
  path-option = ["stdjson/windows_x86_64_cjnative/static/stdjson"]
```

### Dynamic Linking

```toml
[package]
  cjc-version = "1.0.5"
  name = "test"
  description = "nothing here"
  version = "1.0.0"
  target-dir = ""
  output-type = "executable"
  compile-option = ""
  override-compile-option = ""
  link-option = ""
  package-configuration = {}

[target.aarch64-apple-darwin.bin-dependencies]
  path-option = ["stdjson/darwin_aarch64_cjnative/dynamic/stdjson"]

[target.x86_64-unknown-linux-gnu.bin-dependencies]
  path-option = ["stdjson/linux_x86_64_cjnative/dynamic/stdjson"]

[target.x86_64-w64-mingw32.bin-dependencies]
  path-option = ["stdjson/windows_x86_64_cjnative/dynamic/stdjson"]
```

## License

Apache License
