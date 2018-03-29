.data

.text
	# shift left logical allows you to shift a bit to the left
	addi $s0, $zero, 4
	sll $t0, $s0, 2 # multiply 2 to the i (4)
	li $v0, 1
	add $a0, $zero, $t0
	syscall
	