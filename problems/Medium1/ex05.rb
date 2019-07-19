
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce1, produce|
  puts produce1.join(", ")
  puts produce
end

puts "-------------------------"

gather(items) do |produce1, *middle , producelast|
  puts produce1
  puts middle.join(", ")
  puts producelast
end

puts "-------------------------"

gather(items) do |produce1, *producelast|
  puts produce1
  puts producelast.join(", ")
end

puts "-------------------------"

gather(items) do |produce|
  puts produce.join(", ")
end
