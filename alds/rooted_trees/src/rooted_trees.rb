# 親要素、子の一番左、自身の右隣を持つ構造体を使う。

# ALDS1_7_A: Rooted Trees

class Node
  attr_accessor :id, :parent, :left_child, :right_sub

  def depth
    @parent.nil? ? 0 : 1 + @parent.depth
  end

  def parent_id
    @parent.nil? ? -1 : @parent.id
  end

  def child_ids
    child_ids = []
    child     = @left_child
    until child.nil?
      child_ids << child.id
      child = child.right_sub
    end
    child_ids
  end

  def type
    return 'root' if parent.nil?
    return 'leaf' if child_ids.empty?
    'internal node'
  end
end

n_nodes = gets.to_i
tree    = Array.new(n_nodes).map { Node.new }

n_nodes.times do
  id, n_child_ids, *child_ids = gets.split.map &:to_i
  tree[id].id = id
  next if child_ids.empty?

  leftmost = child_ids[0]
  tree[id].left_child = tree[leftmost]

  child_ids.each_with_index do |child_id, i|
    r_sib_id = child_ids[i + 1]
    tree[child_id].right_sub = tree[r_sib_id] unless r_sib_id.nil?
    tree[child_id].parent    = tree[id]
  end
end

tree.each do |n|
  puts "node #{n.id}: parent = #{n.parent_id}, " << 
       "depth = #{n.depth}, #{n.type}, #{n.child_ids}"
end

