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

  def test_attributes
    assert_nil @list.head

    @list.append("doop")

    assert_instance_of Node, @list.head
  end

  def test_append
    @list.append("doop")

    assert_nil @list.head.next_node

    @list.append("deep")

    assert "deep", @list.head.next_node
  end

  def test_count
    @list.append("doop")

    assert 1, @list.count

    @list.append("deep")

    assert 2, @list.count
  end

  def test_to_string
    @list.append("doop")

    assert_equal "doop ", @list.to_string

    @list.append("deep")

    assert_equal "doop deep ", @list.to_string

    @list.append("beep")

    assert_equal "doop deep beep ", @list.to_string
  end

  def test_insert
    @list.append("doop")
    @list.append("deep")
    @list.append("bop")
    @list.append("bleep")
    @list.insert(1, "blat")

    assert_equal "doop blat deep bop bleep ", @list.to_string
  end

  def test_prepend
    @list.append("doop")
    @list.append("deep")
    @list.append("bop")
    @list.prepend("bleep")

    assert_equal "bleep doop deep bop ", @list.to_string
  end

  def test_find
    @list.append("deep")
    @list.append("woo")
    @list.append("shi")
    @list.prepend("shu")
    @list.prepend("blop")

    assert_equal "shi", @list.find(2, 1)
    assert_equal "woo shi shu", @list.find(1, 3)
  end
end
