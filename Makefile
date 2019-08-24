# This file is a basic Makefile for complie multiple files and create executable file

#This is a comment in Makefile

#This is a variable, you can change this to gcc compiler for c code
CC=g++

#This is also variables,
# -c stand for compile
# -Wall is for warning (optional)
CFLAGS=-c -Wall
# to use those variables, we use $(variable name) in the line

OUTPUT=test
# we create a variable for output executable file as "test"


all: $(OUTPUT)
# all is a 'TARGET', when all was called, it will create 'test' (executable file)
# always keep it on the head like this

# simple syntax for compile
# TARGET: dependency (ex. main.cpp, hello, function1.cpp, {executable or cpp file})
# 		g++ -c dependency
# 'TARGET' is a target file we want, for example, hello.o, main.o, function1.o, function2.o
# when 'TARGET' was called, it will check the 'dependency' then compile it

$(OUTPUT): main.o MyClass.o
	$(CC) main.o MyClass.o -o $(OUTPUT)

main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp
# you can see that the dependency after : and the one in the next line must be same

MyClass.o: MyClass.cpp
	$(CC) $(CFLAGS) MyClass.cpp 

# when type 'make clean', it will remove all the file which contain .o and OUTPUT file
clean:
	rm -rf *o $(OUTPUT)

