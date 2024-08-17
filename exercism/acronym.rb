# Problem: https://exercism.org/tracks/ruby/exercises/acronym

#Solution 1
class Acronym
    def self.abbreviate(str)
      words = str.gsub("-"," ").split(" ")
      abbreviation=""
      words.each do |x|
        abbreviation+= x[0]
      end
      abbreviation.upcase
    end
end 

#Solution 2 (using regex)
class Acronym
    def self.abbreviate(string)
      string.scan(/\b[a-zA-Z]/).join.upcase
    end
end
