.data
	numero: .word 20
	offset: .word 0
	obiettivo: .word 30
.globl main
.text 
main:
	lw $t0, numero($zero)
	lw $t1, obiettivo($zero)
	lw $t2, offset($zero)
	j controllo
controllo:
	bne $t0, $t1, ciclo
	j fineProgramma
ciclo:
	sw $t0, 
	addi $
	j controllo
fineProgramma:
	li $v0, 1
	syscall
