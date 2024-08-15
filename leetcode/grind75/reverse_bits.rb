=begin
Reverse bits of a given 32 bits unsigned integer.

Note:
Note that in some languages, such as Java, there is no unsigned integer type. In this case, both input and output will be given as a signed integer type.
They should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
In Java, the compiler represents the signed integers using 2's complement notation.

=end

#Solution 1
#Approach: left shift your result by once place and push last digit of number into it
def reverse_bits(n)
    reversed = 0
    32.times do
        reversed<<=1
        reversed+=(n&1)
        n>>=1
    end
    reversed
end

# Solution 2
# Approach : https://leetcode.com/problems/reverse-bits/solutions/1232842/java-c-0ms-o-1-time-complexity-in-place-detailed-explanation/
def reverse_bits(num)
    num = ((num & 0xffff0000) >> 16) | ((num & 0x0000ffff) << 16) # swap first half with second half
    num = ((num & 0xff00ff00) >> 8) | ((num & 0x00ff00ff) << 8)  # swap first 8 with 8 half within each 16 digits
    num = ((num & 0xf0f0f0f0) >> 4) | ((num & 0x0f0f0f0f) << 4)  # swap first 4 with second 4 digits within each 8 digits
    num = ((num & 0xcccccccc) >> 2) | ((num & 0x33333333) << 2) # swap pairs of 2 within group of 4 digits
    num = ((num & 0xaaaaaaaa) >> 1) | ((num & 0x55555555) << 1) # swap alternate digits

    num
  end