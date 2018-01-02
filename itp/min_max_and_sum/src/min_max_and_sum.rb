# ITP1_4_D: Min, Max and Sum

MIN = -10 ** 6
MAX =  10 ** 6

n_nums = gets.to_i
nums   = gets.split.map &:to_i

min = MAX
max = MIN
sum = 0
nums.each do |n|
  min = n if n < min
  max = n if max < n
  sum += n
end

puts [min, max, sum].join(' ')
