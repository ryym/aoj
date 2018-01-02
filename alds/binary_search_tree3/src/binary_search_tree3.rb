# 削除処理の手順
#
# 削除対象のノードをZとする。
# 1. Zがリーフ要素である場合
#   単にZをNILに置き換えるだけ。
# 2. Zが子を1つ持っている場合
#   Zの位置にZの子を移動させる。この時、
#   その子が更にいくつ子要素を持っていようと問題ない。
# 3. Zが子を2つ(L, R)持っている場合
#   Zの次節点YのキーをZにコピーしてYを削除する。
#   Yの削除には上記1か2の方法を適用できる
#   (YがZの次節点となる以上、Yに左の子は存在しない)。


# ALDS1_8_C: Binary Search Tree 3: Delete

class NilNode
  attr_reader :key
  attr_accessor :parent, :left, :right

  def initialize
    @key = nil
    @parent = @left = @right = self
  end
end

class BinaryTree
  NIL = NilNode.new

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
      parent.set_left new_node
    else
      parent.set_right new_node
    end
  end

  def find(key)
    node = @root
    while node != NIL
      break if node.key == key
      node = key < node.key ? node.left : node.right
    end
    node
  end

  def delete(key)
    target = find key
    return if target == NIL

    if target.has_children?
      next_node = target.right.minimum_leaf
      replace_keys next_node, target
      target = next_node
    end

    child = target.has_left? ? target.left : target.right
    if target.on_left?
      target.parent.set_left child
    else
      target.parent.set_right child
    end
  end

  def replace_keys(src, dest)
    new_node = Node.new src.key, dest.parent, dest.left, dest.right
    if dest == @root
      @root = new_node
    elsif dest.on_left?
      dest.parent.set_left new_node
    else
      dest.parent.set_right new_node
    end
  end

  def has?(key)
    find(key) != NIL
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

  private

    class Node
      attr_reader :key, :parent, :left, :right

      def initialize(key, parent = NIL, left = NIL, right = NIL)
        @key = key
        set_parent parent, nil
        set_left left
        set_right right
      end

      def set_left(node)
        @left = node
        return if node == NIL
        node.set_parent self, :left
      end

      def set_right(node)
        @right = node
        return if node == NIL
        node.set_parent self, :right
      end

      def on_left?
        @on == :left
      end

      def has_children?
        has_left? && has_right?
      end

      def has_left?
        @left != NIL
      end

      def has_right?
        @right != NIL
      end

      def minimum_leaf
        node = self
        node = node.left while node.left != NIL
        node
      end

      protected
      def set_parent(node, position)
        @parent = node
        @on = position
      end
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
  when /delete (-?\d+)/
    key = $1.to_i
    tree.delete key
  when /print/
    puts ' ' << tree.keys_by_inorder.join(' ')
    puts ' ' << tree.keys_by_preorder.join(' ')
  end
end
