puts "enter your year"
year = gets.chomp.to_i
puts "enter your month"
month = gets.chomp.to_i
puts "enter your day"
day = gets.chomp.to_i
number_of_data = day
months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
months[1] = 29 if (year % 4 == 0  && year % 100 != 0) || ( year % 400 == 0)
puts months
months.each_with_index do |el , k|
  number_of_data += el  if month > k+1
end
puts number_of_data
