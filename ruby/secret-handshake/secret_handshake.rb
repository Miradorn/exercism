class SecretHandshake
  COMMANDS = {
    0b00001 => 'wink',
    0b00010 => 'double blink',
    0b00100 => 'close your eyes',
    0b01000 => 'jump'
  }.freeze
  REVERSE = 0b10000

  attr_reader :commands

  def initialize(code)
    @commands = []
    return unless code.is_a? Integer

    @commands = COMMANDS.select { |command, _| code & command != 0 }.values
    @commands.reverse! if code & REVERSE != 0
  end
end
