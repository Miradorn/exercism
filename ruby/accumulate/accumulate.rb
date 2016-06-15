# Implements accumulate function for Arrays.
class Array
  def accumulate
    return to_enum(:accumulate) unless block_given?

    acc = []
    each do |item|
      acc << yield(item)
    end
    acc
  end
end
