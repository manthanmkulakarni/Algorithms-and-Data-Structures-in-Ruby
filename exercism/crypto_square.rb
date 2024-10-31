# Problem: https://exercism.org/tracks/ruby/exercises/crypto-square

# Solution
class Crypto
    def initialize(plaintext)
      @plaintext = plaintext
    end

    def ciphertext
      normalized_text = @plaintext.downcase.gsub(/\W/,"")
      text_len = normalized_text.length
      return "" if text_len==0
      col_len = Math.sqrt(text_len).ceil
      row_len = col_len*(col_len-1) < text_len ? col_len : col_len-1
      char_deficit = (col_len*row_len)-text_len
      normalized_text+=(" "*char_deficit)
      normalized_text
          .chars
          .each_slice(col_len)
          .to_a
          .transpose
          .map{|col| col.join("")}
          .join(" ")
    end
end

# Solution (idiomatic)
class Crypto
    def initialize(plaintext)
      @plaintext = plaintext
    end
    
    def ciphertext
      normalized_text = @plaintext.downcase.gsub(/[^\da-z]/, '')
      length = normalized_text.length
      return '' if length.zero?
      cols = Math.sqrt(length).ceil
      rows = length.quo(cols).ceil
      rectangle_base = normalized_text + ' ' * (cols * rows - length)
      rectangle_base.chars.each_slice(cols).to_a.transpose.map(&:join).join(' ')
    end
end
