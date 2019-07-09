
def divisors(n)
  half1 = []
  half2 = []
  (1..Integer.sqrt(n)).each do |factor|
    half1 << factor if n % factor == 0
  end
  half1.reverse.each do |factor|
    half2 << n / factor
  end
  (half1 + half2).uniq
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
