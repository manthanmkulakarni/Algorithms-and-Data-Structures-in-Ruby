#Problem: https://exercism.org/tracks/ruby/exercises/bob

#Solution
class Bob
    def self.hey(remark)
      remark  = remark.strip
      is_yelling = false
      is_yelling = remark.upcase ==remark unless remark.scan(/[a-zA-z]/).empty?
      is_question = remark.end_with?("?")
      return "Fine. Be that way!" if remark == ""
      return "Calm down, I know what I'm doing!" if is_yelling and is_question
      return "Whoa, chill out!" if is_yelling
      return "Sure." if is_question
      "Whatever."
    end
end