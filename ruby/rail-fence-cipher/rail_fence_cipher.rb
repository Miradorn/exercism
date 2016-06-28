# Encodes and Decodes the RailFenceCipher
# Surely won't win a beauty award, but it works and isn't too complex.
class RailFenceCipher
  VERSION = 1

  class << self
    def encode(sentence, num_rails)
      return sentence if num_rails == 1
      rails = Array.new(num_rails) { Array.new(sentence.length) }

      direction = 1
      line = 0
      sentence.length.times do |pos|
        rails[line][pos] = sentence[pos]

        line += direction

        direction = new_direction(direction, line, num_rails - 1)
      end
      rails.flatten.compact.join
    end

    def decode(sentence, num_rails)
      return sentence if num_rails == 1

      fence = build_fence(num_rails, sentence.length)

      filled = fill(fence, sentence)

      read_fence(filled).join
    end

    private

    def read_fence(fence)
      direction = 1
      line = 0
      Array.new(fence.first.size) do |i|
        result = fence[line][i]

        line += direction

        direction = new_direction(direction, line, fence.size - 1)

        result
      end
    end

    def fill(fence, sentence)
      pos = -1
      fence.map do |row|
        row.map do |placeholder|
          unless placeholder.nil?
            pos += 1
            sentence[pos]
          end
        end
      end
    end

    def build_fence(num_rails, length)
      fence = Array.new(num_rails) { Array.new(length) }
      line = 0
      direction = 1
      length.times do |pos|
        fence[line][pos] = :token

        line += direction
        direction = new_direction(direction, line, num_rails - 1)
      end
      fence
    end

    def new_direction(direction, index, lines)
      if index == lines
        -1
      elsif index == 0
        1
      else
        direction
      end
    end
  end
end
