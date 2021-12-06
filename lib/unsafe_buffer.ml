type t

external acquire : byte_length:(int32[@unboxed]) -> t
  = "unsafe_buffer_acquire_byte" "unsafe_buffer_acquire"
  [@@noalloc]

external release : t -> unit
  = "unsafe_buffer_release_byte" "unsafe_buffer_release"
  [@@noalloc]

external get_i8 : offset:(int32[@unboxed]) -> t -> (int32[@unboxed])
  = "unsafe_buffer_get_i8_byte" "unsafe_buffer_get_i8"
  [@@noalloc]

external get_i32 : offset:(int32[@unboxed]) -> t -> (int32[@unboxed])
  = "unsafe_buffer_get_i32_byte" "unsafe_buffer_get_i32"
  [@@noalloc]

external get_f64 : offset:(int32[@unboxed]) -> t -> (float[@unboxed])
  = "unsafe_buffer_get_f64_byte" "unsafe_buffer_get_f64"
  [@@noalloc]

external set_i8 :
  offset:(int32[@unboxed]) -> value:(int32[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_i8_byte" "unsafe_buffer_set_i8"
  [@@noalloc]

external set_i32 :
  offset:(int32[@unboxed]) -> value:(int32[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_i32_byte" "unsafe_buffer_set_i32"
  [@@noalloc]

external set_f64 :
  offset:(int32[@unboxed]) -> value:(float[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_f64_byte" "unsafe_buffer_set_f64"
  [@@noalloc]
