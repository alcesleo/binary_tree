class Node
  attr_reader :value, :left, :right
  private :value, :left, :right

  def initialize(value, left = :empty, right = :empty)
    @value = value
    @left = left
    @right = right
  end

  def traverse(visitor)
    visitor.call(value)
    left.traverse(visitor) unless left == :empty
    right.traverse(visitor) unless right == :empty
  end

  def invert
    Node.new(value,
             right == :empty ? :empty : right.invert,
             left == :empty ? :empty : left.invert)
  end
end
