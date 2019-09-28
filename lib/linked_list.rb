require './lib/node'
require 'pry'

class LinkedList

  attr_accessor :head

  def initialize
    @head = nil
  end

  def prepend(sound)
    find_placement('prepend', sound)
  end

  def append(sound)
    find_placement('append', sound)
  end

  def find_placement(type, sound)
    new_node = Node.new(sound)
    if @head.nil?
      @head = new_node
    elsif type == 'prepend'
      place_head(new_node)
    else
      place_next_open_slot(new_node)
    end
  end

  def place_head(new_node)
    new_node.next_node = @head
    @head = new_node
  end

  def place_next_open_slot(new_node)
    current = @head
    until forward(current).nil?
      current = forward(current)
    end
    place_node(current, new_node)
  end

  def forward(current_node)
    current_node.next_node
  end

  def place_node(current, new_node)
    current.next_node = new_node
  end

  def insert(placement, sound)
    new_node = Node.new(sound)
    current = @head
    placement.times do |time|
      forward(current)
    end
    new_node.next_node = forward(current)
    place_node(current, new_node)
  end

  def analyze(type)
    analyzation = type
    current = @head
    until current.nil?
      if type.is_a?(Integer) ?
        analyzation += 1 :
        analyzation << "#{current.data} "
      end
      current = forward(current)
    end
    analyzation
  end

  def count
    analyze(0)
  end

  def to_string
    analyze(String.new)
  end

  def string_elements
    to_string.split(" ")
  end

  def find(index, size)
    list = string_elements
    if size == 1
      list[index]
    else
      ending_index = index + (size - 1)
      list[index..ending_index].join(" ")
    end
  end

  def includes?(node)
    to_string.include?(node)
  end

  # def pop
  #   current = @head
  #   until current.next_node == nil
  #     current = forward(current)
  #   end
  #   removed_node = current.data
  #   current.data = nil
  #   removed_node
  # end
end
