class Brackets
  def self.paired?(string)
    stack = BracketStack.new

    string.each_char { |l| stack.push l }

    stack.valid?
  end
end

class BracketStack
  BRACKETS = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }.freeze

  attr_reader :valid

  def initialize
    @stack = []
    @valid = true
  end

  def push(bracket)
    if BRACKETS.keys.include? bracket
      push_open bracket
    elsif BRACKETS.values.include? bracket
      push_close bracket
    end
  end

  def valid?
    @stack.empty? && @valid
  end

  private

  def push_open(bracket)
    @stack.push bracket
  end

  def push_close(bracket)
    last_open = @stack.pop
    @valid = false unless BRACKETS[last_open] == bracket
  end
end

module BookKeeping
  VERSION = 2
end
