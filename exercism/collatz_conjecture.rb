#Problemm: https://exercism.org/tracks/ruby/exercises/collatz-conjecture

#Solution
class CollatzConjecture
    def self.steps(num)
      raise ArgumentError if num<=0
      step_count = 0
      until num==1
        num = num%2==0 ? num/2 : (3*num+1)
        step_count+=1
      end
      step_count
    end
end