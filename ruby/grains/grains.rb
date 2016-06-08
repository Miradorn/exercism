# Calculates the number of grains on a Square on a chess board and the
# total number of grains.
class Grains
  class << self
    def total
      upto(64).inject(:+)
    end

    def square(at)
      upto(at).last
    end

    private

    def upto(number)
      return [1] if number == 1

      squares = [1, 2]
      (2..(number - 1)).to_a.map do |i|
        prev = squares[i - 1]
        squares[i] = prev * 2
      end
      squares
    end
  end
end
