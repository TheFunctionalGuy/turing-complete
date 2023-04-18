#include "rules/overture.asm"
#include "rules/robot_controls.asm"

main:
  ; Get in position
  forward
  forward
  forward
  forward
  forward
  forward

  ; Face targets
  left

; Kill row
kill_row:
  shoot
  shoot
  shoot
  shoot
  shoot

; Turn around 180 degrees
turn_around:
  left
  left

; Wait until enemies arivec
wait_for_enemy:
  wait
  see
  jez wait_for_enemy 
  jmp kill_row
