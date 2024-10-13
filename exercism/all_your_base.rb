# Problem: https://exercism.org/tracks/ruby/exercises/all-your-base

# Solution:
class BaseConverter
    def self.convert(input_base, digits, output_base)
      raise ArgumentError if input_base<=1 or output_base<=1
      return [0] if digits.empty?
      num = 0
      digits.reverse.each_with_index do |digit,idx|
        raise ArgumentError if digit<0 or digit>=input_base
        num+=(digit*(input_base**idx))
      end
      output = num==0 ? [0] : []
      until num==0
        num,remainder = num.divmod(output_base)
        output.push(remainder)
      end
      output = output.reverse
    end
end

