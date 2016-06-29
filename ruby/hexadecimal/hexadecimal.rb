# Implements Base16 to Base10 conversion
class Hexadecimal
  VALUE = '0123456789abcdef'.each_char
                            .each_with_index
                            .map { |l, v| [l, v] }.to_h.freeze

  def initialize(value)
    @value = value
  end

  def to_decimal
    return 0 unless @value =~ /\A[0-9a-f]*\Z/

    @value.chars.reverse.each_with_index
          .reduce(0) { |acc, (n, i)| acc + (VALUE[n] * (16**i)) }
  end
end
