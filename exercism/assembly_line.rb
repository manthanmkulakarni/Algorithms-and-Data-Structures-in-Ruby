#problem: https://exercism.org/tracks/ruby/exercises/assembly-line

#Solution
class AssemblyLine
    YIELD=221
    
    def initialize(speed)
      raise ArgumentError "Speed should be between 1 to 10" unless speed.between?(1,10)
      @speed = speed
    end

    def production_rate_per_hour
       YIELD*@speed*success_rate
    end

    def working_items_per_minute
      (production_rate_per_hour/60).to_int
    end

  private

    def success_rate
        case @speed
        when 1..4
            1
        when 5..8
            0.9
        when 9
            0.8
        else
            0.77
        end
    end
end