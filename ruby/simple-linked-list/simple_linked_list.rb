# frozen_string_literal: true
# Objects of this class represents elements in a linked list
Element = Struct.new(:datum, :next) do
  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  include Enumerable

  attr_reader :size, :head

  def self.from_a(array)
    elements = array || []

    new elements
  end

  def initialize(elements = [])
    @size = 0
    @head = nil

    elements.reverse.each(&method(:push))
  end

  def each
    item = @head
    while item
      yield item.datum
      item = item.next
    end
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  def empty?
    @head.nil?
  end

  def push(datum)
    elem = Element.new(datum, @head)
    @head = elem
    @size += 1
  end

  def pop
    elem = @head
    @head = elem.next
    @size -= 1
    elem.datum
  end

  def peek
    @head&.datum
  end
end
