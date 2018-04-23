# Arrays in MIPS
# RAM is the primary memory of your computer
# Arrays and RAM are similar because they both have contiguous blocks of memory

.data
	myArray: .space 40 # how many numbers do you want to store? an integer is 4 bytes so 40 bytes = 10 numbers
.text
	# These numbers are in the processor (registers)
	addi $s0, $zero, 4
	addi $s1, $zero, 10
	addi $s2, $zero, 12
	# To store the numbers in memory RAM use store word
	# Index = $t0
	addi $t0, $zero, 0 # clearing $t0
	sw $s0, myArray($t0) # first position
	# update position
	addi $t0, $t0, 4
	sw $s1, myArray($t0) # storing at second position
	addi $t0, $t0, 4
	sw $s2, myArray($t0) # third location
	
	# All the values are now in RAM
	# How do we retrieve them now?
	lw $t6, myArray($zero)
	
	li $v0, 1
	addi $a0, $t6, 0
	syscall
	
	
	
