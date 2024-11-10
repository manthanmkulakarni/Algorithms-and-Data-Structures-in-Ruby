# Problem : https://exercism.org/tracks/ruby/exercises/linked-list

#Solution
class Deque
    NODE = Struct.new(:val,:prev,:next)

    def initialize
      @head = nil
      @tail = @head
    end

    def push(element)
      if @tail.nil?
        @head = @tail = NODE.new(element,nil,nil)
        return
      end
      last_node = @tail
      last_node.next = NODE.new(element,last_node,nil)
      @tail = last_node.next
    end
    def pop

      unless @tail.nil?
        last_node = @tail
        @tail = @tail.prev
        return last_node.val
      end
    end

    def shift
      first_val = @head.val
      @head = @head.next
      @tail = nil if @head.nil?
      first_val
    end

     def unshift(element)
      new_node = NODE.new(element, nil, @head)
      @head.prev = new_node unless @head.nil?
      @head = new_node
      @tail = new_node if @tail.nil?
    end
  end

  # Solution (one liner)
  class Deque < Array; end     # As array class has all the functionalities in Ruby    