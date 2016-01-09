# DSL1_A: Disjoint Set


class DisjointSet
  def initialize(size)
    @parents = size.times.map { |i| i }
    @sizes   = Array.new(size, 0)
  end

  def unite_set(x, y)
    x = find_root(x)
    y = find_root(y)
    sub, main = @sizes[x] < @sizes[y] ? [x, y] : [y, x]
    @sizes[main] += 1 if @sizes[main] == @sizes[sub]
    @parents[sub] = main
  end

  def same_set?(x, y)
    find_root(x) == find_root(y)
  end

  def find_root(x)
    unless @parents[x] == x
      @parents[x] = find_root @parents[x]
    end
    @parents[x]
  end
end

module Query
  UNITE = 0
  SAME  = 1
end

size, n_queries = gets.split.map &:to_i
djset = DisjointSet.new(size)

n_queries.times do
  query, x, y = gets.split.map &:to_i
  case query
  when Query::UNITE
    djset.unite_set(x, y)
  when Query::SAME
    puts djset.same_set?(x, y) ? 1 : 0
  end
end

