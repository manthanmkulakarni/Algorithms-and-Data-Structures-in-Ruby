=begin
Write a function to find the longest common prefix string amongst an array of strings.
If there is no common prefix, return an empty string "".
Input: strs = ["flower","flow","flight"]
Output: "fl"
=end

#Solution
=begin
Approach:   
sort the input array of strings and compare the first and last strings is that the longest common prefix of all the strings
must be a prefix of the first string and a prefix of the last string in the sorted array.
this is because strings are ordered based on their alphabetical order (Lexicographical order).
=end
def longest_common_prefix(strs)
    lcs =""
    strs = strs.sort
    first = strs[0]
    last = strs[-1]
    for i in 0...[first.length,last.length].min
        break unless first[i]==last[i]
        lcs+=first[i] 
    end
    lcs
end

#Solution 2
def longest_common_prefix(strs)
    lcs =strs[0]
    strs.each_cons(2) do |a,b|
        curr_lcs=""
        for i in 0...[lcs.length,a.length,b.length].min
           if a[i]==b[i] and a[i]==lcs[i]
            curr_lcs+=a[i] 
            else
                break
            end
        end
        lcs = curr_lcs
    end
    lcs
end