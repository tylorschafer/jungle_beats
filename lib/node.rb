class Node
  attr_reader :next, :data

  def initialize(data)
    @data = data
    @next = []
  end

  def next_node
    if @next == []
      nil
    else
      @next
    end
  end
end
