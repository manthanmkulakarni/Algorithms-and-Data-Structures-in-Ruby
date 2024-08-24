#Problem: https://exercism.org/tracks/ruby/exercises/grains

#Solution
class Grains
    def self.square(n)
      raise ArgumentError if n<=0 or n>64
      2**(n-1)
    end
    
    def self.total
      (2**(64))-1
    end
end