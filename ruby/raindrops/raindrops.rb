module BookKeeping
  VERSION = 2
end

# Outputs Strings containing specific words
# based on the prime factors of a number.
class Raindrops
  class << self
    def convert(number)
      output = ''

      output += 'Pling' if pling? number
      output += 'Plang' if plang? number
      output += 'Plong' if plong? number

      output.empty? ? number.to_s : output
    end

    private

    def pling?(number)
      0 == number % 3
    end

    def plang?(number)
      0 == number % 5
    end

    def plong?(number)
      0 == number % 7
    end
  end
end
