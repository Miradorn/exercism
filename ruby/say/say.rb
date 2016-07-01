# Says a number between 0 and 1_000_000_000_000 in english.
# This seems like a straightforward thing to do, but as it turns out isn't.
class Say
  WORDS = {
    '0' => 'zero',
    '1' => 'one',
    '2' => 'two',
    '3' => 'three',
    '4' => 'four',
    '5' => 'five',
    '6' => 'six',
    '7' => 'seven',
    '8' => 'eigth',
    '9' => 'nine',
    '10' => 'ten',
    '11' => 'eleven',
    '12' => 'twelve',
    '13' => 'thirteen',
    '14' => 'fourteen',
    '15' => 'fifteen',
    '16' => 'sixteen',
    '17' => 'seventeen',
    '18' => 'eighteen',
    '19' => 'nineteen',
    '20' => 'twenty',
    '30' => 'thirty',
    '40' => 'forty',
    '50' => 'fifty',
    '60' => 'sixty',
    '70' => 'seventy',
    '80' => 'eighty',
    '90' => 'ninety'
  }.freeze

  MAGNITUDE = {
    0 => '',
    1 => 'thousand',
    2 => 'million',
    3 => 'billion'
  }.freeze

  def initialize(number)
    raise ArgumentError unless (0...1_000_000_000_000).cover? number

    @splitted = number.to_s.each_char.reverse_each.each_slice(3)
                      .map(&:reverse).reverse_each.to_a
  end

  def in_english
    @splitted.reverse.each_with_index.map do |slice, index|
      n = case slice.length
          when 1
            WORDS[slice.first]
          when 2
            tens_and_ones slice.first, slice.last
          when 3
            hundreds_tens_and_ones(*slice)
          end
      with_magnitude(n, index)
    end.reverse.reject(&:empty?).join ' '
  end

  private

  def tens_and_ones(tens, ones)
    if tens == '0'
      WORDS[ones]
    else
      WORDS[tens + ones] || (WORDS[tens + '0'] + '-' + WORDS[ones])
    end
  end

  def hundreds_tens_and_ones(hundreds, tens, ones)
    return '' if [hundreds, tens, ones].all? { |n| n == '0' }
    return tens_and_ones(tens, ones) if hundreds == '0'

    start = WORDS[hundreds] + ' hundred'
    if tens == '0' && ones == '0'
      start
    else
      start + ' ' + tens_and_ones(tens, ones)
    end
  end

  def with_magnitude(n, index)
    if index.zero? || n.empty?
      n
    else
      n + ' ' + MAGNITUDE[index]
    end
  end
end
