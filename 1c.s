.data

zeroz: .word 0
onez: .word 0

.text
.globl main
.ent main
main:

li $s0, 20
li $s1, 1 # for and'ing

li $s3, 0 #number of zero groups.
li $s4, 0 #number of one groups.

#
and $t0, $s0, $s1

bne $t0, $zero, adds4

addi $s3, $s3, 1
j loop

adds4:
addi $s4, $s4, 1


#

loop:

beq $s0, $zero, exit

and $t0, $s0, $s1


srl $s0, $s0, 1
and $t1, $s0, $s1

bne $t0, $t1, addd

j loop

addd:

and $t2, $s1, $t0

beq $t2, $zero, go1

bne $t2, $zero, go2

go1:
addi $s4,$s4,1
j loop

go2:
addi $s3,$s3,1
j loop

sw $s3, zeroz
sw $s4, onez

exit:

li $v0, 10
syscall

.end main



