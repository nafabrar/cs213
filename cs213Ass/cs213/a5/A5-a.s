.pos 0x0
                 ld   $sb, r5 #address of last word of stack
                 inca r5      #address of word after stack
                 gpc  $6, r6  #ra=pc +6
                 j    0x300   #main()
                 halt         #stop
.pos 0x100
                 .long 0x00001000  #pointer = address of 0x00001000
.pos 0x200
                 ld   0x0(r5), r0   #r0=arg0
                 ld   0x4(r5), r1   #r1=arg1
                 ld   $0x100, r2    #r2=0x100
                 ld   0x0(r2), r2    #r2=value stored in $0x100 naming it pointer
                 ld   (r2, r1, 4), r3 #r3=pointer[arg1]
                 add  r3, r0           #r0=arg0 +pointer[arg1]
                 st   r0, (r2, r1, 4)   #pointer[arg1]=arg0+pointer[arg1]
                 j    0x0(r6)         #return address
.pos 0x300
                 ld   $0xfffffff4, r0  #r0=-12
                 add  r0, r5           #allocate main's frame
                 st   r6, 0x8(r5)      #return address on stack
                 ld   $0x1, r0         #r0=1
                 st   r0, 0x0(r5)      #r0=1=x
                 ld   $0x2, r0         #r0=2
                 st   r0, 0x4(r5)      #r0=y=2
                 ld   $0xfffffff8, r0  #r0=-8
                 add  r0, r5           #allocate new frame (caller)for add

                 ld   $0x3, r0         #r0=3
                 st   r0, 0x0(r5)      #r0=arg0=3
                 ld   $0x4, r0         #r0=4
                 st   r0, 0x4(r5)      #arg1=4
                 gpc  $6, r6           #ra=pc +6
                 j    0x200            #go to add
                 ld   $0x8, r0         #r0=8
                 add  r0, r5           #deallocate add frame
                 ld   0x0(r5), r1      #r1=x
                 ld   0x4(r5), r2      #r2=y
                 ld   $0xfffffff8, r0  #r0=-8
                 add  r0, r5           #allocate add frame
                 st   r1, 0x0(r5)      #arg0=x
                 st   r2, 0x4(r5)      #arg1=y
                 gpc  $6, r6           #ra=pc+6
                 j    0x200            #call add_at(x,y)
                 ld   $0x8, r0         #r0=return address from stack
                 add  r0, r5           #deallocate add_at frame
                 ld   0x8(r5), r6      #
                 ld   $0xc, r0         #r0=12
                 add  r0, r5           #deallocate main's frame
                 j    0x0(r6)          #return
.pos 0x1000 #arr[0]-arr[9]
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
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
