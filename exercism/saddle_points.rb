#Problem: https://exercism.org/tracks/ruby/exercises/saddle-points

#Solution
class Grid
    def self.saddle_points(input)
      row_min_map = self.get_row_min_map(input)
      col_min_map = self.get_col_min_map(input)
      saddle_points = []
      input.each_with_index do |row,row_index|
        row.each_with_index do |element,col_index|
          if element>=row_min_map[row_index+1] && element<=col_min_map[col_index+1]
            saddle_points.append({"row"=>row_index+1,"column"=>col_index+1}) 
          end
        end
      end   
      return saddle_points
    end
    
    def self.get_row_min_map(input)
      row_min_map={}
      input.each_with_index do |row,index|
        row_min_map[index+1] = row.max
      end
      row_min_map
    end

    def self.get_col_min_map(input)
      col_min_map={}
      for i in (0...input[0].length) do
        min = input[0][i]
        for j in (0...input.length) do
          min = input[j][i] if min>=input[j][i]
        end
        col_min_map[i+1]=min
      end
      col_min_map
    end   
end