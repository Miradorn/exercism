# Implements Base16 to Base10 conversion
class Hexadecimal
  VALUE = ('0'..'9').map { |l| [l, l.to_i] }.to_h.merge('a' => 10,
                                                        'b' => 11,
                                                        'c' => 12,
                                                        'd' => 13,
                                                        'e' => 14,
                                                        'f' => 15).freeze
  def initialize(value)
    @value = value
  end

  def to_decimal
    return 0 unless @value =~ /\A[0-9a-f]*\Z/

    @value.chars.reverse.each_with_index
          .reduce(0) { |acc, (n, i)| acc + (VALUE[n] * (16**i)) }
  end
end
