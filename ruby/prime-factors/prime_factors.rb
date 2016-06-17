# Computes Prime Factors for a given number
class PrimeFactors
  require 'prime'

  class << self
    def for(number)
      factors = []
      primes = Prime.each(number)

      while number > 1
        factor = primes.find { |prime| number % prime == 0 }
        primes.rewind

        number /= factor
        factors << factor
      end
      factors
    end
  end
end
