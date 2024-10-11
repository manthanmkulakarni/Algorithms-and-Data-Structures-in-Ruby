# Problem: https://exercism.org/tracks/ruby/exercises/matching-brackets

# Solution
class Brackets
    BRACKETS = {
                "(" => ")",
                "{" => "}",
                "[" => "]"
              }
    def self.paired?(input)
      stack = []
      input.chars.each do |char|
        if BRACKETS.keys.include?(char)
          stack.push(char) 
        elsif BRACKETS.values.include?(char)
          char == BRACKETS[stack[-1]] ? stack.pop : (return false)
        end
      end
      stack.empty?
    end
end
