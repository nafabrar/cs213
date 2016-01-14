.pos 0x1000
code: 
# v = s.x[i]
      ld $i, r0 	# r0 = address of i
      ld (r0), r0	# r0 = (value of) i
      ld $s, r1		# r1 = address of s
      ld (r1,r0,4), r0  # r0 = (value of) s.x[i]
      ld $v, r1		# r1 = address of v
      st r0, (r1)       # v = s.x[i]
      halt
# v = s.y[i]
      ld $i, r0 	# r0 = address of i
      ld (r0), r0	# r0 = (value of) i
      ld $s, r1		# r1 = address of s
      ld 8(r1), r1      # r0 = (value of) s.y (aka address of y)
      ld (r1, r0, 4), r0# r0 = (value of) s.y[i]
      ld $v, r2		# r2 = address of v
      st r0, (r2)	# v = s.y[i]
      halt
# v = s.z->x[i]
      ld $i, r0		# r0 = address of i
      ld (r0), r0	# r0 = (value of) i
      ld $s, r1		# r1 = address of s
      ld 12(r1), r1     # r1 = (value of) s.z (aka address of heap1)
      ld (r1, r0, 4), r0# r0 = (value of) s.z->x[i]
      ld $v, r2		# r2 = address of v
      st r0, (r2)	# v = s.z->x[i] 
      halt

.pos 0x2000
static:
i: .long 0		# i
v: .long 0		# v
s: .long 0		# s.x[0]
   .long 0		# s.x[1]
   .long heap0		# s.y
   .long heap1		# s.z		
   

.pos 0x3000
heap0: .long 0		# y_value0
       .long 0		# y_value1
heap1: .long 0		# s.z->x[0]
       .long 0		# s.z->x[1]
       .long 0		# s.z->y
       .long 0		# s.z->z