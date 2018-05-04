.data
	numero: .word 0, 0, 0, 0, 1, 0, 1, 0
	strExit: .asciiz "Uscita programma"
.globl main
.text

main: 
	la $a0, numero # carico array in memoria in $a0
	jal CA2
	li $v0, 17
	syscall
CA2:	
	li $t5, 8 # # dimensione dell'array
	addi $t0, $a0, 28 # l'ultimo elemento dell'array
ciclo1:
	# BLTZ -- Branch on less than zero
	# Branches if the register is less than zero
	bltz $t5, fine1
	lw $t7, 0($t0)
	addi $t5, $t5, -1
	addi $t0, $t0, -4
	beq $t7, $zero, ciclo1
	# si invertono tutti gli elementi restanti
ciclo2: 
	# t5 contiene indice/una sorta di dimensione dell'array
	beqz $t5, fine1 # se non ci sono piu' elementi si va alla fine
	la $a0, 0($t0)
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal inverti
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	addi $t5, $t5, -1
	addi $t0, $t0, -4
	j ciclo2
inverti:
	lw $t3, 0($a0)
	bgtz $t3, uno
	addi $t3, $t3, 1
	
	li $v0, 1
	move $a0, $t3 
	syscall
uno:
	addi $t3, $t3, -1
fine1:
	jr $ra
fine2:
	sw $t3, 0($a0)
exit:
	li $v0, 4
	la $a0, strExit
	syscall
	
	li $v0, 10
	syscall
