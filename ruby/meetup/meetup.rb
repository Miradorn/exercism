Meetup = Struct.new(:month, :year) do
  DAYS = [:sunday, :monday, :tuesday,
          :wednesday, :thursday, :friday, :saturday].freeze
  DAY_INDEX = DAYS.each_with_index.to_h.freeze

  def day(weekday, offset)
    raise ArgumentError unless DAYS.include? weekday

    possible_dates = days_in_month year, month
    matching_weekday = possible_dates.select do |d|
      d.wday == DAY_INDEX[weekday]
    end

    matching_weekday.at_offset offset
  end

  private

  def days_in_month(year, month)
    first_day_of_month = Date.new(year, month, 1)
    last_day_of_month = first_day_of_month.next_month - 1
    first_day_of_month..last_day_of_month
  end
end

# Extend Array to support the needed indices
class Array
  OFFSET = { first: 0, second: 1, third: 2, fourth: 3, last: -1 }.freeze
  TEENTHS = (13..19).to_a.freeze

  def at_offset(offset)
    if OFFSET.keys.include? offset
      self[OFFSET[offset]]
    else
      find { |d| TEENTHS.include? d.day }
    end
  end
end
