
arr = []
(10..100).each { |number| arr << number if (number % 5).zero? }
puts arr
