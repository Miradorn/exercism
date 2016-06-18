# Sums along the melody
class BeerSong
  def initialize
    build_wall
    build_take
  end

  def verse(which)
    @wall[which] + @take[which]
  end

  def verses(from, to)
    from.downto(to).map { |which| verse(which) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private

  # Make private methods great again!
  def build_wall
    @wall = Hash.new do |h, k|
      h[k] = "#{k} bottles of beer on the wall, #{k} bottles of beer.\n"
    end
    @wall[1] = "1 bottle of beer on the wall, 1 bottle of beer.\n"
    @wall[0] = "No more bottles of beer on the wall, no more bottles of beer.\n"
  end

  def build_take
    @take = Hash.new do |h, k|
      h[k] = "Take one down and pass it around, #{k - 1} bottles of beer on the wall.\n"
    end
    @take[2] = "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    @take[1] = "Take it down and pass it around, no more bottles of beer on the wall.\n"
    @take[0] = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

module BookKeeping
  VERSION = 2
end
