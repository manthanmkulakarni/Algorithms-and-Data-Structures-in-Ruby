=begin

=end

#Solution
#Approach:  I first pass populate result array with product of all
# leftside elements then do the same for right side in second pass
def product_except_self(nums)
    n = nums.length
    product_arr = [1]*n
    left_product = 1
    for i in 0...n
        product_arr[i]=left_product
        left_product*=nums[i]
    end
    right_product = 1
    (n-1).downto(0) do |i|
        product_arr[i]*=right_product
        right_product*=nums[i]
    end
    product_arr
end