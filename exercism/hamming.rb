#Problem: https://exercism.org/tracks/ruby/exercises/hamming

#Solution 1
class Hamming
    def self.compute(dna,replicated_dna)
      dna_len = dna.length
      replicated_len = replicated_dna.length
      raise ArgumentError unless dna_len == replicated_len
      hamming_distance = 0
      for i in 0...dna_len
        hamming_distance+=1 unless dna[i]==replicated_dna[i]
      end
      hamming_distance
    end
end

#Solution 2
class Hamming
    def self.compute (sequence_a, sequence_b)
      if sequence_a.length != sequence_b.length then raise ArgumentError end
      sequence_a.chars.zip(sequence_b.chars).count { |a_char, b_char| a_char != b_char }
    end
end