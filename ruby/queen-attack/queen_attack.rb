class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black

    @white = white
    @black = black
  end

  def attack?
    same_row? || same_line? || same_diagonal?
  end

  def to_s
    placeholder = blank_board
    placeholder[white.first][white.last] = 'W'
    placeholder[black.first][black.last] = 'B'
    placeholder.map { |a| a.join ' ' }.join "\n"
  end

  private

  def blank_board
    Array.new(8) { Array.new(8, '_') }
  end

  def same_line?
    white.first == black.first
  end

  def same_row?
    white.last == black.last
  end

  def same_diagonal?
    (white.first - black.first).abs == (white.last - black.last).abs
  end
end
