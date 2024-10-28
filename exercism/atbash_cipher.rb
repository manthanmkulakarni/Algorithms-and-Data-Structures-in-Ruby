# Problem: https://exercism.org/tracks/ruby/exercises/atbash-cipher

# Solution
class Atbash
    LETTERS = ("a".."z").to_a

    def self.encode(plaintext)
      return "" if plaintext == ""
      ciphertext = ""
      plaintext = plaintext.downcase
      curr_cipher_len = 0
      for i in 0...(plaintext.length)
        if curr_cipher_len==5
          ciphertext+=" "
          curr_cipher_len = 0
        end 
        
        if plaintext[i].match(/\d+/)
          ciphertext+=plaintext[i]
          curr_cipher_len+=1
          next
        end
        
        unless LETTERS.index(plaintext[i]).nil?
          ciphertext+= LETTERS[25-LETTERS.index(plaintext[i])]
          curr_cipher_len+=1
        end
      end
      ciphertext.strip
    end

    def self.decode(ciphertext)
      return "" if ciphertext == ""
      plaintext = ""
      ciphertext = ciphertext.gsub(" ","")
      ciphertext.chars.each do |char|
        if LETTERS.index(char).nil?
          plaintext+=char
        else
          plaintext+= LETTERS[25-LETTERS.index(char)]
        end
      end
      plaintext
    end
end
  
# Solution(idiomatic ruby)
lass Atbash
  ALPHA = ('a'..'z').to_a.join
  
  def self.encode(text)
    decode(text).chars.each_slice(5).map(&:join).join(' ')
  end

  def self.decode(text)
    text.downcase.gsub(/\W/, '').tr(ALPHA, ALPHA.reverse)
  end
end
