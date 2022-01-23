## 0.0.2

### Added

- Support for reading and writing the following from/to an `Unsafe_buffer.t`:
    - 32-bit, signed integers (using `int`)
    - 63-bit, signed integers (using `int`)
    - 64-bit, signed integers (using `int64`)

### Changed

- (BREAKING) Offsets and lengths now expect `int` rather than `int32` to avoid
  boxing in OCaml.

## 0.0.1

### Added

- Support for reading and writing the following from/to an `Unsafe_buffer.t`:
    - 8-bit, signed integers (using `int32`)
    - 32-bit, signed integers (using `int32`)
    - 64-bit, floating-point numbers (using `float`)
