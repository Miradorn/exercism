module BookKeeping
  VERSION = 2
end

# Implements RunLengthEncoding (RLE) for Strings
class RunLengthEncoding
  class << self
    def encode(string)
      string.chars.chunk { |l| l }.map { |char_data| encoded(char_data) }.join
    end

    def decode(string)
      string.split(/(\d*\D)/).reject(&:empty?).map { |d| decoded(d) }.join
    end

    private

    def encoded(char_data)
      length = char_data.last.length
      char = char_data.first
      if length == 1
        char
      else
        "#{length}#{char}"
      end
    end

    def decoded(data)
      count = data[0..-2].to_i
      char = data[-1]
      if count == 0
        char
      else
        char * count
      end
    end
  end
end
