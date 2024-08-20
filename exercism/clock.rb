# Problem: https://exercism.org/tracks/ruby/exercises/clock

#Solution
class Clock
    attr_accessor :hour, :minute
    
    def initialize(hour:0,minute: 0)
      @hour = (hour+(minute/60)) % 24
      @minute = minute%60
    end
    
    def to_s
     display_time(@hour,@minute)
    end
    
    def ==(other)
      self.class == other.class &&
        @hour == other.hour &&
        @minute == other.minute
    end

    def +(other)
      raise TypeError unless self.class == other.class
      Clock.new(hour:@hour+other.hour,minute:@minute+other.minute)
    end

     def -(other)
      raise TypeError unless self.class == other.class
      Clock.new(hour:@hour-other.hour,minute:@minute-other.minute)
    end

    private
    def display_time(hour,minute)
      display_hour = hour <10 ? "0#{hour}" : hour
      display_minute = minute<10 ? "0#{minute}" : minute
      "#{display_hour}:#{display_minute}"
    end
end