.data
	age: .word 23  # this is a word or integer, 32 bits or 4 bytes
.text
	# print an integer to the screen
	li $v0, 1
	lw $a0, age
	syscall 