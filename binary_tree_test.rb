require "minitest/autorun"
require_relative "node"

class BinaryTreeTest < Minitest::Test
  def setup
    #      4
    #    /   \
    #   2     7
    #  / \   / \
    # 1   3 6   9
    @tree = Node.new(4,
              Node.new(2,
                Node.new(1),
                Node.new(3)),
              Node.new(7,
                Node.new(6),
                Node.new(9)))
  end

  def test_traversal
    assert_tree [4, 2, 1, 3, 7, 6, 9], @tree
  end

  def test_invert
    assert_tree [4, 7, 9, 6, 2, 3, 1], @tree.invert
    assert_tree [4, 2, 1, 3, 7, 6, 9], @tree
  end

  def test_enumerable
    assert_equal 9, @tree.max
    assert_equal [4, 2, 6], @tree.find_all(&:even?)
  end

  private

  def assert_tree(nodes, tree)
    assert_equal nodes, tree.to_a
  end
end
