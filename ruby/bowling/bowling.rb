# Implements a fun game of Bowling
class Game
  def initialize
    @scores = []
    @current_frame = []
  end

  def roll(pins)
    check_pins pins

    @current_frame << pins

    check_current_frame

    return unless frame_finished?

    @scores << @current_frame
    @current_frame = []
  end

  def score
    raise 'Score cannot be taken until the end of the game' unless game_ended?

    check_current_frame

    @scores << @current_frame
    (0..9).map { |i| value_for_frame(i) }.reduce(:+)
  end

  private

  def frame_finished?
    @current_frame.length == 2 || @current_frame.reduce(:+) > 9
  end

  def value_for_frame(index)
    frame = @scores[index]
    if strike? frame
      next_two = @scores.drop(index + 1).flatten.take(2)
      frame.first + next_two.reduce(:+)
    elsif spare? frame
      frame.reduce(:+) + @scores[index + 1].first
    else
      frame.reduce(:+)
    end
  end

  def strike?(frame)
    frame.first == 10
  end

  def spare?(frame)
    !strike?(frame) && frame.reduce(:+) == 10
  end

  def game_ended?
    return false unless @scores.length > 9

    last_frame = @scores[9]
    if strike?(last_frame)
      @scores.drop(10).flatten.length == 2
    elsif spare?(last_frame)
      @current_frame.length == 1
    else
      true
    end
  end

  def check_current_frame
    if @current_frame.reduce(0, :+) > 10
      raise 'Pin count exceeds pins on the lane'
    end
  end

  def check_pins(pins)
    raise 'Should not be able to roll after game is over' if game_ended?

    raise 'Pins must have a value from 0 to 10' unless (0..10).cover? pins
  end
end

module BookKeeping
  VERSION = 1
end
