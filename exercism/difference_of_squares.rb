#PROBLEM: https://exercism.org/tracks/ruby/exercises/difference-of-squares

#Solution 1(Using mathematical formulas)
class Squares
    def initialize(n)
      @n=n
    end
    def square_of_sum
      ((@n*@n*(@n+1)*(@n+1))/4).to_f
    end
    def sum_of_squares
      ((@n*(@n+1)*((2*@n)+1))/6).to_f
    end
    def difference
      square_of_sum-sum_of_squares
    end
end

#Solution 2
class Squares
    def initialize(number)
      @number = number
    end
    def square_of_sum
      (1..@number).sum**2
    end
    def sum_of_squares
      (1..@number).map{|x| x**2}.sum
    end
    def difference
      square_of_sum - sum_of_squares
    end
end