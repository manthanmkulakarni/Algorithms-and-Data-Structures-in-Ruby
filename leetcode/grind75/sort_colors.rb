=begin
Given an array a with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent,
with the colors in the order red, white, and blue.
We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

You must solve this problem without using the library's sort function.
=end

#Solution 1 (count the number of 0,1 and 2 and rewrite, need constant extra space but 2 paases)

#Solution 2(Dutch Nation Flag Algo)
#Approach: 3 pointers, left and right move according to value encountered at mid
def sort_colors(a)
    left,middle,right = 0,0,a.length-1
    while middle<=right
        if a[middle]==0
            a[left],a[middle]=a[middle],a[left]
            left+=1
            middle+=1
        elsif a[middle]==1
            middle+=1
        else
            a[right],a[middle]=a[middle],a[right]
            right-=1
        end
    end
    a
end
