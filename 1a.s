.data

ones: .word 0
zeros: .word 0

.text
.globl main
.ent main
main:

li $16, 0
li $20, 32
li $17, 5
li $18, 1
li $19, 1 

loop:

beq $18, $zero, exit

and $15, $18, $17

bgt $15, $zero, aad

sll $18, $18, 1

j loop

aad:

add $16, $16, $19

sll $18, $18, 1

j loop

exit: 

sub $20, $20, $16

sw $16, ones
sw $20, zeros

li $v0, 10
syscall

.end main

# The value of number of 1's is stored in register $16 and number of zero's stored in register $20.
# The register 17 stores the 32-bit number of which we want to find the number of bits.

#rest all are temporary registers for the loops.

