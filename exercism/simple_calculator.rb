# Problem : https://exercism.org/tracks/ruby/exercises/simple-calculator

#Solution
class SimpleCalculator
    ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
    UnsupportedOperation=""
    def self.calculate(first_operand, second_operand, operation)
      raise ArgumentError unless first_operand.kind_of? (Integer) and second_operand.kind_of?(Integer) 
      case operation
      when "+"
        "#{first_operand} #{operation} #{second_operand} = #{first_operand+second_operand}"
      when "*"
        "#{first_operand} #{operation} #{second_operand} = #{first_operand*second_operand}"
      when "/"
        begin
          "#{first_operand} #{operation} #{second_operand} = #{first_operand/second_operand}"
        rescue ZeroDivisionError
          "Division by zero is not allowed."
        end
      else 
        raise UnsupportedOperation
      end
    end
end