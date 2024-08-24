#Problem : https://exercism.org/tracks/ruby/exercises/armstrong-numbers

#Solution
class ArmstrongNumbers
    def self.include?(num)
      return true if num%10==num
      n=number_of_digits(num)
      sum= sum_of_pow(num,n)
      if sum==num
        return true
      else
        return false
      end
    end

    def self.number_of_digits(i)
      count =0
     until i==0
       count +=1
       i/=10
     end
    count
    end

    def self.sum_of_pow(number,number_of_digits)
      sum=0
      for i in 0..number_of_digits
        j=number%10
        number/=10
        sum+=(j**number_of_digits)
      end
      sum
    end     
end

#Solution 2