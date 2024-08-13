=begin
Given an integer x, return true if x is a palindrome, and false otherwise.
=end

#Solution 1 (converting to string)
def is_palindrome(x)
    x.to_s == x.to_s.reverse
end

#Solution 2
def is_palindrome(x)
    # digits = x.digits #gives digits array with unit digit as first element
    return false if x<0
    #Get digits of integer
    digits = []
    while x>0
        digits.push(x%10)
        x/=10
    end

    #check if digits array is palindrome
    left =0
    right = digits.length-1
    while left<right
        return false unless digits[left]==digits[right]
        left+=1
        right-=1
    end
    true
end

#Solution 3 (half iteration to number)
def is_palindrome(x)
    return true if x>=0 and x<10
    return false if x<0 or x%10==0
    half_x = 0
    while x>half_x
        half_x = (half_x*10)+(x%10)
        x/=10
    end
    p half_x, x
    x== half_x or x == half_x/10
end