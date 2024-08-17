=begin
Given the head of a linked list, remove the nth node from the end of the list and return its head.
=end

#Solution 1 (First find length and then remove l-n+1 node, O(n) requires 2 passes)

#Solution 1 (fast and slow pointer approach)
#Approach: Give a head start to a pointer by n steps then move other pointer till head_start reaches end of list

def remove_nth_from_end(head, n)
    return [] if head.nil?
    head_start = head
    follower = head
    prev_node = nil
    count = 0
    while count<n
        head_start = head_start.next
        count+=1
    end
    while head_start
        prev_node = follower
        follower = follower.next
        head_start = head_start.next
    end
    if prev_node.nil?
        head = follower.next
    else
        prev_node.next = follower.next
    end
    head
end
   