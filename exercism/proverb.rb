#Problem: https://exercism.org/tracks/ruby/exercises/proverb

#Solution
class Proverb
    def initialize(*inputs,qualifier:nil)
      @proverb = ""
      base_line = "For want of a %{first} the %{second} was lost.\n"
      last_line = "And all for the want of a %{qualifier}."
      qualifier = qualifier.nil? ? inputs[0] : "#{qualifier} #{inputs[0]}"
      input_len = inputs.length
      for i in 0..input_len-2
        @proverb+= base_line % {first: inputs[i],second:inputs[i+1]}
      end
      @proverb+= last_line % {qualifier:qualifier}
    end

    def to_s
      @proverb
    end
end

#Solution 2 (using each_cons to simplify iterations)
class Proverb
    def initialize(*inputs,qualifier:nil)
      @proverb = ""
      base_line = "For want of a %{first} the %{second} was lost.\n"
      last_line = "And all for the want of a %{qualifier}."
      qualifier = qualifier.nil? ? inputs[0] : "#{qualifier} #{inputs[0]}"
      inputs.each_cons(2) do |items|
        @proverb+= base_line % {first: items[0],second:items[1]}
      end
      @proverb+= last_line % {qualifier:qualifier}
    end
    def to_s
      @proverb
    end
end