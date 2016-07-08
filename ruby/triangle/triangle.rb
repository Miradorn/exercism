class TriangleError < StandardError; end

class Triangle
  def initialize(base, left, right)
    @sides = [base, left, right]
  end

  def kind
    validate

    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    else
      :scalene
    end
  end

  private

  def base
    @sides.first
  end

  def right
    @sides.last
  end

  def left
    @sides[1]
  end

  def validate
    raise TriangleError unless @sides.all?(&:positive?)
    raise TriangleError unless triangle_inequality?
  end

  def triangle_inequality?
    sum = @sides.reduce(:+)
    @sides.all? { |side| side < (sum - side) }
  end

  def equilateral?
    [left, right].all? { |side| side == base }
  end

  def isosceles?
    [left, right, base].permutation(2).any? { |a, b| a == b }
  end
end
