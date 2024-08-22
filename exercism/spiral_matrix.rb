#Problem: https://exercism.org/tracks/ruby/exercises/spiral-matrix


#Solution 1
class SpiralMatrix
    attr_reader :size, :matrix
    def initialize(size)
      @size = size
      @matrix = Array.new(size) { Array.new(size) { nil } }
      spiral_move(1, [0, 0], [[1, 0], [0, 1], [-1, 0], [0, -1]])
    end
    def spiral_move(number, position, vector)
      return if @matrix.flatten.none?(&:nil?)
      x, y = position
      if (0...size).cover?(x) && (0...size).cover?(y) && @matrix[y][x].nil?
        @matrix[y][x] = number
        number += 1
      else
        x -= vector.first[0]
        y -= vector.first[1]
        vector = vector.push(vector.shift)
      end
      x += vector.first[0]
      y += vector.first[1]
      spiral_move(number, [x, y], vector)
    end
end

#Solution 2
class SpiralMatrix
    def initialize(size)
      @size = size
    end
    def matrix
      return [] if @size == 0
      number = @size ** 2 + 1
      result = []
      0.upto(@size * 2) do |m|
        previous = number
        number -= m / 2
        result = [[*number...previous], *result.reverse.transpose]
      end
      result
    end
end


#Solution 3 (brute force)
class SpiralMatrix
    def initialize(size)
      @matrix_size = size
    end
    def matrix
      return [] if @matrix_size<=0
      matrix  = Array.new(@matrix_size){Array.new(@matrix_size)}
      direction = "right"
      count = 1
      i,j = 0,0
      incomplete_rows, incomplete_cols = [-1,@matrix_size], [-1,@matrix_size]
      until count>(@matrix_size*@matrix_size)
        case direction
        when "right"
          if j<incomplete_cols[1]
            matrix[i][j]= count
            count+=1
            j+=1
          else
            direction = "down"
            incomplete_rows[0]+=1
            j = incomplete_cols[1]-1
            i+=1  
          end
        when "down"
          if i<incomplete_rows[1]
            matrix[i][j]= count
            count+=1
            i+=1
          else
            direction = "left"
            incomplete_cols[1]-=1
            i = incomplete_rows[1]-1
            j-=1
          end      
       when "left"
        if j>incomplete_cols[0]
          matrix[i][j]= count
          count+=1
          j-=1
        else
          direction = "up"
          incomplete_rows[1]-=1
          j = incomplete_cols[0]+1
          i-=1
        end
      when  "up"
          if i>incomplete_rows[0]
            matrix[i][j]= count
            count+=1
            i-=1
          else
            direction = "right"
            incomplete_cols[0]+=1
            i = incomplete_rows[0]+1
            j+=1
          end
      end
    end
      matrix
    end
end