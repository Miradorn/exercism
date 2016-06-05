module BookKeeping
  VERSION = 2
end

# Determines of a string is a pangram (contains every letter of the Alphabet
# exaclty once)
class Pangram
  def self.is_pangram?(string)
    downcased = string.downcase
    normalized = downcased.gsub(/[^a-z]/, '')
    letters = normalized.chars.uniq
    letters.length >= 26
  end
end
