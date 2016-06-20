# Calculates your Age on any Planet in our Solar System.
class SpaceAge
  attr_reader :seconds

  SECONDS_PER_YEAR_EARTH = 31_557_600.0

  MAPPING = {
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze

  def initialize(age)
    @seconds = age
  end

  def on_earth
    seconds / SECONDS_PER_YEAR_EARTH
  end

  MAPPING.each do |plannet, factor|
    define_method "on_#{plannet}" do
      on_earth / factor
    end
  end
end
