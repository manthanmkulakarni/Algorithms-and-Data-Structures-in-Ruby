#Problem: https://exercism.org/tracks/ruby/exercises/pangram

#Solution
class Pangram
    def self.pangram?(sentence)
      uniq_alphabet_len = sentence.downcase.scan(/[a-z]/).uniq.length
      uniq_alphabet_len == 26
    end
end

#Solution 2
class Pangram
    def self.pangram?(sentence)
      characters = sentence.downcase.split("").tally
      for char in 'a'..'z'
        return false unless characters.has_key?(char)
      end
      true
    end
end
  