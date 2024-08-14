=begin
Given a binary search tree (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.
According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q
as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
=end

# Solution (recursive)
def lowest_common_ancestor(root, p, q)
    return if root.nil?
    if p.val>q.val
        bigger = p
        smaller = q
    else
        bigger = q
        smaller = p
    end

    if bigger.val<root.val
        return lowest_common_ancestor(root.left, p, q)
    elsif smaller.val>root.val
        return lowest_common_ancestor(root.right, p, q)
    else
        return root
    end
end

#Solution (iterative)
def lowest_common_ancestor(root, p, q)
    return if root.nil?
    small = [p.val,q.val].min
    big = [p.val,q.val].max
    until root.nil?
        root_val = root.val
        if big<root_val
            root = root.left
        elsif small>root_val
            root = root.right
        else
            return root
        end
    end
end