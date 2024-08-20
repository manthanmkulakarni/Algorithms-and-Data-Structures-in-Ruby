#Problem :https://exercism.org/tracks/ruby/exercises/luhn

#Solution 1
class Luhn
    def self.valid?(card_num)
      is_index_odd = true
      card_len = 0
      sum=0
      for i in (card_num.length-1).downto(0)
        next if card_num[i]==" "
        return false if card_num[i]<"0" or card_num[i]>"9"
        card_len+=1
        digit = is_index_odd ? card_num[i].to_i : (card_num[i].to_i*2)
        digit = digit>9 ? digit-9 : digit
        sum+=digit
        is_index_odd = !is_index_odd
      end
      sum%10==0 and card_len>1
    end
end

#Solution 2
# Toggling multiplier between one and two
class Luhn
    def self.valid?(card_num)
      multiplier = 2
      card_len = 0
      sum=0
      for i in (card_num.length-1).downto(0)
        next if card_num[i]==" "
        return false if card_num[i]<"0" or card_num[i]>"9"
        card_len+=1
        multiplier = 3-multiplier
        digit = (card_num[i].to_i*multiplier)
        digit = digit>9 ? digit-9 : digit
        sum+=digit
      end
      sum%10==0 and card_len>1
    end
end

#Solution 3
class Luhn
    def self.valid?(card_num)
      card_num = card_num.gsub(/\s/,'')
      return false unless card_num.scan(/\D/).empty?
      card_num_len = card_num.length
      return false if card_num_len<=1
      card_digits =card_num.reverse.chars.map(&:to_i)
      multiplier = 2
      for i in 0...card_num_len
        multiplier = 3-multiplier #This will toggle between 1 and 2
        card_digits[i]*=multiplier
        card_digits[i]= card_digits[i]-9 if  card_digits[i]>9
      end
      card_digits.sum%10==0
    end
end

