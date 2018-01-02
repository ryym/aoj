# ITP1_4_A: A / B Problem

a, b = gets.split.map &:to_i
printf "%d %d %.6f", (a / b), (a % b), (a / b.to_f)
