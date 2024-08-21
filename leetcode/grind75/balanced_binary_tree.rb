=begin
Given a binary tree, determine if it is height-balanced.
(A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.)
=end

#Solution 1 (Brute force recursive)
def is_balanced(root)
    return true if root.nil?
    left_depth = depth(root.left)
    right_depth = depth(root.right)
    p left_depth,right_depth
    return true if (left_depth-right_depth).abs<=1 and is_balanced(root.left) and is_balanced(root.right)
    false
end

def depth(root)
    return 0 if root.nil?
    left_depth = depth(root.left)
    right_depth = depth(root.right)
    return 1+[left_depth,right_depth].max
end

# Solution 2 (improved than before)
def is_balanced(root)
    return true if root.nil?
    left_depth,is_left_balanced = depth(root.left)
    right_depth,is_right_balanced = depth(root.right)
    return false unless is_left_balanced and is_right_balanced
    return true if (left_depth-right_depth).abs<=1
    false
end

def depth(root)
    return 0,true if root.nil?
    left_depth,is_left_balanced = depth(root.left)
    right_depth,is_right_balanced = depth(root.right)
    is_balanced = (left_depth-right_depth).abs<=1 && is_left_balanced && is_right_balanced
    return 1+[left_depth,right_depth].max, is_balanced
end

# Solution 3 
def is_balanced(root)
    return true if root.nil?
    return depth(root)!=-1
end

def depth(root)
    return 0 if root.nil?
    left_height = depth(root.left)
    return -1 if left_height==-1

    right_height = depth(root.right)
    return -1 if right_height==-1

    return -1 if (left_height-right_height).abs>1
    1+[left_height,right_height].max
end
    