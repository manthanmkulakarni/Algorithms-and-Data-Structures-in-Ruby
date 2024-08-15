=begin
Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n),
ans[i] is the number of 1's in the binary representation of i.
=end

#Solution 1 (O(n log n))
def count_bits(n)
    ans = []
    for i in 0..n
        num_of_set_bits = 0
        while i>0
            pow = Math.log(i,2).to_int
            i-=(2**pow)
            num_of_set_bits+=1
        end
        ans.push(num_of_set_bits)
    end
    ans
end

# Solution 2 (O(n))
# Approach: Left shift or right shift doesn't change num of bits in even numbers it only halves the number
def count_bits(n)
    bits_count = [0]*(n+1)
    return bits_count unless n>0
    bits_count[1]=1
    for i in 2..n
        bits_count[i] = bits_count[i/2]
        bits_count[i]+=1 unless i%2==0
    end
    bits_count
end

#Solution 3 (O(n))
def count_bits(n)
    bits_count = [0]*(n+1)
    return bits_count unless n>0
    bits_count[1]=1
    for i in 2..n
        # replaced division with right shift and condition with bitwise and op with 1
        bits_count[i] = bits_count[i>>1]+(i&1) 
    end
    bits_count
end

