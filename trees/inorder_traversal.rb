# In-Order Traversal follows left-->root-->right

def inorder_traversal(root,val_list=[])
    return [] if root.nil?
    inorder_traversal(root.left,val_list)
    val_list.append(root.val)
    inorder_traversal(root.right,val_list)
    val_list
end