# ALDS1_7_B: Binary Tree

class Node
  class << self
    def bind(parent, left, right)
      parent.set_children(left, right)
      left.set_parent(parent, :left)
      right.set_parent(parent, :right)
    end
  end

  attr_accessor :id, :left, :right
  attr_reader :depth, :height

  def initialize(id)
    @id = id
    @depth = @height = 0
  end

  def update_tree
    update_depths
    update_heights
  end

  def parent
    root? ? NIL : @parent
  end

  def sibling
    return NIL if root?
    on_left? ? @parent.right : @parent.left
  end

  def children
    [@left, @right].select { |n| not n.nil_node? }
  end

  def degree
    children.size
  end

  def type
    case
    when root? then 'root'
    when degree == 0 then 'leaf'
    else 'internal node'
    end
  end

  def root?
    @parent.nil?
  end

  def nil_node?
    self == NIL
  end

  def on_left?
    @position == :left
  end

  def set_children(left, right)
    @left  = left
    @right = right
  end

  def set_parent(parent, position)
    @parent   = parent
    @position = position
  end

  protected
    attr_writer :depth, :height

    def update_depths(depth = 0)
      return if nil_node?
      @depth = depth
      @left.update_depths @depth + 1
      @right.update_depths @depth + 1
    end

    def update_heights
      return -1 if nil_node?
      lh = @left.update_heights
      rh = @right.update_heights
      @height = (lh < rh ? rh : lh) + 1
    end
end

Node.const_set :NIL, Node.new(-1)

n_nodes = gets.to_i
tree = Array.new(n_nodes).map.with_index do |_, i|
  Node.new(i)
end

n_nodes.times do
  id, left_id, right_id = gets.split.map &:to_i
  left  = left_id  == -1 ? Node::NIL : tree[left_id]
  right = right_id == -1 ? Node::NIL : tree[right_id]
  Node.bind tree[id], left, right
end

tree.find { |node| node.root? }.update_tree

tree.each do |n|
  puts "node #{n.id}: parent = #{n.parent.id}, " <<
       "sibling = #{n.sibling.id}, " <<
       "degree = #{n.degree}, depth = #{n.depth}, " <<
       "height = #{n.height}, #{n.type}"
end

