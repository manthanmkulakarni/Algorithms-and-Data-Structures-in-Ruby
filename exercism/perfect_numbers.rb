# Problem: https://exercism.org/tracks/ruby/exercises/perfect-numbers

# Solution
class PerfectNumber
    def self.classify(num)
      raise RuntimeError if num<=0
      factor_sum = 1
      for i in 2..(Math.sqrt(num).ceil)
        if num%i==0
          factor_sum+=i
          factor_sum+=(num/i) unless i*i == num
        end
      end
      comparison = factor_sum <=> num
      case comparison
      when 0
        "perfect"
      when 1
        "abundant"
      when -1
        "deficient"
      end
    end
end