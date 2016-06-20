# Searches for Anagrams
class Anagram
  def initialize(word)
    @base = word.downcase
  end

  def match(list)
    list.select { |word| word.anagram?(@base) }
  end
end

# Adds Anagram related methods to String
class String
  def char_count
    chars.group_by { |l| l }
         .map { |char, list| [char.downcase, list.size] }
         .to_h
  end

  def anagram?(base)
    char_count == base.char_count && casecmp(base) != 0
  end
end
