.data 
	myDouble: .double 7.202
	zeroDouble: .double 0.0
.text
	ldc1 $f2, myDouble
	ldc1 $f0, zeroDouble
	li $v0, 3 # 3 is the number for doubles
	add.d $f12, $f2, $f0
	syscall 