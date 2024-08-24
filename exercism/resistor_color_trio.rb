#Problem : https://exercism.org/tracks/ruby/exercises/resistor-color-trio

#Solution
class ResistorColorTrio
    COLOR_CODES = {
                    "black" => 0,
                    "brown" => 1,
                    "red" => 2,
                    "orange" => 3,
                    "yellow" => 4,
                    "green" => 5,
                    "blue" => 6,
                    "violet" => 7,
                    "grey" => 8,
                    "white" => 9
                  }
    def initialize(colors)
      @color_bands = colors
    end
    
    def label
      resistor_val = (COLOR_CODES[@color_bands[0]]*10 + COLOR_CODES[@color_bands[1]])*(10**COLOR_CODES[@color_bands[2]])
      unit = "ohms"
      if resistor_val>1000
        resistor_val/=1000
        unit = "kiloohms"
      end
      "Resistor value: #{resistor_val} #{unit}"
    end
  end