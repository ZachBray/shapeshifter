#include <assert.h>
#include <stdlib.h>
#define CAML_NAME_SPACE
#include "caml/alloc.h"
#include "caml/misc.h"
#include "caml/memory.h"

inline void* as_ptr(value buffer) {
  return (void *) (buffer & ~1);
}

CAMLprim value unsafe_buffer_acquire(int32_t byte_length) {
  void *buffer_ptr = malloc(byte_length + 2);
  assert (((uintptr_t) buffer_ptr & 1) == 0);  // check correct alignment
  return (value) buffer_ptr | 1;
}

CAMLprim value unsafe_buffer_acquire_byte(value byte_length) {
  CAMLparam1(byte_length);
  CAMLlocal1(buffer);
  buffer = unsafe_buffer_acquire(Int32_val(byte_length));
  CAMLreturn(buffer);
}

CAMLprim void unsafe_buffer_release(value buffer) {
  void *buffer_ptr = as_ptr(buffer);
  free(buffer_ptr);
}

CAMLprim void unsafe_buffer_release_byte(value buffer) {
  CAMLparam1(buffer);
  unsafe_buffer_release(buffer);
  CAMLreturn0;
}

CAMLprim int32_t unsafe_buffer_get_i8(int32_t offset, value buffer) {
  signed char *value = (signed char*) (as_ptr(buffer) + offset);
  return *value;
}

CAMLprim value unsafe_buffer_get_i8_byte(value offset, value buffer) {
  CAMLparam2(offset, buffer);
  CAMLlocal1(val);
  val = caml_copy_int32(unsafe_buffer_get_i8(Int32_val(offset), buffer));
  CAMLreturn(val);
}

CAMLprim int32_t unsafe_buffer_get_i32(int32_t offset, value buffer) {
  int32_t *value = (int32_t*) (as_ptr(buffer) + offset);
  return *value;
}

CAMLprim value unsafe_buffer_get_i32_byte(value offset, value buffer) {
  CAMLparam2(offset, buffer);
  CAMLlocal1(val);
  val = caml_copy_int32(unsafe_buffer_get_i32(Int32_val(offset), buffer));
  CAMLreturn(val);
}

CAMLprim double unsafe_buffer_get_f64(int32_t offset, value buffer) {
  double *value = (double*) (as_ptr(buffer) + offset);
  return *value;
}

CAMLprim value unsafe_buffer_get_f64_byte(value offset, value buffer) {
  CAMLparam2(offset, buffer);
  CAMLlocal1(val);
  val = caml_copy_double(unsafe_buffer_get_f64(Int32_val(offset), buffer));
  CAMLreturn(val);
}

CAMLprim void unsafe_buffer_set_i8(int32_t offset, int32_t v, value buffer) {
  signed char *value = (signed char*) (as_ptr(buffer) + offset);
  signed char char_v = v;
  *value = char_v;
}

CAMLprim void unsafe_buffer_set_i8_byte(value offset, value v, value buffer) {
  CAMLparam3(offset, v, buffer);
  unsafe_buffer_set_i8(Int32_val(offset), Int32_val(v), buffer);
  CAMLreturn0;
}

CAMLprim void unsafe_buffer_set_i32(int32_t offset, int32_t v, value buffer) {
  int32_t *value = (int32_t*) (as_ptr(buffer) + offset);
  *value = v;
}

CAMLprim void unsafe_buffer_set_i32_byte(value offset, value v, value buffer) {
  CAMLparam3(offset, v, buffer);
  unsafe_buffer_set_i32(Int32_val(offset), Int32_val(v), buffer);
  CAMLreturn0;
}

CAMLprim void unsafe_buffer_set_f64(int32_t offset, double v, value buffer) {
  double *value = (double*) (as_ptr(buffer) + offset);
  *value = v;
}

CAMLprim void unsafe_buffer_set_f64_byte(value offset, value v, value buffer) {
  CAMLparam3(offset, v, buffer);
  unsafe_buffer_set_f64(Int32_val(offset), Double_val(v), buffer);
  CAMLreturn0;
}
