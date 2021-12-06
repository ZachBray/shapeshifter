open Core
open Core_bench
open Shapeshifter

let () =
  Memtrace.trace_if_requested () ;
  let unsafe = Unsafe_buffer.acquire ~byte_length:4l in
  Command.run
    (Bench.make_command
       [ Bench.Test.create ~name:"unsafe buffer set" (fun () ->
             Unsafe_buffer.set_i32 ~offset:0l ~value:4l unsafe ) ] ) ;
  Unsafe_buffer.release unsafe
