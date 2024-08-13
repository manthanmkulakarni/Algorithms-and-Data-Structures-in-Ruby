=begin
Given the head of a singly linked list, return true if it is a palindrome or false otherwise.
=end

#Solution
def is_palindrome(head)
    slow = head
    fast = head
    #find the middle of list
    until fast.nil? or fast.next.nil?
        slow = slow.next
        fast = fast.next.next
    end

    # reverse the second half of list
    prev =nil
    until slow.nil?
        next_node = slow.next
        slow.next = prev
        prev = slow
        slow = next_node
    end
    
    #compare elements of first half and second half
    until prev.nil?
        return false unless prev.val==head.val
        prev = prev.next
        head = head.next
    end
    true
end