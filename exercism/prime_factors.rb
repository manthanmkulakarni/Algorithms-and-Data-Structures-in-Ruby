# Problem: https://exercism.org/tracks/ruby/exercises/prime-factors

# Solution
class PrimeFactors
  def self.of(n)
    return [] if n<2
    prime_factors = []
    factor = 2
    while n>1
      while n%factor ==0
        prime_factors<<factor
        n/=factor
      end
      factor+=1
    end
    prime_factors
  end
end

# Solution (Recursive)
class PrimeFactors
    def self.of(n)
      return [] if n < 2
      factor = (2..n).find { |i| n % i == 0 }
      [factor] + of(n / factor)
    end
end

