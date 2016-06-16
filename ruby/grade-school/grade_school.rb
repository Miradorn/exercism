module BookKeeping
  VERSION = 1
end

# Manages People and their grades in a school
class School
  require 'set'

  def add(name, grade)
    mapping[grade].add(name)
  end

  def grade(index)
    mapping[index].to_a
  end

  def to_h
    mapping.sort.map { |grade, students| [grade, students.to_a] }.to_h
  end

  private

  def mapping
    @mapping ||= Hash.new { |h, k| h[k] = SortedSet.new }
  end
end
