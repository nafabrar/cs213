int array[10];
int *pointer=array;
void add(int arg0,int arg1){
    
    pointer[arg1]+=arg0;
    while(pointer[arg1] < 10){
    int printarray= pointer[arg1];
        printf("d/n",printarray)}
}

int main(int argc, char** argv){
    int x=1;
    int y=2;
    add(3,4);
    add(x,y);

}