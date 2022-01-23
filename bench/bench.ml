open Core
open Core_bench
open Shapeshifter

let () =
  let unsafe = Unsafe_buffer.acquire ~byte_length:4 in
  Command.run
    (Bench.make_command
       [ Bench.Test.create ~name:"unsafe buffer set" (fun () ->
             Unsafe_buffer.set_i32 ~offset:0 ~value:4 unsafe ) ] ) ;
  Unsafe_buffer.release unsafe
