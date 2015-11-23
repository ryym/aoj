# ALDS1_12_B: Single Source Shortest Path 1

# ダイクストラのアルゴリズムを用いて、始点sからの最短経路木を
# 構築する。

class Graph
  def initialize(n_v)
    @n_v   = n_v
    @costs = Array.new(n_v) { Hash.new }
  end

  def connect(v_from, v_to, cost)
    @costs[v_from][v_to] = cost
  end

  def calc_min_costs_from(v_start)
    costs_from_start = Array.new @n_v, Float::INFINITY
    visiting = {}
    costs_from_start[v_start] = 0
    visiting[v_start] = 0

    while visiting.any?
      v_from, _ = visiting.min_by do |v, _|
        costs_from_start[v]
      end
      visiting.delete v_from

      @costs[v_from].each do |v_to, cost|
        through_cost = costs_from_start[v_from] + cost
        if through_cost < costs_from_start[v_to]
          costs_from_start[v_to] = through_cost
          visiting[v_to] = true
        end
      end
    end

    costs_from_start
  end
end

# Read input.
n_v   = gets.to_i
graph = Graph.new(n_v)
n_v.times do
  v_from, n_degs, *inputs = gets.split.map &:to_i
  1.step(n_degs * 2, 2) do |i|
    v_to, cost = inputs[i - 1], inputs[i]
    graph.connect v_from, v_to, cost
  end
end

graph.calc_min_costs_from(0).each_with_index do |cost, idx|
  puts "#{idx} #{cost}"
end
