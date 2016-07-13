class Proverb
  def initialize(*stuff, qualifier: '')
    @qualifier = qualifier
    @verse = stuff.each_cons(2)
                  .map { |wanted, lost| lost_for wanted, lost }
                  .join
    @verse += want_of(stuff.first)
  end

  def to_s
    @verse
  end

  private

  def lost_for(wanted, lost)
    "For want of a #{wanted} the #{lost} was lost.\n"
  end

  def want_of(thing)
    "And all for the want of a #{@qualifier} #{thing}.".gsub(/\s+/, ' ')
  end
end
