=begin
Given head, the head of a linked list, determine if the linked list has a cycle in it.
There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. 
Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
Return true if there is a cycle in the linked list. Otherwise, return false.
=end

#Solution 1 (using slow and fast pointers, Also called tortoise and hare)
def hasCycle(head)
    return false if head.nil? or head.next.nil?
    slow = head
    fast = head.next
    until slow == fast
        return false if fast.next.nil? or fast.next.next.nil?
        slow = slow.next
        fast = fast.next.next
    end
    true
end

#Solution 2 (using set/hash_map to track visited nodes)
def hasCycle(head)
    visited_nodes = {}
    until head.nil?
        return true if visited_nodes.has_key?(head)
        visited_nodes[head]=true
        head = head.next
    end
    false
end
