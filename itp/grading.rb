# ITP1_7_A: Grading

def absent?(score)
  score == -1
end

def eof?(*scores)
  scores.all? { |s| absent? s }
end

def grade(mids, ends, rexs)
  return 'F' if absent?(mids) || absent?(ends)
  case mids + ends
  when 80..100 then 'A'
  when 65...80 then 'B'
  when 50...65 then 'C'
  when 30...50 then rexs < 50 ? 'D' : 'C'
  when 0...30  then 'F'
  end
end

while true
  scores = gets.split.map &:to_i
  break if eof? *scores
  puts grade(*scores)
end
