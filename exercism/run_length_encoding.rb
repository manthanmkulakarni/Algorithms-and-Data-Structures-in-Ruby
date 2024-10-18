# Problem: https://exercism.org/tracks/ruby/exercises/run-length-encoding

# Solution (Brute force)
class RunLengthEncoding
    def self.encode(input)
      return "" if input==""
      encoded_msg = ""
      curr_char_count = 0
      prev_char = ""
      input.chars.each do |char|
        if prev_char != char
          encoded_msg+="#{curr_char_count>1?curr_char_count:""}#{prev_char}"
          prev_char = char
          curr_char_count=0
        end
        curr_char_count+=1
      end
      encoded_msg+="#{curr_char_count>1?curr_char_count:""}#{prev_char}"
      encoded_msg
    end

    def self.decode(encoded_input)
      decoded_msg = ""
      curr_num_str = ""
      curr_char = ""
      encoded_input.chars.each do |char|
        if char.match(/\d/)
          curr_num_str+=char
          next
        end
        decoded_msg+="#{curr_num_str=="" ? char: (char*curr_num_str.to_i)}"
        curr_num_str = ""
      end
      decoded_msg     
    end
end

# Solution(Using Regex)
class RunLengthEncoding
    def self.encode(input)
      input.gsub(/(.)\1+/) { |m| "#{m.length}#{m[0]}" }
    end

    def self.decode(input)
      input.gsub(/\d+./) { |m| m[-1] * m.to_i }
    end
end

# Solution(Using Collections)
class RunLengthEncoding
    def self.encode(input)
      input
        .chars
        .chunk { |c| c }
        .collect { |k,v| [v.length > 1 ? v.length : '', k].join }
        .join
    end

    def self.decode(input)
      input
        .scan(/(\d*)([ \w]+?)/)
        .map { |c| c[1] * (c[0] != '' ? c[0].to_i : 1) }
        .join
    end
end