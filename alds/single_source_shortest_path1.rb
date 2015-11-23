# ALDS1_12_B: Single Source Shortest Path 1

# ダイクストラのアルゴリズムを用いて、始点sからの最短経路木を
# 構築する。

MAX_COST = Float::INFINITY

module State
  UNKNOWN = 0
  FOUND   = 1
  REACHED = 2
end

def calc_min_costs_from(v_start, costs)
  vert_state = Struct.new :id, :cost_from_start, :state do
    define_method :cost_to do |v_to|
      costs[id][v_to.id]
    end

    def connected_to?(v_to)
      0 <= cost_to(v_to)
    end

    def is?(state)
      self.state == state
    end

    def cost_from_start_through(other_v)
      other_v.cost_from_start + other_v.cost_to(self)
    end
  end

  n_vertexes  = costs.size
  vert_states = n_vertexes.times.map do |id|
    if id == v_start
      vert_state.new id, 0, State::FOUND
    else
      vert_state.new id, MAX_COST, State::UNKNOWN
    end
  end

  while true
    v_from = vert_states.
      select { |v| v.is? State::FOUND }.
      min_by { |v| v.cost_from_start }

    break if v_from.nil?
    v_from.state = State::REACHED

    vert_states.each do |v_to|
      next if v_to.is?(State::REACHED) or not v_from.connected_to?(v_to)
      through_cost = v_to.cost_from_start_through v_from
      if through_cost < v_to.cost_from_start
        v_to.cost_from_start = through_cost
        v_to.state = State::FOUND
      end
    end
  end

  vert_states.map { |v| v.cost_from_start }
end

n_vertexes = gets.to_i
costs      = Array.new(n_vertexes) { Array.new(n_vertexes, -1) }
n_vertexes.times do
  v_from, n_degrees, *inputs = gets.split.map &:to_i
  1.step(n_degrees * 2, 2) do |i|
    v_to, cost = inputs[i - 1], inputs[i]
    costs[v_from][v_to] = cost
  end
end

min_costs = calc_min_costs_from(0, costs)
puts min_costs.map.with_index{ |cost, v| "#{v} #{cost}" }
