#include "rules/overture.asm"
#include "rules/robot_controls.asm"

; Masks
wall = 0x1
exit = 0x3
coin = 0x8

seek_wall:
  left
  see r3
  jez move
  mov r3, r1
  ld #wall, r2
  and
  mov r3, r1
  sub
  jez seek_path
  jmp seek_wall

seek_path:
  right
  see r3
  jez move
  mov r3, r4
  mov r4, r1
  ld #coin, r2
  and
  mov r3, r1
  sub
  jez move
  mov r4, r1
  ld #exit, r2
  and
  mov r3, r1
  sub
  jez take_exit
  jmp seek_path

move:
  forward
  jmp seek_wall

take_exit:
  use
