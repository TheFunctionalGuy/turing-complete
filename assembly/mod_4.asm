#include "overture.asm"

; Load mod 4 mask
ld #3, r2
mov in, r1
and
mov r3, out
