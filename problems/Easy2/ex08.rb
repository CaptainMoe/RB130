require 'pry'

def max_by(array)
  return nil if array.empty?

  index = 0
  largest = yield(array.first)

  array[1..-1].each_with_index do |ele, idx|
    yielded_ele = yield(ele)

    if largest < yielded_ele
      largest = yielded_ele
      index = idx + 1
    end
  end

  array[index]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
