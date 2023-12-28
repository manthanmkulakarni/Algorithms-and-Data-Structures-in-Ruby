"""Assumung that we have a tree consisting of a set of nodes, and the leaf nodes are
assumed to represent the ends of the game, so for a leaf node n the value
n.value is pre-assigned. All other nodes have n.value undefined to start with.
The function minimax is called with the first argument being the root of the
tree and the second argument being 0. Recursive calls will have depth being
even when it is Max’s turn and odd when it is Min’s turn"""

def minimax(node, depth)
	# Base Case
	return node.value if node.value
  
	if depth % 2 == 0
		max_value = -Float::INFINITY

		i = 0
		while i < node.children.length
			value = minimax(node.children[i], depth + 1)
			max_value = [value, max_value].max
			i += 1

		return max_value
	else
		min_value = Float::INFINITY
		i = 0
		while i < node.children.length
			value = minimax(node.children[i], depth + 1)
			min_value = [value, min_value].min
			i += 1

	  	return min_value
	end
  end