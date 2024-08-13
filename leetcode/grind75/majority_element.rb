=begin
Given an array nums of size n, return the majority element.
The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.
=end

#Solution 1(Sort the array, the middle element will always be majority as it occurs more than n/2 times)
# If exitence of majority was not guaranteed then we need to use binary search to find leftmost and rightmost indexes
#  and check if number of occurences > n/2 or not.
def majority_element(nums)
    nums.sort!
    nums[nums.length/2]
end

#Solution 2 (Using hashmap to count frequency then check which element has frequency>n/2)
def majority_element(nums)
    occurence_count = nums.tally
    occurence_count.each do |key,val|
        return key if val > nums.length/2
    end
    return nil
end

#Solution 3 (Boyer-Moore Majority Voting Algorithm: https://www.geeksforgeeks.org/boyer-moore-majority-voting-algorithm/)
# this is most efficient O(n) time and O(1) space
# Alert: candidate may not always be majority if existence is not ensured please check with one more loop after finding candidate.
def majority_element(nums)
    votes = 0
    candidate = nums[0]
    nums.each do |num|
        if votes == 0
            candidate = num
            votes = 1
        elsif num == candidate
            votes+=1 
        else
            votes-=1
        end
    end
    candidate
end