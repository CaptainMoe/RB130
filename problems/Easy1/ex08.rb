
def any?(collection)
  collection.each do |ele|
    return true if yield(ele)
  end
  false
end

def none?(collection)
  counter = 0

  while counter < collection.size
    return false if yield(collection[counter])
    counter += 1
  end

  true
end

def none?(collection)
  collection.each do |ele|
    return false if yield(ele)
  end
  true
end

def none?(collection, &block)
  !any?(collection, &block)
end
p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
