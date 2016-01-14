# GRL1_C: All Pairs Shortest Path

INF = 1 << 32

def warshall_floyd(mtx)
  n = mtx.size
  n.times do |k|
    n.times do |i|
      n.times do |j|
        next if mtx[i][k] == INF || mtx[k][j] == INF
        mtx[i][j] = [
          mtx[i][j], mtx[i][k] + mtx[k][j]
        ].min
      end
    end
  end
end

def negative_cycle?(mtx)
  mtx.each_with_index.any? do |costs, from|
    costs.each_with_index.any? do |cost, to|
      from == to && cost < 0
    end
  end
end

def make_matrix_from_input
  n_verts, n_edges = gets.split.map &:to_i

  path_mtx = n_verts.times.map do |from|
    n_verts.times.map do |to|
      from == to ? 0 : INF
    end
  end

  n_edges.times do
    from, to, cost = gets.split.map &:to_i
    path_mtx[from][to] = cost
  end

  path_mtx
end


path_mtx = make_matrix_from_input
warshall_floyd path_mtx

if negative_cycle?(path_mtx)
  puts 'NEGATIVE CYCLE'
else
  path_mtx.each do |costs|
    puts costs.map { |cost|
      cost == INF ? 'INF' : cost
    }.join(' ')
  end
end
