type t

external acquire : byte_length:(int[@untagged]) -> t
  = "unsafe_buffer_acquire_byte" "unsafe_buffer_acquire"
  [@@noalloc]

external release : t -> unit
  = "unsafe_buffer_release_byte" "unsafe_buffer_release"
  [@@noalloc]

external get_i8 : offset:(int[@untagged]) -> t -> (int[@untagged])
  = "unsafe_buffer_get_i8_byte" "unsafe_buffer_get_i8"
  [@@noalloc]

external get_i32 : offset:(int[@untagged]) -> t -> (int[@untagged])
  = "unsafe_buffer_get_i32_byte" "unsafe_buffer_get_i32"
  [@@noalloc]

external get_i32_boxed : offset:(int[@untagged]) -> t -> (int32[@unboxed])
  = "unsafe_buffer_get_i32_boxed_byte" "unsafe_buffer_get_i32_boxed"
  [@@noalloc]

external get_i63 : offset:(int[@untagged]) -> t -> (int[@untagged])
  = "unsafe_buffer_get_i63_byte" "unsafe_buffer_get_i63"
  [@@noalloc]

external get_i64_boxed : offset:(int[@untagged]) -> t -> (int64[@unboxed])
  = "unsafe_buffer_get_i64_boxed_byte" "unsafe_buffer_get_i64_boxed"
  [@@noalloc]

external get_f64 : offset:(int[@untagged]) -> t -> (float[@unboxed])
  = "unsafe_buffer_get_f64_byte" "unsafe_buffer_get_f64"
  [@@noalloc]

external set_i8 :
  offset:(int[@untagged]) -> value:(int[@untagged]) -> t -> unit
  = "unsafe_buffer_set_i8_byte" "unsafe_buffer_set_i8"
  [@@noalloc]

external set_i32 :
  offset:(int[@untagged]) -> value:(int[@untagged]) -> t -> unit
  = "unsafe_buffer_set_i32_byte" "unsafe_buffer_set_i32"
  [@@noalloc]

external set_i32_boxed :
  offset:(int[@untagged]) -> value:(int32[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_i32_boxed_byte" "unsafe_buffer_set_i32_boxed"
  [@@noalloc]

external set_i63 :
  offset:(int[@untagged]) -> value:(int[@untagged]) -> t -> unit
  = "unsafe_buffer_set_i63_byte" "unsafe_buffer_set_i63"
  [@@noalloc]

external set_i64_boxed :
  offset:(int[@untagged]) -> value:(int64[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_i64_boxed_byte" "unsafe_buffer_set_i64_boxed"
  [@@noalloc]

external set_f64 :
  offset:(int[@untagged]) -> value:(float[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_f64_byte" "unsafe_buffer_set_f64"
  [@@noalloc]
