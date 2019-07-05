
def reduce(array, default=0)
  counter = 0
  if array[0].is_a? Numeric
    accumalator  = default + array[0]
  else
    accumalator = array[0]
  end

  while counter < array.size
    if counter > 0
      accumalator = yield(accumalator, array[counter])
    end
    counter += 1
  end

  accumalator
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
