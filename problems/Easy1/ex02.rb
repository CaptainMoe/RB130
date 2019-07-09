def compute
  if block_given?
    yield(5)
  else
    'Does not compute.'
  end
end

p compute { |n| n + 3 } == 8
p compute { |n| "#{n}b" } == '5b'
p compute == 'Does not compute.'
