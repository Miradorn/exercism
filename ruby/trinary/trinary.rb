# Implements Base3 to Base9 conversion
class Trinary
  def initialize(number)
    @number = if number =~ /^[0-2]*$/
                number
              else
                '0'
              end
  end

  def to_decimal
    converter.convert(@number)
  end

  private

  def converter
    @converter ||= BaseToDecimal.new(3)
  end
end

# Implements general conversion of numbers in Base[2..9] to base9
class BaseToDecimal
  def initialize(base)
    raise ArgumentError unless (1..9).cover? base

    @base = base
  end

  def convert(number)
    number.each_char.map(&:to_i).reverse.each_with_index
          .reduce(0) { |acc, (n, i)| acc + (n * (@base**i)) }
  end
end
