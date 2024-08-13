=begin
Given the root of a binary tree, invert the tree, and return its root.
=end

#Solution 1 (recursive)
def invert_tree(root)
    return root if root.nil? or (root.left.nil? and root.right.nil?)
    left_tree = root.left
    root.left = invert_tree(root.right)
    root.right = invert_tree(left_tree)
    root
end

#Solution 2 (recursive)
def invert_tree(root)
    return root if root.nil?
    invert_tree(root.left)
    invert_tree(root.right)
    left_node = root.left
    root.left = root.right
    root.right = left_node
    root
end

#Solution 3(Iterative)
#TO BE DONE