.data

r2: .word 0


.text
.globl main
.ent main
main:

li $s0, -23 #the subject.
li $s2, 0

li $s1, 1

sll $s1, $s1, 31

and $s2, $s0, $s1

slt $s2 , $s2 , $zero

sw $s2, r2

exit:

li $v0, 10
syscall

.end main



#We store 0 in s2 if number in s0 is positive and 1 in s2 if number is negative.


