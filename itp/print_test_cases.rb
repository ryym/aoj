# ITP1_3_B: Print Test Cases

number = 1
until (line = gets.chomp) == '0'
  puts "Case #{number}: #{line}"
  number += 1
end
