=begin
Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
=end

#Solution
def sorted_squares(nums)
    left = 0
    right = nums.length-1
    squared_nums = [nil]*nums.length
    curr_index = right
    while left<=right
        left_num_sq = nums[left]**2
        right_num_sq = nums[right]**2
        if left_num_sq >right_num_sq
            squared_nums[curr_index]= left_num_sq
            left+=1
        else
            squared_nums[curr_index]= right_num_sq
            right-=1
        end
        curr_index-=1
    end
    squared_nums
end