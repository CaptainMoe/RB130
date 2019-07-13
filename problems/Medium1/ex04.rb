
def splat_test(arr)
  yield(arr)
end

arr = [1, 2, 3, 4, 5, 6]
splat_test(arr) { |_,_, *arg| puts arg}
