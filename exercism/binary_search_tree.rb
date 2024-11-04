# Problem: https://exercism.org/tracks/ruby/exercises/binary-search-tree

# Solution
class Bst
    include Enumerable
    NODE = Struct.new(:data,:left,:right)
    
    def initialize(value)
      @root = NODE.new(value,nil,nil)
    end

    def data
      @root.data
    end
    def left
      @root.left
    end
    def right
      @root.right
    end

    def insert(element)
      current = @root
      prev = @root
      until current.nil?
       if current.data>=element
         prev = current
         current = current.left
       else
         prev = current
         current = current.right
       end
      end
      current = NODE.new(element,nil,nil)
      if prev.data >= element
        prev.left = current
      else
        prev.right = current
      end
    end

    def each(&block)
      return to_enum(:each) unless block_given?
      inorder_traversal(@root,[]).each do |val|
        yield(val)
      end
    end

    def inorder_traversal(node,arr)
      unless node.nil?
        inorder_traversal(node.left,arr)
        arr.push(node.data)
        inorder_traversal(node.right,arr)
      end
      arr
    end
end