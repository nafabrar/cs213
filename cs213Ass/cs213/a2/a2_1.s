.pos 0x100

	# b = c + 10
	ld $c, r0				# r0 = address of c
	ld 0(r0), r0			# r0 = (value of) c
	ld $10, r1	  			# r1 = 10
	add r1, r0				# r0 = c + 10
	ld $b, r1				# r1 = address of b
	st r0, 0(r1)			# b = c + 10

	# a[4] = a[4] + 4
	ld $a, r0				# r0 = address of a
	ld 0(r0), r0			# r0 = a
	ld $4, r1				# r1 = 4
	
	ld (r0, r1, 4), r1 		# r1 = a[4]
	add r0,	r1				# r1 = a[4] + 4
	st r1, 0(r0)			# a[4] = a[4] + 4

	# a[b & 0x7]
	ld $b, r0				# r0 = address of b
	ld 0(r0), r0			# r0 = b
	ld $7, r1				# r1 = 0x7
	and r1, r0				# r0 = b & 0x7
	ld $a, r1				# r1 = address of a
	ld (r1, r0, 4), r0		# r0 = a[b & 0x7]

	# b + a[b & 0x7]
	ld $b, r1				# r1 = address of b
	ld 0(r1), r1			# r1 = b
	add r1, r0				# r0 = b + a[b & 0x7]


	# a[c] = a[8] + b + a[b & 0x7]
	ld $c, r2				# r2 = address of c
	ld 0(r2), r2			# r2 = c
	ld $a, r1				# r1 = address of a
	ld 0(r1), r1			# r1 = a
	ld (r1, r2, 4), r2		# r2 = a[c]
	ld $8, r3				# r3 = 8
	ld (r3, r1, 4), r1		# r1 = a[8]
	add r1, r0				# r0 = a[8] + b + a[b & 0x7]
	st r0, 0(r2)			# a[c] = a[8] + b + a[b & 0x7]

	halt


	.pos 0x200
	# Data area

	b: .long0				# b
	c: .long0				# c
	a: .long0				# a[0]
	   .long0				# a[1]
	   .long0				# a[2]
	   .long0				# a[3]
	   .long0				# a[4]
	   .long0				# a[5]
	   .long0				# a[6]
	   .long0				# a[7]
	   .long0				# a[8]
	   .long0				# a[9]   



