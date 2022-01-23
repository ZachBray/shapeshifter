open Base
open Base_quickcheck
open Shapeshifter

module type Test_case_iface = sig
  type t [@@deriving quickcheck, sexp]

  val value_byte_length : int

  val set_value : offset:int -> value:t -> Unsafe_buffer.t -> unit

  val get_value : offset:int -> Unsafe_buffer.t -> t

  val assert_same : t -> t -> unit
end

module RoundTripTests (C : Test_case_iface) = struct
  open C

  (** The length (in bytes) of the buffer to construct for each test. *)
  let buffer_length = 64

  (** Creates a buffer of length [buffer_byte_length], passes it to the
      supplied function [f], and releases the buffer, regardless of whether
      [f] raised an exception. *)
  let use_buffer f =
    let buffer = Unsafe_buffer.acquire ~byte_length:buffer_length in
    try
      let r = f buffer in
      Unsafe_buffer.release buffer ;
      r
    with e ->
      Unsafe_buffer.release buffer ;
      raise e

  (** The maximum offset that a value of type [C.t] may be stored within an
      [Unsafe_buffer] of length [buffer_byte_length]. *)
  let max_offset = buffer_length - value_byte_length

  type test_case =
    { offset:
        (int[@quickcheck.generator Generator.int_inclusive 0 max_offset])
    ; value: t }
  [@@deriving quickcheck, sexp]

  (* forall (value: C.t) (offset: nat), valid_offset(offset) ->
     seq(write(offset, value); read(offset)) = value *)
  let%test_unit "round trip" =
    Test.run_exn
      ( module struct
        type t = test_case [@@deriving quickcheck, sexp]
      end )
      ~f:(fun {offset; value} ->
        use_buffer (fun buffer ->
            let is_valid_offset = offset < buffer_length && offset >= 0 in
            if is_valid_offset then (
              set_value ~offset ~value buffer ;
              let found_value = get_value ~offset buffer in
              assert_same value found_value )
            else failwith "offset out of range." ) )
end

module I8_test_case : Test_case_iface = struct
  type t = (int[@quickcheck.generator Generator.int_inclusive (-128) 127])
  [@@deriving quickcheck, sexp]

  let value_byte_length = 4

  let set_value = Unsafe_buffer.set_i8

  let get_value = Unsafe_buffer.get_i8

  let assert_same expect actual = [%test_result: int] ~expect actual
end

let%test_module "i8" = (module RoundTripTests (I8_test_case))

module I32_test_case : Test_case_iface = struct
  type t =
    (int
    [@quickcheck.generator
      Generator.int_inclusive
        (Int32.to_int_exn Int32.min_value)
        (Int32.to_int_exn Int32.max_value)] )
  [@@deriving quickcheck, sexp]

  let value_byte_length = 4

  let set_value = Unsafe_buffer.set_i32

  let get_value = Unsafe_buffer.get_i32

  let assert_same expect actual = [%test_result: int] ~expect actual
end

let%test_module "i32" = (module RoundTripTests (I32_test_case))

module I32_boxed_test_case : Test_case_iface = struct
  type t = int32 [@@deriving quickcheck, sexp]

  let value_byte_length = 4

  let set_value = Unsafe_buffer.set_i32_boxed

  let get_value = Unsafe_buffer.get_i32_boxed

  let assert_same expect actual = [%test_result: int32] ~expect actual
end

let%test_module "i32_boxed" = (module RoundTripTests (I32_boxed_test_case))

module I63_test_case : Test_case_iface = struct
  type t =
    (int
    [@quickcheck.generator
      Generator.int_inclusive
        (Int63.to_int_exn Int63.min_value)
        (Int63.to_int_exn Int63.max_value)] )
  [@@deriving quickcheck, sexp]

  let value_byte_length = 8

  let set_value = Unsafe_buffer.set_i63

  let get_value = Unsafe_buffer.get_i63

  let assert_same expect actual = [%test_result: int] ~expect actual
end

let%test_module "i63" = (module RoundTripTests (I63_test_case))

module I64_boxed_test_case : Test_case_iface = struct
  type t = int64 [@@deriving quickcheck, sexp]

  let value_byte_length = 8

  let set_value = Unsafe_buffer.set_i64_boxed

  let get_value = Unsafe_buffer.get_i64_boxed

  let assert_same expect actual = [%test_result: int64] ~expect actual
end

let%test_module "i64_boxed" = (module RoundTripTests (I64_boxed_test_case))

module F64_test_case : Test_case_iface = struct
  type t = float [@@deriving quickcheck, sexp]

  let value_byte_length = 8

  let set_value = Unsafe_buffer.set_f64

  let get_value = Unsafe_buffer.get_f64

  let assert_same expect actual = [%test_result: float] ~expect actual
end

let%test_module "f64" = (module RoundTripTests (F64_test_case))
