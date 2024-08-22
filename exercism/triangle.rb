#Problem: https://exercism.org/tracks/ruby/exercises/triangle

#Solution
class Triangle
    def initialize(sides)
      @sides = sides
    end

    def equilateral?
      triangle? and @sides.uniq.length == 1
    end

    def isosceles?
      triangle? and @sides.uniq.length < 3
    end

    def scalene?
      triangle? and @sides.uniq.length == 3
    end

    private
    def triangle?
      @sides.all?(&:positive?) &&
      @sides.permutation(3).all? { |(a, b, c)| a <= b + c }
    end    
end