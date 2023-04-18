#subruledef src_reg
{
  r0 => 0x00
  r1 => 0x08
  r2 => 0x10
  r3 => 0x18
  r4 => 0x20
  r5 => 0x28
  in => 0x30
}

#subruledef dst_reg
{
  r0  => 0x00
  r1  => 0x01
  r2  => 0x02
  r3  => 0x03
  r4  => 0x04
  r5  => 0x05
  out => 0x06
}

#ruledef OVERTURE
{
  ; Immediate
  ld #{value: u6} => value`8

  ; Compute
  or   => 0x40
  nand => 0x41
  nor  => 0x42
  and  => 0x43
  add  => 0x44
  sub  => 0x45

  ; Copy
  mov {src: src_reg}, {dst: dst_reg} => {
    opcode = 0x80 + src + dst
    opcode`8
  }

  ; Condition
  btm  => 0xC0
  ez   => 0xC1
  lz   => 0xC2
  lez  => 0xC3
  top  => 0xC4
  nez  => 0xC5
  gz   => 0xC6
  gez  => 0xC7
}
