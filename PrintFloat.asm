.data
	PI: .float 3.14
.text
	li $v0, 2 # for integers is 1, for strings it's 4
	lwc1 $f12, PI
	syscall