# ALDS1_3_B: Queue

# A simple queue.
class Queue
  def initialize(capacity)
    @queue = Array.new capacity
    @head = @num = 0
  end

  def enq(item)
    raise 'Queue is full' if full?
    @num += 1
    tail = (@head + @num - 1) % @queue.size
    @queue[tail] = item
  end

  def deq
    raise 'Queue is empty' if empty?
    item = @queue[@head]
    @queue[@head] = nil
    @head = (@head + 1) % @queue.size
    @num -= 1
    item
  end

  def empty?
    @num == 0
  end

  def full?
    @num == @queue.size
  end
end

# A processor.
class CPU
  MAX_N_PROCESSES = 100000
  Process = Struct.new :name, :time

  def initialize(quantum)
    @quantum = quantum
  end

  def load_ps(n_ps)
    ps = Queue.new MAX_N_PROCESSES
    n_ps.times do
      input = gets.chomp.split
      process = Process.new input[0], input[1].to_i
      ps.enq process
    end
    ps
  end

  def run(ps)
    elapsed_time = 0

    until ps.empty?
      process = ps.deq
      if process.time <= @quantum
        elapsed_time += process.time
        puts "#{process.name} #{elapsed_time}"
      else
        elapsed_time += @quantum
        process.time -= @quantum
        ps.enq process
      end
    end
  end
end

# Run processes.
n_ps, quantum = gets.split.map &:to_i
cpu = CPU.new(quantum)
cpu.run cpu.load_ps(n_ps)
