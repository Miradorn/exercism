class Scrabble
  SCORES = { 1 => %w(A E I O U L N R S T),
             2 => %w(D G),
             3 => %w(B C M P),
             4 => %w(F H V W Y),
             5 => %w(K),
             8 => %w(J X),
             10 => %w(Q Z) }.freeze
  SCORE_FOR_LETTER = SCORES.invert
                           .map { |k, v| k.map { |l| { l => v } } }
                           .flatten
                           .reduce(:merge)
                           .freeze

  attr_reader :score

  def initialize(letters)
    if letters
      @score = letters.upcase
                      .gsub(/[^A-Z]/, '')
                      .each_char
                      .map { |l| SCORE_FOR_LETTER[l] }
                      .reduce(0, :+)
    else
      @score = 0
    end
  end

  def self.score(letters)
    new(letters).score
  end
end
