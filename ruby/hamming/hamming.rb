module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

# Class to compute Hamming Distance for two Strings.
class Hamming
  def self.compute(string, compared)
    unless string.length == compared.length
      raise ArgumentError, 'Strings have to be of equal length'
    end

    (0..string.length).count { |index| string[index] != compared[index] }
  end
end
