require './lib/node'
require 'pry'

class LinkedList

  attr_reader :contents

  def initialize
    @contents = []
  end

  def head
    @contents[0]
  end

  def append(sound)
    if @contents.empty?
      @contents << Node.new(sound)
    else
      @contents.last.next << Node.new(sound)
    end
  end

  def count
    count = 0
    @contents.each do |node|
      count += 1
    end
    count
  end

  def to_string
    @contents.map do |node|
      node.data.to_s
    end.join(" ")
  end

  def insert(place, sound)
    @contents.insert()
  end
end
