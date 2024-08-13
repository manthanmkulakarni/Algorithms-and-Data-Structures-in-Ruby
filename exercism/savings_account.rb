#Problem: https://exercism.org/tracks/ruby/exercises/savings-account

#Solution
module SavingsAccount
    def self.interest_rate(balance=0.0)
      if balance<0.0
        3.213
      elsif balance<1000.0
        0.5
      elsif balance<5000.0
        1.621
      else
        2.475
      end 
    end

    def self.annual_balance_update(balance=0.0)
      interest=(interest_rate(balance)*balance/100.0)
      balance+=interest
    end

    def self.years_before_desired_balance(current_balance, desired_balance)
      years=0
      while current_balance<desired_balance
        years+=1
        current_balance=annual_balance_update(current_balance)
      end
      years
    end
end