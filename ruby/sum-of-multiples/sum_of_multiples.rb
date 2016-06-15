# Sums all numbers upto a limit that are a multiple of given numbers.
class SumOfMultiples
  def initialize(*bases)
    @bases = bases
  end

  def to(limit)
    nums = (0...limit).select do |num|
      @bases.any? { |base| num % base == 0 }
    end
    nums.inject(:+)
  end
end
