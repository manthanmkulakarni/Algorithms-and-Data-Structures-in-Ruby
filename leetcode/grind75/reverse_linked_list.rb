=begin
Given the head of a singly linked list, reverse the list, and return the reversed list.
=end

#Solution (iterative)
def reverse_list(head)
    current = head
    prev_node = nil
    until current.nil?
        next_node = current.next
        current.next = prev_node
        prev_node = current
        current = next_node
    end
    head = prev_node
    head
end

#Solution (recursive: idea is to reach the last node of the linked list using recursion then start reversing the linked list)
def reverse_list(head)
    return head if head.nil? or head.next.nil?
    last_node = reverse_list(head.next)
    head.next.next = head
    head.next = nil
    return last_node
end