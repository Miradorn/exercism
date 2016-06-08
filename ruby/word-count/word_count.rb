module BookKeeping
  VERSION = 1
end

# Counts the occurence of each word in a String.
class Phrase
  def initialize(words)
    @words = words
  end

  def word_count
    normalized_words = @words.downcase.gsub(/[^a-z0-9', ]/, '')
                             .gsub(/,(\S)/, ' \1').delete(',')
                             .gsub(/'(\w*)'/, '\1').gsub(/\s+/, ' ')
    grouped = normalized_words.split(/\s/).group_by { |word| word }
    counts = grouped.map { |word, array| [word, array.count] }
    Hash[counts]
  end
end
