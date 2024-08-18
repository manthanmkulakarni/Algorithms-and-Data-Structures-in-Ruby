=begin
Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

Implement the MinStack class:
MinStack() initializes the stack object.
void push(int val) pushes the element val onto the stack.
void pop() removes the element on the top of the stack.
int top() gets the top element of the stack.
int getMin() retrieves the minimum element in the stack.
You must implement a solution with O(1) time complexity for each function.
=end

#Solution 1 (Storing min with each node)
class MinStack
    def initialize()
       @stack = [] 
       @min = ::Float::MAX
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def push(val)
        @min = val if val<@min
        @stack.push([val,@min])
    end


=begin
    :rtype: Void
=end
    def pop()
        val = @stack.pop
        if @stack.empty?
            @min = ::Float::MAX
        else
            @min = @stack[-1][1]
        end
        val[0]
    end


=begin
    :rtype: Integer
=end
    def top()
        @stack.last[0]
    end


=begin
    :rtype: Integer
=end
    def get_min()
        @min
    end


end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()

#Solution 2 (Using two stacks)
class MinStack
    def initialize()
       @stack = [] 
       @min = []
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def push(val)
        @min.push(val) if @min.empty? || val<=@min.last
        @stack.push(val)
    end


=begin
    :rtype: Void
=end
    def pop()
        val = @stack.pop
        @min.pop if @min.last==val
        val
    end


=begin
    :rtype: Integer
=end
    def top()
        @stack.last
    end


=begin
    :rtype: Integer
=end
    def get_min()
        @min.last
    end


end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()