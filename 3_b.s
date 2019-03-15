

.data

#swapping the elements in list and list2 of character arrays

list: .byte '6', '7', '8', '9'
list2: .byte '1', '2', '3', '4', '5'

.text
.globl main
.ent main
main:

li $t1, 3 #size of array 1.
li $t2, 4 #size of array 2.

la $s0, list  #address of list array in $s0.
la $s1, list2 #address of list2 array in $s1.



li $t0, 0
loop3:  					#t0, t6, t7, t8 are all temp registers
  bgt $t0, $t1, exit3	#exit condition
  
  
  
  add $t6, $zero, $t0       #index of the respective iteration
  
  
  
  
  add $t7, $t6, $s0         #combining to get address in array1.
  lb $t8, 0($t7)			#add result to $t8 for checking.
  
  
  add $s6, $zero, $t0       #index of the respective iteration
  
  
  
  
  add $s7, $s6, $s1         #combining to get address in array1.
  lb $s8, 0($s7)			#add result to $t8 for checking.
  
  #Now we are going to swap s8 and t8
  
  sb $s8, 0($t7)
  sb $t8, 0($s7)
  
  
  
  
  
  addi $t0, $t0, 1
  j loop3
exit3:

#now we have to swap the characters in $t1, $t2

add $s3, $zero, $t2
add $t2, $zero, $t1
add $t1, $zero, $s3


#the below loops are for checking

li $t0, 0
loop1:  					#t0, t6, t7, t8 are all temp registers
  bgt $t0, $t1, exit1
  add $t6, $zero, $t0
 
  add $t7, $t6, $s0
  lb $t8, 0($t7)
  addi $t0, $t0, 1
  j loop1
exit1:






li $t0, 0
loop2:  					#t0, t6, t7, t8 are all temp registers
  bgt $t0, $t2, exit2 
  add $t6, $zero, $t0

  add $t7, $t6, $s1
  lb $t8, 0($t7)
  addi $t0, $t0, 1
  j loop2
exit2:







  
li $v0, 10
syscall

.end main
