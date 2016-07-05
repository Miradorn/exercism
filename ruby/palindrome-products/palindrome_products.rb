class Palindromes
  Palindrome = Struct.new(:value, :factors)

  def initialize(max_factor: 999, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    nums = Hash.new { |h, k| h[k] = [] }

    (@min_factor..@max_factor).each do |first_factor|
      (first_factor..@max_factor).each do |second_factor|
        num = first_factor * second_factor
        next unless palindrome? num.to_s

        nums[num] << [first_factor, second_factor]
      end
    end

    @palindromes = nums.freeze
  end

  def largest
    largest = @palindromes.max_by { |k, _v| k }
    Palindrome.new(largest.first, largest.last)
  end

  def smallest
    smallest = @palindromes.min_by { |k, _v| k }
    Palindrome.new(smallest.first, smallest.last)
  end

  private

  def palindrome?(string)
    string == string.reverse
  end
end
