class Bst
  VERSION = 1

  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(data)
    if data <= @data
      insert_left data
    else
      insert_right data
    end
  end

  def each(&block)
    return to_enum unless block_given?

    @left&.each(&block)
    yield(@data)
    @right&.each(&block)
  end

  private

  def insert_left(data)
    if @left
      @left.insert data
    else
      @left = Bst.new(data)
    end
  end

  def insert_right(data)
    if @right
      @right.insert data
    else
      @right = Bst.new(data)
    end
  end
end
