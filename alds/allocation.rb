# 荷物は運ばれてくる順にしか積めない。n, k の値ははじめから与えられるので、
# Pさえ決まれば全ての荷物が積めるかどうかは簡単にわかる。
# k, P, n[] を入力してk台のトラックに入りきる荷物の数vを返すような関数を作れば、
# v >= n となる最初のvが答えとなる。
# 後は、そのようなPを時間内に特定するために二分探索を使えばいい。
# 下記の実装の場合、loadable_num は load_weights.size より大きい値を
# 返す事はない点に注意する必要がある。

# ALDS1_4_D: Allocation

MAX_N_LOADS = 100000
MAX_WEIGHT  = 10000

def loadable_num(n_trucks, load_weights, capacity)
  w_loaded = 0
  n_trucks_loaded = 0
  load_weights.each_with_index do |weight, i|
    return i if capacity < weight
    w_loaded += weight
    if capacity < w_loaded
      w_loaded = weight
      n_trucks_loaded += 1
      return i if n_trucks == n_trucks_loaded
    end
  end
  load_weights.size
end

def find_min_capacity(n_trucks, load_weights)
  left    = 0
  right   = MAX_N_LOADS * MAX_WEIGHT
  n_loads = load_weights.size
  while left < right
    mid = (left + right) / 2
    n_loadables = loadable_num(n_trucks, load_weights, mid)
    if n_loadables < n_loads
      left = mid + 1
    else
      right = mid
    end
  end
  right
end

n_loads, n_trucks = gets.split.map &:to_i
load_weights = n_loads.times.map do
  gets.chomp.to_i
end

puts find_min_capacity(n_trucks, load_weights)
