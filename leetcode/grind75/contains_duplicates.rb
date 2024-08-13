=begin
Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
=end

#Solution 1(Using sets to remove duplicates)
def contains_duplicate(nums)
    require 'set'
    set_nums = nums.to_set
    set_nums.to_a.size != nums.size
end

#Solution 2(using uniq function to remove duplicates)
def contains_duplicate(nums)
    nums.uniq.size != nums.size
end

#Solution 3(using hashmap to track count of elements)
def contains_duplicate(nums)
    count_map = Hash.new(0)
    nums.each do |num|
        return true if count_map[num]>0
        count_map[num]+=1
    end
    false
end