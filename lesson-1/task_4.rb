
puts 'Enter your a variable'
a = gets.chomp.to_f
puts 'Enter your b variable'
b = gets.chomp.to_f
puts 'Enter your c variable'
c = gets.chomp.to_f

discriminant_number = b**2 - (4 * a * c)
discriminant_text = "Discriminant : #{discriminant_number}"

if discriminant_number > 0
  sqrt = Math.sqrt(discriminant_number)
  puts "#{discriminant_text}, x1 :#{(-b + sqrt) / (2 * a)}, x2 :#{(-b - sqrt) / (2 * a)}."
elsif discriminant_number.zero?
  puts "#{discriminant_text}, x :#{(-b) / (2 * a)}."
else
  puts "#{discriminant_text}, Корней нет!!!"
end
