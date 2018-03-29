.data
	newLine: .asciiz "\n"
.text
	main: 
		# Print value
		addi $s0, $zero, 10
		
		jal increaseMyRegister
		
		li $v0, 1
		move $a0, $s0
		syscall
	
	# This line is going to signal end of program
	li $v0, 10
	syscall

	# t registers are safe
	# we don't want procedures to modify s registers so we save the old value to a stack
	increaseMyRegister:
		# in order to use $s registers in functions, you are supposed to save the old value
		# to do so, allocate enough space in the stack
		addi $sp, $sp, -4 # allocates 4 bytes, stack goes does, minus because we're allocating space
		sw $s0, 0($sp) # save value to first location in the stack pointer
		
		
		# after that we can do whatever we want in the register
		addi $s0, $s0, 30
		
		# print new value in function.
		li $v0, 1
		move $a0, $s0
		syscall
		
		# restoring value of the stack by adding 4
		lw $s0, 0($sp)
		addi $sp, $sp, 4
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		jr $ra