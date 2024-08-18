# Problem : https://exercism.org/tracks/ruby/exercises/reverse-string

#Solution
class Reverser
    def self.reverse(str)
      len = str.length
      l,r = 0,len-1
      while l<r
        str[l],str[r] = str[r],str[l]
        l+=1
        r-=1
      end    
      str
    end  
end

#Solution 2
class Reverser
    def self.reverse(str)
      str.reverse
    end
end
