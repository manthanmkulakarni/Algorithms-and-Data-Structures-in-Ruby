# Pre-Order Traversal follows root-->left-->right

def preorder_traversal(root, val_list=[])
    return  [] if root.nil?
    val_list.append(root.val)
    inorder_traversal(root.left)
    inorder_traversal(root.right)
end