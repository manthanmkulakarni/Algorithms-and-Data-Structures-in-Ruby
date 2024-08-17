# Problem: https://exercism.org/tracks/ruby/exercises/resistor-color-duo

# Solution 1
class ResistorColorDuo
    COLORS = %w[
      black
      brown
      red
      orange
      yellow
      green
      blue
      violet
      grey
      white
    ].freeze
    def self.value(colors)
      colors.first(2).map do |color| 
        COLORS.index(color)
      end.join.to_i
    end
end

#Solution 2
class ResistorColorDuo
  
    def self.value(colours)
      colour_codes = {Black: 0,Brown: 1,Red: 2,Orange: 3,Yellow: 4,Green: 5,Blue:6,Violet: 7,Grey: 8,White: 9}
      band1 =colours[0].to_sym.capitalize
      band2= colours[1].to_sym.capitalize
      
      colour_codes[band2]+(10*colour_codes[band1])
    end
end
      