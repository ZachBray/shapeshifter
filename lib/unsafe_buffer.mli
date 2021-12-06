(** A buffer that allows positional writes and reads without bounds checks.

    Assumes little-endian byte ordering. *)
type t

(* This signature defines functions using [external] rather than [val]. It
   leaks implementation details, but according to the manual {{:
   https://ocaml.org/manual/intfc.html#ss:c-prim-decl} using [external] can
   improve performance slightly}. *)

external acquire : byte_length:(int32[@unboxed]) -> t
  = "unsafe_buffer_acquire_byte" "unsafe_buffer_acquire"
  [@@noalloc]
(** Obtains a buffer with the supplied [byte_length]. To avoid memory leaks,
    consumers must call [release] once they no longer need the returned
    buffer instance. *)

external release : t -> unit
  = "unsafe_buffer_release_byte" "unsafe_buffer_release"
  [@@noalloc]
(** Releases a buffer so that it can be reused or its memory can be freed. *)

external get_i8 : offset:(int32[@unboxed]) -> t -> (int32[@unboxed])
  = "unsafe_buffer_get_i8_byte" "unsafe_buffer_get_i8"
  [@@noalloc]
(** Reads the signed, 8-bit integer stored in the buffer at the supplied
    [offset]. *)

external get_i32 : offset:(int32[@unboxed]) -> t -> (int32[@unboxed])
  = "unsafe_buffer_get_i32_byte" "unsafe_buffer_get_i32"
  [@@noalloc]
(** Reads the signed, 32-bit integer stored at in the buffer the supplied
    [offset]. *)

external get_f64 : offset:(int32[@unboxed]) -> t -> (float[@unboxed])
  = "unsafe_buffer_get_f64_byte" "unsafe_buffer_get_f64"
  [@@noalloc]
(** Reads the 64-bit, floating-point number stored in the buffer at the
    supplied [offset]. *)

external set_i8 :
  offset:(int32[@unboxed]) -> value:(int32[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_i8_byte" "unsafe_buffer_set_i8"
  [@@noalloc]
(** Writes a signed, 8-bit integer to the buffer at the supplied [offset]. *)

external set_i32 :
  offset:(int32[@unboxed]) -> value:(int32[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_i32_byte" "unsafe_buffer_set_i32"
  [@@noalloc]
(** Writes a signed, 32-bit integer to the buffer at the supplied [offset]. *)

external set_f64 :
  offset:(int32[@unboxed]) -> value:(float[@unboxed]) -> t -> unit
  = "unsafe_buffer_set_f64_byte" "unsafe_buffer_set_f64"
  [@@noalloc]
(** Writes a 64-bit, floating-point number to the buffer at the supplied
    [offset]. *)
