=begin
Given two binary strings a and b, return their sum as a binary string.
=end

#Solution
def add_binary(a, b)
    result = ""
    carry = 0
    i= a.length-1
    j =b.length-1
    while i>=0 or j>=0
        char_a = i>=0 ? a[i] : '0' 
        char_b = j>=0 ? b[j] : '0'
        if char_a =='0' and char_b=='0'
            char,carry = carry>0 ? [1,0] : [0,0] 
            result="#{char}#{result}"
        elsif (char_a=='0' and char_b=='1') or (char_a=='1' and char_b=='0')
            char,carry = carry>0 ? [0,1] : [1,0] 
            result="#{char}#{result}"
        else 
            char,carry = carry>0 ? [1,1] : [0,1] 
            result="#{char}#{result}"
        end
        i-=1
        j-=1
    end
    carry>0 ? "1#{result}" : result
end