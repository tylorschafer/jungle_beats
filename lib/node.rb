class Node
  attr_reader :data, :next_node

  def initialize(data)
    @contents = []
    @contents << data
    @data = @contents[0]
    @next_node = @contents[1]
  end
end
