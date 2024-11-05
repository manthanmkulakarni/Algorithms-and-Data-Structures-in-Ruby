# Problem: https://exercism.org/tracks/ruby/exercises/rotational-cipher

# Solution
class RotationalCipher
    LETTERS = ("a".."z").to_a
    
    def self.rotate(input,key)
      ciphertext=""
      input.chars.each do |char|
        if LETTERS.include?(char)
          ciphertext+=LETTERS[(LETTERS.index(char)+key)%26]
        elsif LETTERS.include?(char.downcase)
          ciphertext+=LETTERS[(LETTERS.index(char.downcase)+key)%26].upcase
        else
          ciphertext+=char 
        end
      end
        ciphertext
    end
end