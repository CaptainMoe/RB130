
def zip(array1, array2)
  new_arr = []
  array1.each_with_index do  |ele, idx|
    new_arr << [ele, array2[idx]]
  end
  new_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
