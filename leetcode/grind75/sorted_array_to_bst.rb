=begin
Given an integer array nums where the elements are sorted in ascending order, convert it to a 
height-balanced binary search tree.
=end

#Solution
def sorted_array_to_bst(nums)
    l = 0
    r = nums.length-1
    create_bst(nums,l,r)
end

def create_bst(nums,l,r)
    return nil if l>r
    mid = (l+r)>>1
    root = TreeNode.new(nums[mid])
    root.left = create_bst(nums,l,mid-1)
    root.right = create_bst(nums,mid+1,r)
    root
end
