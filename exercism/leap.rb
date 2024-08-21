#Problem: https://exercism.org/tracks/ruby/exercises/leap

#Solution
class Year
    def self.leap?(year)
     if year%100==0
       if year%400==0
       return true
       else 
       return false
       end
     elsif year%4==0 
       return true
     else
      return false
    end
  end
end

#Solution 2
class Year
    def self.leap? year
      year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
    end
end