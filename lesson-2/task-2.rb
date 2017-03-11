arr = []
(10..100).each do  |number|
  arr << number if number % 5 == 0
end
puts arr
