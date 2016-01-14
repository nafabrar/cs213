.pos 0x100

	# a[i] = a[i+1] + b[i+2]
	ld $i, r0		   		# r0 = address of i
	ld 0(r0), r0			# r0 = i
	mov r0,r1				# r1 = i
	inc r1					# r1 = i + 1
	ld $a, r2				# r2 = address of a
	ld (r2, r0, 4), r0  	# r0 = a[i]
	ld (r2, r1, 4), r2		# r2 = a[1 + 1]
	ld $b, r3				# r3 = address of b
	inc r1					# r1 = i + 2
	ld (r3, r1 4), r3		# r3 = b[i + 2]
	add r3, r2				# r2 = a[i + 1] + b[i + 2]
	st r2, 0(r0)			# a[i] = a[i+1] + b[i+2]

	# d[i] = a[i] + b[i]
	ld $i, r0				# r0 = address of i
	ld 0(r0), r0			# r0 = i
	ld $a, r1				# r1 = address of a
	ld (r1, r0, 4), r1		# r1 = a[i]
	ld $b, r2				# r2 = address of b	
	ld (r2, r0, 4), r2		# r2 = b[i]
	add r2, r1				# r1 = a[i] + b[i]
	ld $d, r2				# r2 = address of d
	st r1, (r2, r0, 4)		# d[i] = a[i] + b[i]

	# d[i] = a[b[i]] + b[a[i]]
	ld $i, r0				# r0 = address of i
	ld 0(r0), r0			# r0 = i
	ld $a, r1				# r1 = address of a
	ld (r1, r0, 4), r1		# r1 = a[i]	
	ld $b, r2				# r2 = address of b	
	ld (r2, r1, 4), r1		# r1 = b[a[i]]
	ld (r2, r0, 4), r2		# r2 = b[i]
	ld $a, r3				# r3 = address of a
	ld (r3, r2, 4), r2		# r2 = a[b[i]]
	add r2, r1				# r1 = a[b[i]] + b[a[i]]
	ld $d, r2				# r2 = address of d
	st r1, (r2, r0, 4)		# d[i] = a[b[i]] + b[a[i]]

	# b[a[i & 3] & 3]
	ld $i, r0				# r0 = address of i
	ld 0(r0), r0			# r0 = i
	ld $3, r1				# r1 = 3
	mov r1, r3				# r3 = 3
	ld $a, r2				# r2 = address of a
	and r0, r1				# r1 = i & 3
	ld (r2, r1, 4), r2		# r2 = a[i & 3]
	and r3, r2				# r2 = a[i & 3] & 3
	ld $b, r3				# r3 = address of b
	ld (r3, r2, 4), r2		# r2 = b[a[i & 3] & 3]

	# a[b[i & 3] & 3]
	ld (r3, r1, 4), r3		# r3 = b[i & 3]
	ld $3, r1				# r1 = 3
	and r3, r1				# r1 = b[i & 3] & 3
	ld $a, r3				# r3 = address of a
	ld (r3, r1, 4), r1		# r1 = a[b[i & 3] & 3]

	# b[a[i & 3] & 3] - a[b[i & 3] & 3]
	not r1					# r1 = ~a[b[i & 3] & 3]
	inc r1					# r1 = ~a[b[i & 3] & 3] + 1
	add r2, r1				# r1 = b[a[i & 3] & 3] + ~a[b[i & 3] & 3] + 1

	# d[b[i]] = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i]
	ld $d, r2				# r2 = address of d
	ld $b, r3				# r3 = address of b
	ld (r2, r0, 4), r2		# r2 = d[i]
	add r2, r1				# r1 = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i]
	ld (r3, r0, 4), r3		# r3 = b[i]
	ld $d, r2				# r2 = address of d
	ld (r2, r3, 4), r2		# r2 = d[b[i]]
	st r1, 0(r2)			# d[b[i]] = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i]



	.pos 0x200
	# Data area

	a: .long0				# a[0]
	   .long0				# a[1]
	   .long0				# a[2]
	   .long0				# a[3]
	   .long0				# a[4]
	   .long0				# a[5]
	   .long0				# a[6]
	   .long0				# a[7]
	b: .long0				# b[0]
	   .long0				# b[1]
	   .long0				# b[2]
	   .long0				# b[3]
	   .long0				# b[4]
	   .long0				# b[5]
	   .long0				# b[6]
	   .long0				# b[7]
	c: .long0				# c[0]
	   .long0				# c[1]
	   .long0				# c[2]
	   .long0				# c[3]
	   .long0				# c[4]
	   .long0				# c[5]
	   .long0				# c[6]
	   .long0				# c[7]
	i: .long0				# i
	d:  .long c             # d










	
