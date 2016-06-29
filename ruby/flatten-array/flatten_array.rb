class FlattenArray
  VERSION = 1

  # obviously calling flatten is cheating,
  # let's do it with reduce and recursion for now
  def self.flatten(nested)
    return [] if nested.nil?
    return [nested] unless nested.is_a? Array

    nested.reduce([]) do |acc, elem|
      acc + flatten(elem)
    end
  end
end
