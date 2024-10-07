# Problem: https://leetcode.com/problems/symmetric-tree/description/
=begin
Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).
Input: root = [1,2,2,3,4,4,3]
Output: true
Input: root = [1,2,2,null,3,null,3]
Output: false
=end


#Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}

#Solution 1 (Brute force Recursive)
def is_symmetric(root)
    return true if root.nil?
    compare_subtrees(root.left,root.right)
end

def compare_subtrees(left_tree,right_tree)
    return true if left_tree.nil? and right_tree.nil?
    return false unless (left_tree&.val == right_tree&.val)
    return false unless compare_subtrees(left_tree&.right,right_tree&.left)
    compare_subtrees(left_tree&.left,right_tree&.right)
end
