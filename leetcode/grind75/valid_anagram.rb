=begin
Given two strings s and t, return true if t is an anagram of s, and false otherwise.
An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
=end

# Approach: Count of each character must be same in each string to be an anagram

# Solution 1 (using ruby's tally method which gives hash of count of elements)
def is_anagram(s, t)
    s = s.chars.tally
    t = t.chars.tally
    s==t
end

#Solution 2
def is_anagram(s, t)
    return false unless s.length==t.length
    char_count_hash = Hash.new(0)
    s.each_char do |char|
        char_count_hash[char]+=1
    end

    t.each_char do |char|
      return false unless char_count_hash[char]>0
      char_count_hash[char]-=1
    end
    true
end