class PigLatin
  class << self
    def translate(phrase)
      words = phrase.split
      words.map { |word| move_consonants(word) + 'ay' }.join ' '
    end

    private

    def move_two?(string)
      string.start_with? 'q'
    end

    def move_one?(string)
      !string.start_with?(*%w(a e i o u yt xr))
    end

    def move_consonants(word)
      if move_two? word
        move_consonants(word[2..-1] + word[0..1])
      elsif move_one? word
        move_consonants(word[1..-1] + word[0])
      else
        word
      end
    end
  end
end
