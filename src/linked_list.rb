require 'ffi'

module LinkedList
  extend FFI::Library
  ffi_lib "linked_list/linked_list.so"
 
  class Element < FFI::Struct
    layout :next, :pointer,
           :element, :int
  end
  
  class LinkedList < FFI::Struct
    layout :front, :pointer
  end

  attach_function :ll_element_init, [:int], Element.by_ref
  attach_function :ll_element_destroy, [Element.by_ref], :void

  attach_function :linked_list_init, [], LinkedList.by_ref
  attach_function :linked_list_destroy, [LinkedList.by_ref], :void

  attach_function :insert_key, [:int,LinkedList.by_ref], :void
  attach_function :insert_node, [Element.by_ref,LinkedList.by_ref], :void
  attach_function :has_cycled, [LinkedList.by_ref], Element.by_ref

end

class TestLinkedList
  def empty_list
    list = LinkedList.linked_list_init
    result = LinkedList.has_cycled(list).null?
    LinkedList.linked_list_destroy(list)
    result
  end
  
  def single_node_no_cycle
    list = LinkedList.linked_list_init
    LinkedList.insert_key(rand(100),list)
    result = LinkedList.has_cycled(list).null?
    LinkedList.linked_list_destroy(list)
    result
  end

  def single_node_cycle
    list = LinkedList.linked_list_init
    node = LinkedList.ll_element_init(rand(10000))
    2.times {
      LinkedList.insert_node(node,list)
    }
    result = LinkedList.has_cycled(list).null?
    LinkedList.linked_list_destroy(list)
    !result
  end

  def huge_list_no_cycle
    list = LinkedList.linked_list_init
    
    ( 1000 + rand(1000)).times { LinkedList.insert_key(rand(10000),list) }
    result = LinkedList.has_cycled(list).null?
    LinkedList.linked_list_destroy(list)
    result
  end

  def huge_list_cycle
    list = LinkedList.linked_list_init
    size = rand(1000)
    choice = rand(size)
    element = LinkedList.ll_element_init(rand(1000))
    last_element = LinkedList.ll_element_init(rand(1000))
    size.times {
      LinkedList.insert_node(element, list) if (choice)
      LinkedList.insert_key(rand(1000),list)
    }
    LinkedList.insert_node(last_element,list)
    last_element[:next] = last_element.pointer

    result = LinkedList.has_cycled(list).null?
    LinkedList.linked_list_destroy(list)
    !result
  end
  
end
