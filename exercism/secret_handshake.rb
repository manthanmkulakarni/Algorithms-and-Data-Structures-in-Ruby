# Problem: https://exercism.org/tracks/ruby/exercises/secret-handshake

# Solution
class SecretHandshake
    ACTIONS = ["wink", "double blink", "close your eyes", "jump"]

    def initialize(number)
      @number = number.is_a?(Integer) ? number : 0
    end
    
    def commands
      actions =[]
      bit_len = @number.digits(2).length
      return actions if @number.zero?

      for i in 0..(bit_len>3 ? 3 : bit_len)
        actions.push(ACTIONS[i]) if (@number & (1<<i)) >0
      end
      @number & (1<<4) >0 ?  (actions.reverse) : actions
    end
end

# Solution 2
class SecretHandshake
    ACTIONS = ["wink", "double blink", "close your eyes", "jump"]
    def initialize(number)
      @binary_digits = number.is_a?(Integer) ? (number.digits(2)) : []
    end
    
    def commands
      actions =[]
      return actions if @binary_digits.empty?
      
      len = @binary_digits.length
      for i in 0...(len>4 ? len-1 : len)
        actions.push(ACTIONS[i]) if @binary_digits[i]==1
      end
      (len>4 and @binary_digits[-1]==1) ? (actions.reverse) : actions
    end
end