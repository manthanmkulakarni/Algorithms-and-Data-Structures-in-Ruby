=begin
Given the root of a binary tree, return its maximum depth.
A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
=end

# Solution 1 (Recursion)
def max_depth(root)
    return 0 if root.nil?
    return 1+[max_depth(root.left),max_depth(root.right)].max
end

# Solution 2 (BFS)
#TODO