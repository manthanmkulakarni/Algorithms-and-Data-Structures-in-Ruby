=begin
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.(IMP)
=end

#Solution
def three_sum(nums)
    triplets = []
    nums = nums.sort
    len =nums.length
    for i in 0..len-3
        next if i>0 and nums[i]==nums[i-1] # to avoid duplicates
        lo = i+1
        hi = len-1
        while lo<hi
            sum=nums[lo]+nums[hi]+nums[i]
            if sum>0
                hi-=1
            elsif sum<0
                lo+=1
            else
                triplets.push([nums[i],nums[lo],nums[hi]])
                lo+=1
                # avoid duplicates by moving j and k if same as previous values
                while lo<hi and nums[lo]==nums[lo-1]
                    lo+=1
                end
                while lo<hi and nums[hi]==nums[hi+1]
                    hi-=1
                end
            end
        end
    end
    triplets
end
