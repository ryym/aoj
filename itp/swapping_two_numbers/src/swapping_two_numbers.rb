# ITP1_3_C: Swapping Two Numbers

while true
  a, b = gets.split.map &:to_i
  break if a == 0 && b == 0
  a, b = b, a if b < a
  puts "#{a} #{b}"
end
