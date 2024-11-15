# Problem: https://exercism.org/tracks/ruby/exercises/darts

# Solution
class Darts

    def initialize(x,y)
      @x=x
      @y=y
    end

    def score
      distance = Math.sqrt(@x*@x + @y*@y)
      
      if distance <=1
        return 10
      end

      if distance<=5
        return 5
      end

      if distance<=10
        return 1
      end

      return 0
    end
end