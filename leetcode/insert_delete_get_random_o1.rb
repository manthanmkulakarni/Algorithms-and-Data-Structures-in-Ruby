=begin
Implement the RandomizedSet class:

RandomizedSet() Initializes the RandomizedSet object.
bool insert(int val) Inserts an item val into the set if not present. Returns true if the item was not present, false otherwise.
bool remove(int val) Removes an item val from the set if present. Returns true if the item was present, false otherwise.
int getRandom() Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the same probability of being returned.
You must implement the functions of the class such that each function works in average O(1) time complexity.
There will be at least one element in the data structure when getRandom is called.
=end

#Solution 1
class RandomizedSet
    def initialize()
      @set = Array.new
      @mapping = Hash.new
    end

=begin
    :type val: Integer
    :rtype: Boolean
=end
    def insert(val)
      return false if @mapping.key?(val)

      @mapping[val] = @set.size
      @set << val

      true
    end

=begin
    :type val: Integer
    :rtype: Boolean
=end
    def remove(val)
      return false if @mapping[val].nil?

      last_index = @mapping[@set.last]
      del_index = @mapping[val]

      @mapping[@set.last] = del_index
      @set[del_index] = @set.last

      @mapping.delete(val)
      @set.pop

      true
    end


=begin
    :rtype: Integer
=end
    def get_random()
      @set.sample # can use @set[rand(@set.length)] too
    end
end

# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet.new()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.get_random()