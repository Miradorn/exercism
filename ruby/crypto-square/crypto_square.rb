# Implements SquareCrypto
class Crypto
  def initialize(string)
    @string = string
  end

  def normalize_plaintext
    @normalized ||= @string.gsub(/\W/, '').downcase
  end

  def size
    @size ||= Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    @chunks ||= normalize_plaintext.each_char.each_slice(size).map(&:join)
  end

  def ciphertext
    return @crypted if @crypted

    chunks = (0...size).each_with_index.map do |i|
      plaintext_segments.map { |chunk| chunk[i] }
    end
    @crypted ||= chunks.join
  end

  def normalize_ciphertext
    @normalized_cypher ||= ciphertext.in_groups(size).join(' ')
  end
end

# Adds `in_groups` taken from ActiveSupport
class String
  # Stolen from ActiveSupport
  def in_groups(number)
    division = size.div number
    modulo = size % number

    # create a new array avoiding dup
    groups = []
    start = 0

    number.times do |index|
      length = division + (modulo > 0 && modulo > index ? 1 : 0)
      groups << slice(start, length)
      start += length
    end

    if block_given?
      groups.each { |g| yield(g) }
    else
      groups
    end
  end
end
