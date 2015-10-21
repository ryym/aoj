# ITP1_3_D: How Many Divisors?

from, to, n = gets.split.map &:to_i

n_divisors = from.upto(to).inject(0) do |n_divisors, d|
  n_divisors + (n % d == 0 ? 1 : 0)
end

p n_divisors
