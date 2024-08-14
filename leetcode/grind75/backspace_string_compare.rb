=begin
Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.
Note that after backspacing an empty text, the text will continue empty.
=end

#Solution
def backspace_compare(s, t)
    s_typed = typed_string(s)
    t_typed = typed_string(t)
    s_typed == t_typed    
end

def typed_string(str)
    stack = []
    str.each_char do |char|
        if char=="#"
            stack.pop unless stack.empty?
            next
        end
        stack.push(char)
    end
    stack.join("") # join is not really required we can directly compare the arrays too.
end