_default:
    @just --list --unsorted

# Assemble FILE to stdout
assemble FILE *ARGS:
    @customasm --quiet --print {{FILE}} | python post.py {{ARGS}}

# Assemble FILE to OUTPUT
assemble-into FILE OUTPUT *ARGS:
    @customasm --quiet --print {{FILE}} | python post.py -o {{OUTPUT}} {{ARGS}}
