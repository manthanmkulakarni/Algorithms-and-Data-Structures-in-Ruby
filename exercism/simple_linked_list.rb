# Problem : https://exercism.org/tracks/ruby/exercises/simple-linked-list

# Solution
class Element
    attr_accessor :next,:datum
    def initialize(data)
      @datum = data
      @next = nil
    end
end

class SimpleLinkedList
    def initialize(elements=[])
      @head = nil
      elements.each do |element|
        push(Element.new(element))
      end
    end

    def push(element)
      if @head.nil?
        @head = element
      else
        tail = find_tail
        tail.next = element
      end
      self
    end

    def pop
      current = @head
      if @head.nil? or @head.next.nil?
        @head = nil
        return current
      end
      current = current.next until current.next.next.nil?
      last_node = current.next
      current.next = nil
      last_node
    end

    def to_a
      current = @head
      data = []
      until current.nil?
        data.push(current.datum)
        current = current.next
      end
      data.reverse
    end

    def reverse!
      current = @head
      prev = nil
      until current.nil?
        next_node = current.next
        current.next = prev
        prev = current
        current = next_node
      end
      @head = prev
      self
    end

    private
    def find_tail
      node = @head
      node = node.next until node.next.nil?
      node
    end
end