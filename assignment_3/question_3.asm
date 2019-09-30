.data
	n1: .asciiz "Enter the Nth natural number: "
	naivef: .asciiz "Naive: "
	interestingf: .asciiz "Interesting: "
	error: .asciiz "Input is erroneous"
	nextLine: .asciiz "\n"

.text

.globl main

main: 

	li $v0, 4
	la $a0, n1
	syscall

	li $v0, 5	
	syscall
	move $t0, $v0	
	
 	slti $s1, $t0, 0 
 	beq $s1,0, R
 	li $v0, 4 
 	la $a0, error 
 	syscall
 	li $v0, 10              
 	syscall 
	
 R:
  
   jal naive
   jal interesting
  
   li $v0, 10              
   syscall  
   
# Naive method
naive:
	move $t7, $t0
	for_loop:
	BLT $t7,1,Exit

	mult $t7, $t7
	mflo $s0
	mult $s0, $t7
	mflo $s1

	add $s2, $s2, $s1

	Sub $t7, $t7, 1

	j for_loop

	Exit:
	 #print string
  	 li $v0, 4 
  	 la $a0, interestingf
  	 syscall
  	 
	li $v0,1
	add $a0, $zero, $s2
	syscall
	
	# store return value
	jr $ra

# interesting 
interesting:
   
  # using the formula: (N(N+1)/2)^2
 	 add $t1, $t0, 1
  	 mul $t2, $t0, $t1 
  	 div $t3, $t2, 2 
  	 mul $t3, $t3, $t3
  	 
  	 li $v0, 4 
  	 la $a0, nextLine
  	 syscall
   
  	 li $v0, 4 
  	 la $a0, interestingf
  	 syscall
   	
  	 li $v0, 1
  	 move $a0, $t3
  	 syscall
  	# store return value
  	jr $ra
	
	
