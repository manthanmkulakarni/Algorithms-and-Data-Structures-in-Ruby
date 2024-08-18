#Problem: https://exercism.org/tracks/ruby/exercises/series

#Solution
class Series
    def initialize(str)
      @series = str
    end
    def slices(len)
      str_len = @series.length
      raise ArgumentError if len <=0|| str_len<=0 || str_len<len
      @series.chars.each_cons(len).map(&:join)
    end
end

#Solution 2
class Series
    def initialize(str)
      @series = str
    end
    def slices(len)
      str_len = @series.length
      raise ArgumentError if len <=0|| str_len<=0 || str_len<len
      slices = []
      i=0 
      while i+len<str_len
        slices.push(@series[i...(i+len)])
        i+=1
      end
      slices.push(@series[i...str_len])if i<str_len
      slices
    end
end