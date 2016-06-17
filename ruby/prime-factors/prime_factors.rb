# Computes Prime Factors for a given number
class PrimeFactors
  class << self
    def for(number)
      factors = []
      factor = 1

      while number > 1
        factor += 1
        next unless number % factor == 0

        number /= factor
        factors << factor
        factor = 1
      end
      factors
    end
  end
end
