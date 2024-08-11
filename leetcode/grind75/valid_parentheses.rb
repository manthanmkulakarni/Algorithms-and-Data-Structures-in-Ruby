=begin
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
An input string is valid if:
1.Open brackets must be closed by the same type of brackets.
2.Open brackets must be closed in the correct order.
3.Every close bracket has a corresponding open bracket of the same type.
=end

#Solution
def is_valid(s)
    closing_brackets =")}]"
    matching_brackets = {
        "}" => "{",
        ")" => "(",
        "]" => "[",
    }
    stack = []
    s.each_char do |bracket|
      if closing_brackets.include?(bracket)
        return false if stack.empty?
        return false unless stack[-1]== matching_brackets[bracket]
        stack.pop
        next
      end
      stack.push(bracket)
    end
    stack.empty?
end