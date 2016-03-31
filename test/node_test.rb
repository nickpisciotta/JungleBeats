require 'minitest/autorun'
require 'minitest/pride'
require_relative "node"

class NodeTest < Minitest::Test

  def test_node_exists
    node = Node.new("plop")

    assert_equal Node, node.class
  end

  def test_create_new_node
    node = Node.new("plop")

    assert_equal "plop", node.data
  end

  def test_create_next_node
    node = Node.new("plop") 

    assert_equal nil, node.next_node
  end

end
