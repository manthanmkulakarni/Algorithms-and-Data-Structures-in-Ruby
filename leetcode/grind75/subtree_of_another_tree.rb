# Problem: https://leetcode.com/problems/subtree-of-another-tree/description/
=begin
Given the roots of two binary trees root and subRoot,
return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.
A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants.
The tree tree could also be considered as a subtree of itself.
=end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {TreeNode} sub_root
# @return {Boolean}

# Solution 1 (Brute force recursive)
def is_subtree(root, sub_root)
    return true if sub_root.nil?
    return false if root.nil?
    is_found = false
    if root.val == sub_root.val
        return true if is_same_tree(root, sub_root)
    end
    is_subtree(root.left, sub_root) || is_subtree(root.right, sub_root)
end

def is_same_tree(root1, root2)
    return true if root1.nil? and root2.nil?
    return false if root1.nil? or root2.nil?
    root1.val == root2.val and is_same_tree(root1.left, root2.left) and is_same_tree(root1.right, root2.right)
end
