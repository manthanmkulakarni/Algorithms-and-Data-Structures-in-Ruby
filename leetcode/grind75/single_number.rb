=begin
Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
You must implement a solution with a linear runtime complexity and use only constant extra space.
=end

#Solution(a^a =0 , hence xoring all elements will give only the unique element)
def single_number(nums)
    unique_element = 0
    nums.each do |num|
        unique_element^=num
    end
    unique_element
end