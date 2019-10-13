.data
	string: .space 51
	palindrome_yes: .asciiz "Yes, the string is a palindrome"
	palindrome_not: .asciiz "“No, the string is not a palindrome."
	
.text 

.globl main

main:
	la $a0, string
 	li $a1, 51
 	# load string in $v0
 	li $v0, 8 
 	syscall
 	
 	# Let A = S
 	la $t0, string
 	
 	# For B = S, move B to the end, check that later
 	la $t1, string 
 	
 	# Function to find the last character in the string
 	check_last_character:
 		# extending byte into a 32-bit value at B
 		lb $t2, ($t1) 
 		
 		# if branch is equal to 0, loop out
 		beqz $t2, loop_out
 		 
 		# if not, increment the value of B
 		addi $t1, $t1, 1
 		
 		# recursively branch the function
 		b  check_last_character 
 	
 	# loop_out function 
 	loop_out:
		# subtract 2 to move back to new line 		
 		subi $t1, $t1, 2
 		
 	# function to check for the palindrome
 	checkPalindrome:
 		# Branch on greater than or equal to check if A >= B
 		bge $t0, $t1, palindrome
 		
 		# extending byte into a 32-bit value at A
 		lb $t2, ($t0) 
 		
 		# extending byte into a 32-bit value at B
 		lb $t3, ($t1)
 		
 		# if $t2 != $t3, not_palindrome
 		bne $t2, $t3, not_palindrome
 		
 		# else, increment A by 1 and decrement B by 1
 		addi $t0, $t0, 1
 		subi $t1, $t1, 1
 		
 		# recursively branch the function
 		b checkPalindrome
 		
 	# function to output if palindrome is there
 	palindrome:
 		la $a0, palindrome_yes
 		li $v0, 4
 		syscall
 		li $v0, 10 
 		syscall
 	
 	# function to output if not palindrome
 	not_palindrome:
 		la $a0, palindrome_not 
 		li $v0, 4
 		syscall
 		li $v0, 10
 		syscall
 	
 		
 		
 		


