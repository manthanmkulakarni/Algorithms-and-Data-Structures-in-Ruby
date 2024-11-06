# problem: https://exercism.org/tracks/ruby/exercises/largest-series-product

# Solution(idiomatic ruby- using each_cons)
class Series
    def initialize(series)
      @series = series
    end
    def largest_product(span)
      raise ArgumentError if span<=0 or span>@series.length or !@series.scan(/\D/).empty?
      max_product =0
      @series.chars.each_cons(span) do |number|
        curr_product = 1
        number.each do |digit|
          curr_product*=digit.to_i
        end
      max_product = max_product >curr_product ? max_product : curr_product
    end
      max_product
    end
end

# Solution
class Series
    def initialize(series)
      @series = series
    end
    
    def largest_product(span)
      raise ArgumentError if span<=0 or span>@series.length or !@series.scan(/\D/).empty?
      max_product =0
      curr_product = 1
      for i in 0..(@series.length-span)
        @series[i...(span+i)].chars.each do |digit|
          curr_product*= digit.to_i
        end
        max_product = max_product>curr_product ? max_product: curr_product
        curr_product = 1
      end
      max_product
    end
end

