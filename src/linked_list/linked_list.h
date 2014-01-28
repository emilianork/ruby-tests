#ifndef LINKED_LIST_H_
#define LINKED_LIST_H_

#ifndef BOOLEANS
#define BOOLEANS

#define TRUE 1
#define FALSE 0

#endif

struct ll_element {
	int element;
	struct ll_element* next;
};

struct linked_list {
	struct ll_element* front;
};

struct ll_element* ll_element_init(int);
void ll_element_destroy(struct ll_element*);

struct linked_list* linked_list_init(void);
void linked_list_destroy(struct linked_list*);

void insert_key(int,struct linked_list*);

void insert_node(struct ll_element*, struct linked_list*);

struct ll_element* has_cycled(struct linked_list*);

#endif
