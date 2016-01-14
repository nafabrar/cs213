
int main (int argc, char** argv) {

int y = 8;

while (y != 0) {
	y = y - 1;
	printVariable = f(argv[y]);
	printf("%i\n, printVariable);
}
 
}


int f(int av) {
	int i = 0;
	while (av > 0) {
		if (!(av & 0x8000000)) {
			av = av*2;
		}
		else { i = i + 1; }
	}
}
	
