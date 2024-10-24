# Problem: https://exercism.org/tracks/ruby/exercises/protein-translation

# Solution
class InvalidCodonError < StandardError; end
class Translation
  CODON_PROTEIN_MAP = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine", 
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan"
  }
  STOP_CODONS = ["UAA", "UAG", "UGA"]
  
  def self.of_rna(strand)
    return [] if strand.empty?
    raise InvalidCodonError if strand.length < 3
    codon = strand[0, 3]
    return [] if STOP_CODONS.include?(codon)
    raise InvalidCodonError if CODON_PROTEIN_MAP[codon].nil?
    [CODON_PROTEIN_MAP[codon]] + of_rna(strand[3..-1])
  end
end