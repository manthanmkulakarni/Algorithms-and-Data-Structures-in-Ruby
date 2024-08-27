#Problem: https://exercism.org/tracks/ruby/exercises/sieve

#Solution
class Sieve
    def initialize(num)
      if num>1
        @input=(2..num).to_a 
      else
        @input=[]
      end
    end

    def primes
      return [] if @input==[]
      primes=[]
      @input.each do |num|
        next if num==nil
        primes.append(num)
        @input.map! {|x| x=x if x!=nil && x%num!=0 }
      end
      primes
    end  
end

#Solution 2
class Sieve
    def initialize(top)
      @top = top
    end
    def primes
      numbers = [nil, nil, *2..@top]
      (2..Math.sqrt(@top)).each do |i|
        (i**2..@top).step(i) { |m| numbers[m] = nil } if numbers[i]
      end
      numbers.compact
    end
end