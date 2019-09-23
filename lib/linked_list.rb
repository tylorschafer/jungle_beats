require './lib/node'
require 'pry'

class LinkedList

  attr_accessor :head

  def initialize
    @head = nil
  end

  def prepend(sound)
    new_node = Node.new(sound)
    if @head.nil?
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def append(sound)
    new_node = Node.new(sound)
    if @head.nil?
      @head = new_node
    else
      place_open_slot(new_node)
    end
  end

  def place_open_slot(new_node)
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
end
