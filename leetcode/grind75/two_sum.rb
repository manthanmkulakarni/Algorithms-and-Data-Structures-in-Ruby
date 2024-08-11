=begin
Problem: 
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.
=end

#Solution: Uses single pass
def two_sum(nums, target)
    lookup_hash = {}
    result = []
    for i in (0...nums.length)
     return [lookup_hash[target-nums[i]],i] if lookup_hash.has_key?(target-nums[i])
     lookup_hash[nums[i]] = i
    end
end
