.pos 0x3000
copy: ld$0xffffffff4,r0  #r0=-12(sizeof callee frame)
      add r0,r5          #copy's frame
      ld $0,r3           #r2=i
      st r6,0x8(r5)      #return address on stack

loop condition: ld $src,r0          #ro=&src
                ld (r0,r3,4),r0     #r0=src[i]
                beq r0,done         #if src[i]==0 goto end


loopbody: st r0,(r5,r3,4)     #src[i]=dst[i]
          add 1,r3            #i++

 gototop: br loop             #go to start of while loop

 end: ld$0,r0                #r0=0
       st r0,(r5,r3,4)       #dst[i]=0
      ld$8(r5),r6            #return address on stack
      ld$12,r0               #r0=12
      add r0,r5              #deallocate copy's frame
      j 0x0(r6)              #go to return

.pos 0x2000
main:    ld$ sb,r5            #address of last word of stack
         inca r5              #address of word after stack
         gpc $0x6,r6          #return address
         j copy               #call copy
         halt                 #stop program

.pos 0x400                #src[0]-src[9]
src: .long 0x90
     .long 0x91
     .long 0x95
     .long 0x98c
     .long 0xff000000
     .long 0x600ff003
     .long 0x600ff005
     .long 0xf0000000
     .long 0x0
     .long 0x87424894
.pos 0x500
stt:.long0x0
    .long0x0
sb:.long0x0


       