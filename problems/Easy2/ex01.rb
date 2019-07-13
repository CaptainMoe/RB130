
def step(start_point, end_point, increment)
  while start_point <= end_point
    yield(start_point)
    start_point += increment
  end
  start_point
end

step(1, 10, 3) { |value| puts "value = #{value}" }
