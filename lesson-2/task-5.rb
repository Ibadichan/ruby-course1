
puts 'Enter your year'
year = gets.chomp.to_i
puts 'Enter your month'
month = gets.chomp.to_i
puts 'Enter your day'
day = gets.chomp.to_i

number_of_data = day
months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
months[1] = 29 if ((year % 4).zero? && year % 100 != 0) || (year % 400).zero?

months.each_with_index { |value, key| number_of_data += value if month > key + 1 }
puts number_of_data
