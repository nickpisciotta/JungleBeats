require "minitest/autorun"   # => true
require "minitest/pride"     # => true
require "./lib/linked_list"  # ~> LoadError: cannot load such file -- ./lib/linked_list
require "pry"

class LinkedListTest  < Minitest::Test

  def test_linked_list_exists
    list = LinkedList.new

    assert_equal LinkedList, list.class
  end

  def test_new_linked_list
    list = LinkedList.new

    assert_equal nil, list.head
  end

  def test_linked_list_with_no_head_returns_count_zero
    list = LinkedList.new

    assert_equal 0, list.count
  end

  def test_linked_list_with_a_head_returns_one
    list = LinkedList.new

    list.append("doop")

    assert_equal 1, list.count
  end

  def test_linked_list_with_two_node_returns_two
    list = LinkedList.new

    list.append("doop")
    list.append("deep")
    assert_equal 2, list.count
  end

  def test_linked_list_count_with_prepend_method
    list = LinkedList.new

    list.append("first")
    list.append("second")
    list.prepend("third")

    assert_equal 3, list.count
  end

  def test_insert_node
    list = LinkedList.new

    list.append("doop")
    list.append("deep")
    list.append("bo")
    list.insert(1, "woo")
    list.insert(2, "yayy")

    assert_equal "doop woo yayy deep bo", list.to_string
    assert_equal 5, list.count
    assert_equal "woo", list.head.next_node.data
    assert_equal "doop", list.head.data
  end

  def test_find_something_in_linked_list
    list = LinkedList.new

    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "deep woo shi shu blop", list.to_string
    assert_equal "shi", list.find(2, 1)
    assert_equal "woo shi shu", list.find(1, 3)
  end

  def test_does_list_include_something
    list = LinkedList.new

    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal true, list.include?("deep")
    assert_equal false, list.include?("dee")
    assert_equal true, list.include?("shi")
  end

  def test_pop_method_with_multiple_nodes

    list = LinkedList.new

    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "blop", list.pop
    assert_equal "shu", list.pop
  end

  def test_list_with_no_head_returns_no_string
    list = LinkedList.new

    assert_equal nil, list.to_string
  end

  def test_list_with_head_returns_head_data_as_string
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.to_string
  end

  def test_list_with_head_and_one_node_returns_all_data_as_string
    list = LinkedList.new

    list.append("doop")
    list.append("deep")

    assert_equal "doop deep", list.to_string
  end

  def test_list_with_multiple_nodes_returns_all_data_as_string
    list = LinkedList.new

    list.append("doop")
    list.append("deep")
    list.append("plop")
    list.append("suu")

    assert_equal "doop deep plop suu", list.to_string
  end

  def test_prepend_new_node
    list = LinkedList.new

    list.append("plop")
    list.append("su")
    list.prepend("dop")

    assert_equal "dop", list.head.data
    assert_equal "plop", list.head.next_node.data
    assert_equal "su",   list.head.next_node.next_node.data
  end

  def test_append_new_node
    list = LinkedList.new

    list.append("doop")

    assert_equal "doop", list.head.data
    assert_equal nil, list.head.next_node
  end

  def test_can_append_a_second_node
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    assert_equal "doop", list.head.data
    assert_equal "deep", list.head.next_node.data
  end

  def test_can_append_a_third_node
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("plop")

    assert_equal "doop", list.head.data
    assert_equal "deep", list.head.next_node.data
    assert_equal "plop", list.head.next_node.next_node.data
  end

end
