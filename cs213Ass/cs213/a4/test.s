.pos 0x100
a: .long 0
b: .long 0
c: .long 0
d: .long 0
e: .long 0
f: .long 0
g: .long 0
h: .long 0
i: .long 0
j: .long 0

# testing branch (expected r1 = 0x3 and r2 = 0x4)
ldi:	   br brt		# goto brt
           ld $0x1, r1 		# r1 = 0x1
           ld $0x2, r2		# r2 = 0x2
brt:       ld $0x3, r1		# r1 = 0x3
	   ld $0x4, r2		# r2 = 0x4
# branch if equal (expected r5 = 0x6)
ldi:      ld $0x0, r1		# r1 = 0
          beq r1, bie		# goto bie if r1 == 0
          ld $0x5, r5		# r5 = 0x5
bie:      ld $0x6, r5		# r5 = 0x6
# branch if greater (expected r5 = 0x6)
ldi:      ld $0x1, r1		# r1 = 0
          bgt r1, big		# goto big if r1 > 0
          ld $0x5, r5		# r5 = 0x5
big:      ld $0x6, r5		# r5 = 0x6	
# testing jump (expected r5 = 0x6)
ldi:      j jmp			# jumpto jmp
          ld $0x5, r5		# r5 = 0x5
jmp:      ld $0x6, r5		# r5 = 0x6 
# testing get pc (expected r0 = address that gpctest references)
ldi:      gpc $1, r0		# r0 = pc(address next instruction)
gpctest:  ld $0x6, r5		# r5 = 0x6 
# indirect jump (expected r1 = 2 after one jump loop)
ldi:      ld $0x0, r1		# r1 = 0
          gpc $1, r0		# r0 = pc(address next instruction)
          inc r1		# r1 = 0 + 1 = 1
          j 0(r0)		# r1 = 1 + 1 = 2	
          
          
              
