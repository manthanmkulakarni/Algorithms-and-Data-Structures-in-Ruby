#Problem: https://exercism.org/tracks/ruby/exercises/rna-transcription

#Solution 1
module Complement
    def self.of_dna(dna)
      dna.tr("GCTA","CGAU")
    end
end

#Solution 2
class Complement
    def self.of_dna(dna_strand)
      dna_strand.gsub(/[GCTA]/, 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')
    end
end