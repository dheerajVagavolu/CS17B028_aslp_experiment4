.data

list: .space 16 #first 32 bit number
list2: .space 16 #Second 32 bit number
list3: .space 16

.text
.globl main
.ent main
main:
addi $s0, $zero, 4
addi $s1, $zero, 5
addi $s2, $zero, 6
addi $s3, $zero, 11111


addi $t0, $zero ,0

sw $s0, list($t0)
addi $t0, $t0, 4
sw $s1, list($t0)
addi $t0, $t0, 4
sw $s2, list($t0)
addi $t0, $t0, 4
sw $s3, list($t0)


addi $s0, $zero, 88
addi $s1, $zero, -7
addi $s2, $zero, 45
addi $s3, $zero, 1


addi $t0, $zero ,0

sw $s0, list2($t0)
addi $t0, $t0, 4
sw $s1, list2($t0)
addi $t0, $t0, 4
sw $s2, list2($t0)
addi $t0, $t0, 4
sw $s3, list2($t0)


################################

li $t8, 0
li $t9, 4

looop:

beq $t8, $t9, exit1

li $t4, 0 #carry
lw $t1, list($t0)
lw $t2, list2($t0)
add $t3, $t1, $t2
add $t3, $t3, $t4

add $s5, $zero, $t3
sw $s5, list3($t0) 

#check if both are positive or both are negative\



bgt $t1, $zero, pos1
j pass
pos1:

bgt $t2, $zero, pos2
j pass2

pos2:

blt $t3,$zero, pos3
j pass2

pos3:

li $t4, 1

j pass2

pass:
bgt $zero, $t1, poss1

poss1:

bgt $zero, $t2, poss2
j pass2
poss2:

bgt $t3, $zero, poss3
j pass2
poss3:

li $t4, 1


pass2:

#At this point we have got the overflow for first eight bits

sub $t0, $t0, 4

addi $t8, $t8, 1
#################################################################
j looop

exit1:



#printing

exit:

li $v0, 10
syscall

.end main
