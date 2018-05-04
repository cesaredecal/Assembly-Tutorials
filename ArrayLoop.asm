# Arrays and loops in MIPS
# Arrays and loops go hand in hand

.data
	myArray: .space 40 # how many numbers do you want to store? an integer is 4 bytes so 40 bytes = 10 numbers
	newLine: .asciiz "\n"
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
	
	# Loop through the array to print the values of the array
	# clear
	addi $t0, $zero, 0
	while:
		beq $t0, 12, exit # we need 12 bytes
		lw $t6, myArray($t0)
		addi $t0, $t0, 4 # add 4 to $t0 at every loop iteration
		
		li $v0, 1
		move $a0, $t6
		syscall
		
		# New line
		li $v0, 4 # for text
		la $a0, newLine
		syscall
		
		# Update offset so we don't have endless loop
		j while	
	exit:
		li $v0, 10
		syscall
		
