.data
	newLine: .asciiz "\n"
.text
	main: 
		# Print value
		addi $s0, $zero, 10
		jal increaseMyRegister
		jal printTheValue
	
	# This line is going to signal end of program
	li $v0, 10
	syscall

	# t registers are safe; if you are using them you don't have to save the value to the stack
	# it's different for s registers
	# we don't want procedures to modify s registers so we save the old value to a stack
	increaseMyRegister:
		# every value is 4 bytes
		addi $sp, $sp, -8 # allocates 8 bytes, stack goes does, minus because we're allocating space

		sw $s0, 0($sp) # save value to first location in the stack pointer
		sw $ra, 4($sp) # the address will be stored  
		
		# after that we can do whatever we want in the register
		addi $s0, $s0, 30
		
		# nested procedure
		jal printTheValue
		
		# restoring value of the stack by adding 4
		lw $s0, 0($sp)
		lw $ra, 4($sp)
		
		addi $sp, $sp, 4
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		jr $ra
		
	printTheValue:
		# print new value in function.
		li $v0, 1
		move $a0, $s0
		syscall
		jr $ra