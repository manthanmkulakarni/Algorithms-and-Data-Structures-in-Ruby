=begin
You are given the heads of two sorted linked lists list1 and list2.
Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
Return the head of the merged linked list.
=end

#Solution
def merge_two_lists(list1, list2)
    result = []
    curr_1 = list1
    curr_2 = list2
    until curr_1.nil? or curr_2.nil?
        if curr_1.val<=curr_2.val
          result.push(curr_1.val)
          curr_1 = curr_1.next
        else
          result.push(curr_2.val)
          curr_2 = curr_2.next
        end

        if curr_1.nil?
            until curr_2.nil?
                result.push(curr_2.val)
                curr_2 = curr_2.next
            end
            break
        end

        if curr_2.nil?
            until curr_1.nil?
                result.push(curr_1.val)
                curr_1 = curr_1.next
            end
            break
        end
    end    
    result
end