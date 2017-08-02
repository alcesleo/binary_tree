class Node
  class EmptyNode
    def traverse_depth_first(_visitor); end
    def _traverse_breadth_first(_visitor, _queue); end
    def invert; self; end
  end
  EMPTY = EmptyNode.new

  attr_reader :value, :left, :right
  private :value, :left, :right

  def self.build_tree(values)
    return EMPTY if values == EMPTY

    left, value, right = split(values)

    Node.new(value, Node.build_tree(left), Node.build_tree(right))
  end

  def self.split(values)
    [
      values.take(values.length / 2),
      values.fetch(values.length / 2),
      values.drop(values.length / 2 + 1)
    ].map { |v| v == [] ? EMPTY : v }
  end

  def initialize(value, left = EMPTY, right = EMPTY)
    @value = value
    @left = left
    @right = right
  end

  def invert
    Node.new(value, right.invert, left.invert)
  end

  def traverse_depth_first(visitor)
    left.traverse_depth_first(visitor)
    visitor.call(value)
    right.traverse_depth_first(visitor)
  end

  def traverse_breadth_first(visitor)
    queue = [self]
    queue.shift._traverse_breadth_first(visitor, queue) until queue.empty?
  end

  protected

  def _traverse_breadth_first(visitor, queue)
    visitor.call(value)

    queue.push(left)
    queue.push(right)
  end
end
