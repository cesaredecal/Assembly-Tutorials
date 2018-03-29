.data

.text
	addi $t0, $zero, 2000
	addi $t1, $zero, 10
	mult $t0, $t1 # mult for bigger integers, the product is going to be stored in two registers
	mflo $s0
	li $v0, 1
	add $a0, $zero, $s0
	syscall