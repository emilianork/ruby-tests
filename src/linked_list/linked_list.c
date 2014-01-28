#include "linked_list.h"

#include <stdlib.h>

struct ll_element* ll_element_init(int element) 
{
	struct ll_element* node = 
		(struct ll_element*) malloc(sizeof(struct ll_element));

	node->element = element;
	node->next = NULL;
	
	return node;
}

void ll_element_destroy(struct ll_element* node)
{
	free(node);
}

struct linked_list* linked_list_init() 
{

	struct linked_list* list = 
		(struct linked_list*) malloc(sizeof(struct linked_list));
	
	list->front = NULL;

	return list;
}

void linked_list_destroy(struct linked_list* list) 
{
	struct ll_element *tmp1, *tmp2, *begin;
	tmp1 = list->front;
	
	if (has_cycled(list))
		begin = tmp1;

	for (tmp1 = list->front; tmp1 != NULL; tmp1 = tmp2) {
		tmp2 = tmp1->next;
		if (begin != tmp1)
			free(tmp1);
		else
			break;
	}

	free(list);
} 

void insert_key(int element, struct linked_list* list) 
{
	insert_node(ll_element_init(element), list);	
}

void insert_node(struct ll_element* element, struct linked_list* list)
{
	if (element == NULL || list == NULL) 
		return;

	element->next = list->front;
	list->front = element;
}


struct ll_element*  has_cycled(struct linked_list* list)
{	
	struct ll_element *hare, *turtle;

	hare = turtle = list->front;
	int count = FALSE;
	
	while (hare != NULL) {
		if (count) {
			turtle = turtle->next;
			count  = FALSE;
		} else {
			count = TRUE;
		}
		hare = hare->next;
		
		if (hare == turtle) 
			return hare;
	}
	
	return NULL;
}
