.pos 0x100
start:
    ld $sb, r5			# sp = address of last word of stack
    inca    r5			# sp = address of word after stack
    gpc $6, r6			# ra = pc + 6
    j main			# call main(k)
    halt

f:
    deca r5			# sp = callee part of 
    ld $0, r0			# r0 = 0;
    ld 4(r5), r1		# load r1 = ra of main
    ld $0x80000000, r2		# r2 = 0x80000000
f_loop:
    beq r1, f_end		# goto f_end if r1 == 0
    mov r1, r3			# move r3 content to r1
    and r2, r3			# r2 & r3
    beq r3, f_if1		# goto f_if1 if r3 == 0
    inc r0			# r0 = r0 + 1
f_if1:
    shl $1, r1			# r1 = r2/2
    br f_loop			# goto f_loop (loop)
f_end:
    inca r5			# r5 = r5 + 4
    j(r6)			# return

main:
    deca r5			# sp = allocate callee part of main's frame
    deca r5			# sp = allocate callee part of main's frame
    st r6, 4(r5)		# save ra on stack
    ld $8, r4			# r4 = 8
main_loop:
    beq r4, main_end		# goto main_end if r4 == 0
    dec r4			# r4 = 8 - 1
    ld $x, r0			# r0 = address of x
    ld (r0,r4,4), r0		# load memory at address (x + 7)
    deca r5			# sp = r5 - 4
    st r0, (r5)			# l0 = memory at address (x + 7)	
    gpc $6, r6			# r6 = pc + 6
    j f				# call to f()
    inca r5			# r5 = r5 + 4		
    ld $y, r1			# r1 = address of y
    st r0, (r1,r4,4)		# store r0 into address of y + 7
    br main_loop		# goto main_loop (loop)
main_end:
    ld 4(r5), r6		# r6 = r5 + 4
    inca r5			# r5 = r5 + 4
    inca r5			# r5 = r5 + 4
    j (r6)			# return (and halt)

.pos 0x2000
x:
    .long 1
    .long 2
    .long 3
    .long 0xffffffff
    .long 0xfffffffe
    .long 0
    .long 184
    .long 340057058

y:
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0

.pos 0x8000
# These are here so you can see (some of) the stack contents.
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
sb: .long 0

