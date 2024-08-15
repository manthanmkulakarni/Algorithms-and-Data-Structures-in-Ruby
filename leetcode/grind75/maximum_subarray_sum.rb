=begin
Given an integer array nums,
find the subarray with the largest sum, and return its sum.
=end

# Solution 1 (Kadane's Algorithm)
def max_sub_array(nums)
    max_sum = nums[0]
    curr_sum = 0
    nums.each do |num|
        curr_sum=0 if curr_sum<0
        curr_sum+=num
        max_sum = curr_sum if curr_sum>max_sum
    end
    max_sum
end

# Solution 2 (Using Dynamic Programming)
#TO DO