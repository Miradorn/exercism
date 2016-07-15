class OCR
  MAPPING = Hash.new('?').merge([' _ ', '| |', '|_|'] => '0',
                                ['   ', '  |', '  |'] => '1',
                                [' _ ', ' _|', '|_ '] => '2',
                                [' _ ', ' _|', ' _|'] => '3',
                                ['   ', '|_|', '  |'] => '4',
                                [' _ ', '|_ ', ' _|'] => '5',
                                [' _ ', '|_ ', '|_|'] => '6',
                                [' _ ', '  |', '  |'] => '7',
                                [' _ ', '|_|', '|_|'] => '8',
                                [' _ ', '|_|', ' _|'] => '9')

  def initialize(text)
    lines = text.split "\n"
    lines = lines[0..-2]
    digits = lines.map { |line| line.each_char.each_slice(3).map(&:join) }
    decoded = (0...(lines.first.length / 3)).map do |i|
      [digits[0][i], digits[1][i], digits[2][i]]
    end
    @numbers = decoded.map { |d| MAPPING[d] }.join
  end

  def convert
    @numbers
  end
end
