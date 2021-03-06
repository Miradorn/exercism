class Nucleotide
  ALPHABET = %w(A C G T).freeze

  attr_reader :histogram

  def self.from_dna(dna)
    raise ArgumentError unless dna =~ /\A[#{ALPHABET.join}]*\Z/

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
