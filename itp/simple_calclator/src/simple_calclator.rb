# ITP1_4_C: Simple Calculator

while true
  a, op, b = gets.chomp.split
  break if op == '?'
  puts a.to_i.send(op, b.to_i)
end
