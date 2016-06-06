module BookKeeping
  VERSION = 2
end

# Add a `to_roman` method to Numbers
class Fixnum
  def to_roman
    rest = self
    string = ''
    while rest != 0
      number, literal = mapping.find { |key, _| rest - key >= 0 }
      rest -= number
      string += literal
    end
    string
  end

  private

  def mapping
    {
      1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
      90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX',
      5 => 'V', 4 => 'IV', 1 => 'I'
    }
  end
end
