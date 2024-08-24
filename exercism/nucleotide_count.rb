#Problem: https://exercism.org/tracks/ruby/exercises/nucleotide-count

#Solution
class Nucleotide
    def initialize(dna_strand)
      nucleotides = dna_strand.split("")
      @nucleotide_count = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
      nucleotides.each do |nucleotide|
        raise ArgumentError unless @nucleotide_count.has_key?(nucleotide)
        @nucleotide_count[nucleotide]+=1
      end
    end
    
    def self.from_dna(dna_strand)
      Nucleotide.new(dna_strand)
    end
    
    def count(nucleotide)
      @nucleotide_count[nucleotide]
    end
    
    def histogram
      @nucleotide_count
    end
end