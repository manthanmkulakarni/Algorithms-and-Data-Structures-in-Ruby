=begin
Write a function that takes the binary representation of a positive integer and returns the number of 
set bits it has (also known as the Hamming weight).
=end

# Solution 1
def hamming_weight(n)
    num_of_set_bits = 0
    while n>0
        pow = Math.log(n,2).to_int
        n-=(2**pow)
        num_of_set_bits+=1
    end
    num_of_set_bits
end

#Solution 2 (using bit operations)
def hamming_weight(n)
    num_of_set_bits = 0
    while n>0
        num_of_set_bits+=(n&1)
        n=(n>>1)
    end
    num_of_set_bits
end