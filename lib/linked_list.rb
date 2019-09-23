require './lib/node'
require 'pry'

class LinkedList

  attr_reader :list_contents, :head, :next_node

  def initialize
    @list_contents = []
  end

  def head
    @list_contents[0]
  end

  def append(sound)
    @list_contents << Node.new(sound)
  end

  def count
    @list_contents.count
  end

  def to_string
    @list_contents.map do |node|
      node.data.to_s
    end.join(" ")
  end
end
