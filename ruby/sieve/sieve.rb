# Implements the Sieve of Eratosthenes.
class Sieve
  def initialize(upto)
    @upto = upto
  end

  def primes
    primes = (0..@upto).to_a
    primes[0] = primes[1] = nil

    primes.each do |prime|
      next unless prime

      break if prime * prime > @upto

      (prime * prime).step(to: @upto, by: prime) { |m| primes[m] = nil }
    end

    primes.compact
  end
end
