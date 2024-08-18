#Problem: https://exercism.org/tracks/ruby/exercises/matrix

#Solution
class Matrix
    def initialize(str)
      @matrix = str.split("\n").map {|row| row.split(" ")}
    end
    def row(n)
      if n>@matrix.size
        raise "Row does not exist"
      end
        return @matrix[n-1].map(&:to_i)
    end
    def column(n)
       if n>@matrix[0].size
        raise "Column does not exist"
      end
      col =[]
      @matrix.each_with_index do |elem,index|
        col.append(elem[n-1].to_i)
      end
      return col
    end
    
end