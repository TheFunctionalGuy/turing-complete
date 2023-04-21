#include "rules/overture.asm"

; Input #1
mov in, r1
; Input #2
mov in, r2
nand

; Save input #2
mov r2, r4

; Take nand in1, in2 into register R2
mov r3, r2
nand

; Save intermediate value #1
mov r3, r5

mov r4, r1
nand

mov r3, r2
mov r5, r1
nand

; Copy to output
mov r3, out
