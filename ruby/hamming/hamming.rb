module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

class Hamming
  def self.compute(string, compared)
    raise ArgumentError, "Strings have to be of equal length" unless (string.length == compared.length)
    hamming = 0
    (0..string.length).each do |index|
      hamming = hamming + 1 if string[index] != compared[index]
    end
    hamming
  end
end
