=begin
Problem: https://leetcode.com/problems/binary-tree-level-order-traversal/description/
Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
=end

#Solution (Using BFS/Queue)
# Time Complexity: O(n) Space: O(n)

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
# @return {Integer[][]}
def level_order(root)
    val_list = []
    return [] if root.nil?
    queue = [root] # Queue.new can be used instead of List for efficiency of insertion

    until queue.empty?
        level = []
        size = queue.length

        size.times do
            node =  queue.pop()
            level.append(node.val)
            queue.unshift(node.left) if node.left
            queue.unshift(node.right) if node.right
        end
        val_list.append(level)
    end
    val_list
end

# Solution (Brute Force)
# Time Complexity: O(n^2) Space: O(n)

def level_order(root)
    h = height(root)
    trav_list = []
    for i in 1..h
        nodes = []
        level_order_nodes(root,i,nodes)
        trav_list.append(nodes)
    end
    trav_list
end

def level_order_nodes(root,level,nodes)
    return nodes if root.nil?
    if level == 1
        nodes.append(root.val)
    elsif level>1
        level_order_nodes(root.left,level-1,nodes)
        level_order_nodes(root.right,level-1,nodes)
    end
end



def height(root)
    return 0 if root.nil?
    left_h = height(root.left)
    right_h = height(root.right)
    return 1+[left_h, right_h].max
end
