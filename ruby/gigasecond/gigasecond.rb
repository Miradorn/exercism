module BookKeeping
  VERSION = 3
end

# Class to calculate the Gigasecond Birthday of a Person
class Gigasecond
  def self.from(date)
    date + (10**9)
  end
end
