require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("plop")
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_attributes
    assert 'plop', @node.data
  end

  def test_next_node
    assert_nil @node.next_node
  end
end
