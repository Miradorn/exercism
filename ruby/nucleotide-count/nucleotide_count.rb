class Nucleotide
  ALPHABET = %W(A C G T)

  attr_reader :histogram

  def self.from_dna(dna)
    raise ArgumentError unless dna =~ /\A[ACGT]*\Z/

    counts = ALPHABET.map { |l| [l, dna.count(l)] }.to_h
    new(counts)
  end

  def initialize(counts)
    @histogram = counts
  end

  def count(l)
    histogram[l]
  end

end
