# Problem

# Solution
class ComplexNumber
    attr_accessor :real,:imaginary
    
    def initialize(real=0,imaginary=0)
      @real = real
      @imaginary = imaginary
    end

    def +(other)
      raise ArgumentError unless other.is_a?(ComplexNumber)
      real = self.real + other.real
      imaginary = self.imaginary + other.imaginary
      ComplexNumber.new(real,imaginary)
    end

    def -(other)
      raise ArgumentError unless other.is_a?(ComplexNumber)
      real = self.real - other.real
      imaginary = self.imaginary - other.imaginary
      ComplexNumber.new(real,imaginary)
    end

    def *(other)
      raise ArgumentError unless other.is_a?(ComplexNumber)
      real = (self.real*other.real)-(self.imaginary*other.imaginary)
      imaginary = (self.real*other.imaginary)+(self.imaginary*other.real)
      ComplexNumber.new(real,imaginary)
    end

    def /(other)
      raise ArgumentError unless other.is_a?(ComplexNumber)
      real = ((self.real*other.real)+(self.imaginary*other.imaginary) )/ other.abs**2
      imaginary = ((self.imaginary*other.real)-(self.real*other.imaginary)) / other.abs**2
      ComplexNumber.new(real,imaginary)
    end

    def ==(other)
      raise ArgumentError unless other.is_a?(ComplexNumber)
      (self.real-other.real).abs <1e-15 and (self.imaginary-other.imaginary).abs < 1e-15
    end
    
    def abs
      Math.sqrt(@real**2+@imaginary**2)
    end

    def conjugate
      ComplexNumber.new(@real,-1*@imaginary)
    end

    def exp
      real = Math.exp(@real)*Math.cos(@imaginary)
      imaginary = Math.exp(@real)*Math.sin(@imaginary)
      ComplexNumber.new(real,imaginary)
    end
end