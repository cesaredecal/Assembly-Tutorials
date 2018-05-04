.data
	risultato: .word 0
	numeroDaRaggiungere: .word 5 # quante volte 
	contatoreAzzeramento: .word 0 # quante volte e' stato azzerato
	
.globl main
.text

main:	
	# Carica i valori nei registri
	lw $t0, risultato($zero)
	lw $t1, numeroDaRaggiungere($zero)
	lw $t2, contatoreAzzeramento($zero)
	j controllo
controllo:
	beq $t0, $t1, fineProgramma
	j aumentaRisultato	
aumentaRisultato:
	addi $t0, $t0, 1
	j controllo
fineProgramma:
	# Aumenta di 1 il contatore azzeramento
	addi $t2, $zero, 1
	
	# Termina esecuzione programma
	li $v0, 10 
	syscall
