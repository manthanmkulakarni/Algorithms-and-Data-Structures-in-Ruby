#Problem: https://exercism.org/tracks/ruby/exercises/flatten-array

#Solution (idiomatic)
class FlattenArray
    def self.flatten(arr)
      arr.flatten.compact
    end
end

#Solution 2 (recursive)
class FlattenArray
    def self.flatten(arr)
      result = []
      arr.each do |val|
        if val.is_a?(Array)
          flat_val = flatten(val)
          result+=flat_val
        else
          result.push(val) unless val.nil?
        end
      end
      result    
    end
end