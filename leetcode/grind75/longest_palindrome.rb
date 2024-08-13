=begin
Given a string s which consists of lowercase or uppercase letters, return the length of the longest 
palindrome that can be built with those letters.
Letters are case sensitive, for example, "Aa" is not considered a palindrome.
=end


#Solution
def longest_palindrome(s)
    return 0 if s.empty?
    char_count = s.chars.tally
    palindrome_len = 0
    contains_odd = 0
    char_count.each_value do |count|
        if count%2==0
            palindrome_len+= count
        else
            contains_odd = 1
            palindrome_len+= count-1
        end
    end
    palindrome_len+contains_odd
end