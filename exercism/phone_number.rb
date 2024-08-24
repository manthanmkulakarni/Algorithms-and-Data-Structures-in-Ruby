#Problem: https://exercism.org/tracks/ruby/exercises/phone-number

#Solution
class PhoneNumber
    def self.clean(number)
      cleaned_num = number.gsub(/[\D]/,"")
      num_len = cleaned_num.length
      return nil if num_len<10 or num_len>11
      if num_len==11
        return nil unless cleaned_num[0]=="1"
        cleaned_num = cleaned_num[1..-1]
      end
      return nil unless self.valid_area_and_exchange_code(cleaned_num) 
      cleaned_num  
    end

    def self.valid_area_and_exchange_code(num)
      num[0].to_i >=2 and num[0].to_i <=9 and num[3].to_i >=2 and num[3].to_i <=9
    end
end

#Solution 2(Idiomatic)
class PhoneNumber
    VALID_PHONE_NUMBER = /^([2-9]\d\d){2}\d{4}$/
    def self.clean(number)
      numbers = number.gsub(/\D/, "").sub(/^1/, "")
      numbers[VALID_PHONE_NUMBER]
    end
end
  