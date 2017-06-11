class Tree
  include Enumerable

  attr_reader :nodes

  def initialize(*nodes)
    @nodes = nodes
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    nodes.each do |node|
      if node.is_a? Tree
        node.each(&block)
      else
        block.call(node)
      end
    end
    self
  end

  def map(&block)
    return enum_for(:map) unless block_given?

    new_tree = Tree.new
    nodes.each do |node|
      if node.is_a? Tree
        new_node = node.map(&block)
      else
        new_node = block.call(node)
      end
      new_tree.nodes << new_node
    end
    new_tree
  end

  def to_s
    "[#{nodes.join(', ')}]"
  end
end

tree = Tree.new(Tree.new(1, 2), Tree.new(Tree.new(3, 4, 5), 6))

puts "Tree:"
puts tree

puts "Leafs:"
tree.each { |n| puts "* #{n}" }

puts "Result of map(+1):"
puts tree.map { |n| n + 1 }

puts tree.each
puts tree.map
