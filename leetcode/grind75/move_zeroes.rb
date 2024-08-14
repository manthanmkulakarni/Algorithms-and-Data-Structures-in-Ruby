=begin
Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
Note that you must do this in-place without making a copy of the array.
=end
def move_zeroes(a)
    left = 0
    right = 0
    while right<a.length
        if a[right]==0
            right+=1
            next
        end
        a[left],a[right] = a[right],a[left] if a[left]==0 
        left+=1
        right+=1
    end
    a
end