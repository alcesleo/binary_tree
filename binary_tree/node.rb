class Node
  class EmptyNode
    def traverse_depth_first(_visitor); end
    def _traverse_breadth_first(_visitor, _queue); end
    def invert; self; end
  end
  EMPTY = EmptyNode.new

  attr_reader :value, :left, :right
  private :value, :left, :right

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
