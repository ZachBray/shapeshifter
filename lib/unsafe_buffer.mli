(** A buffer that allows positional writes and reads without bounds checks.

    Assumes little-endian byte ordering. *)
type t

(* This signature defines functions using [external] rather than [val]. It
   leaks implementation details, but according to the manual {{:
   https://ocaml.org/manual/intfc.html#ss:c-prim-decl} using [external] can
   improve performance slightly}. *)

external acquire : byte_length:(int[@untagged]) -> t
  = "unsafe_buffer_acquire_byte" "unsafe_buffer_acquire"
  [@@noalloc]
(** Obtains a buffer with the supplied [byte_length]. To avoid memory leaks,
    consumers must call [release] once they no longer need the returned
    buffer instance. *)

external release : t -> unit
  = "unsafe_buffer_release_byte" "unsafe_buffer_release"
  [@@noalloc]
(** Releases a buffer so that it can be reused or its memory can be freed. *)

external get_i8 : offset:(int[@untagged]) -> t -> (int[@untagged])
  = "unsafe_buffer_get_i8_byte" "unsafe_buffer_get_i8"
  [@@noalloc]
(** Reads the signed, 8-bit integer stored in the buffer at the supplied
    [offset]. *)

external get_i32 : offset:(int[@untagged]) -> t -> (int[@untagged])
  = "unsafe_buffer_get_i32_byte" "unsafe_buffer_get_i32"
  [@@noalloc]
(** Reads the signed, 32-bit integer stored in the buffer at the supplied
    [offset] into a native [int]. *)

external get_i32_boxed : offset:(int[@untagged]) -> t -> (int32[@unboxed])
  = "unsafe_buffer_get_i32_boxed_byte" "unsafe_buffer_get_i32_boxed"
  [@@noalloc]
(** Reads the signed, 32-bit integer stored in the buffer at the supplied
    [offset] into a [int32]. *)

external get_i63 : offset:(int[@untagged]) -> t -> (int[@untagged])
  = "unsafe_buffer_get_i63_byte" "unsafe_buffer_get_i63"
  [@@noalloc]
(** Reads the signed, 63-bit integer stored (using 8 bytes) in the buffer at
    the supplied at [offset] into a native [int]. *)

external get_i64_boxed : offset:(int[@untagged]) -> t -> (int64[@unboxed])
  = "unsafe_buffer_get_i64_boxed_byte" "unsafe_buffer_get_i64_boxed"
  [@@noalloc]
(** Reads the signed, 64-bit integer stored in the buffer at the supplied
    [offset] into a [int64]. *)

external get_f64 : offset:(int[@untagged]) -> t -> (float[@unboxed])
  = "unsafe_buffer_get_f64_byte" "unsafe_buffer_get_f64"
  [@@noalloc]
(** Reads the 64-bit, floating-point number stored in the buffer at the
    supplied [offset]. *)

external set_i8 :
  offset:(int[@untagged]) -> value:(int[@untagged]) -> t -> unit
  = "unsafe_buffer_set_i8_byte" "unsafe_buffer_set_i8"
  [@@noalloc]
(** Writes a signed, 8-bit integer to the buffer at the supplied [offset]. *)

external set_i32 :
  offset:(int[@untagged]) -> value:(int[@untagged]) -> t -> unit
  = "unsafe_buffer_set_i32_byte" "unsafe_buffer_set_i32"
  [@@noalloc]
(** Writes a signed, 32-bit integer to the buffer at the supplied [offset]. *)

external set_i32_boxed :
  offset:(int[@untagged]) -> value:(int32[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_i32_boxed_byte" "unsafe_buffer_set_i32_boxed"
  [@@noalloc]
(** Writes a signed, 32-bit integer to the buffer at the supplied [offset]. *)

external set_i63 :
  offset:(int[@untagged]) -> value:(int[@untagged]) -> t -> unit
  = "unsafe_buffer_set_i63_byte" "unsafe_buffer_set_i63"
  [@@noalloc]
(** Writes a signed, 63-bit integer to the buffer (using 8 bytes) at the
    supplied [offset]. *)

external set_i64_boxed :
  offset:(int[@untagged]) -> value:(int64[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_i64_boxed_byte" "unsafe_buffer_set_i64_boxed"
  [@@noalloc]
(** Writes a signed, 64-bit integer to the buffer at the supplied [offset]. *)

external set_f64 :
  offset:(int[@untagged]) -> value:(float[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_f64_byte" "unsafe_buffer_set_f64"
  [@@noalloc]
(** Writes a 64-bit, floating-point number to the buffer at the supplied
    [offset]. *)
