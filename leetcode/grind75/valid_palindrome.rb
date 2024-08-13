=begin
A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters,
it reads the same forward and backward. Alphanumeric characters include letters and numbers.
Given a string s, return true if it is a palindrome, or false otherwise.
=end

#Solution (Sanitizing string first then checking using two pointers)
def is_palindrome(s)
    s = s.gsub(/[\W_]/,"")
    s = s.downcase
    l = 0
    r = s.length-1
    while l<=r
        return false unless s[l]==s[r]
        l+=1
        r-=1
    end
    true
end
