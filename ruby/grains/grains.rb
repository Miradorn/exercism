# Calculates the number of grains on a Square on a chess board and the
# total number of grains.
class Grains
  class << self
    def total
      squares_to(64).inject(:+)
    end

    def square(at)
      squares_to(at).last
    end

    private

    def squares_to(number)
      return [1] if number == 1

      squares = [1, 2]
      (2...number).each { |i| squares[i] = squares[i - 1] * 2 }
      squares
    end
  end
end
