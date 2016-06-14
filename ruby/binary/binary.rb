module BookKeeping
  VERSION = 2
end

# Implements Binary numbers that can be converted to decimal
class Binary
  def initialize(binary)
    raise ArgumentError unless binary =~ /^(0|1)+$/
    @value = binary
  end

  def to_decimal
    @value.reverse.each_char.with_index
          .reduce(0) { |acc, (number, pos)| acc + (number.to_i * (2**pos)) }
  end
end
