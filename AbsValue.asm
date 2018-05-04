.data
.globl main
.text

main:
	addi $t0, $zero, -10
	bltz $t0, rendiPositivo
	j fineProgramma
rendiPositivo:
	mul $t1, $t0, -1
	jr $ra
fineProgramma:
	li $v0, 1
	move $a0, $t1
	syscall
