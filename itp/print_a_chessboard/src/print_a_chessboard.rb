# ITP1_5_C: Print a Chessboard

def make_line(width, is_even)
  ('#.' * width)[ is_even ? 0 : 1, width ]
end

while true
  height, width = gets.split.map &:to_i
  break if height == 0 && width == 0

  even_line = make_line width, true
  odd_line  = make_line width, false

  height.times do |n|
    puts( n.even? ? even_line : odd_line )
  end
  puts
end
