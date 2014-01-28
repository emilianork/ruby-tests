require File.expand_path(File.join(File.dirname(__FILE__), "linked_list"))

def assert(message, boolean)
  puts "#{" "*3}#{message}#{" "*(50-message.size)} [PASS]" if boolean
  puts "#{" "*3}#{message}#{" "*(50-message.size)} [FAIL]" if !boolean
end

test_linked_list = TestLinkedList.new

assert("Empty list", test_linked_list.empty_list)
assert("One node with no cycle", test_linked_list.single_node_no_cycle)
assert("One node with cycle", test_linked_list.single_node_cycle)
assert("Huge list with no cycle", test_linked_list.huge_list_no_cycle)
assert("Huge list with cycle", test_linked_list.huge_list_cycle)
