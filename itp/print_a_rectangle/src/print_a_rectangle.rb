# ITP1_5_A: Print a Rectangle

RECT = '#'

while true
  height, width = gets.split.map &:to_i
  break if height == 0 && width == 0
  height.times do
    puts RECT * width
  end
  puts
end
