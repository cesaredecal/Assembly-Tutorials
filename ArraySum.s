.data
	voti: .word 30, 18, 28, 22, 18, 19, 30, 29, 27, 20
	fineStr: .asciiz "Fine!"
	sommaStr: .asciiz "Somma:"
.text
.globl main

# indirizzo in $a0
# indice in $t3
# somma in $s4
# 40 in $s3 (num max)

main:	
	# Lunghezza array
	addi $s3, $zero, 40
	
	# Carico in $a0 indirizzo array
	la $a0, voti
	
	# Offset
	add $s0, $zero, $zero
	
	# Somma
	add $s4, $zero, $zero
	
	jal somma
somma:
	bne $s0, $s3, fine
	addi $a0, $a0, 4
	
	# Prendi elemento da array
	
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
