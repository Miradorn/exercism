# Slices strings in given Sizes
class Series
  def initialize(string)
    @numbers = string.each_char.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError unless size <= @numbers.length

    @numbers.each_cons(size).to_a
  end
end
