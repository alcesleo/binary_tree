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
    result = []
    visitor = -> (value) { result << value }

    @tree.traverse(visitor)

    assert_equal [4, 2, 1, 3, 7, 6, 9], result
  end
end
