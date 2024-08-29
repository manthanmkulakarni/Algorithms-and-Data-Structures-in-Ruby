#Problem: https://exercism.org/tracks/ruby/exercises/palindrome-products

#Solution
class Palindromes
    attr_accessor :value,:factors
    def initialize(max_factor:,min_factor:nil)
      @max_factor = max_factor ? max_factor : 1
      @min_factor = min_factor ? min_factor : 1
      @palindromes = []
    end

    def generate
      for i in @min_factor..@max_factor
        for j in i..@max_factor
          @palindromes.push(i*j) if (i*j).to_s == (i*j).to_s.reverse
        end
      end
      @palindromes
    end

    def largest
      value = @palindromes.sort!.last
      factors = get_factors(value)
      largest_pal = Struct.new(:value,:factors)
      largest_pal.new(value,factors)
    end
    
    def smallest
      value = @palindromes.first
      factors = get_factors(value)
      smallest_pal = Struct.new(:value,:factors)
      smallest_pal.new(value,factors)
    end
    private
    
    def get_factors(num)
      factors = []
      for i in @min_factor..@max_factor
        factors.push([i,num/i]) if num%i == 0 and (num/i)>=@min_factor and (num/i)<=@max_factor and (num/i)>=i
      end
      factors
    end
end