# Problem: https://exercism.org/tracks/ruby/exercises/bank-account

# Solution
class BankAccount
    def initialize
      @opened = false
      @balance = 0
    end

    def open
      raise ArgumentError.new("You can't open an already open account") if @opened
      @opened = true
    end

    def balance
      raise ArgumentError.new("You can't check the balance of a closed account") unless @opened
      @balance
    end

    def deposit(amount)
      raise ArgumentError.new("You can't deposit a negative amount") if amount<0
      raise ArgumentError.new("You can't deposit money into a closed account") unless @opened
      @balance+= amount
    end

    def withdraw(amount)
      raise ArgumentError.new("You can't withdraw money into a closed account") unless @opened
      raise ArgumentError.new("You can't withdraw a negative amount") if amount<=0
      raise ArgumentError.new("You can't withdraw more than you have") if amount>@balance
      @balance-=amount
    end

    def close
      raise ArgumentError.new("You can't close an already closed account") unless @opened
      @opened = false
      @balance = 0
    end
end