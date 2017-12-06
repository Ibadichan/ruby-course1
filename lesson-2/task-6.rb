
order = {}
total = 0

loop do
  puts 'Enter name of product'
  name = gets.chomp
  break if name == 'stop'
  puts 'Enter unit price'
  price = gets.chomp.to_f
  puts 'Enter count'
  count = gets.chomp.to_f

  total_price = price * count
  order[name] = { price: price, count: count, total_price: total_price }
  total += total_price
end

puts order, total
