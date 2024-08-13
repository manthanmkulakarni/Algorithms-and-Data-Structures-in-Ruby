=begin
Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
=end

#Solution
def missing_number(nums)
    xor = 0
    for i in 0..nums.length
        xor^=i
    end
    nums.each do |num|
        xor^=num
    end
    xor
end

#Solution 2 (single pass)
def missing_number(nums)
    xor = 0
    xor^=(nums.length)
    nums.each_with_index do |num,idx|
        xor^=(num^idx)
    end
    xor
end