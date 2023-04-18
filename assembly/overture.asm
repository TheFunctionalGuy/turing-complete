#subruledef register
{
  r0 => 0b000
  r1 => 0b001
  r2 => 0b010
  r3 => 0b011
  r4 => 0b100
  r5 => 0b101
}

#ruledef OVERTURE
{
  ; Immediate
  ld #{value: u6}                  => value`8
  ld #{value: u6}, {dst: register} => value`8 @ asm { mov r0, {dst} }
  ld #{value: u6}, out             => value`8 @ asm { mov r0, out }

  ; Compute
  or   => 0x40
  nand => 0x41
  nor  => 0x42
  and  => 0x43
  add  => 0x44
  sub  => 0x45

  ; Copy
  mov {src: register}, {dst: register} => 0b10 @ src @ dst
  ; Special cases (IO registers)
  mov in, {dst: register}              => 0b10 @ 0b110 @ dst
  mov {src: register}, out             => 0b10 @ src   @ 0b110
  mov in, out                          => 0b10 @ 0b110 @ 0b110

  ; Condition
  btm  => 0xC0

  ez   => 0xC1
  jez  {label: u6} => label`8 @ asm { ez }

  lz   => 0xC2
  jlz  {label: u6} => label`8 @ asm { lz }

  lez  => 0xC3
  jlez {label: u6} => label`8 @ asm { lez }

  top  => 0xC4
  jmp  {label: u6} => label`8 @ asm { top }

  nez  => 0xC5
  jnez {label: u6} => label`8 @ asm { nez }

  gz   => 0xC6
  jgz  {label: u6} => label`8 @ asm { gz }

  gez  => 0xC7
  jgez {label: u6} => label`8 @ asm { gez }
}
