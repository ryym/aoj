# Pre order  親、左、右
# In order   左、親、右
# Post order 左、右、親

# ALDS1_7_C: Tree Walk

class BinaryTree

  class Node
    attr_reader :id, :parent, :left, :right

    def initialize(id)
      @id = id
    end

    def set_children(left, right)
      @left  = left
      @right = right
      @left.set_parent self
      @right.set_parent self
    end

    def root?
      @parent.nil?
    end

    def nil_node?
      self == NIL
    end

    protected
      def set_parent(parent)
        @parent = parent
      end
  end

  NIL = Node.new(-1)

  def initialize(data)
    nodes = Array.new(data.size).map.with_index do |_, i|
      Node.new(i)
    end

    data.each do |id, left_id, right_id|
      left  = left_id  == -1 ? NIL : nodes[left_id]
      right = right_id == -1 ? NIL : nodes[right_id]
      bind nodes[id], left, right
    end

    @root = nodes.find { |n| n.root? }
  end

  def preorder_walk(node = @root)
    return [] if node.nil_node?
    [node] + preorder_walk(node.left) + preorder_walk(node.right)
  end

  def inorder_walk(node = @root)
    return [] if node.nil_node?
    inorder_walk(node.left) + [node] + inorder_walk(node.right)
  end

  def postorder_walk(node = @root)
    return [] if node.nil_node?
    postorder_walk(node.left) + postorder_walk(node.right) + [node]
  end

  private
    def bind(parent, left, right)
      parent.set_children left, right
    end
end

def nodes_to_s(nodes)
  ' ' << nodes.map(&:id).join(' ')
end

n_nodes = gets.to_i
node_data = n_nodes.times.map do
  gets.split.map &:to_i
end

tree = BinaryTree.new node_data

puts [
  'Preorder',
  nodes_to_s(tree.preorder_walk),
  'Inorder',
  nodes_to_s(tree.inorder_walk),
  'Postorder',
  nodes_to_s(tree.postorder_walk)
]
