# 先行順の要素列であれば、先頭の要素がルートであるのは間違いない。
# そのルートが中間順の要素列の中のどこに位置しているかがわかれば、
# その位置より左にあるのが左部分木、右にあるのが右部分木とわかる。
# 同様に、先行順の要素列の2番目の要素が左部分木のルートなので、
# その位置を先ほどの左部分木の中から探し、左部分木を更に左部分木と
# 右部分木に分け、.. という具合に再帰的に木を部分木に分けていく事ができる。
# 問題は後行順に巡回した場合の要素列 post を組み立てる事なので、上記の要領で
# 木を分解していき、リーフ要素にたどり着いたら post にその要素を追加していけば
# 後行順に要素を並べる事ができる。


# ALDS1_7_D: Reconstruction of the Tree

class Walker
  attr_reader :post
  def initialize(preorder, inorder)
    @pre  = preorder
    @in   = inorder
    @post = []
    @pre_pos = 0
  end

  def reconstruct(left, right)
    return if right <= left
    root = @pre[ @pre_pos ]
    @pre_pos += 1
    in_pos = @in.index root
    reconstruct(left, in_pos)
    reconstruct(in_pos + 1, right)
    @post << root
  end
end

n_nodes  = gets.to_i
preorder = gets.split.map &:to_i
inorder  = gets.split.map &:to_i

walker = Walker.new(preorder, inorder)
walker.reconstruct 0, n_nodes

puts walker.post.join(' ')
