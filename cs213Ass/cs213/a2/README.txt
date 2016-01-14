1.
a)
Name: Tony Huang
Student Number: 38023123
Name: Nafis
Student Number:58068131

b)
What the program prints at each command:

b foo: Breakpoint 1 at 0x40056c: file simple.c line 5.
r: Breakpoint 1, foo (s=0x40063e "Hello") at simple.c:5 
   5 printf ("%s world\n", s);
p s: $1 0x40063e "Hello"
c: Continuing.
   Hello World

value of s at breakpoint: "Hello"

c)
2a) - one memory reading required, to retrieve the static value of s.x[i]
2b) - two memory reading required, to retrieve dynamic values of s.y and s.y[i]
2c) - two memory reading required, to retrieve dynamic values of s.z and s.z->x[i]