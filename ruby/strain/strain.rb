# Implements keep and discard methods to arrays.
class Array
  def keep
    result = []

    each do |elem|
      next unless yield elem
      result << elem
    end

    result
  end

  def discard(&block)
    self - keep(&block)
  end
end
