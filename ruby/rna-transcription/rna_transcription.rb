module BookKeeping
  VERSION = 4
end

# Implements the replacement of DNA components with RNA components in a String
class Complement
  REPLACEMENTS = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }.freeze

  def self.of_dna(dna)
    # Return empty String if String is no valid DNA
    return '' unless dna.chars.all? { |char| REPLACEMENTS.keys.include? char }

    # replace each letter with its RNA complement
    replaced = dna.chars.map do |letter|
      REPLACEMENTS[letter]
    end
    replaced.join('')
  end
end
