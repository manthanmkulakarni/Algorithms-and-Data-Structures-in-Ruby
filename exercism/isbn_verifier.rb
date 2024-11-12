# Problem: https://exercism.org/tracks/ruby/exercises/isbn-verifier

# Solution
class IsbnVerifier
    def self.valid?(string)
      string = string.gsub("-","")
      return false if string.length!=10 or string.match(/\d{9}[0-9X]/).nil?
      result = string[-1]=="X" ? 10 : string[-1].to_i
      string[0...-1].chars.each_with_index do |char,idx|
        result+= ((10-idx)*(char.to_i))
      end
      result %11 ==0
    end
end