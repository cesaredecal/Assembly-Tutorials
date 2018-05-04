.data
	prompt: .asciiz "Enter your age: "
	message: .asciiz "\n"
.text 	
	# Prompt user to enter age
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Get the user's age
	li $v0, 5 # system call to tell the system that we want to get an integer from the keyboard
	# The number is going to be stored in $t0
	syscall