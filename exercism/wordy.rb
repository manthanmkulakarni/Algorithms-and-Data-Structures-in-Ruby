# Problem: https://exercism.org/tracks/ruby/exercises/wordy

# Solution
class WordProblem
    REPLACEMENTS = {
                      "plus" => "+",
                      "minus" =>"-",
                      "divided by" => "/",
                      "multiplied by" => "*",
                      "what is" =>""
                    }
    OPERATIONS = {
                      "+" => lambda{|a,b| a+b},
                      "-" =>lambda{|a,b| a-b },
                      "/" => lambda{|a,b| a/b },
                      "*" => lambda{|a,b| a*b }
                    }
    def initialize(word_prob)
      word_prob = word_prob.strip.gsub(/\b(?:#{REPLACEMENTS.keys.join('|')})\b/i, REPLACEMENTS)
      @word_prob = word_prob[-1]=="?" ? word_prob[0...-1] : word_prob
    end

    def answer
      words = @word_prob.split(" ")
      result = 0
      i=0
      prev_num = nil
      prev_op = nil
      while i<words.length
        if words[i].match?(/^-?\d+$/)
          unless prev_num.nil? and prev_op.nil?
            result = prev_op.call(prev_num,words[i].to_i)
            prev_op = nil
            prev_num = result
          else
            prev_num = words[i].to_i
          end
        elsif OPERATIONS.keys.include?(words[i])
          prev_op = OPERATIONS[words[i]]
        else
          raise ArgumentError
        end
        i+=1
      end
      result
    end
end

# Solution
class WordProblem
    attr_reader :question
    OPERATIONS = {
      'plus'       => :+,
      'minus'      => :-,
      'divided'    => :/,
      'multiplied' => :*
    }
    def initialize(question)
      @question = question
    end
    
    def answer
      numbers = question.scan(/(-?\d+)/).flatten.map(&:to_i)
      operations = question.scan(/(plus|minus|multiplied|divided)/).flatten.
        map { |op| OPERATIONS[op] }
      raise ArgumentError if numbers.empty? || operations.empty?
      equation = operations.unshift(:+).zip(numbers).flatten.compact
      equation.each_slice(2).inject(0) do |sum, (operation, number)|
        sum.send(operation, number)
      end
    end
end