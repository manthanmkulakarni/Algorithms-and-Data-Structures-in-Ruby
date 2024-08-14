=begin
You are climbing a staircase. It takes n steps to reach the top.
Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
=end

# Solution 1 (Simple recursion)
def climb_stairs(n)
    return n if [1,2].include?(n)
    climb_stairs(n-1)+climb_stairs(n-2)
end

# Solution 2 (using Dynamic programming: Memoization)
#Top-down approach
def climb_stairs(n)
    steps = {}
    calculate_steps(n,steps)
end

def calculate_steps(n,steps)
    return 1 if [0,1].include?(n)
    return steps[n] if steps.has_key?(n)
    steps[n] = calculate_steps(n-1,steps)+calculate_steps(n-2,steps)   
end

# Solution 3 (using Dynamic programming: Tabulation)
#bottom-up approach
def climb_stairs(n)
    steps = {}
    steps[1] = 1
    steps[0] = 1
    for i in 2..n
      steps[i]=steps[i-1]+steps[i-2]
    end
    steps[n]
end

# Solution 4 (using only two vars prev and curr)
def climb_stairs(n)
    prev = curr = 1
    for i in 2..n
      temp = curr
      curr = curr + prev
      prev = temp
    end
    curr
end

