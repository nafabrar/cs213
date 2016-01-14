#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* 
 * Class Person
 */
 
 struct Person_class {
	 void* super;
	 //void (* new_Person) (char* name);
	 void (* toString  ) (void*     );
	
 }
 
 struct Person {
	 struct Person_class* class;
	 char* name;
 }
 
 //void new_Person (char* name) { }
 void Person_toString (void* thisP) {
	 struct Person* this = thisP;
	 printf ("Name of person: (%c)", this->name);
	 this->class->super->toString (this);
 }
 
 struct Person_class Person_class_obj = { NULL, new_Person, Person_toString}
 
struct Person* new_Person(char* name) {
	struct Person* obj = malloc (sizeof (struct Person));
	obj->class = &Person_class_obj;
	obj->name = name;
	return obj;
}

/*
 * Class Student extends Person
 */
 
 struct Student_class {
	 struct Person_class* super;
	 //void (* new_Student) (char* name);
	 void (* toString  ) (void*     );
 }
 
 struct Student {
	 struct Student_class* class;
	 char* name;
	 int sid;
 }
 
 //void new_Student(char* name, int sid) { }
 void Student_toString (void* thisS) { 
     struct Person* this = thisS;
	 printf ("Name of student: (%c)", this->name);
	 printf ("Student Id of student: (%d)", this->sid);
	 this->class->super->toString (this);
 }
 
 struct Student Student_class_obj = { &Person_class_obj, new_Student, Student_toString }
 
 struct Student* new_Student(char* name, int sid) {
	 struct Student* obj = malloc (sizeof (struct Student));
	 obj->class = &Student_class_obj;
	 obj->name = name;
	 obj->sid = sid;
	 return obj;
 }
 
 /*
  * A6_2's main and print
  */
  
void print(void* aVP) {
	
void main(int argc, char** argv) {
	numberOfElements = 
	for (int i = 0; 
	
  