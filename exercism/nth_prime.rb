# Problem: https://exercism.org/tracks/ruby/exercises/nth-prime

#Solution
class Prime
    def self.nth(n)
      raise ArgumentError if n<=0
      return 2 if n==1
      primes = [2]
      count = 1
      i=3
      while count!=n
        if self.is_prime(i)
          primes.push(i) 
          count+=1
        end
        i+=1
      end
      primes.last
    end

    def self.is_prime(num)
      range = Math.sqrt(num).to_i
      for i in 2..range
        return false if num%i==0
      end
      true
    end  
end

#Solution 2 (Using Prime Module)
require 'prime'
# Prime is extended to provide an 'nth Prime' method
class Prime
  def self.nth(count)
    raise ArgumentError if count < 1
    Prime.first(count).last
  end
end