class Alphametics
  attr_reader :first, :second, :operator, :power, :result, :letters
  def solve(formula)
    extract_values formula

    mapping = (0..9).to_a.permutation(letters.length).find do |numbers|
      h = letters.zip(numbers).to_h

      first_number = first.gsub(/\w/, h)
      second_number = second.gsub(/\w/, h)
      result_number = result.gsub(/\w/, h)

      next if [first_number, second_number, result_number].any? do |n|
        n.start_with? '0'
      end

      valid_assignment?(first_number.to_i, second_number.to_i, result_number.to_i)
    end

    letters.zip(mapping).to_h
  end

  private

  def valid_assignment?(first, second, result)
    if power
      raised = second**power
      first.send(operator, raised) == result
    else
      first.send(operator, second) == result
    end
  end

  def extract_values(formula)
    list = formula.upcase.split
    if list[3] == '^'
      @first, @operator, @second, _, @power, _, @result = list
      @power = power.to_i
    else
      @first, @operator, @second, _, @result = list
    end
    @letters = (first.chars + second.chars + result.chars).uniq
  end
end

module BookKeeping
  VERSION = 1
end
