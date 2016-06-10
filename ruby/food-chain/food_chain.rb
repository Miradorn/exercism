module BookKeeping
  VERSION = 2
end

class FoodChain
  class << self
    def song
      [swallow_fly, swallow_spider, swallow_bird, swallow_cat,
       swallow_dog, swallow_goat, swallow_cow, swallow_horse].join "\n"
    end

    def swallow_fly
      "I know an old lady who swallowed a fly.\n" +
        fly
    end

    def fly
      "I don't know why she swallowed the fly. Perhaps she'll die.\n"
    end

    def swallow_spider
      "I know an old lady who swallowed a spider.\n" \
        "It wriggled and jiggled and tickled inside her.\n" +
        spider
    end

    def spider
      "She swallowed the spider to catch the fly.\n" +
        fly
    end

    def swallow_bird
      "I know an old lady who swallowed a bird.\n" \
        "How absurd to swallow a bird!\n" +
        bird
    end

    def bird
      'She swallowed the bird to catch the spider that wriggled and jiggled ' \
        "and tickled inside her.\n" +
        spider
    end

    def swallow_cat
      "I know an old lady who swallowed a cat.\n" \
        "Imagine that, to swallow a cat!\n" +
        cat
    end

    def cat
      "She swallowed the cat to catch the bird.\n" +
        bird
    end

    def swallow_dog
      "I know an old lady who swallowed a dog.\n" \
        "What a hog, to swallow a dog!\n" +
        dog
    end

    def dog
      "She swallowed the dog to catch the cat.\n" +
        cat
    end

    def swallow_goat
      "I know an old lady who swallowed a goat.\n" \
        "Just opened her throat and swallowed a goat!\n" +
        goat
    end

    def goat
      "She swallowed the goat to catch the dog.\n" +
        dog
    end

    def swallow_cow
      "I know an old lady who swallowed a cow.\n" \
        "I don't know how she swallowed a cow!\n" +
        cow
    end

    def cow
      "She swallowed the cow to catch the goat.\n" +
        goat
    end

    def swallow_horse
      "I know an old lady who swallowed a horse.\n" \
        "She's dead, of course!\n"
    end
  end
end
