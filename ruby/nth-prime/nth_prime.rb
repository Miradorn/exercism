# Query for the nth Prime number.
class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    upto = n * n # Weak upper bound, but we don't need Performance.

    Sieve.new(upto).primes[n - 1]
  end
end

# Implements the Sieve of Eratosthenes.
class Sieve
  def initialize(upto)
    @upto = upto
  end

  def primes
    primes = (0..(@upto + 1)).to_a
    primes[0] = primes[1] = nil

    primes.each do |prime|
      next unless prime

      break if prime * prime > @upto

      (prime * prime).step(to: @upto, by: prime) { |m| primes[m] = nil }
    end

    primes.compact
  end
end
