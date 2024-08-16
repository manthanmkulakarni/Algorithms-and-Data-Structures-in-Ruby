=begin
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9. 
X can be placed before L (50) and C (100) to make 40 and 90. 
C can be placed before D (500) and M (1000) to make 400 and 900.

Given a roman numeral, convert it to an integer.
=end

#Solution 1
#Approach: In a valid Roman numeral when a smaller value appears before a larger value,
# it represents subtraction, while when a smaller value appears after or equal to a larger value, it represents addition.
def roman_to_int(s)
    int_val = 0
    roman_to_int_map = {
        "I"=> 1,
        "V"=> 5,
        "X"=> 10,
        "L"=> 50,
        "C"=> 100,
        "D"=> 500,
        "M"=> 1000,
    }
    i=0
    while i<s.length
        if i < s.length - 1 and roman_to_int_map[s[i]] < roman_to_int_map[s[i+1]]
            int_val -= roman_to_int_map[s[i]]
        else
            int_val += roman_to_int_map[s[i]]
        end
        i+=1
    end
    int_val
end


# Solution 2
#Approach is to check chars in pair of two and increase steps accordingly)
def roman_to_int(s)
    int_val = 0
    special_prefixes = "IXC"
    roman_to_int_map = {
        "I"=> 1,
        "V"=> 5,
        "X"=> 10,
        "L"=> 50,
        "C"=> 100,
        "D"=> 500,
        "M"=> 1000,
        "IV"=> 4,
        "IX"=> 9,
        "XL"=> 40,
        "XC"=> 90,
        "CD"=> 400,
        "CM"=> 900,
    }
    i=0
    while i<s.length
        if special_prefixes.include?(s[i]) and i<s.length-1 and roman_to_int_map.has_key?(s[i]+s[i+1])
            int_val+=roman_to_int_map[s[i]+s[i+1]]
            i+=2
            next
        end
        int_val+=roman_to_int_map[s[i]]
        i+=1    
    end
    int_val
end