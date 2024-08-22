#Problem: https://exercism.org/tracks/ruby/exercises/anagram

#Solution
class Anagram
    def initialize(str)
      @input_word =str.downcase
    end
    
    def match(word_list)
      anagrams = []
      word_list.each do |word|
       unless word.downcase == @input_word 
        anagrams.append(word) if word.downcase.split("").tally == @input_word.split("").tally
       end
      end
      anagrams
    end       
end