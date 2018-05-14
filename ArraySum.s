.data
	voti: .word 30, 18, 28, 22, 18, 19, 30, 29, 27, 20
	fineStr: .asciiz "Fine!"
	sommaStr: .asciiz "Somma:"
.text
.globl main

# indirizzo in $a0
# indice in $t3
# somma in $t4
# 40 in $t0 (num max)

main:	
	addi $t3, $zero, 40
	la $a0, voti
	move $a1, $a0
	jal somma
somma:
	bne $t1, $t3, fine
	la $t0, voti
	addi $t3, $t3, 4
	add $t4, $t4, $t0
fine:
	li $v0, 4
	la $a0, sommaStr
	syscall
	
	li $v0, 1
	la $a0, $t4
	syscall
		
	li $v0, 4
	la $a0, fineStr
	syscall
