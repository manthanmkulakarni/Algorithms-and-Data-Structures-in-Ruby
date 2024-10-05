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

# Solution 3 
class Prime

  # Credit for this solution at http://codereview.stackexchange.com/questions/90813/finding-the-nth-prime - this is not my code
  def self.nth n
    up_to = n * (Math.log(n) + 2)
    primes = (2..up_to).to_a
    primes.each {|num| primes.delete_if {|i| i > num && (i % num) == 0} }
    primes[n-1]
  end
end