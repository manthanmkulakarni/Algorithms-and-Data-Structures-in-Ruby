# Post-Order Traversal follows left-->right-->root

def postorder_traversal(root, val_list=[])
    return [] if root.nil?
    inorder_traversal(root.left,val_list)
    inorder_traversal(root.right,val_list)
    val_list.append(root.val)
    val_list
end