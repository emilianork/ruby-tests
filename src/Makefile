CC=gcc
CFLAGS=-I.
DEPS=linked_list.h
OBJ=linked_list/linked_list.o
SHARED=linked_list/linked_list.so
# Regla por patron
# $@ invoca al target y $< invoca al primer prerequisito 
%.o: %.c 
	$(CC) -c -o $@ $< $(CFLAGS) 

# Regla por patron
%.so: %.o 
	gcc -shared -o $@ $< 

compile: $(SHARED)

clean: compile
	rm $(SHARED)
