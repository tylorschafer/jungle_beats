require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require 'pry'

class LinkedListTest < Minitest::Test

  def setup
    @list = LinkedList.new
  end

  def test_it_exists
    assert_instance_of LinkedList, @list
  end

  def test_head
    assert_nil @list.head

    @list.append("doop")

    assert_instance_of Node, @list.head
  end

  def test_append
    @list.append("doop")

    assert "doop", @list.head
    assert_nil @list.head.next_node
  end

  def test_count
    @list.append("doop")

    assert 1, @list.count
  end

  def test_to_string
    @list.append("doop")

    binding.pry

    assert "doop", @list.to_string
  end
end
