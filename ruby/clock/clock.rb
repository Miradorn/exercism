class Clock
  include Comparable

  attr_reader :minute, :hour

  def self.at(hour, minute)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @minute = minute % 60
    overrun = minute / 60
    @hour = (hour + overrun) % 24
  end

  def to_s
    hour_string = hour.to_s.rjust(2, '0')
    minute_string = minute.to_s.rjust(2, '0')
    "#{hour_string}:#{minute_string}"
  end

  def +(other)
    Clock.at(hour, minute + other)
  end

  def -(other)
    Clock.at(hour, minute - other)
  end

  def <=>(other)
    hour_order = hour <=> other.hour
    return hour_order unless hour_order == 0
    minute <=> other.minute
  end
end

module BookKeeping
  VERSION = 2
end
