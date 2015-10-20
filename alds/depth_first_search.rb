# ALDS1_11_B: Depth First Search

class Timer
  def initialize(start = 0)
    @time = start
  end

  def next
    @time += 1
  end
end

class DepthFirstSearcher
  def initialize(graph)
    @graph = graph
  end

  def search_by(method_name, found, finished)
    last  = @graph.size - 1
    timer = Timer.new
    proc  = self.method "#{method_name.to_s}_search"
    (1..last).each do |id|
      proc.call(id, found, finished, timer)
    end
  end

  private

    def recursive_search(id, found, finished, timer)
      return unless found[id].nil?

      found[id] = timer.next
      @graph[id].each do |d_id|
        recursive_search d_id, found, finished, timer
      end
      finished[id] = timer.next
    end

    def stack_search(id, found, finished, timer = Timer.new)
      return unless found[id].nil?

      stack = [id]
      found[id] = timer.next

      until stack.empty?
        id = stack.last
        next_id = @graph[id].find do |d_id|
          found[d_id].nil?
        end

        if next_id.nil?
          finished[id] = timer.next
          stack.pop
        else
          if found[next_id].nil?
            stack.push next_id
            found[next_id] = timer.next
          end
        end
      end
    end
end

n_vertexes = gets.to_i
max_v      = n_vertexes + 1
graph      = Array.new, max_v

n_vertexes.times do
  id, n_adjs, *adjs = gets.split.map &:to_i
  graph[id] = adjs
end

searcher = DepthFirstSearcher.new graph
found    = Array.new max_v
finished = Array.new max_v
searcher.search_by :stack, found, finished

(1..n_vertexes).each do |id|
  puts "#{id} #{found[id]} #{finished[id]}"
end
