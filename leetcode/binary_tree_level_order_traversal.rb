=begin
Problem: https://leetcode.com/problems/binary-tree-level-order-traversal/description/
Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
=end

#Solution (Using BFS/Queue)

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
