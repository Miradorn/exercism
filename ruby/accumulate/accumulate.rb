# Implements accumulate function for Arrays.
class Array
  def accumulate
    acc = []
    each do |item|
      acc << yield(item)
    end
    acc
  end
end
