# ALDS1_8_B: Binary Search Tree 2: Search

class BinaryTree
  class Node
    attr_reader :key
    attr_accessor :left, :right

    def initialize(key)
      @key = key
      @left = @right = NIL
    end
  end

  NIL = Node.new(-1)

  def initialize
    @root = NIL
  end

  def insert(key)
    parent = NIL
    node   = @root
    while node != NIL
      parent = node 
      node = key < node.key ? node.left : node.right
    end

    new_node = Node.new key
    if parent == NIL
      @root = new_node
    elsif key < parent.key
      parent.left = new_node
    else
      parent.right = new_node
    end
  end

  def has?(key)
    node = @root
    while node != NIL
      return true if node.key == key
      node = key < node.key ? node.left : node.right
    end
    false
  end

  def keys_by_preorder(node = @root)
    return [] if node == NIL
    left_keys  = keys_by_preorder(node.left)
    right_keys = keys_by_preorder(node.right)
    [node.key] + left_keys + right_keys
  end

  def keys_by_inorder(node = @root)
    return [] if node == NIL
    left_keys  = keys_by_inorder(node.left)
    right_keys = keys_by_inorder(node.right)
    left_keys + [node.key] + right_keys
  end
end

tree = BinaryTree.new

n_commands = gets.to_i
n_commands.times do
  command = gets.chomp
  case command
  when /insert (-?\d+)/
    key = $1.to_i
    tree.insert key
  when /find (-?\d+)/
    key = $1.to_i
    puts tree.has?(key) ? 'yes' : 'no'
  when /print/
    puts ' ' << tree.keys_by_inorder.join(' ')
    puts ' ' << tree.keys_by_preorder.join(' ')
  end
end
