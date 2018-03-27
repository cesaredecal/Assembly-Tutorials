.data 
	myDouble: .double 7.202
	zeroDouble: .double 0.0
.text
	# it takes two registers
	# it always takes a pair
	# always use even register numbers
	# it's a special case, it uses 64 bits instead of 32
	ldc1 $f2, myDouble
	ldc1 $f0, zeroDouble
	li $v0, 3 # 3 is the number for doubles
	add.d $f12, $f2, $f0
	syscall 