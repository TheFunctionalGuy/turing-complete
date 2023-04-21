#ruledef robot_controls {
  left                => asm { ld #0, out }
  forward             => asm { ld #1, out }
  right               => asm { ld #2, out }
  wait                => asm { ld #3, out }
  use                 => asm { ld #4, out }
  shoot               => asm { ld #5, out }
  see {dst: register} => asm { mov in, {dst} }
}
