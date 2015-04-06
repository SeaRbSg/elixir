def powersum(x, y)
  result = x**y
  result.to_s.chars.map {|s| s.to_i}.inject {|sum, i| sum += i}
end

puts powersum(2, 1000)