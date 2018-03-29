.data

.text 
	main:
		# By convention store arguments in $a0-$a3 registers
		addi $a1, $zero, 50
		addi $a2, $zero, 100
		jal addNumbers
		
		li $v0, 1
		add $a0, $v1, 0
		syscall
		
		# Tell the system that the program is done
	li $v0, 10
	syscall		
	
	addNumbers:
		# By conventions programmers store return values in $v0-$v1 registers
		add $v1, $a1, $a2
		jr $ra # go back to the calling place
		