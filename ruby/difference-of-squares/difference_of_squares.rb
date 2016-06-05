module BookKeeping
  VERSION = 3
end

# Compares the sum of squares and the square of the sum of the first N natural
# Numbers
class Squares
  def initialize(number)
    @upto = number
  end

  def sum_of_squares
    @upto.zero? ? 0 : (1..@upto).map { |n| n**2 }.inject(:+)
  end

  def square_of_sum
    @upto.zero? ? 0 : (1..@upto).inject(:+)**2
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
