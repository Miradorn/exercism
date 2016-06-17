# Cleans and normalizes Phone Numbers in american Format.
class PhoneNumber
  INVALID = '0000000000'.freeze

  attr_reader :number

  def initialize(number)
    cleaned = clean number
    too_short_checked = check_too_short cleaned
    removed_one = remove_leading_one too_short_checked
    too_long_checked = check_too_long removed_one

    @number = too_long_checked
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..9]}"
  end

  private

  def clean(number)
    cleaned = number.gsub(/\W/, '')
    if cleaned =~ /\D/
      INVALID
    else
      cleaned
    end
  end

  def check_too_short(number)
    if number.length < 10
      INVALID
    else
      number
    end
  end

  def check_too_long(number)
    if number.length > 10
      INVALID
    else
      number
    end
  end

  def remove_leading_one(number)
    if number.length == 11 && number.start_with?('1')
      number[1..-1]
    else
      number
    end
  end
end
