require "minitest/autorun"
require_relative "node"

class BinaryTreeTest < Minitest::Test
  def setup
    #      4
    #    /   \
    #   2     6
    #  / \   / \
    # 1   3 5   8
    #          /
    #         7
    @tree = Node.new(4,
              Node.new(2,
                Node.new(1),
                Node.new(3)),
               Node.new(6,
                 Node.new(5),
                 Node.new(8,
                   Node.new(7))))
  end

  def test_build_tree
    result = []
    visitor = ->(value) { result << value }

    Node.build_tree([*1..9]).traverse_depth_first(visitor)

    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], result
  end

  def test_traverse_depth_first
    result = []
    visitor = ->(value) { result << value }

    @tree.traverse_depth_first(visitor)

    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], result
  end

  def test_traverse_breadth_first
    result = []
    visitor = ->(value) { result << value }

    @tree.traverse_breadth_first(visitor)

    assert_equal [4, 2, 6, 1, 3, 5, 8, 7], result
  end

  def test_invert
    result = []
    visitor = ->(value) { result << value }

    @tree.invert.traverse_depth_first(visitor)

    assert_equal [8, 7, 6, 5, 4, 3, 2, 1], result
  end
end
