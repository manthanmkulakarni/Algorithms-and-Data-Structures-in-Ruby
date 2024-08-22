#Problem: https://exercism.org/tracks/ruby/exercises/sum-of-multiples

#Solution
class SumOfMultiples
    def initialize(*factors) 
      @factors=factors
    end
    
    def to(num)
      1.upto(num-1).select{|num| @factors.any?{|i| num%i==0}}.sum  
    end
end