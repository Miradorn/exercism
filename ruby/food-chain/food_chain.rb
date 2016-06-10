module BookKeeping
  VERSION = 2
end

# generate a Cumulative Song.
class FoodChain
  ANIMALS = %w(fly spider bird cat dog goat cow horse).freeze

  class << self
    ANIMALS.each_cons(2) do |old_animal, new_animal|
      define_method(new_animal) do
        reason(new_animal, old_animal) + send(old_animal)
      end
    end

    def song
      ANIMALS.map { |animal| send("swallow_#{animal}") }.join "\n"
    end

    def swallow(animal)
      "I know an old lady who swallowed a #{animal}.\n"
    end

    def reason(what, to)
      "She swallowed the #{what} to catch the #{to}.\n"
    end

    def swallow_fly
      swallow('fly') + fly
    end

    # manual define fly, because it's the starting Point.
    def fly
      "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    end

    def swallow_spider
      swallow('spider') +
        "It wriggled and jiggled and tickled inside her.\n" +
        spider
    end

    def swallow_bird
      swallow('bird') +
        "How absurd to swallow a bird!\n" +
        bird
    end

    # manual override of bird, beause it has extra text.
    def bird
      'She swallowed the bird to catch the spider that wriggled and jiggled ' \
        "and tickled inside her.\n" +
        spider
    end

    def swallow_cat
      swallow('cat') +
        "Imagine that, to swallow a cat!\n" +
        cat
    end

    def swallow_dog
      swallow('dog') +
        "What a hog, to swallow a dog!\n" +
        dog
    end

    def swallow_goat
      swallow('goat') +
        "Just opened her throat and swallowed a goat!\n" +
        goat
    end

    def swallow_cow
      swallow('cow') +
        "I don't know how she swallowed a cow!\n" +
        cow
    end

    def swallow_horse
      swallow('horse') +
        "She's dead, of course!\n"
    end
  end
end
