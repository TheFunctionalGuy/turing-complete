_default:
    @just --list

# Assemble FILE to stdout
assemble FILE:
    @customasm -f hexcomma -p {{FILE}} | python post.py

# Assemble FILE to OUTPUT
assemble-into FILE OUTPUT:
    @customasm -f hexcomma -p {{FILE}} | python post.py -o {{OUTPUT}}
