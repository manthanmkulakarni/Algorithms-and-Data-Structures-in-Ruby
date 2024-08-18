=begin
Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.
Return the sum of the three integers.

You may assume that each input would have exactly one solution.
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
=end

#Solution(130ms using early returns)
def three_sum_closest(nums, target)
    n = nums.length
  
    return nums[0] + nums[1] + nums[2] if n == 3
  
    nums.sort!
    max = nums[n - 1] + nums[n - 2] + nums[n - 3]
  
    return max if target > max
  
    min = ::Float::INFINITY
    (0...(n - 2)).each do |i|
      l = i + 1
      r = n - 1
      while l < r
        curr = nums[i]
        max = curr + nums[r - 1] + nums[r]
  
        break if target - max > min.abs
  
        min_sum = curr + nums[l] + nums[l + 1]
  
        break if min_sum - target > min.abs
  
        sum = curr + nums[l] + nums[r]
  
        return sum if sum == target
  
        diff = sum - target
        min = diff if diff.abs < min.abs
  
        r -= 1 if diff.positive?
  
        l += 1 if diff.negative?
      end
    end
  
    target + min
  end

  #Solution (340ms)
  def three_sum_closest(nums, target)
    nums = nums.sort
    len =nums.length
    prev_diff = Float::MAX
    closest_sum = nil
    for i in 0..len-3
        lo = i+1
        hi = len-1
        while lo<hi
            sum=nums[lo]+nums[hi]+nums[i]
            if sum>target
                hi-=1
                diff = sum-target
                if diff < prev_diff
                    prev_diff = diff
                    closest_sum = sum
                end
            elsif sum<target
                lo+=1
                diff = target-sum
                if diff < prev_diff
                    prev_diff = diff
                    closest_sum = sum
                end
            else
                return target
            end
        end
    end
    closest_sum
end