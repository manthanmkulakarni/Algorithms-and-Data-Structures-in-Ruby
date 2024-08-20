#Problem: https://exercism.org/tracks/ruby/exercises/isogram

#Solution 1
class Isogram
    def self.isogram?(input)
      array_of_chars=input.downcase.scan /\w/
      hi=array_of_chars.length-1
      for i in 0..hi
        for j in (i+1)..hi
          return false if array_of_chars[i]==array_of_chars[j]
        end
      end
        return true  
    end
end

#Solution 2
class Isogram
    def self.isogram?(phrase)
      letters = phrase.downcase.scan(/\w/)
      letters == letters.uniq
    end
end