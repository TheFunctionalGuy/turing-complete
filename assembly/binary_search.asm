#include "overture.asm"

; Load 128 into r3 and r2
load_mask:
  ld #63, r1
  ld #1, r2
  add

  ; Mask register  [R2]
  mov r3, r2

  ; Create 128 in r3
  mov r3, r1
  shl


; Check current guess
check:
  mov r3, out

  ; Guess register [R5]
  mov r3, r5

  ; Retrieve answer
  mov in, r3

  jnez above


; Guess was below
below:
  ; Manipulate guess
  mov r5, r1
  or
  mov r3, r5

  ; Shift mask
  mov r2, r1
  shr
  mov r3, r2

  ; Restore guess
  mov r5, r3

  ; Jump back
  jmp check

; Guess was above
above:
  ; Shift mask
  mov r2, r1
  shr
  mov r3, r2

  ; Divide by two
  mov r5, r1
  shr
  jmp check
