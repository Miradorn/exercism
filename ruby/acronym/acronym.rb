class Acronym
  def self.abbreviate(sentence)
    sentence
      .gsub(/([a-z])([A-Z])/, '\1 \2')
      .split(/\W/)
      .reject(&:empty?)
      .map { |s| s[0].upcase }
      .join
  end
end

module BookKeeping
  VERSION = 1
end
