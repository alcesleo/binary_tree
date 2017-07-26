class Node
  class EmptyNode
    def left; self; end
    def right; self; end
    def invert; self; end
    def traverse(_visitor); end
  end

  EMPTY = EmptyNode.new

  attr_reader :value, :left, :right
  private :value, :left, :right

  def initialize(value, left = EMPTY, right = EMPTY)
    @value = value
    @left = left
    @right = right
  end

  def traverse(visitor)
    visitor.call(value)
    left.traverse(visitor)
    right.traverse(visitor)
  end

  def invert
    Node.new(value, right.invert, left.invert)
  end
end
