order = {}
total = 0
while true do
  puts "enter name of product"
  name = gets.chomp
  break if name == "stop"
  puts "enter unit price"
  price = gets.chomp.to_f
  puts "enter count"
  count = gets.chomp.to_f
  total_price = price * count
  order[name] = {
    price: price,
    count: count,
    total_price: total_price
  }
  total += total_price
end
puts order
puts total
