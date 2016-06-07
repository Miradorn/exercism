module BookKeeping
  VERSION = 2
end

require 'Set'

# Use to Create robotors.
# Robotors have an unique name, that can be reset.
class Robot
  LETTERS = ('A'..'Z').to_a
  NUMBERS = (0..9).to_a

  @names = Set.new

  class << self; attr_accessor :names end

  attr_reader :name

  def initialize
    Robot.names = Robot.names.delete(@name) if @name
    @name = generate_unique_name
  end

  def reset
    initialize
  end

  private

  def generate_unique_name
    name = generate_name
    name = generate_name until Robot.names.add?(name)
    name
  end

  def generate_name
    chars = LETTERS.sample(2) + NUMBERS.sample(3)
    chars.join
  end
end
