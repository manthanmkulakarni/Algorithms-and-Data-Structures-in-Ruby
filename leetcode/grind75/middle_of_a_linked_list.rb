=begin
Given the head of a singly linked list, return the middle node of the linked list.
If there are two middle nodes, return the second middle node.
=end

#Approach:Use of fast and slow pointers,similar to finding cycle in linked list,
# fast pointer moves 2 steps so when fast pointer reaches end of list then slow is in the middle

#Solution
def middle_node(head)
    return head if head.nil? or head.next.nil?
    slow = head
    fast = head.next
    until fast.nil?
        fast = fast.next
        fast = fast.next unless fast.nil?
        slow = slow.next
    end
    slow
end