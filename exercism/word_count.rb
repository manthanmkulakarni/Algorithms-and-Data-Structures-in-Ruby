#Problem : https://exercism.org/tracks/ruby/exercises/word-count

#Solution
class Phrase
    def initialize(input)
      @phrase = input.downcase
    end
    def word_count
      result = Hash.new(0)
      curr_word=""
      len = @phrase.length
      for i in 0...len
        unless @phrase[i].match(/^[a-zA-Z0-9']/)
          result[curr_word]+=1 unless curr_word==""
          curr_word=""
          next
        end
        next if @phrase[i]=="'" and \
        (i==len-1 || i==0 || !@phrase[i+1].match(/^[a-zA-Z0-9']/) || !@phrase[i-1].match(/^[a-zA-Z0-9']/))
        curr_word+=@phrase[i]
      end 
      result[curr_word]+=1 unless curr_word=="" or curr_word=="'"
      result
    end
end

#Solution 2
class Phrase
    def initialize(phrase)
      @phrase = phrase
    end
    def word_count
      @phrase.downcase.scan(/\b[\w']+\b/).tally
    end
end