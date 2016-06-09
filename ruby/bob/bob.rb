# Implements Bob, an lackadaisical teenager
class Bob
  def hey(remark)
    if remark.nothing?
      'Fine. Be that way!'
    elsif remark.screaming?
      'Whoa, chill out!'
    elsif remark.question?
      'Sure.'
    else
      'Whatever.'
    end
  end
end

# Adds convenience methods to Strings.
class String
  # Only whitespace characters are included.
  def nothing?
    self =~ /\A\s*\Z/
  end

  # All letters have to be upcase and has to contain at least one letter.
  def screaming?
    upcase == self && self =~ /[A-Z]/
  end

  # Questions end with a question mark.
  def question?
    end_with?('?')
  end
end
