# Problem: https://exercism.org/tracks/ruby/exercises/microwave

# Solution
class Microwave
    def initialize(input)
      debug"#{input.divmod(100)}"
      @minutes,@seconds = input<100 ? input.divmod(60) : input.divmod(100)
      if @seconds>=60 
        @minutes+=(@seconds/60)
        @seconds%=60
      end
    end

    def timer
      sprintf("%02d:%02d", @minutes, @seconds)
    end
end