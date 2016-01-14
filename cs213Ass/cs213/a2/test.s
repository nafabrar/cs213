ldi: ld $0x00000008, r0
	ld $0x00000010, r1


ldbo: ld 4(r1), r2
ldi: ld $0x00000008, r0
	 ld $0x00000010, r1

ldin: ld (r0,r1,4), r4
      halt
ldi: ld $0x00000008, r0
	 ld $0x00000010, r1

stba: st r0,4(r1)
	  st r1,0(r2)

ldi: ld $0x00000008, r0
	 ld $0x00000010, r1

stin: st r1,(r2,r3,4)
	  st r0,(r6,r7,4)

ldi: ld $0x00000008, r0
	 ld $0x00000010, r1
rrmove: mov r0,r1
		mov rr1,r3
ldi: ld $0x00000008, r0
	 ld $0x00000010, r1
add: add r0,r1
	 add r1,r3
ldi: ld $0x00000008, r0
	 ld $0x00000010, r1
     ld $0x00000010, r3

and: and r0,r1
	 and r1,r3
ldi: ld $0x00000008, r0
	 ld $0x00000010, r1

inc: inc r0
	 inc r1
ldi: ld $0x00000008, r0
	 ld $0x00000010, r1

incaddress: inca r0
			inca r1

ldi: ld $0x00000008, r0
	 ld $0x00000010, r1
dec: dec r1
     dec r2

ldi: ld $0x00000008, r0
	 ld $0x00000010, r1

decaddr: deca r0
		deca r1
ldi: ld $0x00000008, r0
	 ld $0x00000010, r1

not: not r0
	 not r1

ldi: ld $0x00000008, r0
	 ld $0x00000010, r1

shift: shl $0x00223344,r0
	   shr $0x11223344,r1
	   halt
nop: nop
    halt


#Before every test I changed the register value of r0 and r1 to a multiple of 4.As few of the instructions required multiples of 4.After each tests
#the register values are reset by load immediate instruction.I stepped each instruction one by one and matched the register value with the expected
#value.The top left side showhed the register values in the simulator.My implentation worked.

