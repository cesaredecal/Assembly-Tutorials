.data 
	message: .asciiz "Hi, everybody! My name is Cesare.\n"
.text
	# Functions arez  reusable
	# Calling a function means reusing a function
	# To call a function first create it
	# In MIPS they're called procedures
	# A label is just a name with a colon
	main:
		jal displayMessage
		addi $s0, $zero, 5
		li $v0, 1
		add $a0, $zero, $s0
		syscall	

		# Tell the computer that the program is done
		# This is mandatory, it tells the system that the program is done
		li $v0, 10
		syscall
	displayMessage:
		li $v0, 4
		la $a0, message
		syscall
		
		# go back to precedure which called it
		jr $ra