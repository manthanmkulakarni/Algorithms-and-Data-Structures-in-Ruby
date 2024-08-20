#Problem: https://exercism.org/tracks/ruby/exercises/eliuds-eggs

#Solution 1
class EliudsEggs
    def self.egg_count(n)
      set_bits=0
      while n>0
        set_bits+= (n%2)
        n/=2
      end
      set_bits
    end
end

#Solution 2
class EliudsEggs
    def self.egg_count(n)
      bin_digits = n.to_s(2).split("")
      set_bits=0
      bin_digits.each do |digit|
         set_bits+=1 if digit=="1"   
      end
      set_bits
    end
end

