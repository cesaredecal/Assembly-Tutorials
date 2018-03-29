.data

.text
	addi $s0, $zero, 10 # immediate is a constant, add 10 plus 0 and store the sum in the $s0 register
	addi $s1, $zero, 4
	
	mul $t0, $s0, $s1 # it takes 3 registers, take $s0 and $s1 and store product in $t0
	
	# you can only multiply two numbers that are 16 bits long (product should be maximum 32 bits)
	
	li $v0, 1
	add $a0, $zero, $t0 # store product in $a0
	syscall